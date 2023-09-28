import 'package:viacepapp/model/cep_model.dart';
import 'package:viacepapp/repositories/viacep/viacep_repository.dart';

import 'package:dio/dio.dart';

class ViaCepDioRepository implements ViaCepRepository {
  @override
  Future<CepModel> consultaCEP(String cep) async {
    Dio dio = Dio();
    var response = await dio.get("https://viacep.com.br/ws/$cep/json/");
    if (response.statusCode == 200) {
      return CepModel.fromJson(response.data);
    } else {
      return CepModel();
    }
  }
}
