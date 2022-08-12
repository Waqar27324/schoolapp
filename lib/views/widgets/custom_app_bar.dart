// import 'package:cookoo_website/utils/my_colors.dart';
// import 'package:cookoo_website/utils/router.dart';
// import 'package:cookoo_website/viewmodels/home_view_model.dart';
// import 'package:cookoo_website/views/widgets/top_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       toolbarHeight: 64.h,
//       centerTitle: false,
//       leadingWidth: 0.5.sw,
//       leading: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 32.r, vertical: 18.h),
//         child: GestureDetector(
//           onTap: () {
//             Provider.of<HomeViewModel>(context, listen: false).changeIndex(0);
//             GoRouter.of(context).go(HomeRoute);
//           },
//           child: Text(
//             'COOKOO TECHNOLOGIES.',
//             style: TextStyle(
//               fontSize: 24.sp,
//               fontWeight: FontWeight.bold,
//               color: MyColors.blackTextColor,
//             ),
//           ),
//         ),
//       ),
//       elevation: 0,
//       backgroundColor: MyColors.whiteTextColor,
//       actions: [
//         // if (Responsive.isDesktop(context))
//         topBar(context),
//       ],
//     );
//   }
// }

// class CustomAppBarTabletView extends StatelessWidget {
//   const CustomAppBarTabletView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       toolbarHeight: 64.h,
//       centerTitle: false,
//       leadingWidth: 0.5.sw,
//       leading: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 32.r, vertical: 18.h),
//         child: GestureDetector(
//           onTap: () {
//             Provider.of<HomeViewModel>(context, listen: false).changeIndex(0);
//             GoRouter.of(context).go(HomeRoute);
//           },
//           child: Text(
//             'COOKOO TECHNOLOGIES.',
//             style: TextStyle(
//               fontSize: 20.sp,
//               fontWeight: FontWeight.bold,
//               color: MyColors.blackTextColor,
//             ),
//           ),
//         ),
//       ),
//       elevation: 0,
//       backgroundColor: MyColors.whiteTextColor,
//       actions: [
//         // if (Responsive.isDesktop(context))
//         topBarTabletView(context),
//       ],
//     );
//   }
// }
