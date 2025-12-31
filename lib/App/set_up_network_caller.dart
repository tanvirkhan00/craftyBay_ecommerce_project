import 'package:ecommerce_project/core/services/api_caller.dart';

ApiCaller getApiCaller() {
  ApiCaller apiCaller = ApiCaller(
    headers: {"Content-Type": "application/json", "token": "token"},
    onUnauthorize: () {
      // Handle Unauthorize
    },
  );
  return apiCaller;
}
