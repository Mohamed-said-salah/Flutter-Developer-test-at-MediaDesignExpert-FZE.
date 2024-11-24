import 'package:flutter/material.dart';
import 'package:flutter_developer_test_at_media_design_expert_fze/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitFlatButton extends StatelessWidget {
  const SubmitFlatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print("submit button pressed");
          },
          borderRadius: BorderRadius.circular(10.0.r),
          child: Ink(
            width: 335.w,
            height: 51.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10.0.r),
            ),
            child: Center(
              child: Text(
                "Submit",
                style: TextStyle(
                  fontSize: 16.0.sp,
                ),
              ),
            ),
          ),
        ));
  }
}
