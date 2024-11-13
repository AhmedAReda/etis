import 'package:etislat/feature/collectionpage/logic/collection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberOfCollectionWidget extends StatelessWidget {
  const NumberOfCollectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionCubit, CollectionState>(
      builder: (context, state) {
        if (state is CollectionSucessState) {
          return CircleAvatar(
            backgroundColor: const Color(0xffFE0000),
            foregroundColor: Colors.white,
            radius: 25,
            child: Text(
              "${state.collections.length}",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          );
        } else {
          return const Text("0");
        }
      },
    );
  }
}
