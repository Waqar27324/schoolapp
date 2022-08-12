// import 'package:cookoo_website/utils/my_colors.dart';
// import 'package:cookoo_website/views/widgets/custom_app_bar.dart';
// import 'package:cookoo_website/views/widgets/resposive_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// final GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey();

// class MainView extends StatefulWidget {
//   Widget screen;
//   MainView({Key? key, required this.screen}) : super(key: key);

//   @override
//   State<MainView> createState() => _MainViewState();
// }

// class _MainViewState extends State<MainView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // key: Scaffoldkey,
//         backgroundColor: MyColors.fullScreenBckColor,
//         appBar: (ResponsiveBuilder.isDesktop(context))
//             ? PreferredSize(
//                 preferredSize: Size.fromHeight(64.h),
//                 child: const CustomAppBar(),
//               )
//             : (ResponsiveBuilder.isTablet(context))
//                 ? PreferredSize(
//                     preferredSize: Size.fromHeight(64.h),
//                     child: const CustomAppBarTabletView(),
//                   )
//                 : null,
//         body: widget.screen);
//   }
// }
