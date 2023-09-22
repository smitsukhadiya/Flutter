import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Routes/app_route.dart';
import 'package:flutter_practical/practice/project/components/custom_suffix_Icon.dart';
import 'package:flutter_practical/practice/project/constants.dart';
import 'package:flutter_practical/practice/project/model/user.dart';
import 'package:flutter_practical/practice/project/praference/pref_manager.dart';
import 'package:flutter_practical/practice/project/utils/utils.dart';

class Signup_Form extends StatefulWidget {
  const Signup_Form({super.key});

  @override
  State<Signup_Form> createState() => _Signup_FormState();
}

class _Signup_FormState extends State<Signup_Form> {

  void updateGenderSelection(String? value) {
    setState(() {
      gender = value!;
    });
  }

  var dobController = TextEditingController();
  var passwordController = TextEditingController();

  String dob = '',
         password= '',
         firstname = '',
         lastname = '',
         email = '',
         contact = '',
         userType = '',
         address = '';

  Future<void> selectDate()async{
    var pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate:DateTime(2000),
        lastDate:DateTime.now(),
      confirmText: 'Done',
      cancelText: 'Cancel',
      fieldLabelText: 'DOB',
      helpText:'Select Date of Birth',
    );

    if(pickDate!= null){
      dob =
      '${pickDate.day.toString().padLeft(2,'0')}/${pickDate.month.toString().padLeft(2,'0')}/${pickDate.year}';
      setState(() {
        dobController.text = dob;
      });
    }
  }

  final globalKey = GlobalKey<FormState>();

  var gender = 'male';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: globalKey,
        child: Column(
          children: [
            buildNameFormField(),
            SizedBox(height: 16,),
            buildEmailFormField(),
            SizedBox(height: 16,),
            buildContactFormField(),
            SizedBox(height: 16,),
            buildGenderSelectionWidget(),
            SizedBox(height: 16,),
            buildUserTypeFormField(),
            SizedBox(height: 16,),
            buildDateofBirthFormField(),
            SizedBox(height: 16,),
            buildAdressFormField(),
            SizedBox(height: 20,),
            buildPasswordFormField(),
            SizedBox(height: 20,),
            buildConfirmPasswordFormField(),
           SizedBox(height: 20,),
            buildSignupButtonWidget(),
          ],
        ),
      ),
    );
  }

 buildNameFormField() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.name,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Enter Name First';
                }else{
                  return null;
                }
              },
              onSaved: (newValue) {
                firstname = newValue.toString();
              },
              decoration: InputDecoration(
                labelText: "First Name",
                hintText: 'First Name',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          ),
          SizedBox(width: 16,),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.name,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Enter Last Name';
                }else{
                  return null;
                }
              },
              onSaved: (newValue) {
                lastname = newValue.toString();
              },
              decoration: InputDecoration(
                labelText: "Last Name",
                hintText: 'Last Name',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          )
        ],
      ),
    );
  }

  buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || !Utils.isValidEmail(value)) {
          return 'Enter valid email address';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        email = newValue.toString();
      },
        decoration: InputDecoration(
          labelText: "Email",
          hintText: 'Email address',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon:CustomSuffixIcon(iconEmail),
        ),
    );
  }

 buildContactFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (value) {
        if(value == null || !Utils.isValidContact(value)){
          return 'Enter Valid Contact';
        }else{
          return null;
        }
      },
      onSaved: (newValue) {
        contact = newValue.toString();
      },
      decoration: InputDecoration(
        hintText: 'Contact',
        labelText: 'Contact Number',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSuffixIcon(iconCall),
      ),
    );
 }

  buildGenderSelectionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Gender'),
        Row(
          children: [
            Radio(value: 'male', groupValue:gender, onChanged:(value) {
             updateGenderSelection(value);
            },),
            Text('Male'),
          ],
        ),
        Row(
          children: [
            Radio(value: 'female', groupValue: gender, onChanged: (value) {
              updateGenderSelection(value);
            },),
            Text('Female')
          ],
        ),
        Row(
          children: [
            Radio(value: 'other', groupValue: gender, onChanged:(value) {
              updateGenderSelection(value);
            },),
            Text('Other'),
          ],
        ),
      ],
    );
  }

  buildUserTypeFormField() {
  return Padding(
    padding: EdgeInsets.only(left: 15,right: 15),
    child: DropdownButtonFormField(
      borderRadius: BorderRadius.circular(28),
      isExpanded: true,
      iconEnabledColor: Colors.black45,
      validator: (value) {
        if(value == null || value.isEmpty){
          return 'Select User Type';
        }else{
          return null;
        }
      },
      onSaved: (newValue) {
        userType = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "User Type",
          hintText: 'Select User Type',
          floatingLabelBehavior: FloatingLabelBehavior.auto),
      items: [
        DropdownMenuItem(
          alignment: Alignment.center,
           value: 'Vendor',
            child: Text('Vendor')),

        DropdownMenuItem(
            alignment: Alignment.center,
          value: 'User',
            child: Text('User'))
      ],
      onChanged: (value) {
     userType = value.toString();
      },),
  );
  }

  buildDateofBirthFormField() {
    return TextFormField(
      keyboardType: TextInputType.none,
      controller:dobController,
      onTap: () {
        selectDate();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      validator: (value) {
        if(value == null || value.isEmpty){
          return 'Select Date of Birth';
        }else{
          return null;
        }
      },
      onSaved: (newValue) {
        dob = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "Date of birth",
          hintText: 'Date of birth',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffixIcon('assets/Dob.svg')),
    );
  }

 buildAdressFormField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      onSaved: (newValue) {
        address = newValue.toString();
      },
      decoration: InputDecoration(
        labelText: 'Address',
        hintText: 'Address',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        alignLabelWithHint: true,
      ),
    );
 }

  buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        if(value == null || !Utils.isValidPassword(value)){
          return 'Enter Valid Password';
        }else{
          return null;
        }
      },
      onSaved: (newValue) {
        password = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: 'Enter password',
          helperText:
          'must contains digit, alphabet and special character (*,@,_)',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffixIcon('assets/icons/Lock.svg')),
    );
  }

  buildConfirmPasswordFormField() {
   return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        if(value == null || value != passwordController.text.toString()){
          return 'Password Missmatch';
        }else {
          return null;
        }
      },
      decoration: InputDecoration(
          labelText: "Confirm password",
          hintText: 'Enter password',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CustomSuffixIcon('assets/icons/Lock.svg')),
    );
  }

  buildSignupButtonWidget() {
    return MaterialButton(
      color: Colors.green,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onPressed: () {
  if(globalKey.currentState!.validate()){
      globalKey.currentState!.save();

      var user = User(
       email: email,
        name: '$firstname $lastname',
        contact: contact,
        address: address,
        dob: dob,
        gender: gender,
        password: password,
        userType: userType,
      );
      PrefManager.updateLoginStatus(true);
      Navigator.pushReplacementNamed(context, AppRoute.home);
  }
      },
      child: Text(
        'Sign up',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

}
