import 'package:bet_for_big/components/image_widget.dart';
import 'package:bet_for_big/components/spring_widget.dart';
import 'package:bet_for_big/constant/constants.dart';
import 'package:bet_for_big/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class historyRecordCard extends StatelessWidget {
  const historyRecordCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return SpringWidget(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                    height: 300.sp,
                    child: Column(children: [
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/bg2.png'),
                                fit: BoxFit
                                    .cover, // Use BoxFit.cover instead of BoxFit.fill
                                colorFilter: ColorFilter.mode(
                                  themecontroller.colorPrimary.withOpacity(0.9),
                                  BlendMode.srcATop,
                                ),
                              ),
                            ),
                            child: Column(children: [
                              SizedBox(
                                height: 20.sp,
                              ),
                              Stack(children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 42.sp,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(110),
                                    child: ImageWidget(
                                        height: 80.sp,
                                        width: 100,
                                        imageUrl:
                                            'https://a.storyblok.com/f/191576/1200x800/faa88c639f/round_profil_picture_before_.webp'),
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15.sp,
                                      child: Image.asset(
                                          'assets/images/hookie.png'),
                                    ))
                              ]),
                              Text(
                                'NCAAB',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'calvin King',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Container(
                            child: Column(
                              children: [],
                            ),
                          ),
                        ),
                      )
                    ])),
              );
            },
          );
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.screenPadding,
                vertical: Constants.screenPadding),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(children: [
                    CircleAvatar(
                      backgroundColor:
                          themecontroller.colorPrimary.withOpacity(0.4),
                      radius: 43.sp,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(110),
                        child: ImageWidget(
                            height: 80.sp,
                            width: 100,
                            imageUrl:
                                'https://a.storyblok.com/f/191576/1200x800/faa88c639f/round_profil_picture_before_.webp'),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 27, 203, 243),
                          radius: 15.sp,
                          child: Image.asset('assets/images/hookie.png'),
                        ))
                  ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'NCAAB',
                        style: TextStyle(
                          color: themecontroller.colorPrimary.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.sp,
                      ),
                      SizedBox(
                        width: 70.sp,
                        child: Text(
                          'calvin king',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.sp,
                      ),
                      Text(
                        'Bat on',
                        style: TextStyle(
                          color: themecontroller.colorPrimary.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'category Flames',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'NCAAB',
                        style: TextStyle(
                          color: themecontroller.colorPrimary.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.sp,
                      ),
                      SizedBox(
                        width: 70.sp,
                        child: Text(
                          'category Flames',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'vs',
                        style: TextStyle(
                          color: themecontroller.colorPrimary.withOpacity(0.6),
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 70.sp,
                        child: Text(
                          'category Flames',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text(
                        'Market',
                        style: TextStyle(
                          color: themecontroller.colorPrimary.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'moneyline',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Odds',
                        style: TextStyle(
                          color: themecontroller.colorPrimary.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '-200',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Text(
                        'Risk',
                        style: TextStyle(
                          color: themecontroller.colorPrimary.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Units',
                        style: TextStyle(
                          color: themecontroller.colorPrimary.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '-200',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Text(
                        'bet Result',
                        style: TextStyle(
                          color: themecontroller.colorPrimary.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Lost',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      );
    });
  }
}
