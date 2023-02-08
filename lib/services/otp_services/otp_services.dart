import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_application/const/api/api.dart';
import 'package:ecommerce_application/const/api/api_endpoint.dart';
import 'package:ecommerce_application/const/utils/exceptions/dio_exceptions.dart';

class OtpServices {
  Dio dio = Dio();

  Future<String?> sentOtp(email, context) async {
    log('otpenabled');
    try {
      final Response response = await dio.get(
        Apibaseurl().baseUrl + ApiEndpoints.sendOtp,
        queryParameters: {"email": email},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          log("otpdone");
          log(response.data.toString());
          return response.data['meassage'];
        }
      }
    } on DioError catch (e) {
      log(e.message);
      log('otp faild');
      DioException().dioError(e, context);
    }
    return null;
  }
}
