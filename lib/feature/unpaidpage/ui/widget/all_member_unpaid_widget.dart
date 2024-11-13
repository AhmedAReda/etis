import 'package:etislat/core/routing/routes.dart';
import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/memer/member_widget.dart';
import 'package:etislat/feature/unpaidpage/bloc/unpaid_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllMemberUnpaidWidget extends StatelessWidget {
  const AllMemberUnpaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnpaidCubit, UnpaidState>(
      builder: (context, state) {
        if (state is SucessMemberState) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.allmemberss.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context
                        .read<UnpaidCubit>()
                        .playAudio(audio: 'audio/gopage.mp3');
                    context.read<UnpaidCubit>().focusNode.unfocus();
                    context.PushNamd(Routes.ProfileScreen, arguments: {
                      'member': state.allmemberss[index],
                    }).then(
                      (value) {
                        if (value == true) {
                          context.read<UnpaidCubit>().getAllMemberunPaid();
                        } else {}
                      },
                    );
                  },
                  child: MemberWidgetTest(
                    namecolor: Colors.black,
                    memberModel: state.allmemberss[index],
                    onMemberPaid: (paid) async {
                      context.read<UnpaidCubit>().memberpaid(
                          memberid: state.allmemberss[index].id, paid: paid!);
                    },
                    phone: () {
                      context.read<UnpaidCubit>().callmember(
                          phone: state.allmemberss[index].phone.toString());
                    },
                    whats: () {
                      context.read<UnpaidCubit>().snendSms(
                          phone: state.allmemberss[index].phone.toString());
                    },
                    goToCollection: () async {
                      context
                          .read<UnpaidCubit>()
                          .playAudio(audio: 'audio/gopage.mp3');
                      final response = await context
                          .read<UnpaidCubit>()
                          .getSpecificCollection(
                              collectionId:
                                  state.allmemberss[index].collectionId);
                      context.PushNamd(Routes.memberScreen,
                          arguments: response);
                    },
                  ),
                );
              },
            ),
          );
        } else if (state is MemberLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
