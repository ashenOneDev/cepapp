import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:viacepapp/pages/cep_back4app_page.dart';
import 'package:viacepapp/pages/consulta_cep_page.dart';
import 'package:viacepapp/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int paginaAtual = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Consulta CEP"),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
                child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  paginaAtual = value;
                });
              },
              scrollDirection: Axis.horizontal,
              children: const [ConsultaCepPage(), CepBack4appPage()],
            )),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                pageController.jumpToPage(value);
              },
              currentIndex: paginaAtual,
              items: const [
                BottomNavigationBarItem(
                    label: "Consulta CEP",
                    icon: FaIcon(FontAwesomeIcons.mapLocation)),
                BottomNavigationBarItem(
                    label: "CEPs Back4App",
                    icon: FaIcon(FontAwesomeIcons.database))
              ],
            )
          ],
        ),
      ),
    );
  }
}
