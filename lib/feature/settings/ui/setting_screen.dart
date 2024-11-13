import 'package:etislat/core/widget/button.dart';
import 'package:etislat/feature/settings/cubit/setting_cubit.dart';
import 'package:etislat/feature/settings/ui/widget/signout_dialog.dart';
import 'package:etislat/feature/settings/ui/widget/upload_load.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        // context.read<SettingCubit>().getemail();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UploadLoad(),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 0.2)),
              child: Text(
                '${context.read<SettingCubit>().email == 'null' ? 'لا يوجد ايميل ' : context.read<SettingCubit>().email}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 15.sp),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<SettingCubit>().signIn();
                },
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {
                SignoutDialog(context);
              },
              child: Text(
                'تسجيل الخروج',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
              ),
            ),
            SizedBox(height: 200.h),
            Button(
              text: 'رفع قاعدة البيانات',
              onPressed0: () {
                context.read<SettingCubit>().uploadData();
              },
            ),
            
           
          ],
        );
      },
    );
  }
}
