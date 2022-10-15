import 'package:flutter/material.dart';

import '../../../size_config.dart';


class Discount_banner extends StatelessWidget {
  const Discount_banner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateWidth(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateWidth(20),
        vertical: getProportionateWidth(15),
      ),
      width: double.infinity,
      //height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text.rich(
        TextSpan(
          text: "A Summer Surprise\n",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )
            )
          ]
        ),
      ),
    );
  }
}
