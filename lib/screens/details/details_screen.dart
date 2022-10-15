
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/screens/details/components/body.dart';
import 'package:flutter/material.dart';

import 'components/custom_app_bar.dart';

class DetailScreen extends StatelessWidget {

  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {

    final Product arguments = 
      ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(arguments.rating),
      body: Body(
        product: arguments,
      ),
    );
  }
}


  // We need to pass our product to the detail screen
  // we used route so we need to create an argument class

  class ProductDetailsArguments {

    final Product product;
    ProductDetailsArguments({@required this.product});
    
  }

