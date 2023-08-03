import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({Key? key, this.errorMessage}) : super(key: key);
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/icons/x-circle.svg"),
        Text(
          "BAŞARISIZ",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: const Color(0xff151512), fontSize: 34.sp),
        ),
        Text(
          errorMessage ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: const Color(0xff999999)),
        )
      ],
    );
  }
}
