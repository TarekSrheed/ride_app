import 'package:rideshare_app/core/handling_error/auth_exception.dart';
import 'package:rideshare_app/core/handling_error/auth_handling.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/data/data_sources/remote/auth_service.dart';
import 'package:rideshare_app/features/data/model/login_model/login_user_model.dart';
import 'package:rideshare_app/features/data/model/login_model/user_model.dart';

class AuthRepository {
  final AuthServiceImp authServiceImp;

  AuthRepository(this.authServiceImp);

  Future<AuthHandling> signUp(UserModel user) async {
    try {
      await authServiceImp.signUp(user);
      return DataSuccess();
    } on UserNameIsInUse {
      return DataFailed(message: AppString().USERNAMEINUSE);
    } on PhoneNumIsInUse {
      return DataFailed(message: AppString().PHONENUMINUSE);
    } on PhoneNumMustHaveTenCharacter {
      return DataFailed(message: AppString().PHONENUMMUSTHAVE10);
    } on PasswordHasNotSpeicalCharacter {
      return DataFailed(message:AppString(). PASSWORDMUSTHAVESPICALCHARACTER);
    } on PasswordMustHaveEightCharacter {
      return DataFailed(message:AppString(). PASSWORDMUSTHAVE8);
    } on PasswordHasNotDigitCharacter {
      return DataFailed(message:AppString(). PASSWORDMUSTHAVE8);
    } on PasswordHasNotUppercaseCharacter {
      return DataFailed(message: AppString().PASSWORDMUSTHAVEUPPERCASE);
    }
  }

  Future<AuthHandling> login(LoginUserModel user) async {
    try {
      await authServiceImp.login(user);
      return DataSuccess();
    } on InvalidEmailOrPassword {
      return DataFailed(message:AppString(). INVALIDEMAILORPASSWORD);
    } on UserNotFound {
      return DataFailed(message:AppString(). USERNOTFOUND);
    }
  }
}
