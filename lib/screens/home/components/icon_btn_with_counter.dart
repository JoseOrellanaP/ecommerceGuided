import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class iconBtnWithCounter extends StatelessWidget {
  const iconBtnWithCounter({
    Key key, 
    @required this.svgSrc, 
    this.numOfItems = 0, 
    @required this.press,

  }) : super(key: key);

  final String svgSrc;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateWidth(12)),
            height: getProportionateWidth(46),
            width: getProportionateWidth(46),
            decoration: BoxDecoration(
              color: kSecondartColor.withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfItems != 0)
          Positioned(
            right: 0,
            top: -3,
            child: Container(
              height: getProportionateWidth(16),
              width: getProportionateWidth(16),
              decoration: BoxDecoration(
                color: Color(0xFFFF4848),
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Center(
                child: Text(
                  "$numOfItems",
                  style: TextStyle(
                    fontSize: getProportionateWidth(10),
                    height: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}