import 'dart:developer';

import 'package:ecommerce_application/View/otp_screen/otp_screen.dart';
import 'package:ecommerce_application/model/signup_model/sigup_model.dart';
import 'package:ecommerce_application/services/otp_services/otp_services.dart';
import 'package:ecommerce_application/services/signup_services/signup_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  SignupServices signupServices = SignupServices();

  bool isloading = false;
  Future<void> signupUser(BuildContext context) async {
    isloading = true;
    notifyListeners();
    final model = SignUpModel(
      fullname: fullname.text,
      password: password.text,
      email: email.text.toString(),
      phone: phoneNo.text,
    );

    OtpServices().sentOtp(model.email, context).then((value) {
      if (value == null) {
        log("hii");
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Otpscreen(
              model: model,
            ),
          ),
        );
        disposeTextfiled();
      } else {
        return;
      }
    });
    isloading = false;
    notifyListeners();
  }

  void disposeTextfiled() {
    fullname.clear();
    password.clear();
    email.clear();
    phoneNo.clear();
    confirmPassword.clear();
    username.clear();
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else {
      return null;
    }
  }

  String? usernameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else if (value.length < 2) {
      return 'Too short username';
    } else {
      return null;
    }
  }

  String? emailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , please enter correct email';
    } else {
      return null;
    }
  }

  String? phoneValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length < 10) {
      return 'Invalid mobile number,make sure your entered 10 digits';
    } else {
      return null;
    }
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value.length > 8) {
      return 'Password exceeds 8 character';
    }
    return null;
  }

  String? confirmpasswordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value != password.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: Colors.black,
  );
}
