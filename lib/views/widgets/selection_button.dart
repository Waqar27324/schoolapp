// import 'package:cookoo_website/utils/constants/app_data.dart';
// import 'package:cookoo_website/utils/my_colors.dart';
// // import 'package:cookoo_website/utils/router.dart';
// import 'package:cookoo_website/viewmodels/home_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// class SelectionButtonData {
//   final IconData? activeIcon;
//   final IconData? icon;
//   final String label;
//   final int? totalNotif;

//   SelectionButtonData({
//     this.activeIcon,
//     this.icon,
//     required this.label,
//     this.totalNotif,
//   });
// }

// class SelectionButton extends StatefulWidget {
//   const SelectionButton({
//     this.initialSelected = 0,
//     required this.data,
//     required this.onSelected,
//     Key? key,
//   }) : super(key: key);

//   final int initialSelected;
//   final List<SelectionButtonData> data;
//   final Function(int index, SelectionButtonData value) onSelected;

//   @override
//   State<SelectionButton> createState() => _SelectionButtonState();
// }

// class _SelectionButtonState extends State<SelectionButton> {
//   // late int selected;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   selected = widget.initialSelected;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeViewModel>(builder: (_, provider, __) {
//       return Column(
//         children: widget.data.asMap().entries.map((e) {
//           final index = e.key;
//           final data = e.value;

//           return Padding(
//             padding: EdgeInsets.only(bottom: 16.h),
//             child: _Button(
//               selected: provider.selectedIndexDrawerMobile == index,
//               onPressed: () {
//                 widget.onSelected(index, data);
//                 // setState(() {
//                 // selected = index;
//                 // provider.selectedIndexDrawerMobile = index;
//                 // });
//                 Provider.of<HomeViewModel>(context, listen: false)
//                     .changeIndexFromMobileSide(index, context);
//               },
//               data: data,
//             ),
//           );
//         }).toList(),
//       );
//     });
//   }
// }

// class _Button extends StatelessWidget {
//   const _Button({
//     required this.selected,
//     required this.data,
//     required this.onPressed,
//     Key? key,
//   }) : super(key: key);

//   final bool selected;
//   final SelectionButtonData data;
//   final Function() onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       // color:
//       //     (!selected) ? null : Theme.of(context).primaryColor.withOpacity(.1),
//       // borderRadius: BorderRadius.circular(kBorderRadius),
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onPressed,
//         splashColor: Colors.transparent,
//         hoverColor: Colors.transparent,
//         // borderRadius: BorderRadius.circular(10),
//         child: Row(
//           children: [
//             // _buildIcon(),
//             // const SizedBox(width: kSpacing + 5),
//             Expanded(child: _buildLabel()),
//             // if (data.totalNotif != null)
//             //   Padding(
//             //     padding: const EdgeInsets.only(left: kSpacing / 2),
//             //     child: _buildNotif(),
//             //   )
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget _buildIcon() {
//   //   return Icon(
//   //     (!selected) ? data.icon : data.activeIcon,
//   //     size: 15.r,
//   //     color: (!selected) ? kFontColorPallets[1] : MyColors.primaryColor,
//   //     //Theme.of(Get.context!).primaryColor,
//   //   );
//   // }

//   Widget _buildLabel() {
//     return Text(
//       data.label,
//       style: TextStyle(
//         color: (!selected) ? kFontColorPallets[1] : MyColors.primaryColor,
//         //Theme.of(Get.context!).primaryColor,
//         fontWeight: FontWeight.normal,
//         letterSpacing: .8,
//         fontSize: 16,
//       ),
//     );
//   }

//   // Widget _buildNotif() {
//   //   return (data.totalNotif == null || data.totalNotif! <= 0)
//   //       ? Container()
//   //       : Container(
//   //           width: 30,
//   //           padding: const EdgeInsets.all(5),
//   //           decoration: const BoxDecoration(
//   //             color: Colors.orange,
//   //             borderRadius: BorderRadius.only(
//   //               bottomLeft: Radius.circular(10),
//   //               bottomRight: Radius.circular(10),
//   //               topRight: Radius.circular(10),
//   //             ),
//   //           ),
//   //           alignment: Alignment.center,
//   //           child: Text(
//   //             (data.totalNotif! >= 100) ? "4+" : "${data.totalNotif}",
//   //             style: const TextStyle(
//   //               color: Colors.white,
//   //               fontSize: 10,
//   //               fontWeight: FontWeight.w600,
//   //             ),
//   //             textAlign: TextAlign.center,
//   //           ),
//   //         );
//   // }

// }
