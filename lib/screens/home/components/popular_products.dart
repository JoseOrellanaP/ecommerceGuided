import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/models/Product.dart';



import 'package:ecommerce/screens/details/details_screen.dart';
import 'package:ecommerce/screens/home/components/special_offers.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';


class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
      text: "Popular Product",
      press: (){},
    ),
    SizedBox(height: getProportionateWidth(20),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              /*
              ...List.generate(
                demoProducts.length,
                (index) => ProductCart(
                  product: demoProducts[index],
                ),
              ),
              SizedBox(width: getProportionateWidth(20),),*/

              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular) 
                    return ProductCart(product: demoProducts[index], 
                                      press: ()=>
                                        Navigator.pushNamed(context, DetailScreen.routeName,
                                        arguments: demoProducts[index]),
                    );
                 return SizedBox
                    .shrink();
                }
              ),
              SizedBox(width: getProportionateWidth(20),),

              
            ],
          ),
        ),
      ],
    );
  }
}
