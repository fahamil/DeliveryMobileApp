import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_application/View/BottomNav/bottom_nav_bar.dart';
import 'package:ecommerce_application/const/utils/error_popup/snackbar.dart';
import 'package:ecommerce_application/model/signup_model/sigup_model.dart';
import 'package:ecommerce_application/services/otp_services/verify_otp_services.dart';
import 'package:ecommerce_application/services/signup_services/signup_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class VerifyOtpProvider extends ChangeNotifier {
  VeriflyOtpServices veriflyOtpServices = VeriflyOtpServices();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  bool isloading = false;
  String code = '';

  void onsubmitcode(String submitCode) {
    log(submitCode);
    code = submitCode;
    notifyListeners();
  }

  void submitotp(SignUpModel model, code, context) {
    if (code.length != 4) {
      SnackBarPop.popUp(context, 'Please enter the otp', Colors.red);
    } else {
      isloading = true;
      notifyListeners();
      veriflyOtpServices.verifyOtp(model.email, code, context).then(
        (value) {
          if (value != null) {
            SignupServices().signupUser(model, context).then(
                  (value) => {
                    if (value != null)
                      {
                        storage.write(key: 'token', value: value.accessToken),
                        storage.write(
                            key: 'refreshToken', value: value.refersshToken),
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const BottomNavBar()),
                          (route) => false,
                        ),
                        isloading = false,
                        notifyListeners()
                      }
                  },
                );
          }
        },
      );
    }
  }
}
