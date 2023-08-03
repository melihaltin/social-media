import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginContainer extends StatelessWidget {
  final double containerHeight;
  final double radius;
  final Widget containerChild;
  final Color containerColor;
  const LoginContainer({
    required this.containerHeight,
    required this.radius,
    required this.containerColor,
    required this.containerChild,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius))
            .w,
        color: containerColor,
      ),
      child: containerChild,
    );
  }
}
