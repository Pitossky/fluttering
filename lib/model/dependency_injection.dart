import 'package:crypto_app/model/crypto_data.dart';
import 'package:crypto_app/model/data/mock_data.dart';
import 'package:crypto_app/model/data/production_data.dart';

enum DataRepo { MOCK, PRODUCTION }

class Injector {
  static final Injector _singleton = Injector._internal();
  static late DataRepo _dataRepo;

  static void configure(DataRepo dataRepo) {
    _dataRepo = dataRepo;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  CryptoRepo get cryptoRepo {
    switch (_dataRepo) {
      case DataRepo.MOCK:
        return MockDataRepo();
      default:
        return ProductionDataRepo();
    }
  }
}
