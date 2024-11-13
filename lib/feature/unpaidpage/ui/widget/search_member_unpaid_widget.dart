import 'package:etislat/core/widget/custom_text_form_field.dart';
import 'package:etislat/feature/unpaidpage/bloc/unpaid_cubit.dart';
import 'package:etislat/feature/unpaidpage/ui/widget/number_of_un_paid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchMemberUnpaidWidget extends StatelessWidget {
  const SearchMemberUnpaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const NumberOfUnPaidWidget(),
        SizedBox(width: 5.w),
        Expanded(
          child: customTextFormField(
            focusNode: context.read<UnpaidCubit>().focusNode,
            controller: context.read<UnpaidCubit>().searchcontroller,
            isobscureText: false,
            onChanged: (p0) {
              context.read<UnpaidCubit>().filtermember(value: p0);
            },
            onTapOutside: (p0) {
              context.read<UnpaidCubit>().focusNode.unfocus();
            },
            contentPadding: const EdgeInsets.all(12),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        )
      ],
    );
  }
}
