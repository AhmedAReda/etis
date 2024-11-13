import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/button.dart';
import 'package:etislat/feature/settings/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void SignoutDialog(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialog(
          title: Text(
            'اتأكد انك عامل رفع البيانات قبل تسجيل الخروج',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  text: 'نعم',
                  Buttoncolor: Colors.red,
                  onPressed0: () {
                    context.read<SettingCubit>().signOut();
                    context
                        .read<SettingCubit>()
                        .playAudio(audio: 'audio/delete.mp3');
                    context.pop();
                  },
                ),
                Button(
                  text: 'لا',
                  onPressed0: () {
                    context
                        .read<SettingCubit>()
                        .playAudio(audio: 'audio/back.mp3');

                    context.pop();
                  },
                )
              ],
            ),
          ],
        );
      });
}
