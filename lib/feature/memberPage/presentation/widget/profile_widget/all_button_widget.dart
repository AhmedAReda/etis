import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/button_widget.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/delete_member_dialog.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/edit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllButtonWidget extends StatelessWidget {
  const AllButtonWidget({super.key, required this.member});
  final Member member;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget(
              name: 'تعديل',
              color: Colors.blue,
              icon: const Icon(Icons.edit),
              onTap: () {
                context.read<MemberCubit>().playAudio(audio: 'audio/move.mp3');
                editMemberDialog(context, member: member);
              },
            ),
            SizedBox(height: 7.h),
            ButtonWidget(
              name: 'اتصال',
              color:   Colors.green,
              icon: const Icon(Icons.phone),
              onTap: () async {
                context
                    .read<MemberCubit>()
                    .callmember(phone: '${member.phone}');
              },
            ),
            SizedBox(height: 7.h),
            ButtonWidget(
              name: 'حذف',
              color: Colors.red,
              icon: const Icon(Icons.delete),
              onTap: () {
                context.read<MemberCubit>().playAudio(audio: 'audio/move.mp3');
                deleteMemberDialog(context, member: member);
              },
            ),
            SizedBox(height: 7.h),
            ButtonWidget(
              name: 'ارسال رسالة',
              textcolor: Colors.white,
              color: Colors.green,
              icon: const Icon(
                Icons.mark_as_unread_sharp,
                color: Colors.white,
              ),
              onTap: () {
                context.read<MemberCubit>().sendWhatsappMessage(
                    name: member.name, phone: member.phone.toString());
              },
            )
          ],
        ),
        // Text("ddddddddd"),
        member.note != null
            ? Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  member.note!,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ))
            : const SizedBox.shrink(),
      ],
    ));
  }
}
