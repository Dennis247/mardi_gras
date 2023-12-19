import 'package:mardi_gras/common/models/base.response.dart';
import 'package:mardi_gras/modules/authentication/services/auth.services.dart';
import 'package:mardi_gras/utils/base.viewmodel.dart';

class LoginViewModel extends BaseViewModel {
  String email = '';

  String password = '';

  Future<BaseResponse> execute() async {
    BaseResponse baseResponse =
        BaseResponse(isSucessfull: false, message: '', data: null);
    try {
      setBusy(true);
      baseResponse = await AuthService.signIn(email: email, password: password);
    } catch (e, s) {
      baseResponse =
          BaseResponse(isSucessfull: false, message: '$e $s', data: null);
    }
    setBusy(false);
    return baseResponse;
  }
}
