import 'package:ecommerce/components/defaul_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/screens/otp/otp_screen.dart';
import 'package:ecommerce/screens/sign_in/compnents/custom_surfix_icon.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class CompleteProfileForm extends StatefulWidget {

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName, lastName, phoneNumber, address;

  void addError({String error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }
  
  void removeError({String error}){
    if (errors.contains(error)) {
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
        buildFirstNameFormField(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildLastNameFormField(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildPhoneNumberFormField(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildAddressFormField(),
        FormError(errors: errors),
        SizedBox(height: getProportionateScreenHeight(40)),
        DefaultButton(
          text: "Continue",
          press: (){
            if (_formKey.currentState.validate()) {
              // Go to OTP screen
              Navigator.pushNamed(context, OtpScreen.routeName);
            }
          },
        )
        ],
      ),
    );
  
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
        onSaved: (newValue) => address = newValue,
        onChanged: (value){
          if(value.isNotEmpty){
            removeError(error: kAdrressNullError);
          }
          return null;
        },
        validator: (value){
          if(value.isEmpty){
            addError(error: kAdrressNullError);
            return "";
          }
          return null;
        },
        
        decoration: InputDecoration(
          hintText: "Enter your address",
          labelText: "Address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurfixIcon(
            svgIcon: "assets/icons/Location point.svg",
          )
          
        ),
      );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        onSaved: (newValue) => phoneNumber = newValue,
        onChanged: (value){
          if(value.isNotEmpty){
            removeError(error: kPhoneNumberNullError);
          }
          return null;
        },
        validator: (value){
          if(value.isEmpty){
            addError(error: kPhoneNumberNullError);
            return "";
          }
          return null;
        },
        
        decoration: InputDecoration(
          hintText: "Enter your phone number",
          labelText: "Phone Number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurfixIcon(
            svgIcon: "assets/icons/Phone.svg",
          )
          
        ),
      );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
        onSaved: (newValue) => lastName = newValue, 
        decoration: InputDecoration(
          hintText: "Enter your last Name",
          labelText: "Last Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurfixIcon(
            svgIcon: "assets/icons/User.svg",
          )
          
        ),
      );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
        onSaved: (newValue) => firstName = newValue,
        onChanged: (value){
          if(value.isNotEmpty){
            removeError(error: kNameNullError);
          }
          return null;
        },
        validator: (value){
          if(value.isEmpty){
            addError(error: kNameNullError);
            return "";
          }
          return null;
        },
        
        decoration: InputDecoration(
          hintText: "Enter your firts Name",
          labelText: "First Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurfixIcon(
            svgIcon: "assets/icons/User.svg",
          )
          
        ),
      );
  }
}