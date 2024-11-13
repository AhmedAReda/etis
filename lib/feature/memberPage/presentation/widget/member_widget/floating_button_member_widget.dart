import 'package:etislat/core/di/dipendency_injection.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:etislat/feature/memberPage/presentation/widget/member_widget/add_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingButtonMemberWidget extends StatelessWidget {
  const FloatingButtonMemberWidget({super.key, required this.collectionModel});
  final CollectionModel collectionModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getit<MemberCubit>(),
      child: FloatingActionButton(
        backgroundColor: const Color(0xffFE0000),
        onPressed: () {
          context.read<MemberCubit>().playAudio(audio: 'audio/gopage.mp3');
          addMmberDialog(context, collectionmodel: collectionModel);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
