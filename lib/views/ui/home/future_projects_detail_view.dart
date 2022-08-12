// import 'package:cookoo_website/utils/my_colors.dart';
// import 'package:cookoo_website/utils/router.dart';
// import 'package:cookoo_website/viewmodels/home_view_model.dart';
// import 'package:cookoo_website/views/ui/home/future+project_local_widgets/project_gridview_images.dart';
// import 'package:cookoo_website/views/ui/home/future+project_local_widgets/project_header.dart';
// import 'package:cookoo_website/views/ui/home/future+project_local_widgets/project_single_images_container.dart';
// import 'package:cookoo_website/views/ui/home/future+project_local_widgets/the_challenge.dart';
// import 'package:cookoo_website/views/widgets/custom_footer.dart';
// import 'package:cookoo_website/views/widgets/drawer_widget.dart';
// import 'package:cookoo_website/views/widgets/resposive_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// class FutureProjectsDetailView extends StatelessWidget {
//   const FutureProjectsDetailView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.whiteTextColor,
//       key: UniqueKey(),
//       endDrawer: ResponsiveBuilder.isMobile(context)
//           ? Drawer(
//               backgroundColor: MyColors.whiteTextColor,
//               child: SafeArea(
//                 child: SingleChildScrollView(
//                     controller: ScrollController(),
//                     child: ResponsiveBuilder.isMobile(context)
//                         ? buildSidebar(context)
//                         : buildSidebarForTablet(context)),
//               ),
//             )
//           : null,
//       body: SafeArea(
//         child: ResponsiveBuilder(
//           mobileBuilder: (context, constraints) {
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   buildTaskContent(
//                     onPressedMenu: () {
//                       Scaffold.of(context).openEndDrawer();
//                     },
//                     gotoHomePage: () {
//                       Provider.of<HomeViewModel>(context, listen: false)
//                           .changeIndex(0);
//                       GoRouter.of(context).go(HomeRoute);
//                     },
//                   ),
//                   const ProjectHeaderMobileWidget(),
//                   const ProjectExpandedContainerWithBlueBackSMobileWidget(),
//                   const TheChallengeMobileWidget(),
//                   const ProjectUiListViewMobileWidget(),
//                   CustomFooterMobile(),
//                 ],
//               ),
//             );
//           },
//           tabletBuilder: (context, constraints) {
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // buildTaskContentForTablet(
//                   //   onPressedMenu: () {
//                   //     Scaffold.of(context).openEndDrawer();
//                   //   },
//                   //   gotoHomePage: () {
//                   //     Provider.of<HomeViewModel>(context, listen: false)
//                   //         .changeIndex(0);
//                   //     GoRouter.of(context).go(HomeRoute);
//                   //   },
//                   // ),
//                   const ProjectHeaderTabletWidget(),
//                   const ProjectExpandedContainerWithBlueBackSTabletWidget(),
//                   const TheChallengeTabletWidget(),
//                   const ProjectUiGridviewTabletWidget(),
//                   CustomFooterTablet(),
//                 ],
//               ),
//             );
//           },
//           desktopBuilder: (context, constraints) {
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const ProjectHeaderDesktopWidget(),
//                   const ProjectExpandedContainerWithBlueBackSDesktopWidget(),
//                   const TheChallengeDesktopWidget(),
//                   const ProjectUiGridviewDesktopWidget(),
//                   CustomFooterDesktop(),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
