import 'package:ecommerce/components/defaul_button.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce/screens/splash/components/splash_content.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text" : "Welcome to Tokoto, let's shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people conect with store \naround the world",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop, \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value){
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                image: splashData[index]['image'],
                text: splashData[index]['text'],
              ),
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateWidth(20)
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index)
                      ),
                    ),
                    Spacer(flex: 3,),
                    DefaultButton(
                      text: "Continue",
                      press: (){
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
                  duration: kAnimationDuration,
                  margin: EdgeInsets.only(right: 5),
                  height: 6,
                  width: currentPage == index ? 20 : 6,
                  decoration: BoxDecoration(
                    color: currentPage==index ? kPrimaryColor : Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.circular(3)
                  ),
                );
  }
}
