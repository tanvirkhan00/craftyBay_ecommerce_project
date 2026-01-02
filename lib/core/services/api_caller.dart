import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

part '../models/api_response.dart';

class ApiCaller {
  final Logger _logger = Logger();

  final VoidCallback onUnauthorize;
  final Map<String, String>? headers;

  ApiCaller({required this.onUnauthorize, required this.headers});

  Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);

      Response response = await get(uri, headers: headers);
      _logResponse(url, response);

      final int statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        // Success
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: true,
          responseCode: statusCode,
          responseData: decodedData,
        );
      } else if (statusCode == 401) {
        onUnauthorize();
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          errorMessage: "Un-Authorized",
          responseData: null,
        );
      } else {
        // Failed
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          responseData: decodedData,
          errorMessage: decodedData['data'],
        );
      }
    } on Exception catch (e) {
      return ApiResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  Future<ApiResponse> postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, body: body);

      Response response = await post(
        uri,
        headers: {'Content-Type': 'application/json', ...?headers},
        body: jsonEncode(body),
      );

      _logResponse(url, response);

      final int statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        return ApiResponse(
          isSuccess: true,
          responseCode: statusCode,
          responseData: jsonDecode(response.body),
        );
      } else if (statusCode == 401) {
        onUnauthorize();
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          errorMessage: "Un-Authorized",
          responseData: null,
        );
      } else {
        final decodedData = jsonDecode(response.body);
        return ApiResponse(
          isSuccess: false,
          responseCode: statusCode,
          responseData: decodedData,
          errorMessage: decodedData['message'] ?? "Request failed",
        );
      }
    } catch (e) {
      return ApiResponse(
        isSuccess: false,
        responseCode: -1,
        responseData: null,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      "URL => $url\n"
      "Request Body: $body",
    );
  }

  void _logResponse(String url, Response response) {
    _logger.i(
      "URL => $url\n"
      "Status Code: ${response.statusCode}\n"
      "Body: ${response.body}",
    );
  }
}
