import 'package:etislat/core/widget/custom_text_form_field.dart';
import 'package:etislat/feature/allpaaidpage/logic/allpaid_cubit.dart';
import 'package:etislat/feature/allpaaidpage/ui/widget/number_of_paid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchMemberPaidWidget extends StatelessWidget {
  const SearchMemberPaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const NumberOfPaidWidget(),
        SizedBox(width: 5.w),
        Expanded(
          child: customTextFormField(
            focusNode: context.read<AllpaidCubit>().focusNode,
            controller: context.read<AllpaidCubit>().searchcontroller,
            isobscureText: false,
            onChanged: (p0) {
              context.read<AllpaidCubit>().filtermember(value: p0);
            },
            onTapOutside: (p0) {
              context.read<AllpaidCubit>().focusNode.unfocus();
            },
            // hintText: 'Search',
            contentPadding: const EdgeInsets.all(12),
             enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        )
      ],
    );
  }
}
