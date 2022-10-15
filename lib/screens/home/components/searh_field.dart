import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class SearhField extends StatelessWidget {
  const SearhField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * .6,
      // height: 50,
      decoration: BoxDecoration(
        color: kSecondartColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value){
          // search value
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search Product",
          prefix: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateWidth(20),
            vertical: getProportionateWidth(9)
          )
        ),
      ),
    );
  }
}
