import 'package:etislat/feature/settings/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadLoad extends StatelessWidget {
  const UploadLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
      if (state is SettingLoading) {
        return Center(
          child: Container(
            width: 50.w,
            height: 50.h,
            child: const CircularProgressIndicator(),
          ),
        );
      } else if (state is SettingSucess) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "تمت العمليه بنجاح",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.green,
                ),
              ),
              Icon(
                Icons.check,
                size: 50,
                color: Colors.green,
              )
            ],
          ),
        );
      } else if (state is SettingFailure) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "فشلت العمليه ",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.red,
                ),
              ),
              Icon(
                Icons.close,
                size: 50,
                color: Colors.red,
              )
            ],
          ),
        );
      } else if (state is SettingSignedOut) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "تم تسجيل الخروج ",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.red,
                ),
              ),
              Icon(
                Icons.exit_to_app,
                size: 50,
                color: Colors.red,
              )
            ],
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    });
  }
}
