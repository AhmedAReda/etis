import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/button.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/collectionpage/logic/collection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void deletecollectiondialog(BuildContext context,
    {required CollectionModel collectionmodel}) {
  showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialog(
          title: Text(collectionmodel.collectionname,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'هل تريد حذف المجموعه',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  text: 'مسح',
                  Buttoncolor: Colors.red,
                  onPressed0: () {
                    context
                        .read<CollectionCubit>()
                        .playAudio(audio: 'audio/delete.mp3');
                    context.read<CollectionCubit>().deleteCollection(
                        collectionId: collectionmodel.collectoinid);
                    context.pop();
                  },
                ),
                Button(
                  text: 'لا',
                  onPressed0: () {
                    context
                        .read<CollectionCubit>()
                        .playAudio(audio: 'audio/back.mp3');

                    // context.read<CollectionCubit>().updateCollection(
                    //     collectionId: collectionmodel.collectoinid);
                    context.pop();
                  },
                )
              ],
            ),
          ],
        );
      });
}
