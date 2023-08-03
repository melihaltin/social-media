import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nonname/config/palette.dart';
import 'package:flutter/services.dart';
import '../widgets/form_widgets/form_widgets.dart'; // to show status bar

class LoginOrSignupScreen extends StatefulWidget {
  const LoginOrSignupScreen({super.key});

  @override
  State<LoginOrSignupScreen> createState() => _LoginOrSignupScreenState();
}

class _LoginOrSignupScreenState extends State<LoginOrSignupScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = false.obs;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                LoginContainer(
                  containerHeight: 600.h,
                  containerColor: primaryColor,
                  radius: 37,
                  containerChild: Padding(
                    padding:
                        EdgeInsets.only(left: 62.w, right: 62.w, top: 10.h),
                    child: FirstContainer(isLogin: isLogin),
                  ),
                ),
                LoginContainer(
                  containerHeight: 541.h,
                  containerColor: whiteColor,
                  radius: 32.w,
                  containerChild: Padding(
                    padding:
                        EdgeInsets.only(left: 35.w, right: 35.w, top: 56.h),
                    child: Obx(() => isLogin.isTrue
                        ? const LoginOrSignupContainer(
                            text1: "Mevcut hesabınızla giriş yapabilirsiniz.",
                            text2: "Giriş yap",
                            text3: "YA DA ŞUNUNLA GİRİŞ YAP",
                          )
                        : const LoginOrSignupContainer(
                            text1: "Aşağıdan Kayıt olabilirsiniz",
                            text2: "Kayıt Ol",
                            text3: "YA DA ŞUNUNLA KAYIT OLABİLİRSİNİZ")),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FirstContainer extends StatelessWidget {
  const FirstContainer({
    Key? key,
    required this.isLogin,
  }) : super(key: key);

  final RxBool isLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            isLogin.toggle();
          },
          child: Obx(
            () => Text(
              "Giriş Yap",
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: isLogin.isTrue
                        ? whiteColor
                        : whiteColor.withOpacity(49 / 100),
                  ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            isLogin.toggle();
          },
          child: Obx(
            () => Text(
              "Kayıt Ol",
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: isLogin.isFalse
                        ? whiteColor
                        : whiteColor.withOpacity(49 / 100),
                  ),
            ),
          ),
        )
      ],
    );
  }
}

class LoginOrSignupContainer extends StatelessWidget {
  const LoginOrSignupContainer({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
  }) : super(key: key);
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    // GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController emailInput = TextEditingController();
    TextEditingController pwInput = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoginTexts(
            text: "Hoşgeldiniz",
            textStyle: Theme.of(context).textTheme.headline1!),
        SizedBox(
          height: 14.h,
        ),
        LoginTexts(
          text: text1,
          textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                fontWeight: FontWeight.bold,
                color: primaryTextColor.withOpacity(42 / 100),
              ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 12.w,
            ),
            LoginOrSignupFormField(
              controller: emailInput,
              text: 'email',
              isPW: false,
            ),
            LoginOrSignupFormField(
              text: 'parola',
              controller: pwInput,
              isPW: true,
            )
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        LoginOrSignupScreenButton(
          text: text2,
          procedure: () {
            //Get.to("/cart");
          },
        ),
        SizedBox(
          height: 27.h,
        ),
        const LoginOrSignupScreenUtils(),
        SizedBox(
          height: 65.h,
        ),
        SocialPlatforms(
          text: text3,
        ),
      ],
    );
  }
}

class SocialPlatforms extends StatelessWidget {
  const SocialPlatforms({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          LoginTexts(
            text: text,
            textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black.withOpacity(42 / 100),
                ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              socialIcons("assets/icons/google.svg", () {}),
              SizedBox(
                width: 30.w,
              ),
              socialIcons("assets/icons/facebook.svg", () {}),
              SizedBox(
                width: 30.w,
              ),
              socialIcons("assets/icons/twitter.svg", () {}),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector socialIcons(String iconPath, Function procedure) {
    return GestureDetector(
      onTap: procedure(),
      child: SvgPicture.asset(
        iconPath,
        height: 45.h,
        width: 45.h,
      ),
    );
  }
}

class LoginOrSignupScreenUtils extends StatelessWidget {
  const LoginOrSignupScreenUtils({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LoginTexts(
          text: "Parolanızı mı unuttunuz?",
          textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              color: Colors.black.withOpacity(43 / 100)),
        ),
        SizedBox(
          width: 15.w,
        ),
        InkWell(
          onTap: () {},
          child: LoginTexts(
            text: "Parolayı sıfırla",
            textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 11.sp,
                  color: const Color(0xff000AFF),
                ),
          ),
        )
      ],
    );
  }
}

class LoginOrSignupScreenButton extends StatelessWidget {
  final Function procedure;
  const LoginOrSignupScreenButton({
    required this.text,
    Key? key,
    required this.procedure,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: procedure(),
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(11.r)),
        height: 50.h,
        width: 298.w,
        child: Center(
          child: InkWell(
            onTap: () {}, //TODO: Button
            child: LoginTexts(
              text: text,
              textStyle: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginTexts extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  const LoginTexts({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle);
  }
}

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
