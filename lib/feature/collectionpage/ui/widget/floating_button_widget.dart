import 'package:etislat/feature/collectionpage/logic/collection_cubit.dart';
import 'package:etislat/feature/collectionpage/ui/widget/add_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xffFE0000),
      onPressed: () {
        context.read<CollectionCubit>().playAudio(audio: 'audio/gopage.mp3');
        context.read<CollectionCubit>().focusNode.requestFocus();
        showAddCollectionDialog(context);
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
