// import 'package:cookoo_website/utils/my_colors.dart';
// import 'package:cookoo_website/viewmodels/home_view_model.dart';
// import 'package:cookoo_website/views/widgets/custom_text.dart';
// import 'package:cookoo_website/views/widgets/main_menu.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// Widget buildSidebar(BuildContext context) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.end,
//     children: [
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 InkWell(
//                   splashColor: Colors.transparent,
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Icon(
//                     Icons.close,
//                     color: MyColors.blackTextColor,
//                     size: 30.r,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 30.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 CustomText(
//                     text: 'Menu',
//                     textStyle: TextStyle(
//                         fontSize: 20.sp,
//                         color: MyColors.drawerMenuTextGreyClr)),
//               ],
//             ),
//           ],
//         ),
//         // UserProfile(
//         //   data: dataProfil,
//         //   onPressed: null,
//         // ),
//       ),
//       // SizedBox(height: 32.h),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.w),
//         child: MainMenu(
//             onSelected: Provider.of<HomeViewModel>(context, listen: false)
//                 .onSelectedMainMenu),
//       ),
//       // const Divider(
//       //   indent: 20,
//       //   thickness: 1,
//       //   endIndent: 20,
//       //   height: 40,
//       // ),
//       // Padding(
//       //   padding: EdgeInsets.only(right: 20.w),
//       //   child: Row(
//       //     mainAxisAlignment: MainAxisAlignment.end,
//       //     children: [
//       //       Text("2022 Teamwork lisence",
//       //           textAlign: TextAlign.end,
//       //           style: TextStyle(
//       //             color: Colors.black,
//       //             fontSize: 13.sp,
//       //           )),
//       //     ],
//       //   ),
//       // ),
//     ],
//   );
// }

// Widget buildTaskContent({Function()? onPressedMenu, Function()? gotoHomePage}) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 16.w),
//     color: MyColors.whiteTextColor,
//     child: Column(
//       children: [
//         // const SizedBox(height: 30),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextButton(
//               onPressed: gotoHomePage,
//               child: Text(
//                 'COOKOO TECHNOLOGIES.',
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.bold,
//                   color: MyColors.blackTextColor,
//                 ),
//               ),
//             ),
//             if (onPressedMenu != null)
//               IconButton(
//                 onPressed: onPressedMenu,
//                 splashColor: Colors.transparent,
//                 splashRadius: 0.1,
//                 icon: const Icon(
//                   Icons.menu,
//                   color: MyColors.primaryColor,
//                 ),
//               ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget buildSidebarForTablet(BuildContext context) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       // const Padding(
//       //   padding: EdgeInsets.symmetric(horizontal: 10),
//       //   child: UserProfile(
//       //     data: dataProfil,
//       //     onPressed: null,
//       //   ),
//       // ),
//       const SizedBox(height: 15),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: MainMenu(
//             onSelected: Provider.of<HomeViewModel>(context, listen: false)
//                 .onSelectedMainMenu),
//       ),
//       const Divider(
//         indent: 20,
//         thickness: 1,
//         endIndent: 20,
//         height: 40,
//       ),
//       Padding(
//         padding: EdgeInsets.only(right: 20.w),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text("2022 Teamwork lisence",
//                 textAlign: TextAlign.end,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 13.sp,
//                 )),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// Widget buildTaskContentForTablet(
//     {Function()? onPressedMenu, Function()? gotoHomePage}) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 30.w),
//     color: MyColors.whiteTextColor,
//     child: Column(
//       children: [
//         // const SizedBox(height: 30),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextButton(
//               onPressed: gotoHomePage,
//               child: Text(
//                 'COOKOO TECHNOLOGIES.',
//                 style: TextStyle(
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.bold,
//                   color: MyColors.blackTextColor,
//                 ),
//               ),
//             ),
//             if (onPressedMenu != null)
//               IconButton(
//                 splashColor: Colors.transparent,
//                 splashRadius: 0.1,
//                 onPressed: onPressedMenu,
//                 icon: Icon(
//                   Icons.menu,
//                   size: 35.r,
//                   color: MyColors.primaryColor,
//                 ),
//               ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
