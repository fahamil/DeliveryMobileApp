import 'package:ecommerce_application/provider/verify_otp_provider/verify_otp_provider.dart';
import 'package:ecommerce_application/model/signup_model/sigup_model.dart';
import "package:flutter/material.dart";
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class Otpscreen extends StatelessWidget {
  const Otpscreen({super.key, required this.model});
  final SignUpModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.only(
            left: 20,
            top: 150,
            right: 20,
            bottom: 80,
          ),
          child: Consumer<VerifyOtpProvider>(
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Please Enter Your Otp",
                    // style: Theme.of(context).textTheme.headline1,
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Consumer<VerifyOtpProvider>(
                        builder: (context, value, child) {
                          return OtpTextField(
                            textStyle: const TextStyle(color: Colors.black),
                            numberOfFields: 4,
                            borderColor: Colors.black,
                            enabledBorderColor: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            showFieldAsBox: true,
                            onSubmit: (String verificationCode) {
                              value.onsubmitcode(verificationCode);
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        child: ElevatedButton(
                          child: const Center(child: Text("Loign")),
                          onPressed: () {
                            value.submitotp(model, value.code, context);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Create A Account",
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
