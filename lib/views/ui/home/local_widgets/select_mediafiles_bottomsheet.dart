import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:schoolphotoapp/utils/my_colors.dart';
import 'package:schoolphotoapp/viewmodels/home_view_model.dart';
import 'package:schoolphotoapp/views/widgets/custom_text.dart';

Future<void> selectMediaFilesBottomSheet(BuildContext parentContext) {
  return showModalBottomSheet<void>(
    context: parentContext,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Consumer<HomeViewModel>(builder: (context, homeProvider, __) {
        return Container(
          height: 130.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h, bottom: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // sizeBoxHeight5,
                ListTile(
                  horizontalTitleGap: 10.w,
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.camera_alt,
                    color: MyColors.blackTextColor,
                    size: 24.r,
                  ),
                  title: CustomText(
                      text: 'Take a photo',
                      textAlign: TextAlign.start,
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        color: MyColors.blackTextColor,
                      )),
                  onTap: () {
                    Navigator.pop(context);

                    homeProvider.pickAndUploadFile(true, parentContext);
                  },
                ),
                const Divider(
                  color: MyColors.greyColor,
                  thickness: 0.6,
                  height: 2,
                ),
                ListTile(
                  horizontalTitleGap: 10.w,
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.photo_library,
                    color: MyColors.blackTextColor,
                    size: 24.r,
                  ),
                  title: CustomText(
                      text: 'Choose from Gallery',
                      textAlign: TextAlign.start,
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        color: MyColors.blackTextColor,
                      )),
                  onTap: () {
                    Navigator.pop(context);

                    homeProvider.pickAndUploadFile(false, parentContext);
                    // pickAndUploadFile();
                  },
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}
