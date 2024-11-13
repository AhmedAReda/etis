import 'package:etislat/core/routing/routes.dart';
import 'package:etislat/core/utils/extension.dart';
import 'package:etislat/core/widget/memer/member_widget.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllMemberWidget extends StatelessWidget {
  const AllMemberWidget({super.key, required this.collectionModel});
  final CollectionModel collectionModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberCubit, MemberState>(
      builder: (context, state) {
        if (state is SucessMemberState) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.allmemberss.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context
                        .read<MemberCubit>()
                        .playAudio(audio: 'audio/gopage.mp3');
                    context.read<MemberCubit>().focusNode.unfocus();
                    context.PushNamd(
                      Routes.ProfileScreen,
                      arguments: {
                        'member': state.allmemberss[index],
                        'collectionModel': collectionModel,
                      },
                    ).then(
                      (value) {
                        if (value == true) {
                          context
                              .read<MemberCubit>()
                              .getMemberById(collectionmodel: collectionModel);
                        } else {}
                      },
                    );
                  },
                  child: MemberWidgetTest(
                    namecolor: Colors.black,
                    memberModel: state.allmemberss[index],
                    onMemberPaid: (paid) async {
                      context.read<MemberCubit>().memberpaid(
                          memberid: state.allmemberss[index].id, paid: paid!);
                    },
                    phone: () {
                      context.read<MemberCubit>().callmember(
                          phone: state.allmemberss[index].phone.toString());
                    },
                    whats: () {
                      context.read<MemberCubit>().snendSms(
                            phone: state.allmemberss[index].phone.toString(),
                          );
                    },
                  ),
                );
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
