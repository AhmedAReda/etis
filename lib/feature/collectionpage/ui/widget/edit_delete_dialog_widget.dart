import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/button.dart';
import 'package:etislat/core/widget/custom_text_form_field.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/collectionpage/logic/collection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void editCollectionDialog(BuildContext context,
    {required CollectionModel collectionmodel}) {
  context.read<CollectionCubit>().editnamecollectioncontroller.text =
      collectionmodel.collectionname;
  showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialog(
          title: Text(collectionmodel.collectionname,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                customTextFormField(
                  controller: context
                      .read<CollectionCubit>()
                      .editnamecollectioncontroller,
                  hintText: 'تعديل اسم المجموعه',
                )
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             
                Button(
                  text: 'حفظ',
                  onPressed0: () {
                    context
                        .read<CollectionCubit>()
                        .playAudio(audio: 'audio/back.mp3');

                    context.read<CollectionCubit>().updateCollection(
                        collectionId: collectionmodel.collectoinid);
                    context.pop();
                  },
                )
              ],
            ),
          ],
        );
      });
}
