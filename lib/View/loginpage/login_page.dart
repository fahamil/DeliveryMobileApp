import 'package:ecommerce_application/View/signup_page/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.only(
            left: 10,
            top: 150,
            right: 20,
            bottom: 10,
          ),
          child: Form(
            key: formGlobalKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Hello,\nWelcome Back",
                  // style: Theme.of(context).textTheme.headline1,
                  style: TextStyle(fontSize: 22),
                ),
                Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Image(
                    //       image: AssetImage("assets/google.png"),
                    //       height: 22,
                    //     ),
                    //   ],
                    // ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "password",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'forgot password?',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Column(children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    child: ElevatedButton(
                      child: const Center(child: Text("Loign")),
                      onPressed: () {},
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SigninPage()));
                    },
                    child: Text(
                      "Create A Account",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
