import 'package:ecommerce/constants.dart';
import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/screens/home/components/popular_products.dart';
import 'package:ecommerce/screens/home/components/searh_field.dart';
import 'package:ecommerce/screens/home/components/icon_btn_with_counter.dart';
import 'package:ecommerce/screens/home/components/special_offers.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateWidth(20),),
            HomeHeader(),
            SizedBox(height: getProportionateWidth(30),),
            Discount_banner(),
            SizedBox(height: getProportionateWidth(30),),
            Categories(),
            SizedBox(height: getProportionateWidth(30),),
            SpecialOffers(),
            SizedBox(height: getProportionateWidth(30),),
            PopularProducts(),
            SizedBox(height: getProportionateWidth(30),),
          ],
        ),
      )
      );
  }
}
