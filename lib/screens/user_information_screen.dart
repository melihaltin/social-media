import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nonname/config/palette.dart';
import 'package:nonname/widgets/form_widgets/form_widgets.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController fullNameController = TextEditingController();
    TextEditingController dateInputController = TextEditingController();

    TextInputType birthDateKeyboard = TextInputType.datetime;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          backgroundColor: whiteColor,
          elevation: 0,
          //title: SvgPicture.asset("assets/icons/google.svg"),//TODO: The APP logo will be put here.
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              UserInformationsScreenFields(
                  controller: fullNameController,
                  textFieldLabelText: "Ad Soyad"),
              UserInformationsScreenFields(
                controller: userNameController,
                textFieldLabelText: "Kullanıcı Adı",
              ),
              UserInformationsScreenFields(
                keyBoardType: birthDateKeyboard,
                controller: dateInputController,
                textFieldLabelText: "Doğum Tarihi",
                isDate: true,
                icon: SvgPicture.asset("assets/icons/calendar.svg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
