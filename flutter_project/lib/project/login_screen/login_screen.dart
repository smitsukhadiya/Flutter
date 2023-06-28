import 'package:flutter/material.dart';
import 'package:flutter_practical/project/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  var _email = TextEditingController();
  var _pass = TextEditingController();

  var _emailerror = null;
  var _passworderror = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 50,
        color: Colors.grey.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an Account?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                'SignUp',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.nsbpictures.com/wp-content/uploads/2019/11/logo-icon-png-8.png'),
                          height: 140,
                          width: 140,
                        ),
                        Text(
                          'WELCOME',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          'LogIn To Continue',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _email,
                          cursorHeight: 27,
                          cursorColor: Colors.grey.shade300,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.grey.shade300,
                            ),
                            filled: true,
                            fillColor: _emailerror==null? Colors.grey.shade500 : Colors.red.shade300,
                            hintText: 'Enter Email Address',
                            errorText: _emailerror,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                              )
                            ),
                            border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorStyle: TextStyle(
                              color: Colors.red
                            ),
                            hintStyle: TextStyle(color: Colors.grey.shade300),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                              )
                            )

                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _pass,
                          cursorHeight: 27,
                          cursorColor: Colors.grey.shade300,
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.key,
                                color: Colors.grey.shade300,
                              ),
                              filled: true,
                              fillColor: _passworderror==null? Colors.grey.shade500 : Colors.red.shade300,
                              hintText: 'Enter PassWord',
                              errorText: _passworderror,
                              hintStyle: TextStyle(color: Colors.grey.shade300),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  )
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              errorStyle: TextStyle(
                                  color: Colors.red
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  )
                              )
                          ),
                          obscureText: true,
                          maxLength: 18,
                        ),
                        SizedBox(height: 8),
                        Container(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              print('Forgot Password Clicked');
                            },
                            child: Text(
                              'Forgot PassWord?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            String email = _email.text;
                            String password = _pass.text;

                            _emailerror = null;
                            _passworderror = null;

                            setState(()  {
                              if (!Utils.isValidEmail(email)) {
                                //show error on email
                                _emailerror = "Enter valid Email Address";
                              } else if (!Utils.isValidPassword(password)) {
                                //show error on password
                                _passworderror = "Enter Valid PassWord";
                              } else {
                                print('All fields are validated');
                                navigate(context);
                              }
                            });
                          },
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            child: Text(
                              'LogIn',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigate(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();
    var isLogin = await prefs.setBool('isLogin', true);
    if(isLogin){
      Navigator.pushNamed(context,'/home');
    }
  }
}
