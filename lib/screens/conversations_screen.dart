import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nonname/config/palette.dart';
import 'package:nonname/widgets/navigationbar/bottom_navigation_bar.dart';

import '../widgets/conversationScreen/conservation_widget.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor,
    ));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: InkWell(
                child: SvgPicture.asset(
                  "assets/icons/bottomIcons/plus.svg",
                  height: 14.h,
                ),
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {},
          ),
          title: Text("Sohbet", style: Theme.of(context).textTheme.headline1),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return const ConversationScreenWidget();
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
