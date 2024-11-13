import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/button.dart';
import 'package:etislat/core/widget/custom_text_form_field.dart';
import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void editMemberDialog(BuildContext context, {required Member member}) {
  context.read<MemberCubit>().editnamecontroller.text = member.name;
  context.read<MemberCubit>().editphonehcontroller.text =
      member.phone.toString();
  context.read<MemberCubit>().editmoneycontroller.text =
      member.money.toString();
  showDialog(
    context: context,
    builder: (BuildContext _) {
      return AlertDialog(
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            member.name,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              customTextFormField(
                controller: context.read<MemberCubit>().editnamecontroller,
                label: Text('الأسم'),
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: 10.h),
              customTextFormField(
                controller: context.read<MemberCubit>().editphonehcontroller,
                label: Text('رقم التليفون'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10.h),
              customTextFormField(
                controller: context.read<MemberCubit>().editmoneycontroller,
                label: Text('سعر الباقه'),
                keyboardType: TextInputType.number,
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
                  Member mem = Member(
                      id: member.id,
                      name: context.read<MemberCubit>().editnamecontroller.text,
                      phone: int.parse(context
                          .read<MemberCubit>()
                          .editphonehcontroller
                          .text),
                      paid: member.paid,
                      collectionId: member.collectionId,
                      money:
                          context.read<MemberCubit>().editmoneycontroller.text,
                      collectionName: member.collectionName);
                  context.read<MemberCubit>().editmemberById(member: mem);
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
