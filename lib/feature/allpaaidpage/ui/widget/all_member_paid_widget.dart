import 'package:etislat/core/routing/routes.dart';
import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/memer/member_widget.dart';
import 'package:etislat/feature/allpaaidpage/logic/allpaid_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllMemberPaidWidget extends StatelessWidget {
  const AllMemberPaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllpaidCubit, AllpaidState>(
      builder: (context, state) {
        if (state is SucessMemberState) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.allmemberss.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      context
                          .read<AllpaidCubit>()
                          .playAudio(audio: 'audio/gopage.mp3');
                      context.read<AllpaidCubit>().focusNode.unfocus();
                      context.PushNamd(Routes.ProfileScreen, arguments: {
                        'member': state.allmemberss[index],
                      }).then(
                        (value) {
                          if (value == true) {
                            context.read<AllpaidCubit>().getAllMemberPaid();
                          } else {}
                        },
                      );
                    },
                    child: MemberWidgetTest(
                      color: Color(0xff127D13),
                      phonecolor: Colors.white,
                      smscolor: Colors.white,
                      checkcolor: Colors.black,
                      memberModel: state.allmemberss[index],
                      onMemberPaid: (paid) async {
                        context.read<AllpaidCubit>().memberpaid(
                            memberid: state.allmemberss[index].id, paid: paid!);
                      },
                      phone: () {
                        context.read<AllpaidCubit>().callmember(
                            phone: state.allmemberss[index].phone.toString());
                      },
                      whats: () {
                        context.read<AllpaidCubit>().snendSms(
                            phone: state.allmemberss[index].phone.toString());
                      },
                      goToCollection: () async {
                        print("---------- ww");
                        final response = await context
                            .read<AllpaidCubit>()
                            .getSpecificCollection(
                                collectionId:
                                    state.allmemberss[index].collectionId);
                        context.PushNamd(Routes.memberScreen,
                            arguments: response);
                      },
                    ));
              },
            ),
          );
        } else if (state is MemberLoadingState) {
          return const Center(
              child:
                  CircularProgressIndicator()); // Show a loading indicator while members are being fetched
        } else {
          return const SizedBox.shrink(); // Placeholder for other states
        }
      },
    );
  }
}
