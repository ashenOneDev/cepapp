import 'package:viacepapp/model/cep_model.dart';
import 'package:viacepapp/repositories/back4app/back4app_custom_dio.dart';

class CepBack4appRepository {
  final _customDio = Back4appCustomDio();

  CepBack4appRepository();

  Future<CepModel> obterCEP() async {
    var response = await _customDio.dio.get("/ceps");
    return CepModel.fromJson(response.data);
  }

  Future<void> salvarCep(CepModel cepModel) async {
    try {
      await _customDio.dio.post("/ceps", data: cepModel.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
