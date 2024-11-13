import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/data/repo/member_repo.dart';
import 'package:flutter/material.dart';

part 'unpaid_state.dart';

class UnpaidCubit extends Cubit<UnpaidState> {
  UnpaidCubit({required this.memberRepo}) : super(UnpaidInitial());
  final MemberRepo memberRepo;

  TextEditingController searchcontroller = TextEditingController();
  TextEditingController sahrephonecontroller = TextEditingController();

  FocusNode focusNode = FocusNode();
  List<Member> allmembers = [];
  List<Member> filterdmember = [];
  List numbers = [];
  List<String> names = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playAudio({required String audio}) async {
    await _audioPlayer.play(AssetSource(audio)); // Play audio from assets
  }

 Future<CollectionModel> getSpecificCollection({required int collectionId}) async {
    final response =
        await memberRepo.getallSpecificcollection(collectionId: collectionId);
    return response;
  }

  getAllMemberunPaid() async {
    try {
      emit(MemberLoadingState());
      final memberpaid = await memberRepo.getAllMemberPaid(paid: false);
      allmembers = memberpaid;
      //  numbers = allmembers.map((member) => member.phone).toList();
      numbers =
          allmembers.map((member) => '0${member.phone.toString()}').toList();
      names = allmembers.map((member) => '${member.name.toString()}').toList();
      emit(SucessMemberState(allmemberss: allmembers));
    } catch (e) {
      emit(ErrorMemberState(error: e.toString()));
    }
  }

  filtermember({required String value}) {
    emit(MemberLoadingState());

    if (searchcontroller.text.isNotEmpty) {
      filterdmember = allmembers.where((member) {
        final searchValue = value.toLowerCase();
        return member.name.toLowerCase().contains(searchValue) ||
            member.collectionName.toLowerCase().contains(searchValue) ||
            member.phone.toString().contains(searchValue);
      }).toList();

      emit(SucessMemberState(allmemberss: filterdmember));
    } else {
      emit(SucessMemberState(allmemberss: allmembers));
    }
  }

  memberpaid({required int memberid, required bool paid}) async {
    try {
      await memberRepo.memberpaid(memberid: memberid, paid: paid);
    } catch (e) {}
  }

  callmember({required String phone}) async {
    playAudio(audio: 'audio/move.mp3');
    await memberRepo.callmember(phone: phone);
  }

  snendSms({required String phone}) async {
    playAudio(audio: 'audio/move.mp3');
    await memberRepo.sendsms(phone: phone);
  }

  sendUnpaidWhatsAppMessage() async {
    await memberRepo.sendUnpaidWhatsAppMessage(
        names: names, numbers: numbers, phonenumber: sahrephonecontroller.text);
  }
}
