import 'package:mardi_gras/utils/base.viewmodel.dart';
import 'package:mardi_gras/utils/local_storage.service.dart';

class SplashViewModel extends BaseViewModel {
  Future<bool> isAuthInFoInLocalStorageAvailable() async {
    final result = await LocalStorageService.getUserNameFromLocalStorage();

    if (result != null) {
      return true;
    }

    return false;
  }
}
