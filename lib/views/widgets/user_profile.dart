// import 'package:cookoo_website/utils/constants/app_data.dart';
// import 'package:cookoo_website/utils/my_colors.dart';
// import 'package:flutter/material.dart';

// class UserProfileData {
//   final String image;
//   final String name;
//   final String jobDesk;

//   const UserProfileData({
//     required this.image,
//     required this.name,
//     required this.jobDesk,
//   });
// }

// class UserProfile extends StatelessWidget {
//   const UserProfile({
//     required this.data,
//     required this.onPressed,
//     Key? key,
//   }) : super(key: key);

//   final UserProfileData data;
//   final Function()? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(kBorderRadius),
//         onTap: onPressed,
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Row(
//             children: [
//               _buildImage(),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildName(),
//                     _buildJobdesk(),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildImage() {
//     return const CircleAvatar(
//       radius: 25,
//       backgroundColor: MyColors.primaryColor,
//       // backgroundImage: data.image,
//     );
//   }

//   Widget _buildName() {
//     return Text(
//       data.name,
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         color: kFontColorPallets[0],
//       ),
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//     );
//   }

//   Widget _buildJobdesk() {
//     return Text(
//       data.jobDesk,
//       style: TextStyle(
//         fontWeight: FontWeight.w300,
//         color: kFontColorPallets[1],
//       ),
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//     );
//   }
// }

// class SelectionButtonData {
//   final IconData activeIcon;
//   final IconData icon;
//   final String label;
//   final int? totalNotif;

//   SelectionButtonData({
//     required this.activeIcon,
//     required this.icon,
//     required this.label,
//     this.totalNotif,
//   });
// }
