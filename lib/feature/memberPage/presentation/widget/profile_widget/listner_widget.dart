import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListnerWidget extends StatelessWidget {
  const ListnerWidget({
    super.key,
  });
  // final CollectionModel collectionModel;
  @override
  Widget build(BuildContext context) {
    return BlocListener<MemberCubit, MemberState>(
      listener: (context, state) {
        if (state is deleteMemberState || state is editMemberState) {
          Navigator.of(context).pop(true);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
