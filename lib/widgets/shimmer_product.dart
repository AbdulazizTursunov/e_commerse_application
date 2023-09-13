

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerProductScreen extends StatelessWidget {
  const ShimmerProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor:  Colors.grey,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.5
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.all(8.w),
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1, color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 7,
                                spreadRadius: 1,
                                offset: const Offset(3, 3),
                              )
                            ]),
                        child:const SizedBox(),
                        );
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}