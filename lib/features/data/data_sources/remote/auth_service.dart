import 'package:dio/dio.dart';
import 'package:rideshare_app/core/config/service_locater.dart';
import 'package:rideshare_app/core/handling_error/auth_exception.dart';
import 'package:rideshare_app/features/data/data_sources/remote/core_service.dart';
import 'package:rideshare_app/features/data/model/login_user_model.dart';
import 'package:rideshare_app/features/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService extends CoreService {
  final String baseurl = "https://rideshare.devscape.online/api/v1/auth/";

  Future<bool> signUp(UserModel user);
  Future<bool> login(LoginUserModel user);
  AuthService(super.dio);
}

class AuthServiceImp extends AuthService {
  AuthServiceImp(super.dio);

  @override
  Future<bool> signUp(UserModel user) async {
    try {
      response = await dio.post('${baseurl}register', data: user.toMap());
      core
          .get<SharedPreferences>()
          .setString('token', response.data['body']['token']);
      return true;
    } on DioException catch (e) {
      if (e.response!.data['message']
          .contains("Password must contain 1 or more special characters.")) {
        throw PasswordHasNotSpeicalCharacter();
      } else if (e.response!.data['message']
          .contains('Password must contain 1 or more uppercase characters.')) {
        throw PasswordHasNotUppercaseCharacter();
      } else if (e.response!.data['message']
          .contains("Password must contain 1 or more digit characters.")) {
        throw PasswordHasNotDigitCharacter();
      } else if (e.response!.data['message']
          .contains("Password must be 8 or more characters in length.")) {
        throw PasswordMustHaveEightCharacter();
      } else if (e.response!.data['message']
          .contains("username already in use")) {
        throw UserNameIsInUse();
      } else if (e.response!.data['message']
          .contains("phone number already in use")) {
        throw PhoneNumIsInUse();
      } else if (e.response!.data['message']
          .contains("phone number must be absolutely 10")) {
        throw PhoneNumMustHaveTenCharacter();
      } else {
        throw NoEnternet();
      }
    }
  }

  @override
  Future<bool> login(LoginUserModel user) async {
    try {
      response = await dio.post('${baseurl}authenticate', data: user.toMap());
      core
          .get<SharedPreferences>()
          .setString('token', response.data['body']['token']);

      return true;
    } on DioException catch (e) {
      if (e.response!.data['message'].contains("invalid email or password")) {
        throw InvalidEmailOrPassword();
      } else if (e.response!.data['message'].contains('user not found')) {
        throw UserNotFound();
      } else {
        throw NoEnternet();
      }
    }
  }
}
