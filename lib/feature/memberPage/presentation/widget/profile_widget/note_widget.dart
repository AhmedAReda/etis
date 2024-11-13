import 'package:etislat/core/widget/button.dart';
import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/add_note_dialog.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/delete_note_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.member});
  final Member member;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
              text: 'مسح الملحوظه',
              Buttoncolor: Colors.red,
              textColor: Colors.white,
              onPressed0: () {
                context.read<MemberCubit>().playAudio(audio: 'audio/move.mp3');
                deleteNoteDialog(context, member: member);
              },
            ),
            Button(
              text: 'اضافة ملحوظه',
              Buttoncolor: Colors.white,
              textColor: Colors.black,
              onPressed0: () {
                context.read<MemberCubit>().playAudio(audio: 'audio/move.mp3');
                addNoteDialog(context, member: member);
              },
            ),
          ],
        ),
        // member.note != null
        //     ? Container(
        //         padding: const EdgeInsets.all(10),
        //         decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(10)),
        //         child: Text(
        //           member.note!,
        //           style: TextStyle(
        //               fontSize: 15.sp,
        //               fontWeight: FontWeight.w500,
        //               color: Colors.black),
        //         ))
        //     : const SizedBox.shrink(),
      ],
    );
  }
}
