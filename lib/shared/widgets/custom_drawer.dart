import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:viacepapp/pages/cep_back4app_page.dart';
import 'package:viacepapp/pages/consulta_cep_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 230,
      backgroundColor: Colors.white,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const InkWell(
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlue),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: FaIcon(FontAwesomeIcons.map),
                ),
                accountName: Text(
                  "Iago Cavalcante",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text("iagocav@gmail.com",
                    style: TextStyle(color: Colors.white))),
          ),
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
                  Text("Consulta CEP", style: TextStyle(color: Colors.black))
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConsultaCepPage()));
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
                  Text("CEPs Back4App", style: TextStyle(color: Colors.black))
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
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sair", style: TextStyle(color: Colors.black)),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: const Text(
                        "Consulta CEP",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Wrap(
                        children: [
                          Text("Deseja realmente sair?"),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: const Text("Sim")),
                      ],
                    );
                  });
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
