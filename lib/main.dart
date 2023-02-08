import 'package:ecommerce_application/View/loginpage/login_page.dart';
import 'package:ecommerce_application/provider/bottom_nav_bar.provider/bottom_provider.dart';
import 'package:ecommerce_application/provider/signup_provider/signup_provider.dart';
import 'package:ecommerce_application/provider/verify_otp_provider/verify_otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VerifyOtpProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
