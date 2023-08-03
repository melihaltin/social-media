import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LoginOrSignupFormField extends StatelessWidget {
  const LoginOrSignupFormField({
    Key? key,
    required this.text,
    required this.controller,
    required this.isPW,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final bool isPW;
  @override
  Widget build(BuildContext context) {
    var isVisible = true.obs;

    return !isPW
        ? TextFormField(
            decoration: InputDecoration(
                labelText: text,
                labelStyle: Theme.of(context).textTheme.bodyText1!),
            controller: controller,
          )
        : Obx(() {
            return TextFormField(
              obscureText: isVisible.isTrue,
              decoration: InputDecoration(
                  suffixIcon: TextButton(
                    onPressed: () {
                      isVisible.toggle();
                    },
                    child: isVisible.isTrue
                        ? Text(
                            "show",
                            style: TextStyle(
                                color: const Color(0xff4A77ef),
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          )
                        : Text(
                            "hide",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff4A77ef),
                                fontSize: 12.sp),
                          ),
                  ),
                  labelText: text,
                  labelStyle: Theme.of(context).textTheme.bodyText1!),
              controller: controller,
              style: Theme.of(context).textTheme.bodyText2,
              onSaved: (newValue) {
                controller.text = newValue!;
              },
            );
          });
  }
}

class UserInformationsScreenFields extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String textFieldLabelText;
  final SvgPicture? icon;
  final bool? isDate;
  final TextInputType? keyBoardType;

  const UserInformationsScreenFields(
      {super.key,
      required this.controller,
      this.hintText,
      this.icon,
      required this.textFieldLabelText,
      this.isDate,
      this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInformationTexts(text: textFieldLabelText),
        SizedBox(
          height: 15.w,
        ),
        SizedBox(
          height: 50.h,
          child: TextField(
            keyboardType: keyBoardType,
            style: Theme.of(context).textTheme.bodyText1,
            onTap: isDate != null
                ? () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      controller.text = formattedDate;
                    }
                  }
                : () {},
            readOnly: isDate ?? false,
            controller: controller,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: icon ?? const Icon(null),
                hintText: hintText ?? ""),
          ),
        ),
        SizedBox(
          height: 43.w,
        )
      ],
    );
  }
}

class UserInformationTexts extends StatelessWidget {
  final String text;
  const UserInformationTexts({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
          color: const Color(0xff151522),
          fontSize: 15.sp,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600),
    );
  }
}
