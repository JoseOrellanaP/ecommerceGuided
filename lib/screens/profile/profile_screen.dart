import 'package:ecommerce/components/custom_bottom_nav_bar.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/enums.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/profile/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {

  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Body()
        ),
      bottomNavigationBar: CustomButtonNavBar(selectedMenu: MenuState.profile,),
    );
  }
}
