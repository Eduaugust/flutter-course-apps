import 'package:flutter/material.dart';

import 'package:quiz/questao.dart';
import 'package:quiz/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;
  const Questionario({
    Key? key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  }) : super(key: key);
  bool get isQuestionsSelect => perguntaSelecionada < perguntas.length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = isQuestionsSelect
        ? perguntas[perguntaSelecionada]['resposta']
            as List<Map<String, Object>>
        : [];
    List<Widget> widgets = respostas
        .map((resp) => Resposta(
              texto: resp['texto'] as String,
              onSelect: ()=> responder(resp['pontuacao'] as int),
            ))
        .toList();
    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'] as String),
        ...widgets,
      ],
    );
  }
}
