import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nonname/config/palette.dart';
import 'package:nonname/screens/club_screen.dart';
import 'package:nonname/screens/home_screen.dart';
import 'package:nonname/screens/partner_screen.dart';
import 'package:nonname/screens/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return const [
        HomeScreen(),
        SearchScreen(),
        ClubsScreen(),
        PartnerScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset("assets/icons/bottomIcons/Home.svg"),
          title: ("Home"),
          activeColorPrimary: primaryColor,
          activeColorSecondary: whiteColor,
          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14.sp,
              ),
          inactiveColorPrimary: whiteColor,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset("assets/icons/bottomIcons/Search.svg"),
          title: ("Search"),
          activeColorPrimary: primaryColor,
          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14.sp,
              ),
          activeColorSecondary: whiteColor,
          inactiveColorPrimary: whiteColor,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset("assets/icons/bottomIcons/Group.svg"),
          title: ("Clubs"),
          activeColorPrimary: primaryColor,
          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14.sp,
              ),
          activeColorSecondary: whiteColor,
          inactiveColorPrimary: whiteColor,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/icons/bottomIcons/Partner.svg",
          ),
          title: ("Partner"),
          activeColorPrimary: primaryColor,
          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14.sp,
              ),
          activeColorSecondary: whiteColor,
          iconSize: 24,
        ),
      ];
    }

    PersistentTabController controller = PersistentTabController();

    return PersistentTabView(
      context,
      navBarHeight: 70.h,

      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.linear,

        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style7, // Choose the nav bar style with this property.
    );
  }
}
