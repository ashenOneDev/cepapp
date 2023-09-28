import 'package:flutter/material.dart';
import 'package:viacepapp/model/cep_model.dart';
import 'package:viacepapp/repositories/viacep/impl/viacep_dio_repository.dart';
import 'package:viacepapp/repositories/viacep/viacep_repository.dart';

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  ViaCepRepository viaCepRepository = ViaCepDioRepository();
  TextEditingController cepController = TextEditingController(text: "");
  bool loading = false;
  bool hidenString = true;
  CepModel cepModel = CepModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Informe o CEP:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 8),
                child: TextField(
                  maxLength: 8,
                  textAlign: TextAlign.center,
                  controller: cepController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 8,
                color: Colors.green,
                child: TextButton(
                  onPressed: () async {
                    var cep = cepController.text
                        .replaceAll(new RegExp(r'[^0-9]'), '');
                    if (cep.length == 8) {
                      setState(() {
                        loading = true;
                      });
                      cepModel = await viaCepRepository.consultaCEP(cep);
                    }
                    setState(() {
                      loading = false;
                      if (cepModel.cep != null) {
                        hidenString = false;
                      } else {
                        hidenString = true;
                      }
                    });
                  },
                  child: const Text(
                    "Consultar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (!hidenString)
                Text(
                  "${cepModel.logradouro ?? ""}, ${cepModel.bairro ?? ""}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              if (!hidenString)
                Text(
                  "${cepModel.localidade ?? ""} - ${cepModel.uf ?? ""}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              if (loading) const CircularProgressIndicator()
            ],
          ),
        ]),
      ),
    ));
  }
}
