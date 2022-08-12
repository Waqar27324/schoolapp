import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:schoolphotoapp/models/album_model.dart';
import 'package:schoolphotoapp/models/media_file_model.dart';
import 'package:schoolphotoapp/utils/constants/sizes.dart';
import 'package:schoolphotoapp/utils/my_colors.dart';
import 'package:schoolphotoapp/viewmodels/home_view_model.dart';
import 'package:schoolphotoapp/views/widgets/custom_text.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key, required this.albumModel}) : super(key: key);

  final AlbumModel albumModel;

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  // Initial Selected Value
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // toolbarHeight: 0,
        leading: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: MyColors.blackTextColor,
            size: 24.r,
          ),
        ),
        title: CustomText(
          text: 'Activity',
          textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: MyColors.blackTextColor,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Consumer<HomeViewModel>(builder: (context, homeProvider, __) {
          return Column(
            children: [
              sizeBoxHeight15,
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        homeProvider.isInProgressStatus
                            ? SvgPicture.asset(
                                'assets/svgs/upload.svg',
                                height: 35.h,
                                width: 35.w,
                              )
                            : Icon(
                                Icons.check_circle_rounded,
                                color: MyColors.primaryColor,
                                size: 35.r,
                              ),
                        SizedBox(
                          width: 0.73.sw,
                          height: 35.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: homeProvider.isInProgressStatus
                                        ? 'Uploading photos'
                                        : 'Upload completed',
                                    textStyle: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.blackTextColor),
                                  ),
                                  CustomText(
                                    text: (homeProvider.isRetryingSingleFile)
                                        ? '1 left'
                                        : homeProvider.isInProgressStatus
                                            ? '${homeProvider.files.length - homeProvider.currentUploadIndex} left'
                                            : 'Nothing left',
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.lightgreyColorText,
                                    ),
                                  ),
                                ],
                              ),
                              StreamBuilder<int>(
                                  initialData: 0,
                                  stream: homeProvider.publishSubject,
                                  builder: (builder, snap) {
                                    return LinearPercentIndicator(
                                        padding: EdgeInsets.zero,
                                        alignment: MainAxisAlignment.start,
                                        lineHeight: 4.h,
                                        percent:
                                            (!homeProvider.isInProgressStatus)
                                                ? 1
                                                : snap.data! / 100,
                                        barRadius: Radius.circular(2.r),
                                        progressColor:
                                            (homeProvider.isInProgressStatus)
                                                ? MyColors.greenColorText
                                                : MyColors.primaryColor);
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              sizeBoxHeight30,
              // if (homeProvider.isInProgressStatus)
              Wrap(
                // direction: Axis.vertical,
                // alignment: WrapAlignment.center,
                // spacing: 0.0,
                // runAlignment:WrapAlignment.center,
                // runSpacing: 0.0,
                // crossAxisAlignment: WrapCrossAlignment.center,
                // textDirection: TextDirection.rtl,
                // verticalDirection: VerticalDirection.up,

                children: <Widget>[
                  for (var i = 0; i < homeProvider.mediaFilesList.length; i++)
                    SingleMediaItemWidget(
                      height: MediaQuery.of(context).size.width * 0.25,
                      width: MediaQuery.of(context).size.width * 0.25,
                      mediaFile: homeProvider.mediaFilesList[i],
                      uploadStatus: 1,
                      isStreaming:
                          (i == homeProvider.currentUploadIndex) ? true : false,
                      index: i,
                    ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

class SingleMediaItemWidget extends StatelessWidget {
  const SingleMediaItemWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.mediaFile,
      required this.uploadStatus,
      required this.index,
      required this.isStreaming})
      : super(key: key);
  final double height;
  final double width;
  final MediaFileModel mediaFile;
  final bool isStreaming;
  final int index;
  final int
      uploadStatus; //  1 for uploading,2 for uploaded, 3 for failed, 4 for pending
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, homeProvider, __) {
      return Stack(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  'assets/images/profile.jpeg',
                ),
                fit: BoxFit.cover,
                colorFilter: (homeProvider.isInProgressStatus &&
                        index > homeProvider.currentUploadIndex)
                    ? const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.darken,
                      )
                    : null,
              ),
            ),
          ),
          if (homeProvider.isInProgressStatus &&
              index <= homeProvider.currentUploadIndex)
            Positioned(
              bottom: -5.h,
              right: -5.w,
              child: Container(
                width: 35.r,
                height: 35.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // color: Colors.transparent,
                    color: (isStreaming)
                        ? MyColors.whiteTextColor
                        : (homeProvider.mediaFilesList[index].uploadToken !=
                                null)
                            ? MyColors.primaryColor
                            : MyColors.orangeColor,
                    shape: BoxShape.circle),
                child: (isStreaming && homeProvider.isInProgressStatus)
                    ? StreamBuilder<int>(
                        initialData: 0,
                        stream: homeProvider.publishSubject,
                        builder: (builder, snap) {
                          return Text(
                            '${snap.data}%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: MyColors.greenColorText,
                            ),
                          );
                        })
                    : Icon(
                        (homeProvider.mediaFilesList[index].uploadToken != null)
                            ? Icons.done
                            // : (!homeProvider.isInProgressStatus)
                            //     ? Icons.info
                            : Icons.refresh,
                        color: Colors.white,
                        size: 15.r),
              ),
            ),
          if (!homeProvider.isInProgressStatus)
            Positioned(
              bottom: -5.h,
              right: -5.w,
              child: Container(
                width: 35.r,
                height: 35.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // color: Colors.transparent,
                    color:
                        (homeProvider.mediaFilesList[index].uploadToken != null)
                            ? MyColors.primaryColor
                            : MyColors.orangeColor,
                    shape: BoxShape.circle),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  radius: 35.r,
                  child: Icon(
                      (homeProvider.mediaFilesList[index].uploadToken != null)
                          ? Icons.done
                          : Icons.refresh,
                      color: Colors.white,
                      size: 15.r),
                  onTap: () {
                    if (homeProvider.mediaFilesList.isNotEmpty) {
                      homeProvider.startRetryProcessForSingleFile(
                        context,
                        homeProvider.mediaFilesList[index],
                        index,
                      );
                    }
                  },
                ),
              ),
            ),
        ],
      );
    });
  }
}
