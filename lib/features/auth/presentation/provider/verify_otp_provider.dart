import 'package:ecommerce_project/App/set_up_network_caller.dart';
import 'package:ecommerce_project/core/services/api_caller.dart';
import 'package:flutter/foundation.dart';
import '../../../../App/urls.dart';
import '../../data/model/verify_otp_params.dart';

class VerifyOtpProvider extends ChangeNotifier {
  bool _isVerifyOtpInProgress = false;

  bool get isVerifyOtpInProgress => _isVerifyOtpInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(VerifyOtpParams params) async {
    bool isSuccess = false;
    _isVerifyOtpInProgress = true;
    notifyListeners();

    final ApiResponse response = await getApiCaller().postRequest(
      url: Urls.verifyOtpUrl,
      body: params.toJson(),
    );

    if(response.isSuccess) {
      isSuccess = true;
      _errorMessage= null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _isVerifyOtpInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}