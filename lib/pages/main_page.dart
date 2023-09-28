import 'package:flutter/material.dart';
import 'package:viacepapp/pages/consulta_cep_page.dart';
import 'package:viacepapp/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Consulta CEP"),
        ),
        drawer: const CustomDrawer(),
        body: ConsultaCepPage(),
      ),
    );
  }
}
