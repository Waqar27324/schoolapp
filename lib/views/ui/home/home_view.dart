import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:schoolphotoapp/models/album_model.dart';
import 'package:schoolphotoapp/utils/constants/sizes.dart';
import 'package:schoolphotoapp/utils/constants/text_styles.dart';
import 'package:schoolphotoapp/utils/my_colors.dart';
import 'package:schoolphotoapp/viewmodels/auth_view_model.dart';
import 'package:schoolphotoapp/viewmodels/home_view_model.dart';
import 'package:schoolphotoapp/views/ui/activity/activity.dart';
import 'package:schoolphotoapp/views/ui/home/local_widgets/select_mediafiles_bottomsheet.dart';
import 'package:schoolphotoapp/views/ui/home/local_widgets/single_uploaded_album_activity.dart';
import 'package:schoolphotoapp/views/ui/settings/settings.dart';
import 'package:schoolphotoapp/views/widgets/custom_text.dart';
import 'package:schoolphotoapp/views/widgets/rounded_image_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectMediaFilesBottomSheet(context);
        },
        backgroundColor: MyColors.primaryColor,
        child: Icon(
          Icons.add,
          size: 30.r,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              sizeBoxHeight5,
              Consumer<FirebaseAuthViewModel>(
                  builder: (context, authProvider, __) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CustomText(
                        textAlign: TextAlign.left,
                        text: (authProvider.studentModel.fullName == '')
                            ? 'Welcome'
                            : 'Good Morning ${authProvider.studentModel.fullName}',
                        textStyle: goodMorningStyle,
                        maxLines: 1,
                        textOverflow: TextOverflow.clip,
                      ),
                    ),
                    sizeBoxwidth10,
                    SvgPicture.asset(
                      'assets/svgs/sunrise.svg',
                      height: 26.h,
                      width: 26.w,
                    ),
                    sizeBoxwidth5,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()),
                        );
                      },
                      splashColor: Colors.transparent,
                      radius: 45.r,
                      child: Container(
                        width: 45.w,
                        height: 45.h,
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: MyColors.primaryColor),
                        ),
                        child: RoundedImage(
                          height: 35.h,
                          width: 35.w,
                          isBorderVisible: false,
                          imageUrl: authProvider.studentModel.profileUrl ??
                              'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
                        ),
                      ),
                    ),
                  ],
                );
              }),
              sizeBoxHeight35,
              Consumer<HomeViewModel>(builder: (context, homeProvider, __) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Last Activity',
                          textStyle: subHeading,
                        ),
                        CustomText(
                          text: homeProvider.isInProgressStatus
                              ? 'InProgress'
                              : 'Completed',
                          textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: homeProvider.isInProgressStatus
                                ? MyColors.greenColorText
                                : MyColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    sizeBoxHeight15,
                    Container(
                      height: 83.h,
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: MyColors.lightGreyWidgetBckColor),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<int>(
                              initialData: 0,
                              stream: homeProvider.publishSubject,
                              builder: (builder, snap) {
                                return LinearPercentIndicator(
                                    padding: EdgeInsets.zero,
                                    alignment: MainAxisAlignment.start,
                                    lineHeight: 16.h,
                                    percent: (!homeProvider.isInProgressStatus)
                                        ? 1
                                        : snap.data! / 100,
                                    barRadius: Radius.circular(3.r),
                                    progressColor:
                                        (homeProvider.isInProgressStatus)
                                            ? MyColors.greenColorText
                                            : MyColors.primaryColor);
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: (homeProvider.isInProgressStatus)
                                    ? '${homeProvider.currentUploadIndex} of ${homeProvider.files.length} uploaded'
                                    : '12 of 12 uploaded',
                                textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.lightgreyColorText),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ActivityScreen(
                                              albumModel: dymmyAlbumsData[0],
                                            )),
                                  );
                                  // }
                                },
                                child: CustomText(
                                  text: 'See Detail >',
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.blackTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              sizeBoxHeight25,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Recent Activity',
                    textStyle: subHeading,
                  ),
                ],
              ),
              sizeBoxHeight25,
              SizedBox(
                height: 0.6.sh,
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior(
                      androidOverscrollIndicator:
                          AndroidOverscrollIndicator.glow),
                  child: ListView.builder(
                      itemCount: dymmyAlbumsData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: SingleUploadedAlbumActivity(
                            albumModel: dymmyAlbumsData[index],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
