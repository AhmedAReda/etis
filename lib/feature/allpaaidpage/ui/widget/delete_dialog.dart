import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/button.dart';
import 'package:etislat/feature/allpaaidpage/logic/allpaid_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void deleteMemberUnDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext _) {
      return AlertDialog(
        // title:
        content: Text(
          'هل انت متأكد من الحذف',
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                text: 'حذف',
                onPressed0: () {
                  context
                      .read<AllpaidCubit>()
                      .playAudio(audio: 'audio/delete.mp3');
                  context.read<AllpaidCubit>().makeAllMemberunPaid();

                  context.pop();
                },
              ),
              Button(
                text: 'لا',
                onPressed0: () {
                  context
                      .read<AllpaidCubit>()
                      .playAudio(audio: 'audio/back.mp3');

                  context.pop();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
