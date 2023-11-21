import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_log_in/pages/main_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static String route = "/signUp";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final phoneKey = GlobalKey<FormState>();
  final nameKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  final confirmKey = GlobalKey<FormState>();


  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset("assets/images/done.png", scale: 5,),
              const Center(child: Text("Account created successfully!",
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 18,
               ),
               )),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  final emailController = TextEditingController();
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



  final nameController = TextEditingController();
  String? validateName(String? value) {
    String pattern = r"^[a-zA-Z\s\'-]+$";
    RegExp regExp = RegExp(pattern);

    if (value!.isEmpty) {
    return 'Please enter your name';
    } else if (!regExp.hasMatch(value) && value.length < 3) {
    return 'Invalid characters in the name, there should at least 3 characters' ;
    }

    return null;
  }


  final phoneController = TextEditingController();
  String? validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }

    return null;
  }

  final passwordController = TextEditingController();
  String? validatePassword(String? value) {
    const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? "Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter and digits"
        : null;
  }

  final confirmPassword = TextEditingController();

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Let's Get Started!",
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
              "Create an account to Q Allure to get all features",
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
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                  ],
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nameController,
                  key: nameKey,
                  validator: validateName,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                      size: 16,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
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
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                      size: 16,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    errorBorder: OutlineInputBorder(
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
                    FilteringTextInputFormatter.allow(RegExp("[0-9+]+")),
                  ],
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: phoneController,
                  validator: validateMobile,
                  decoration: const InputDecoration(
                    enabled: true,
                    fillColor: Colors.white,
                    labelText: "Phone",
                    prefixIcon: Icon(
                      Icons.phone_android_sharp,
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
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      borderSide: BorderSide(
                          color: Colors.blue,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9@a-zA-Z.]")),
                  ],
                  autocorrect: false,
                  controller: confirmPassword,
                  key: confirmKey,
                  validator: validateConfirmPassword,
                  decoration: const InputDecoration(
                    enabled: true,
                    fillColor: Colors.white,
                    labelText: "Confirm Password",
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
                    errorBorder: OutlineInputBorder(
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
            const SizedBox(height: 40,),
            Container(
              width: 180,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {
                  // Trigger the success dialog when the button is pressed
                  _showSuccessDialog();
                },
                child: const Text(
                  "CREATE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Already have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 1,),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MainPage.route);
                  },
                  child: Text("Log In Here",
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
     ],
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}


