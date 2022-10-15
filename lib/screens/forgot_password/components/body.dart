import 'package:ecommerce/components/defaul_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/components/no_account_text.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/sign_in/compnents/custom_surfix_icon.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * .04,),
              Text("Forgot password",
              style: TextStyle(
                fontSize: getProportionateWidth(28),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              ),
              Text("Please enter your email and we will send \nyou a link to return to your account",
              textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * .1,),
              ForgotPassword(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatefulWidget {

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue,
          onChanged: (value){
            if(value.isNotEmpty && errors.contains(kEmailNullError)){
              setState(() {
                errors.remove(kEmailNullError);
              });
            }else if(emailValidatorRegExp.hasMatch(value) &&
                    errors.contains(kInvalidEmailError)) {
                      setState(() {
                        errors.remove(kInvalidEmailError);
                      });
                    }
            return null;
          },
          validator: (value){
            if(value.isEmpty && !errors.contains(kEmailNullError)){
              setState(() {
                errors.add(kEmailNullError);
              });
            }else if(!emailValidatorRegExp.hasMatch(value) &&
                    !errors.contains(kInvalidEmailError)) {
                      setState(() {
                        errors.add(kInvalidEmailError);
                      });
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
        ),
        SizedBox(height: getProportionateScreenHeight(30),),
        FormError(errors: errors,),
        SizedBox(height: SizeConfig.screenHeight * .1,),
        DefaultButton(
          text: "Continue",
          press: (){
            if(_formKey.currentState.validate()){
              // Do what you want to do
            }
          },
        ),
        SizedBox(height: SizeConfig.screenHeight * .1,),
        NoAccountText()
        ],
      ),
    );
  }
}