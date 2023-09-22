import 'package:flutter/material.dart';
import 'package:flutter_practical/firebase_email_password_auth/controller.dart';
import 'package:flutter_practical/firebase_email_password_auth/home_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<Controller>(
      builder: (ctrl) {
        return Form(
          key: ctrl.loginFormKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      if (ctrl.loginFormKey.currentState!.validate()) {
                        ctrl.loginFormKey.currentState!.save();
                        ctrl.loginUser(ctrl.email, ctrl.password);
                        Get.off(const HomeScreen());
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.green,
                                content: Text('Login Success')));
                      }
                    },
                    child: const Text('Log In', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Don t have an Account Sign Up',
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    ));
    ;
  }
}
