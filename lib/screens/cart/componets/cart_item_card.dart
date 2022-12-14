import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Cart.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';


class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key, 
    @required this.cart,

  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateWidth(88),
          child: AspectRatio(
            aspectRatio: .88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: getProportionateWidth(20),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              demoCarts[0].product.title,
              style: TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
            ),
            const SizedBox(height: 10,),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
                style: TextStyle(
                  color: kPrimaryColor
                ),
                children: [
                  TextSpan(
                    text: "x${cart.numOfItems}",
                    style: TextStyle(color: kTextColor)
                  )
                ]
              )
            )
          ],
        )
      ],
    );
  }
}