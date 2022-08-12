// import 'package:cookoo_website/utils/my_colors.dart';
// import 'package:cookoo_website/utils/router.dart';
// import 'package:cookoo_website/viewmodels/home_view_model.dart';
// import 'package:cookoo_website/views/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// class CustomFooterDesktop extends StatelessWidget {
//   CustomFooterDesktop({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // final HomeViewModel provider =
//     //     Provider.of<HomeViewModel>(context, listen: false);
//     return Container(
//       height: 580.h,
//       // width: 396.w,
//       padding:
//           EdgeInsets.only(left: 80.w, right: 80.w, bottom: 20.h, top: 80.h),
//       color: MyColors.blackTextColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(
//                 color: MyColors.whiteTextColor,
//                 width: 1,
//               )),
//             ),
//             padding: EdgeInsets.only(bottom: 5.h),
//             child: GestureDetector(
//               onTap: () {
//                 Provider.of<HomeViewModel>(context, listen: false)
//                     .changeIndex(3);
//                 GoRouter.of(context).go(ContactRoute);
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     text: 'Have an idea?',
//                     textStyle: TextStyle(
//                       fontSize: 40.sp,
//                       fontWeight: FontWeight.w600,
//                       color: MyColors.whiteTextColor,
//                     ),
//                   ),
//                   CustomText(
//                     text: 'Tell us about it',
//                     textStyle: TextStyle(
//                       fontSize: 40.sp,
//                       // fontWeight: FontWeight.w600,
//                       color: MyColors.whiteTextColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 160.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     decoration: const BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(
//                         color: MyColors.whiteTextColor,
//                         width: 0.6,
//                       )),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(bottom: 5.h),
//                       child: CustomText(
//                         text: 'Cookoo@gmail.com',
//                         textStyle: TextStyle(
//                           fontSize: 25.sp,
//                           color: MyColors.whiteTextColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   CustomText(
//                     text: 'Kickstart, 189-A Korang Road, I-10,',
//                     textStyle: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w500,
//                       color: MyColors.darkGreyClr,
//                     ),
//                   ),
//                   CustomText(
//                     text: 'Islamabad, Islamabad Capital Territory',
//                     textStyle: TextStyle(
//                       fontSize: 18.sp,
//                       // fontWeight: FontWeight.w300,
//                       color: MyColors.darkGreyClr,
//                     ),
//                   ),
//                 ],
//               ),
//               // SizedBox(
//               //   width: 0.5.sw,
//               //   child: Column(
//               //     mainAxisAlignment: MainAxisAlignment.center,
//               //     children: [
//               //       Row(
//               //         mainAxisAlignment: MainAxisAlignment.center,
//               //         children: [
//               //           Column(
//               //             children: [
//               //               IconButton(
//               //                 onPressed: null,
//               //                 icon: FaIcon(
//               //                   FontAwesomeIcons.linkedinIn,
//               //                   color: MyColors.greyColor,
//               //                   size: 25.r,
//               //                 ),
//               //               ),
//               //               CustomText(
//               //                 text: 'Linkdin',
//               //                 textStyle: TextStyle(
//               //                   fontSize: 20.sp,
//               //                   // fontWeight: FontWeight.w300,
//               //                   color: MyColors.greyColor,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //           SizedBox(
//               //             width: 20.w,
//               //           ),
//               //           Column(
//               //             children: [
//               //               IconButton(
//               //                 onPressed: null,
//               //                 icon: FaIcon(
//               //                   FontAwesomeIcons.twitter,
//               //                   color: MyColors.greyColor,
//               //                   size: 25.r,
//               //                 ),
//               //               ),
//               //               CustomText(
//               //                 text: 'Twitter',
//               //                 textStyle: TextStyle(
//               //                   fontSize: 20.sp,
//               //                   // fontWeight: FontWeight.w300,
//               //                   color: MyColors.greyColor,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //           SizedBox(
//               //             width: 20.w,
//               //           ),
//               //           Column(
//               //             children: [
//               //               IconButton(
//               //                 onPressed: null,
//               //                 icon: FaIcon(
//               //                   FontAwesomeIcons.whatsapp,
//               //                   color: MyColors.greyColor,
//               //                   size: 25.r,
//               //                 ),
//               //               ),
//               //               CustomText(
//               //                 text: 'Whatsapp',
//               //                 textStyle: TextStyle(
//               //                   fontSize: 20.sp,
//               //                   // fontWeight: FontWeight.w300,
//               //                   color: MyColors.greyColor,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //         ],
//               //       ),
//               //       SizedBox(
//               //         height: 20.h,
//               //       ),
//               //       Row(
//               //         mainAxisAlignment: MainAxisAlignment.center,
//               //         children: [
//               //           Column(
//               //             children: [
//               //               IconButton(
//               //                 onPressed: null,
//               //                 icon: FaIcon(
//               //                   FontAwesomeIcons.basketball,
//               //                   color: MyColors.greyColor,
//               //                   size: 25.r,
//               //                 ),
//               //               ),
//               //               CustomText(
//               //                 text: 'Website',
//               //                 textStyle: TextStyle(
//               //                   fontSize: 20.sp,
//               //                   // fontWeight: FontWeight.w300,
//               //                   color: MyColors.greyColor,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //           SizedBox(
//               //             width: 20.w,
//               //           ),
//               //           Column(
//               //             children: [
//               //               IconButton(
//               //                 onPressed: null,
//               //                 icon: FaIcon(
//               //                   FontAwesomeIcons.facebook,
//               //                   color: MyColors.greyColor,
//               //                   size: 25.r,
//               //                 ),
//               //               ),
//               //               CustomText(
//               //                 text: 'Facebook',
//               //                 textStyle: TextStyle(
//               //                   fontSize: 20.sp,
//               //                   // fontWeight: FontWeight.w300,
//               //                   color: MyColors.greyColor,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //           SizedBox(
//               //             width: 20.w,
//               //           ),
//               //           Column(
//               //             children: [
//               //               IconButton(
//               //                 onPressed: null,
//               //                 icon: FaIcon(
//               //                   FontAwesomeIcons.youtube,
//               //                   color: MyColors.greyColor,
//               //                   size: 25.r,
//               //                 ),
//               //               ),
//               //               CustomText(
//               //                 text: 'Youtube',
//               //                 textStyle: TextStyle(
//               //                   fontSize: 20.sp,
//               //                   // fontWeight: FontWeight.w300,
//               //                   color: MyColors.greyColor,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //         ],
//               //       ),
//               //     ],
//               //   ),
//               // ),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       IconButton(
//                         onPressed: null,
//                         icon: FaIcon(
//                           FontAwesomeIcons.linkedinIn,
//                           color: MyColors.greyColor,
//                           size: 25.r,
//                         ),
//                       ),
//                       CustomText(
//                         text: 'Linkdin',
//                         textStyle: TextStyle(
//                           fontSize: 20.sp,
//                           // fontWeight: FontWeight.w300,
//                           color: MyColors.greyColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 30.w,
//                   ),
//                   Column(
//                     children: [
//                       IconButton(
//                         onPressed: null,
//                         icon: FaIcon(
//                           FontAwesomeIcons.twitter,
//                           color: MyColors.greyColor,
//                           size: 25.r,
//                         ),
//                       ),
//                       CustomText(
//                         text: 'Twitter',
//                         textStyle: TextStyle(
//                           fontSize: 20.sp,
//                           // fontWeight: FontWeight.w300,
//                           color: MyColors.greyColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 30.w,
//                   ),
//                   Column(
//                     children: [
//                       IconButton(
//                         onPressed: null,
//                         icon: FaIcon(
//                           FontAwesomeIcons.whatsapp,
//                           color: MyColors.greyColor,
//                           size: 25.r,
//                         ),
//                       ),
//                       CustomText(
//                         text: 'Whatsapp',
//                         textStyle: TextStyle(
//                           fontSize: 20.sp,
//                           // fontWeight: FontWeight.w300,
//                           color: MyColors.greyColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 30.w,
//                   ),
//                   Column(
//                     children: [
//                       IconButton(
//                         onPressed: null,
//                         icon: FaIcon(
//                           FontAwesomeIcons.basketball,
//                           color: MyColors.greyColor,
//                           size: 25.r,
//                         ),
//                       ),
//                       CustomText(
//                         text: 'Website',
//                         textStyle: TextStyle(
//                           fontSize: 20.sp,
//                           // fontWeight: FontWeight.w300,
//                           color: MyColors.greyColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 30.w,
//                   ),
//                   Column(
//                     children: [
//                       IconButton(
//                         onPressed: null,
//                         icon: FaIcon(
//                           FontAwesomeIcons.facebook,
//                           color: MyColors.greyColor,
//                           size: 25.r,
//                         ),
//                       ),
//                       CustomText(
//                         text: 'Facebook',
//                         textStyle: TextStyle(
//                           fontSize: 20.sp,
//                           // fontWeight: FontWeight.w300,
//                           color: MyColors.greyColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 30.w,
//                   ),
//                   Column(
//                     children: [
//                       IconButton(
//                         onPressed: null,
//                         icon: FaIcon(
//                           FontAwesomeIcons.youtube,
//                           color: MyColors.greyColor,
//                           size: 25.r,
//                         ),
//                       ),
//                       CustomText(
//                         text: 'Youtube',
//                         textStyle: TextStyle(
//                           fontSize: 20.sp,
//                           // fontWeight: FontWeight.w300,
//                           color: MyColors.greyColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 30.w,
//                   ),
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class CustomFooterTablet extends StatelessWidget {
//   CustomFooterTablet({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // final HomeViewModel provider =
//     //     Provider.of<HomeViewModel>(context, listen: false);
//     return Container(
//       height: 480.h,
//       // width: 396.w,
//       padding:
//           EdgeInsets.only(left: 48.w, right: 48.w, bottom: 25.h, top: 48.h),
//       color: MyColors.blackTextColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(
//                 color: MyColors.whiteTextColor,
//                 width: 1,
//               )),
//             ),
//             padding: EdgeInsets.only(bottom: 3.h),
//             child: GestureDetector(
//               onTap: () {
//                 Provider.of<HomeViewModel>(context, listen: false)
//                     .changeIndex(3);
//                 GoRouter.of(context).go(ContactRoute);
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     text: 'Have an idea?',
//                     textStyle: TextStyle(
//                       fontSize: 36.sp,
//                       fontWeight: FontWeight.w600,
//                       color: MyColors.whiteTextColor,
//                     ),
//                   ),
//                   CustomText(
//                     text: 'Tell us about it',
//                     textStyle: TextStyle(
//                       fontSize: 36.sp,
//                       // fontWeight: FontWeight.w600,
//                       color: MyColors.whiteTextColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 100.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     decoration: const BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(
//                         color: MyColors.whiteTextColor,
//                         width: 0.5,
//                       )),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(bottom: 5.h),
//                       child: CustomText(
//                         text: 'Cookoo@gmail.com',
//                         textStyle: TextStyle(
//                           fontSize: 22.sp,
//                           color: MyColors.whiteTextColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   CustomText(
//                     text: 'Kickstart, 189-A Korang Road, I-10,',
//                     textStyle: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w500,
//                       color: MyColors.darkGreyClr,
//                     ),
//                   ),
//                   CustomText(
//                     text: 'Islamabad, Islamabad Capital Territory',
//                     textStyle: TextStyle(
//                       fontSize: 18.sp,
//                       // fontWeight: FontWeight.w300,
//                       color: MyColors.darkGreyClr,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 0.4.sw,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Column(
//                           children: [
//                             IconButton(
//                               onPressed: null,
//                               icon: FaIcon(
//                                 FontAwesomeIcons.linkedinIn,
//                                 color: MyColors.greyColor,
//                                 size: 25.r,
//                               ),
//                             ),
//                             CustomText(
//                               text: 'Linkdin',
//                               textStyle: TextStyle(
//                                 fontSize: 18.sp,
//                                 // fontWeight: FontWeight.w300,
//                                 color: MyColors.greyColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         Column(
//                           children: [
//                             IconButton(
//                               onPressed: null,
//                               icon: FaIcon(
//                                 FontAwesomeIcons.twitter,
//                                 color: MyColors.greyColor,
//                                 size: 25.r,
//                               ),
//                             ),
//                             CustomText(
//                               text: 'Twitter',
//                               textStyle: TextStyle(
//                                 fontSize: 18.sp,
//                                 // fontWeight: FontWeight.w300,
//                                 color: MyColors.greyColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         Column(
//                           children: [
//                             IconButton(
//                               onPressed: null,
//                               icon: FaIcon(
//                                 FontAwesomeIcons.whatsapp,
//                                 color: MyColors.greyColor,
//                                 size: 25.r,
//                               ),
//                             ),
//                             CustomText(
//                               text: 'Whatsapp',
//                               textStyle: TextStyle(
//                                 fontSize: 18.sp,
//                                 // fontWeight: FontWeight.w300,
//                                 color: MyColors.greyColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Column(
//                           children: [
//                             IconButton(
//                               onPressed: null,
//                               icon: FaIcon(
//                                 FontAwesomeIcons.basketball,
//                                 color: MyColors.greyColor,
//                                 size: 25.r,
//                               ),
//                             ),
//                             CustomText(
//                               text: 'Website',
//                               textStyle: TextStyle(
//                                 fontSize: 18.sp,
//                                 // fontWeight: FontWeight.w300,
//                                 color: MyColors.greyColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         Column(
//                           children: [
//                             IconButton(
//                               onPressed: null,
//                               icon: FaIcon(
//                                 FontAwesomeIcons.facebook,
//                                 color: MyColors.greyColor,
//                                 size: 25.r,
//                               ),
//                             ),
//                             CustomText(
//                               text: 'Facebook',
//                               textStyle: TextStyle(
//                                 fontSize: 18.sp,
//                                 // fontWeight: FontWeight.w300,
//                                 color: MyColors.greyColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 15.w,
//                         ),
//                         Column(
//                           children: [
//                             IconButton(
//                               onPressed: null,
//                               icon: FaIcon(
//                                 FontAwesomeIcons.youtube,
//                                 color: MyColors.greyColor,
//                                 size: 25.r,
//                               ),
//                             ),
//                             CustomText(
//                               text: 'Youtube',
//                               textStyle: TextStyle(
//                                 fontSize: 18.sp,
//                                 // fontWeight: FontWeight.w300,
//                                 color: MyColors.greyColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class CustomFooterMobile extends StatelessWidget {
//   CustomFooterMobile({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // final HomeViewModel provider =
//     //     Provider.of<HomeViewModel>(context, listen: false);
//     return Container(
//       height: 500.h,
//       width: 396.w,
//       padding:
//           EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h, top: 50.h),
//       color: MyColors.blackTextColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(
//                 color: MyColors.whiteTextColor,
//                 width: 1,
//               )),
//             ),
//             padding: EdgeInsets.only(bottom: 5.h),
//             child: GestureDetector(
//               onTap: () {
//                 Provider.of<HomeViewModel>(context, listen: false)
//                     .changeIndex(3);
//                 GoRouter.of(context).go(ContactRoute);
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     text: 'Have an idea?',
//                     textStyle: TextStyle(
//                       fontSize: 25.sp,
//                       fontWeight: FontWeight.w500,
//                       color: MyColors.whiteTextColor,
//                     ),
//                   ),
//                   CustomText(
//                     text: 'Tell us about it',
//                     textStyle: TextStyle(
//                       fontSize: 25.sp,
//                       // fontWeight: FontWeight.w300,
//                       color: MyColors.whiteTextColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 50.h,
//           ),
//           Container(
//             decoration: const BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(
//                 color: MyColors.whiteTextColor,
//                 width: 0.3,
//               )),
//             ),
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 5.h),
//               child: CustomText(
//                 text: 'Cookoo@gmail.com',
//                 textStyle: TextStyle(
//                   fontSize: 16.sp,
//                   color: MyColors.whiteTextColor,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               CustomText(
//                 text: 'Kickstart, 189-A Korang Road, I-10,',
//                 textStyle: TextStyle(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w500,
//                   color: MyColors.darkGreyClr,
//                 ),
//               ),
//               CustomText(
//                 text: 'Islamabad, Islamabad Capital Territory',
//                 textStyle: TextStyle(
//                   fontSize: 13.sp,
//                   // fontWeight: FontWeight.w300,
//                   color: MyColors.darkGreyClr,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           CustomText(
//             text: 'Privacy Policy',
//             textStyle: TextStyle(
//               fontSize: 13.sp,
//               // fontWeight: FontWeight.w300,
//               color: MyColors.lightGreyWidgetBckColor,
//             ),
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     onPressed: null,
//                     icon: FaIcon(
//                       FontAwesomeIcons.linkedinIn,
//                       color: Colors.grey.shade800,
//                       size: 25.r,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   IconButton(
//                     onPressed: null,
//                     icon: FaIcon(
//                       FontAwesomeIcons.twitter,
//                       color: Colors.grey.shade800,
//                       size: 25.r,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   IconButton(
//                     onPressed: null,
//                     icon: FaIcon(
//                       FontAwesomeIcons.whatsapp,
//                       color: Colors.grey.shade800,
//                       size: 25.r,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     onPressed: null,
//                     icon: FaIcon(
//                       FontAwesomeIcons.basketball,
//                       color: Colors.grey.shade800,
//                       size: 25.r,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   IconButton(
//                     onPressed: null,
//                     icon: FaIcon(
//                       FontAwesomeIcons.facebook,
//                       color: Colors.grey.shade800,
//                       size: 25.r,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   IconButton(
//                     onPressed: null,
//                     icon: FaIcon(
//                       FontAwesomeIcons.youtube,
//                       color: Colors.grey.shade800,
//                       size: 25.r,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
