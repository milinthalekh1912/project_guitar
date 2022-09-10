import '../service/logout_service/logout_service.dart';

class LogoutManager {
  Future<void> logoutRequest() async {
    await Logout_Api_Service().logoutRequest();
    print("Logout success!");
  }
}
