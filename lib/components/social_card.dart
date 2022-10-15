import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SocialCard extends StatelessWidget {
  const SocialCard({
    this.icon,
    this.press,
    Key key,
  }) : super(key: key);

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateWidth(10)),
        padding: EdgeInsets.all(getProportionateWidth(12)),
        height: getProportionateScreenHeight(45),
        width: getProportionateWidth(40),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
