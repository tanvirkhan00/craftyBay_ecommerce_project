import 'package:ecommerce_project/App/set_up_network_caller.dart';
import 'package:ecommerce_project/core/services/api_caller.dart';
import 'package:flutter/foundation.dart';
import '../../../../App/urls.dart';
import '../../data/model/sign_in_params.dart';

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