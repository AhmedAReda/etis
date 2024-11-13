import 'package:etislat/feature/unpaidpage/bloc/unpaid_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberOfUnPaidWidget extends StatelessWidget {
  const NumberOfUnPaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnpaidCubit, UnpaidState>(
      builder: (context, state) {
        return CircleAvatar(
          backgroundColor: const Color(0xffFE0000),
          foregroundColor: Colors.white,
          radius: 25,
          child: Text(
            state is SucessMemberState ? "${state.allmemberss.length}" : '0',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        );
      },
    );
  }
}
