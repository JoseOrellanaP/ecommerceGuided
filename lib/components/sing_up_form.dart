

import 'package:ecommerce/components/defaul_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screens/login_success/login_sucess_screen.dart';
import 'package:ecommerce/screens/sign_in/compnents/custom_surfix_icon.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';


class SignForm extends StatefulWidget {

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
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
    var kPrimaryColor;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value){
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    ForgotPasswordScreen.routeName
                  );
                },
                child: Text(
                  "Forgot password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: 'Continue',
            press: (){
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();
                // If all are valid then go to success screen
                Navigator.pushNamed(context, LoginSucessScreen.routeName);
              }
            },
          )
        ],
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

  TextFormField buildEmailFormField() {
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
