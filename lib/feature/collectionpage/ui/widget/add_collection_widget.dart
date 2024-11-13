import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/button.dart';
import 'package:etislat/core/widget/custom_text_form_field.dart';
import 'package:etislat/feature/collectionpage/logic/collection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showAddCollectionDialog(BuildContext context) {
  //context.read<CollectionCubit>().focusNode.requestFocus();
  showDialog(
    context: context,
    builder: (BuildContext _) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<CollectionCubit>().focusNode.requestFocus();
      });
      return Form(
        key: context.read<CollectionCubit>().formkey,
        child: AlertDialog(
          title: const Text('اضافة مجموعه جديده'),
          // content: const Text('Add collection details here...'),

          actions: <Widget>[
            customTextFormField(
              controller:
                  context.read<CollectionCubit>().collectionnamecontroler,
              focusNode: context.read<CollectionCubit>().focusNode,
              hintText: 'اسم المجموعه',
              validator: (p0) {
                if (p0 == null || p0.trim() == "") {
                  return "Enter Name";
                }
                return null;
              },
            ),
            SizedBox(height: 6.h),
            Button(
              text: 'اضافه',
              onPressed0: () {
                if (context
                    .read<CollectionCubit>()
                    .formkey
                    .currentState!
                    .validate()) {
                  context
                      .read<CollectionCubit>()
                      .playAudio(audio: 'audio/add.mp3');

                  context.read<CollectionCubit>().addcollection();
                  context.pop();
                } else {
                  context
                      .read<CollectionCubit>()
                      .collectionnamecontroler
                      .clear();
                }
                //
                //  context.read<CollectionCubit>().test();
              },
            )
            // TextButton(
            //   onPressed: () {
            //     if (context
            //         .read<CollectionCubit>()
            //         .formkey
            //         .currentState!
            //         .validate()) {
            //       context.read<CollectionCubit>().addcollection();
            //       context.pop();
            //     } else {
            //       context
            //           .read<CollectionCubit>()
            //           .collectionnamecontroler
            //           .clear();
            //     }
            //     //
            //     //  context.read<CollectionCubit>().test();
            //   },
            //   child: const Text('Add'),
            // ),
          ],
        ),
      );
    },
  );
}
