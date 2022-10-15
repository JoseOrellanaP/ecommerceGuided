import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",
        style: TextStyle(fontSize: getProportionateWidth(16)),),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(
              context, 
              SignUpScreen.routeName
              );
          },
          child: Text("Sign up",
          style: TextStyle(
            fontSize: getProportionateWidth(16),
            color: kPrimaryColor
          ),),
        )
      ],
    );
  }
}
