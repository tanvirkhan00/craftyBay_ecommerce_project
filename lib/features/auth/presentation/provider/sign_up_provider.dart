import 'package:ecommerce_project/App/set_up_network_caller.dart';
import 'package:ecommerce_project/core/services/api_caller.dart';
import 'package:flutter/foundation.dart';
import '../../../../App/urls.dart';
import '../../data/model/sign_up_params.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isSignUpInProgress = false;

  bool get isSignUpInProgress => _isSignUpInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpParams params) async {
    bool isSuccess = false;
    _isSignUpInProgress = true;
    notifyListeners();

    final ApiResponse response = await getApiCaller().postRequest(
      url: Urls.signUpUrl,
      body: params.toJson(),
    );

    if(response.isSuccess) {
      isSuccess = true;
      _errorMessage= null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _isSignUpInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}