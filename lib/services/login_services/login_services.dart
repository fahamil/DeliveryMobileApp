// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:ecommerce_application/const/api/api.dart';
// import 'package:ecommerce_application/const/api/api_endpoint.dart';
// import 'package:ecommerce_application/model/login_model/login_model.dart';
// import 'package:ecommerce_application/model/login_model/login_model_Token.dart';
// import 'package:flutter/cupertino.dart';

// class SignInServices {
//   Dio dio = Dio();
//   SigninModel? signinModel;
//   Future<SignInTokenModel?> signinUser(
//       SigninModel model, BuildContext context) async {
//         try{
//           Response response = await dio.post(
//             Apibaseurl().baseUrl +ApiEndpoints.signIn,
//             data: jsonEncode(
//               model.toJson(),
//             ),
//           );
//           if(response.statusCode==200||response.statusCode==201){
//             final 
//           }
//         }
//         return null;
//       }
// }
