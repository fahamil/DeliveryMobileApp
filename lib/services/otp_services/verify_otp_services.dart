import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:ecommerce_application/const/api/api.dart';
import 'package:ecommerce_application/const/api/api_endpoint.dart';
import 'package:ecommerce_application/const/utils/exceptions/dio_exceptions.dart';

class VeriflyOtpServices {
  Dio dio = Dio();
  Future<String?> verifyOtp(email, otpcode, context) async {
    try {
      final Response response = await dio.post(
        Apibaseurl().baseUrl + ApiEndpoints.sendOtp,
        data: {
          'email': email,
          'otp': otpcode,
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('verification faild');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log('verification faliled');
     DioException().dioError(e, context);
    }
    return null;
  }
}
