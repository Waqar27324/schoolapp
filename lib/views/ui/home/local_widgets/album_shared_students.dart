import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schoolphotoapp/models/student_model.dart';
import 'package:schoolphotoapp/utils/my_colors.dart';
import 'package:schoolphotoapp/views/widgets/rounded_image_container.dart';

class AlbumSharedToStudentsList extends StatelessWidget {
  const AlbumSharedToStudentsList({
    Key? key,
    required this.studentsList,
  }) : super(key: key);

  final List<StudentModel> studentsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: 80.w,
      child: (studentsList.isNotEmpty)
          ? ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return (index != 3)
                    ? Container(
                        width: 18.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: MyColors.primaryColor),
                        ),
                        child: RoundedImage(
                          height: 17.h,
                          width: 17.w,
                          isBorderVisible: false,
                          imageUrl: studentsList[index].profileUrl,
                        ),
                      )
                    : Container(
                        width: 18.w,
                        height: 18.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: MyColors.primaryColor),
                        ),
                        child: RoundedImage(
                          height: 17.h,
                          width: 17.w,
                          isBorderVisible: false,
                          isPlusMoreDisplayed: true,
                          moreStudents: studentsList.length - 3,
                        ),
                      );
              })
          : const SizedBox(),
    );
  }
}
