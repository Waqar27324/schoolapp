// import 'package:cookoo_website/utils/my_colors.dart';
// import 'package:cookoo_website/utils/router.dart';
// import 'package:cookoo_website/viewmodels/home_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// Widget topBar(
//   BuildContext context, {
//   title = '',
// }) {
//   Widget tab(String value, bool isSelected) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: 16.r,
//       ),
//       child: SizedBox(
//         height: 39.h,
//         // width: 140,
//         child: Center(
//             child: Container(
//           decoration: BoxDecoration(
//             border: isSelected
//                 ? Border(
//                     bottom: BorderSide(
//                         color: MyColors.primaryColor,
//                         width: isSelected ? 1.5 : 0,
//                         style: BorderStyle.solid))
//                 : const Border(bottom: BorderSide.none),
//           ),
//           child: Text(
//             value,
//             style: TextStyle(
//               fontSize: 24.sp,
//               color: MyColors.blackTextColor,
//               // decoration: isSelected ? TextDecoration.underline : null,
//             ),
//           ),
//         )),
//       ),
//     );
//   }

//   return Consumer<HomeViewModel>(builder: (_, model, __) {
//     return Container(
//       color: Colors.transparent,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           for (int i = 0; i < model.listOfTabs.length; i++)
//             InkWell(
//               hoverColor: Colors.lightBlue.shade100,
//               onTap: () {
//                 model.changeIndex(i);

//                 if (i == 0) {
//                   GoRouter.of(context).go(HomeRoute);
//                 } else if (i == 1) {
//                   GoRouter.of(context).go(ServicesRoute);
//                 } else if (i == 2) {
//                   GoRouter.of(context).go(AboutRoute);
//                 }
//                 // else if (i == 3) {
//                 //   GoRouter.of(context).go(BlogsRoute);
//                 // }
//                 else {
//                   GoRouter.of(context).go(ContactRoute);
//                 }
//               },
//               // onHover: (isHovering) {
//               //   if (isHovering) {
//               //     model.hoveringIndex = i;
//               //     //The mouse is hovering.
//               //   } else {
//               //     model.hoveringIndex = -1;
//               //     //The mouse is no longer hovering.
//               //   }
//               //   model.notifyListeners();
//               // },
//               child: tab(model.listOfTabs[i],
//                   model.selectedIndex == i || model.hoveringIndex == i),
//             ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.r),
//             child: Container(
//               width: 139.w,
//               decoration: BoxDecoration(
//                   color: MyColors.primaryColor,
//                   borderRadius: BorderRadius.circular(8.r)),
//               child: TextButton(
//                 onPressed: () {
//                   model.changeIndex(3);
//                   GoRouter.of(context).go(ContactRoute);
//                 },
//                 child: Text(
//                   'contact',
//                   style: TextStyle(
//                       fontSize: 24.sp,
//                       fontWeight: FontWeight.w100,
//                       // decoration: isSelected ? TextDecoration.underline : null,
//                       // decorationThickness: 1.5,
//                       color: MyColors.whiteTextColor),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   });
// }

// Widget topBarTabletView(
//   BuildContext context, {
//   title = '',
// }) {
//   Widget tab(String value, bool isSelected) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: 14.r,
//       ),
//       child: SizedBox(
//         height: 35.h,
//         // width: 140,
//         child: Center(
//             child: Container(
//           decoration: BoxDecoration(
//             border: isSelected
//                 ? Border(
//                     bottom: BorderSide(
//                         color: MyColors.primaryColor,
//                         width: isSelected ? 1.5 : 0,
//                         style: BorderStyle.solid))
//                 : const Border(bottom: BorderSide.none),
//           ),
//           child: Text(
//             value,
//             style: TextStyle(
//               fontSize: 20.sp,
//               color: MyColors.blackTextColor,
//               // decoration: isSelected ? TextDecoration.underline : null,
//             ),
//           ),
//         )),
//       ),
//     );
//   }

//   return Consumer<HomeViewModel>(builder: (_, model, __) {
//     return Container(
//       color: Colors.transparent,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           for (int i = 0; i < model.listOfTabs.length; i++)
//             InkWell(
//               hoverColor: Colors.lightBlue.shade100,
//               onTap: () {
//                 model.changeIndex(i);

//                 if (i == 0) {
//                   GoRouter.of(context).go(HomeRoute);
//                 } else if (i == 1) {
//                   GoRouter.of(context).go(ServicesRoute);
//                 } else if (i == 2) {
//                   GoRouter.of(context).go(AboutRoute);
//                 }
//                 // else if (i == 3) {
//                 //   GoRouter.of(context).go(BlogsRoute);
//                 // }
//                 else {
//                   GoRouter.of(context).go(ContactRoute);
//                 }
//               },
//               // onHover: (isHovering) {
//               //   if (isHovering) {
//               //     model.hoveringIndex = i;
//               //     //The mouse is hovering.
//               //   } else {
//               //     model.hoveringIndex = -1;
//               //     //The mouse is no longer hovering.
//               //   }
//               //   model.notifyListeners();
//               // },
//               child: tab(model.listOfTabs[i],
//                   model.selectedIndex == i || model.hoveringIndex == i),
//             ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.r),
//             child: Container(
//               // width: 130.w,
//               padding: EdgeInsets.symmetric(horizontal: 16.r),

//               decoration: BoxDecoration(
//                   color: MyColors.primaryColor,
//                   borderRadius: BorderRadius.circular(8.r)),
//               child: TextButton(
//                 onPressed: () {
//                   model.changeIndex(3);
//                   GoRouter.of(context).go(ContactRoute);
//                 },
//                 child: Text(
//                   'contact',
//                   style: TextStyle(
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w100,
//                       // decoration: isSelected ? TextDecoration.underline : null,
//                       // decorationThickness: 1.5,
//                       color: MyColors.whiteTextColor),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   });
// }
