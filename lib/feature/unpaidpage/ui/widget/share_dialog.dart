import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/button.dart';
import 'package:etislat/core/widget/custom_text_form_field.dart';
import 'package:etislat/feature/unpaidpage/bloc/unpaid_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void sharedialog(
  BuildContext context,
) {
  context.read<UnpaidCubit>().sahrephonecontroller.text = '01129500959';
  showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                customTextFormField(
                  keyboardType: TextInputType.phone,
                  controller: context.read<UnpaidCubit>().sahrephonecontroller,
                )
              ],
            ),
          ),
          actions: <Widget>[
            Button(
              text: 'مشاركه',
              Buttoncolor: Colors.red,
              textColor: Colors.black,
              onPressed0: () {
                context.read<UnpaidCubit>().playAudio(audio: 'audio/add.mp3');
                context.read<UnpaidCubit>().sendUnpaidWhatsAppMessage();
                context.pop();
              },
            ),
          ],
        );
      });
}
