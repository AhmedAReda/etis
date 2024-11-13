import 'package:etislat/core/widget/custom_text_form_field.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:etislat/feature/memberPage/presentation/widget/member_widget/number_of_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchMemberWidget extends StatelessWidget {
  const SearchMemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const NumberOfMemberWidget(),
        SizedBox(width: 5.w),
        Expanded(
          child: customTextFormField(
            focusNode: context.read<MemberCubit>().focusNode,
            controller: context.read<MemberCubit>().searchcontroller,
            isobscureText: false,
            onChanged: (p0) {
              context.read<MemberCubit>().filtermember(value: p0);
            },
            hintText: 'Search',
            contentPadding: const EdgeInsets.all(12),
             enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        )
      ],
    );
  }
}
