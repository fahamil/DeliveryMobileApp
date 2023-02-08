import 'package:ecommerce_application/View/loginpage/login_page.dart';
import 'package:ecommerce_application/provider/signup_provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.only(
            left: 10,
            top: 70,
            right: 20,
            bottom: 30,
          ),
          child: Form(
            key: formGlobalKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Consumer<SignUpProvider>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "SignUp,\nWelcome You All",
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
                            controller: provider.fullname,
                            validator: (fullname) =>
                                provider.nameValidation(fullname),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "FullName",
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
                          child: TextFormField(
                            controller: provider.email,
                            validator: (emailprovider) =>
                                provider.emailValdation(emailprovider),
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
                          child: TextFormField(
                            controller: provider.phoneNo,
                            validator: (phoneNo) =>
                                provider.phoneValdation(phoneNo),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "PhoneNo",
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
                          child: TextFormField(
                            validator: (passwordValue) =>
                                provider.passwordValdation(passwordValue),
                            controller: provider.password,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "password",
                            ),
                          ),
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
                            child: const Center(child: Text("SginUp")),
                            onPressed: () {
                              if (formGlobalKey.currentState!.validate()) {
                                formGlobalKey.currentState!.save();
                                value.signupUser(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('already have an account '),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                            },
                            child: const Text("LoginNow"))
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
