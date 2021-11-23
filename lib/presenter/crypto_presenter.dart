import 'package:crypto_app/model/crypto_data.dart';
import 'package:crypto_app/model/dependency_injection.dart';

abstract class CryptoPresenter {
  void downloadedData(List<CryptoData> items);
  void dataDownloadError();
}

class CryptoDataPresenter {
  CryptoPresenter _dataPresenter;
  CryptoRepo? _cryptoDataRepo;

  CryptoDataPresenter(this._dataPresenter) {
    _cryptoDataRepo = Injector().cryptoRepo;
  }

  void loadCurrencies() {
    _cryptoDataRepo!
        .fetchCurrenciesFromCryptoApi()
        .then((value) => _dataPresenter.downloadedData(value))
        .catchError((onError) => _dataPresenter.dataDownloadError());
  }
}
