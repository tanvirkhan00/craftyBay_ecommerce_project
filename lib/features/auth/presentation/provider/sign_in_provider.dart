import 'package:ecommerce_project/App/set_up_network_caller.dart';
import 'package:ecommerce_project/core/services/api_caller.dart';
import 'package:ecommerce_project/features/auth/data/model/user_model.dart';
import 'package:flutter/foundation.dart';
import '../../../../App/urls.dart';
import '../../data/model/sign_in_params.dart';
import 'auth_controller.dart';

class SignInProvider extends ChangeNotifier {
    bool _isSignInProgress = false;

  bool get isSignInProgress => _isSignInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInParams params) async {
    bool isSuccess = false;
    _isSignInProgress = true;
    notifyListeners();

    final ApiResponse response = await getApiCaller().postRequest(
      url: Urls.signInUrl,
      body: params.toJson(),
    );

    if(response.isSuccess) {
      UserModel model = UserModel.fromJson(response.responseData["data"] ["user"]);
      String accessToken = response.responseData["data"]["token"];
      await AuthController.saveUserData(accessToken, model);

      isSuccess = true;
      _errorMessage= null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _isSignInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}