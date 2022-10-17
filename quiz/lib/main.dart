import 'package:flutter/material.dart';
import 'package:quiz/questionario.dart';
import 'package:quiz/resultado.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  void _responder(int pontuacao) {
    if (isQuestionsSelect) {
      setState(() {
        _perguntaSelecionada += 1;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get isQuestionsSelect => _perguntaSelecionada < _perguntas.length;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 1},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'resposta': [
        {'texto': 'Coelho', 'pontuacao': 1},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Javali', 'pontuacao': 5},
      ]
    },
    {
      'texto': 'Qual linguagem foi feito esse app?',
      'resposta': [
        {'texto': 'React-native', 'pontuacao': 3},
        {'texto': 'Flutter', 'pontuacao': 5},
        {'texto': 'Ionic', 'pontuacao': 1},
        {'texto': 'Dart', 'pontuacao': 10},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Perguntas'), centerTitle: true),
          body: isQuestionsSelect
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : Resultado(
                  pontuacao: _pontuacaoTotal,
                  reiniciarQuestionario: _reiniciarQuestionario,
                )),
    );
  }
}
