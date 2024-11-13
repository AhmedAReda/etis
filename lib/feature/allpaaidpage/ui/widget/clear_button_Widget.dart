import 'package:etislat/core/widget/button.dart';
import 'package:etislat/feature/allpaaidpage/logic/allpaid_cubit.dart';
import 'package:etislat/feature/allpaaidpage/ui/widget/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearButtonWidget extends StatelessWidget {
  const ClearButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      text: 'حذف الكل',
      onPressed0: () {
        context.read<AllpaidCubit>().playAudio(audio: 'audio/move.mp3');
        deleteMemberUnDialog(context);
      },
    );
  }
}
