import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:viacepapp/pages/cep_back4app_page.dart';
import 'package:viacepapp/pages/main_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              width: double.infinity,
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.mapLocation),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Consulta CEP")
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainPage()));
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              width: double.infinity,
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.database),
                  SizedBox(
                    width: 10,
                  ),
                  Text("CEP  Back4App")
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CepBack4appPage()));
            },
          ),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
