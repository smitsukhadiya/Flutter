import 'package:flutter/material.dart';
import 'package:flutter_practical/firebase_email_password_auth/controller.dart';
import 'package:flutter_practical/firebase_email_password_auth/home_screen.dart';
import 'package:flutter_practical/firebase_email_password_auth/login_screen.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<Controller>(
      builder: (ctrl) {
        return Form(
          key: ctrl.signupFormKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onSaved: (newValue) {
                      ctrl.name = newValue.toString();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Name',
                      filled: true,
                      fillColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      ctrl.email = newValue.toString();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Email-Address',
                      filled: true,
                      fillColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      ctrl.password = newValue.toString();
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter Password',
                      filled: true,
                      fillColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    colorBrightness: Brightness.dark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    height: 50,
                    minWidth: double.infinity,
                    color: Colors.blue.shade900,
                    onPressed: () {
                      if (ctrl.signupFormKey.currentState!.validate()) {
                        ctrl.signupFormKey.currentState!.save();
                        Future.delayed(
                          const Duration(seconds: 4),
                          () {
                            const Center(
                              child: CircularProgressIndicator(),
                            );
                            ctrl.registerUser(ctrl.email, ctrl.password);
                            Get.off(const HomeScreen(), arguments: ctrl.name);
                          },
                        );
                      }
                    },
                    child:
                        const Text('Sign Up', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const LoginScreen());
                      },
                      child: const Text(
                        'Already a User ? Login',
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
