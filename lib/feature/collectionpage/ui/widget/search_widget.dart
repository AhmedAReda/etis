import 'package:etislat/core/widget/custom_text_form_field.dart';
import 'package:etislat/feature/collectionpage/logic/collection_cubit.dart';
import 'package:etislat/feature/collectionpage/ui/widget/number_of_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const NumberOfCollectionWidget(),
        SizedBox(width: 5.w),
        Expanded(
          child: customTextFormField(
            controller: context.read<CollectionCubit>().searchcontroller,
            isobscureText: false,
            onChanged: (p0) {
              context.read<CollectionCubit>().filtercollection(value: p0);
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            hintText: 'Search',
            contentPadding: const EdgeInsets.all(12),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ],
    );
  }
}
