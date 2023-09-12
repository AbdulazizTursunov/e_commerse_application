// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
//
// class ShimmerProductScreen extends StatelessWidget {
//   const ShimmerProductScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade400,
//       highlightColor: Colors.white,
//       child: Shimmer.fromColors(
//         baseColor: Colors.grey[300]!, // Shu yerga yoqishingiz mumkin
//         highlightColor: Colors.grey[100]!, // Shu yerga yoqishingiz mumkin
//         child:
//       GridView.builder(
//       itemCount: 4,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 10.0,
//           mainAxisExtent: 10.0,
//           childAspectRatio: 0.7),
//       itemBuilder: (context, int index) {
//         return Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
//               child: Container(
//                 // height: 100,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.r),
//                     color: Colors.grey),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
//               child: Container(
//                 margin: EdgeInsets.all(15),
//                 height: 250,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.r),
//                     color: Colors.grey),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//               child: Container(
//                 height: 250,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.r),
//                     color: Colors.grey),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
//               child: Container(
//                 height: 250,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.r),
//                     color: Colors.grey),
//               ),
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Container(
//                 height: 250,
//
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.grey),
//               ),
//             ),
//             Padding(
//               padding:
//               const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Container(
//                 height: 250,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.grey),
//               ),
//             ),
//           ],
//         );
//       },
//     ),
//
//           ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
//
// class ShimmerProductScreen extends StatelessWidget {
//   const ShimmerProductScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Shimmer.fromColors(
//         baseColor: Colors.white,
//         highlightColor: Colors.black.withOpacity(0.9),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 5,
//                 itemBuilder: (context, index) {
//                   return ZoomTapAnimation(
//                     child: Container(
//                       margin: EdgeInsets.all(5),
//                       padding: EdgeInsets.all(5),
//                       height: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.black,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: Offset(3,5), // no offset
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:e_commerse_application/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerImage extends StatelessWidget {
  const ShimmerImage({super.key, required this.height, required this.width});

  final num height;
  final num width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Shimmer.fromColors(
          baseColor: AppColors.white,
          highlightColor:  Colors.grey,
          child:Container(
              width: width.w,
              height: height.h,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(
                  horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(width: 1, color: AppColors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: const Offset(3, 3),
                    )
                  ]),
              child:const SizedBox()),
      ),
    );
  }
}