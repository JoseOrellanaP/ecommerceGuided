import 'package:ecommerce/components/defaul_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/components/social_card.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/sign_in/compnents/custom_surfix_icon.dart';
import 'package:ecommerce/screens/sign_up/components/sign_up_form.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

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
              SizedBox(height: SizeConfig.screenHeight * 0.02,),
              Text(
                "Register Account",
                style: headingStyle
              ),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * .07,), // 8% of total height
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.07,),
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: "assets/icons/google-icon.svg",
                        press: (){},
                      ),
                      SocialCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: (){},
                      ),
                      SocialCard(
                        icon: "assets/icons/twitter.svg",
                        press: (){},
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateWidth(20),),
                  Text(
                    "By continuing your confirm that you agree \nwith our Term and Conditions",
                    textAlign: TextAlign.center,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

