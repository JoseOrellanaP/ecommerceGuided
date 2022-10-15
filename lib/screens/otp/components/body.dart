

import 'package:ecommerce/components/defaul_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateWidth(20.0)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * .05,),
              Text("OTP Verification", style: headingStyle,),
              Text("We sent your code to your number"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * .15,),
              OTPForm(),
              SizedBox(height: SizeConfig.screenHeight * .1,),
              GestureDetector(
                onTap: (){
                  // resend the OTP
                },
                child: Text(
                  "Resent OTP code",
                  style: TextStyle(decoration: TextDecoration.underline),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This code will expire in "),
            TweenAnimationBuilder(
              tween: Tween(begin: 30.0, end: 0.00), 
              duration: Duration(seconds: 30), 
              builder: (context, value, child) => Text("00:${value.toInt()}",
                style: TextStyle(color: kPrimaryColor),),
                onEnd: (){},
              ),
          ],
        );
  }
}
