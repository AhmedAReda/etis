import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/button.dart';
import 'package:etislat/core/widget/custom_text_form_field.dart';
import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void addNoteDialog(BuildContext context, {required Member member}) {
  context.read<MemberCubit>().notecontroller.text = member.note ?? '';

  showDialog(
    context: context,
    builder: (BuildContext _) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              customTextFormField(
                controller: context.read<MemberCubit>().notecontroller,
                label: const Text('ملاحظه'),
                keyboardType: TextInputType.multiline,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                text: 'رجوع',
                onPressed0: () {
                  context
                      .read<MemberCubit>()
                      .playAudio(audio: 'audio/back.mp3');
                  context.pop();
                },
              ),
              Button(
                text: 'حفظ',
                onPressed0: () {
                  context.read<MemberCubit>().playAudio(audio: 'audio/add.mp3');
                  context.read<MemberCubit>().updateNote(
                        memberid: member.id,
                      );
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
