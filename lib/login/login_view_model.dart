import '../manager/login_manager.dart';
import 'login_model.dart';

class LoginViewModel {
  late LoginModel model;
  LoginViewModel(username, password) {
    model = LoginModel(
      username: username,
      password: password,
      posclientId: username,
      version: '1.0.0',
    );
  }

  Future<dynamic> userOnClickLogin() async {
    var result = await LoginManager().login(model);
    if (result == 500) {
      return "Server Error";
    } else {
      return result;
    }
  }
}
