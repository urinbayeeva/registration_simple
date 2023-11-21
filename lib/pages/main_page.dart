import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:simple_log_in/pages/signup_page.dart';

class MainPage extends StatefulWidget {
   const MainPage({super.key});

  static String route = "/mainPage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   final formKey = GlobalKey<FormState>();
   final passwordKey = GlobalKey<FormState>();

   final emailController = TextEditingController();
   final passwordController = TextEditingController();

   String? validateEmail(String? value) {
     const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
         r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
         r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
         r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
         r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
         r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
         r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
     final regex = RegExp(pattern);

     return value!.isNotEmpty && !regex.hasMatch(value)
         ? 'Enter a valid email address'
         : null;
   }

   String? validatePassword(String? value) {
      const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
      final regex = RegExp(pattern);

      return value!.isNotEmpty && !regex.hasMatch(value)
          ? "Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter and digits"
          : null;
   }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Image.asset(
                "assets/images/main.jpg",
                scale: 9,
              ),
            ),
          ),
          const Text(
            "Welcome back!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            "Log in to your existant account of Q Allure",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[0-9@a-zA-Z.]")),
                ],
                autocorrect: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                key: formKey,
                validator: validateEmail,
                decoration: InputDecoration(
                  labelText: "Email address",
                  prefixIcon: const Icon(
                    Icons.person_outline_rounded,
                    color: CupertinoColors.activeBlue,
                    size: 16,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 12,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[0-9@a-zA-Z.]")),
                ],
                autocorrect: false,
                controller: passwordController,
                key: passwordKey,
                validator: validatePassword,
                decoration: const InputDecoration(
                  enabled: true,
                  fillColor: Colors.white,
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.lock_open_outlined,
                    color: Colors.grey,
                    size: 16,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8,),
          Container(
            width: 180,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Text("LOG IN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Or connect using",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook, color: Colors.white,),
                    SizedBox(width: 4,),
                    Text("Facebook",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12, height: 10,),
              Container(
                width: 130,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.switch_account_rounded, color: Colors.white,),
                    SizedBox(width: 4,),
                    Text("Google",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Don't have an account?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              ),
              const SizedBox(width: 1,),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignUp.route);
                },
                child: Text("Sign Up",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

