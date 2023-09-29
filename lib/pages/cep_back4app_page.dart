import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:viacepapp/model/ceps_back4app_model.dart';
import 'package:viacepapp/repositories/back4app/ceps_back4app_repository.dart';

class CepBack4appPage extends StatefulWidget {
  const CepBack4appPage({super.key});

  @override
  State<CepBack4appPage> createState() => _CepBack4appPageState();
}

class _CepBack4appPageState extends State<CepBack4appPage> {
  CepsBack4appRepository cepsBack4appRepository = CepsBack4appRepository();
  var _cepsBack4appModel = CepsBack4appModel([]);
  bool loading = false;
  TextEditingController cepController = TextEditingController(text: "");
  TextEditingController logradouroController = TextEditingController(text: "");
  TextEditingController complementoController = TextEditingController(text: "");
  TextEditingController bairroController = TextEditingController(text: "");
  TextEditingController localidadeController = TextEditingController(text: "");
  TextEditingController ufController = TextEditingController(text: "");
  TextEditingController ibgeController = TextEditingController(text: "");
  TextEditingController giaController = TextEditingController(text: "");
  TextEditingController dddController = TextEditingController(text: "");
  TextEditingController siafiController = TextEditingController(text: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    setState(() {
      loading = true;
    });
    _cepsBack4appModel = await cepsBack4appRepository.obterCEPs();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("CEPs Back4App"),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _cepsBack4appModel.ceps.length,
              itemBuilder: (BuildContext bc, int index) {
                var cep = _cepsBack4appModel.ceps[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cep.cep),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("${cep.localidade} - ${cep.uf}"),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: const FaIcon(
                          FontAwesomeIcons.pencil,
                          color: Colors.green,
                        ),
                        onTap: () {
                          cepController.text = cep.cep.replaceAll("-", "");
                          logradouroController.text = cep.logradouro;
                          complementoController.text = cep.complemento;
                          bairroController.text = cep.bairro;
                          localidadeController.text = cep.localidade;
                          ufController.text = cep.uf;
                          ibgeController.text = cep.ibge;
                          giaController.text = cep.gia;
                          dddController.text = cep.ddd;
                          siafiController.text = cep.siafi;
                          showDialog(
                              context: context,
                              builder: (BuildContext bc) {
                                return AlertDialog(
                                  title: const Text("Edição:"),
                                  content: ListView(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "CEP:",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  textAlignVertical:
                                                      TextAlignVertical.bottom,
                                                  maxLength: 8,
                                                  controller: cepController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Logradouro:",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  controller:
                                                      logradouroController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Complemento:",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  controller:
                                                      complementoController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Bairro:",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  controller: bairroController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Localidade:",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  controller:
                                                      localidadeController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "UF:",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  controller: ufController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "IBGE:",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  controller: ibgeController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "GIA:",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  controller: giaController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "DDD:",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  controller: dddController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "SIAFI:",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                  controller: siafiController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancelar")),
                                    TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          cep.cep =
                                              "${cepController.text.substring(0, 5)}-${cepController.text.substring(5, 8)}";
                                          cep.logradouro =
                                              logradouroController.text;
                                          cep.complemento =
                                              complementoController.text;
                                          cep.bairro = bairroController.text;
                                          cep.localidade =
                                              localidadeController.text;
                                          cep.uf = ufController.text;
                                          cep.ibge = ibgeController.text;
                                          cep.gia = giaController.text;
                                          cep.ddd = dddController.text;
                                          cep.siafi = siafiController.text;
                                          await cepsBack4appRepository
                                              .alterarCep(cep);
                                          carregarDados();
                                        },
                                        child: const Text("Salvar"))
                                  ],
                                );
                              });
                        },
                      ),
                      InkWell(
                        child: const FaIcon(
                          FontAwesomeIcons.x,
                          color: Colors.red,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext bc) {
                                return AlertDialog(
                                  title: const Text("Alertar!"),
                                  content: const Wrap(
                                    children: [
                                      Text("Deseja realmente excluir?")
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Não")),
                                    TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          await cepsBack4appRepository
                                              .removerCep(cep.objectId);
                                          carregarDados();
                                        },
                                        child: const Text("Sim"))
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  ),
                );
              }),
    ));
  }
}
