import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final VoidCallback reiniciarQuestionario;
  const Resultado({
    Key? key,
    required this.pontuacao,
    required this.reiniciarQuestionario,
  }) : super(key: key);

  String get fraseResultado {
    if (pontuacao < 5) {
      return "Muito ruim";
    }
    if (pontuacao < 10) {
      return "Ruim";
    }
    if (pontuacao < 15) {
      return "Quase na média";
    }
    if (pontuacao < 20) {
      return "Bom";
    }
    return "Muito Bom";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          Text(
            fraseResultado + '\nVoce fez ${pontuacao}/30 pontos',
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          TextButton(
            onPressed: reiniciarQuestionario,
            child: const Text('Reiniciar Questionario'),
          ),
        ],
      ),
    );
  }
}
