import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length, (index) => formErrorText(error: errors[index])
      )
    );
  }

  Row formErrorText({String error}) {
    return Row(
    children: [
      SvgPicture.asset("assets/icons/Error.svg",
      height: getProportionateScreenHeight(14),
      width: getProportionateWidth(14),
      ),
      SizedBox(
        width: getProportionateWidth(10),
      ),
      Text(error)
    ],
  );
  }
}
