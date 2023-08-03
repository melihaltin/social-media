import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreenWidget extends StatelessWidget {
  const SuccessScreenWidget({Key? key, this.successMessage}) : super(key: key);
  final String? successMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/icons/check-circle.svg"),
        Text(
          "BAŞARILI",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: const Color(0xff151512), fontSize: 34.sp),
        ),
        Text(
          successMessage ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: const Color(0xff999999)),
        )
      ],
    );
  }
}
