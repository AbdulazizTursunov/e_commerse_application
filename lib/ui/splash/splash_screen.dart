import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/app_colors.dart';
import '../../utils/icons.dart';
import '../route/route_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _init() async {
    await Future.delayed(const Duration(seconds: 10));

    if (context.mounted) {
      Navigator.pushReplacementNamed(
          context, RouteNames.tabBox
      );
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c5EA3B4,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.c5EA3B4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInRight(
              child: SizedBox(
                height: 120.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 140.h),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 25,
                        bottom: 80,
                        child: SvgPicture.asset(AppIcons.splashHelperLogo,fit: BoxFit.cover,),
                      ),
                      Positioned(
                        top: 25.h,
                        left: 3.w,
                        child: SvgPicture.asset(
                          AppIcons.splashMainLogo,
                        ),
                      ),
                      Positioned(
                        top: 45.h,
                        left: 30.w,
                        child: Text("B",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: AppColors.cC7BA96,
                          ),),
                      )
                    ],
                  ),
                ),
              ),
            ),
            FadeInLeft(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Baraka Shop",
                    style: Theme.of(context).textTheme.headlineMedium
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
