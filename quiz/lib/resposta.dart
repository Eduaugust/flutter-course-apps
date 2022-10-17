import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelect;
  const Resposta({
    Key? key,
    required this.texto,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: onSelect,
        child: Text(texto),
      ),
    );
  }
}
