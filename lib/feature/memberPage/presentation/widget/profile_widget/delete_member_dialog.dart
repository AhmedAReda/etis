import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/button.dart';
import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void deleteMemberDialog(BuildContext context, {required Member member}) {
  showDialog(
    context: context,
    builder: (BuildContext _) {
      return AlertDialog(
        title: Text(
          member.name,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
        ),
        content: Text(
          'هل أنت متأكد من حذف هذا العضو',
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
                      .read<MemberCubit>()
                      .playAudio(audio: 'audio/delete.mp3');
                  context
                      .read<MemberCubit>()
                      .deletememberById(memberId: member.id);
                  context.pop();
                },
              ),
              Button(
                text: 'لا',
                onPressed0: () {
                  context
                      .read<MemberCubit>()
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
