import '../../model/cep_model.dart';

abstract class ViaCepRepository {
  Future<CepModel> consultaCEP(String cep);
}
