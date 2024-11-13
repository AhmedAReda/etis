import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/button.dart';
import 'package:etislat/core/widget/custom_text_form_field.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void addMmberDialog(BuildContext context,
    {required CollectionModel collectionmodel}) {
  showDialog(
    context: context,
    builder: (BuildContext _) {
      return Form(
        key: context.read<MemberCubit>().formkey,
        child: AlertDialog(
          title: const Text('اضافة عضو جديد'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                customTextFormField(
                  controller: context.read<MemberCubit>().namecontroller,
                  label: Text('الأسم'),
                  //  hintText: 'الاسم',
                  validator: (p0) {
                    if (p0 == null || p0.trim() == "") {
                      return "أدخل الأسم";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8.h),
                customTextFormField(
                  controller: context.read<MemberCubit>().phonecontroller,
                  keyboardType: TextInputType.phone,
                  label: Text('رقم التليفون'),
                  //  hintText: 'الاسم',
                  validator: (p0) {
                    if (p0 == null || p0.trim() == "") {
                      return "أدخل رقم التليفون";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8.h),
                customTextFormField(
                  controller: context.read<MemberCubit>().moneycontroller,
                  keyboardType: TextInputType.number,
                  label: Text('سعر الباقه'),
                  //  hintText: 'الاسم',
                  validator: (p0) {
                    if (p0 == null || p0.trim() == "") {
                      return "أدخل سعر الباقه";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Button(
              text: 'اضافه',
              onPressed0: () {
                if (context
                    .read<MemberCubit>()
                    .formkey
                    .currentState!
                    .validate()) {
                  context.read<MemberCubit>().playAudio(audio: 'audio/add.mp3');
                  context.read<MemberCubit>().addNewMmber(collectionmodel);
                  context.pop();
                }
              },
            )
          ],
        ),
      );
    },
  );
}
