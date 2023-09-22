import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Routes/app_route.dart';
import 'package:flutter_practical/practice/project/praference/pref_manager.dart';
import 'package:flutter_practical/practice/project/utils/utils.dart';

class signinForm extends StatefulWidget {
  const signinForm({super.key});

  @override
  State<signinForm> createState() => _signinFormState();
}

class _signinFormState extends State<signinForm> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  String? errorEmail,errorPassword;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
           children: [
             buildEmailFormField(),
             SizedBox(height: 24,),
             buildPasswordFormField(),
             SizedBox(height: 24,),
             buildForgotPasswordWidget(context),
             SizedBox(height: 24,),
             buildLoginButtonWidget(),
           ],
    ));
  }

  buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Email address',
          errorText: errorEmail,
          floatingLabelBehavior: FloatingLabelBehavior.auto
      ),
    );
  }

  buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Password',
          errorText: errorPassword,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildForgotPasswordWidget(BuildContext context ) {
  return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forgot Password",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  buildLoginButtonWidget() {
       return MaterialButton(
         color: Colors.green,
         minWidth: double.infinity,
         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
         onPressed: () {
           var email = emailController.text.trim();
           var password = passwordController.text.trim();

           errorEmail = null;
           errorPassword = null;

           if(!Utils.isValidEmail(email)){
            setState(() {
              errorEmail = 'Enter Valid Email Adress';
            });
           }else if(!Utils.isValidPassword(password)){
             setState(() {
               errorPassword = 'Password must contains atleast one special character, one upper and one lower case';
             });
           }else{
             PrefManager.updateLoginStatus(true);
             Navigator.pushReplacementNamed(context,AppRoute.home);
           }
       },
         child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 20)),
       );
  }
}
