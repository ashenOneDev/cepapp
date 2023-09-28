import 'package:flutter/material.dart';

class CepBack4appPage extends StatefulWidget {
  const CepBack4appPage({super.key});

  @override
  State<CepBack4appPage> createState() => _CepBack4appPageState();
}

class _CepBack4appPageState extends State<CepBack4appPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("CEP Back4App"),
      ),
    ));
  }
}
