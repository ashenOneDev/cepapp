import 'package:viacepapp/model/ceps_back4app_model.dart';
import 'package:viacepapp/repositories/back4app/back4app_custom_dio.dart';

class CepsBack4appRepository {
  final _customDio = Back4appCustomDio();

  CepsBack4appRepository();

  Future<CepsBack4appModel> obterCEPs() async {
    var response = await _customDio.dio.get("/ceps");
    return CepsBack4appModel.fromJson(response.data);
  }

  Future<void> salvarCep(CepBack4appModel cepBack4appModel) async {
    try {
      await _customDio.dio.post("/ceps", data: cepBack4appModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> alterarCep(CepBack4appModel cepBack4appModel) async {
    try {
      await _customDio.dio.put("/ceps/${cepBack4appModel.objectId}",
          data: cepBack4appModel.toCreateJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removerCep(String objectId) async {
    try {
      await _customDio.dio.delete("/ceps/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
