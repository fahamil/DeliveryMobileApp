import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_application/const/api/api.dart';
import 'package:ecommerce_application/const/api/api_endpoint.dart';
import 'package:ecommerce_application/const/utils/exceptions/dio_exceptions.dart';
import 'package:ecommerce_application/model/signup_model/signup_token_model.dart';
import 'package:ecommerce_application/model/signup_model/sigup_model.dart';
import 'package:flutter/cupertino.dart';

class SignupServices {
  Dio dio = Dio();

  Future<SignupTokenModel?> signupUser(
      SignUpModel model, BuildContext context) async {
    try {
      Response response = await dio.post(
        Apibaseurl().baseUrl + ApiEndpoints.signUp,
        data: jsonEncode(
          model.tojson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final signupResponse = SignupTokenModel.fromjson(response.data);
        log(response.data.toString());
        return signupResponse;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
  }
}
