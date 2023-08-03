import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/palette.dart';

class ConversationScreenWidget extends StatelessWidget {
  const ConversationScreenWidget({
    this.imageUrl,
    Key? key,
  }) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      color: whiteColor,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: CircleAvatar(
                    radius: 25.h,
                    backgroundImage: NetworkImage(imageUrl ??
                        "https://marketplace.canva.com/EAFEits4-uw/1/0/1600w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-oEqs2yqaL8s.jpg")),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aralık 15, 2018 01.30",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: const Color(0xff999999),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                        "last messagd dsa dçsa çdisa dşiasç işdsaçişd dklsamdlksam lkdsma lkdmslka mdlksamlk dmsal dmlskam lkdsa dsaç dsişa",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyText2!),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chevron_right,
                    size: 28,
                  ))
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          const Divider(
            color: Color(0xffE4E4E4),
            height: 1,
          ),
        ],
      ),
    );
  }
}
