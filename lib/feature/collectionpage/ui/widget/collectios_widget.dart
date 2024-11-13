import 'package:etislat/core/routing/routes.dart';
import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/feature/collectionpage/logic/collection_cubit.dart';
import 'package:etislat/feature/collectionpage/ui/widget/delete_collectoin_dialog.dart';
import 'package:etislat/feature/collectionpage/ui/widget/edit_delete_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectiosWidget extends StatelessWidget {
  const CollectiosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionCubit, CollectionState>(
      builder: (context, state) {
        if (state is CollectionSucessState) {
          return Expanded(
            child: GridView.builder(
              itemCount: state.collections.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 6.h,
                  childAspectRatio: 2.h),
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    editCollectionDialog(context,
                        collectionmodel: state.collections[index]);
                  },
                  onTap: () {
                    context
                        .read<CollectionCubit>()
                        .playAudio(audio: 'audio/gopage.mp3');
                    context.PushNamd(Routes.memberScreen,
                            arguments: state.collections[index])
                        .then(
                      (value) {
                        context.read<CollectionCubit>().getallcollection();
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                deletecollectiondialog(context,
                                    collectionmodel: state.collections[index]);
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 15,
                                child: Icon(
                                  Icons.close,
                                  size: 15,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 12,
                                child: Text(
                                  '${state.collections[index].memberCount}',
                                  style: TextStyle(fontSize: 16.sp),
                                ))
                          ],
                        ),
                        Text(
                          state.collections[index].collectionname,
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
