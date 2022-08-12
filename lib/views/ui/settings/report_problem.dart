import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schoolphotoapp/models/album_model.dart';
import 'package:schoolphotoapp/utils/constants/sizes.dart';
import 'package:schoolphotoapp/utils/my_colors.dart';
import 'package:schoolphotoapp/views/widgets/custom_button.dart';
import 'package:schoolphotoapp/views/widgets/custom_text.dart';
import 'package:schoolphotoapp/views/widgets/custom_textfield.dart';

class ReportAProblem extends StatefulWidget {
  const ReportAProblem({
    Key? key,
  }) : super(key: key);

  @override
  State<ReportAProblem> createState() => _ReportAProblemState();
}

class _ReportAProblemState extends State<ReportAProblem> {
  // Initial Selected Value
  bool _value = true;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h, bottom: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
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
                      sizeBoxwidth20,
                      CustomText(
                        text: 'Report a problem',
                        textStyle: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.blackTextColor,
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    text: 'Report',
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.primaryColor,
                    ),
                  ),
                ],
              ),
              sizeBoxHeight25,
              CustomeTextField(
                hintText: 'Enter you’re email',
                isTextFieldBorderVisible: false,
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: MyColors.lightgreyColorText,
                ),
                // h: TextInputType.text,
              ),
              // Divider(
              //   color: Colors.grey.shade400,
              //   thickness: 1.r,
              // ),
              sizeBoxHeight10,
              CustomeTextField(
                height: 200.h,
                hintText: 'What went wrong? Explain in detail.',
                isTextFieldBorderVisible: false,
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: MyColors.lightgreyColorText,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 15,
                minLines: 15,

                textAreaHeight: 200.h,
                // h: TextInputType.text,
              ),
              sizeBoxHeight10,
            ],
          ),
        ),
      ),
    );
  }
}
