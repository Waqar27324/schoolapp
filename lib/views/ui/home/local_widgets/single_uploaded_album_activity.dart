import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schoolphotoapp/models/album_model.dart';
import 'package:schoolphotoapp/utils/constants/sizes.dart';
import 'package:schoolphotoapp/utils/my_colors.dart';
import 'package:schoolphotoapp/views/ui/home/local_widgets/album_shared_students.dart';
import 'package:schoolphotoapp/views/widgets/custom_text.dart';

class SingleUploadedAlbumActivity extends StatelessWidget {
  const SingleUploadedAlbumActivity({
    Key? key,
    required this.albumModel,
  }) : super(key: key);

  final AlbumModel albumModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      // margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: MyColors.lightGreyWidgetBckColor),
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 25.h,
                width: 25.w,
                child: SvgPicture.asset(
                  (albumModel.title == 'Images and Videos')
                      ? 'assets/svgs/imageandvideo.svg'
                      : (albumModel.title == 'Images')
                          ? 'assets/svgs/image.svg'
                          : 'assets/svgs/video.svg',
                  // height: 30.h,
                  // width: 30.w,
                ),
              ),
              sizeBoxwidth20,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: albumModel.title,
                    textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.blackTextColor),
                  ),
                  CustomText(
                    text:
                        '${albumModel.totalSize} MB  -  ${albumModel.totalFiles} files',
                    textStyle: TextStyle(
                        fontSize: 10.sp, color: MyColors.lightgreyColorText),
                  ),
                ],
              ),
            ],
          ),
          // AlbumSharedToStudentsList(
          //   studentsList: albumModel.sharedWithStudentsList ?? [],
          // ),
        ],
      ),
    );
  }
}
