import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomSurfixIcon extends StatelessWidget {
  const CustomSurfixIcon({
    Key key,
    @required this .svgIcon,
  }) : super(key: key);
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0,
        getProportionateWidth(20),
        getProportionateWidth(20),
        getProportionateWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
      height: getProportionateWidth(18),
      ),
    );
  }
}