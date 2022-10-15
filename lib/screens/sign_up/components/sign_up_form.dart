import 'package:ecommerce/components/defaul_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile.screen.dart';
import 'package:ecommerce/screens/sign_in/compnents/custom_surfix_icon.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {  

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  
  final _formKey = GlobalKey<FormState>();
  String email, password, confirm_password;
  final List<String> errors = [];

    void addError({String error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}){
    if(errors.contains(error)){
      setState(() {
        errors.remove(error);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          builEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildRePasswordFielForm(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40),),
          DefaultButton(
            text: "Continue",
            press: (){
              if(_formKey.currentState.validate()){
                // Go to complete profile page
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildRePasswordFielForm() {
    return TextFormField(
          obscureText: true,
          onSaved: (newValue) => confirm_password = newValue,
          onChanged: (value){
            if(password == confirm_password){
              removeError(error: kMatchPassError);
            }
            return null;
          },
          validator: (value){
            if(value.isEmpty){
              return "";
            }else if(password != value) {
                      addError(error: kMatchPassError);
                      return "";
                    }
            return null;
          },
          decoration: InputDecoration(
            hintText: "Re-enter your password",
            labelText: "Confirm Password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurfixIcon(
              svgIcon: "assets/icons/Lock.svg",
            )
            
          ),
        );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
          obscureText: true,
          onSaved: (newValue) => password = newValue,
          onChanged: (value){
            if(value.isNotEmpty){
              removeError(error: kPassNullError);
            }else if(value.length >= 8) {
                      removeError(error: kShortPassError);
                    }
            password = value;
            return null;
          },
          validator: (value){
            if(value.isEmpty){
              addError(error: kPassNullError);
              return "";
            }else if(value.length < 8) {
                      addError(error: kShortPassError);
                      return "";
                    }
            return null;
          },
          decoration: InputDecoration(
            hintText: "Enter your password",
            labelText: "Password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurfixIcon(
              svgIcon: "assets/icons/Lock.svg",
            )
            
          ),
        );
  }

  TextFormField builEmailFormField() {
    return TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue,
          onChanged: (value){
            if(value.isNotEmpty){
              removeError(error: kEmailNullError);
            }else if(emailValidatorRegExp.hasMatch(value)) {
                      removeError(error: kInvalidEmailError);
                    }
            return null;
          },
          validator: (value){
            if(value.isEmpty){
              addError(error: kEmailNullError);
              return "";
            }else if(!emailValidatorRegExp.hasMatch(value)) {
                      addError(error: kInvalidEmailError);
                      return "";
                    }
            return null;
          },
          
          decoration: InputDecoration(
            hintText: "Enter your email",
            labelText: "Email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurfixIcon(
              svgIcon: "assets/icons/Mail.svg",
            )
            
          ),
        );
  }
}