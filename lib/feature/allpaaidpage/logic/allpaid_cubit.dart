import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/data/repo/member_repo.dart';
import 'package:flutter/material.dart';

part 'allpaid_state.dart';

class AllpaidCubit extends Cubit<AllpaidState> {
  AllpaidCubit({required this.memberRepo}) : super(AllpaidInitial());
  final MemberRepo memberRepo;
  TextEditingController searchcontroller = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<Member> allmembers = [];
  List<Member> filterdmember = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playAudio({required String audio}) async {
    await _audioPlayer.play(AssetSource(audio)); // Play audio from assets
  }

  Future<CollectionModel> getSpecificCollection(
      {required int collectionId}) async {
    final response =
        await memberRepo.getallSpecificcollection(collectionId: collectionId);
    return response;
  }

  getAllMemberPaid() async {
    try {
      emit(MemberLoadingState());
      final memberpaid = await memberRepo.getAllMemberPaid(paid: true);
      allmembers = memberpaid;
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

  getallmember() async {
    try {
      emit(MemberLoadingState());
      final memberpaid = await memberRepo.getAllMembers();
      allmembers = memberpaid;
      emit(SucessMemberState(allmemberss: allmembers));
    } catch (e) {
      emit(ErrorMemberState(error: e.toString()));
    }
  }

  makeAllMemberunPaid() async {
    try {
      emit(MemberLoadingState());

      await memberRepo.makeAllMemberunPaid();
      final memberpaid0 = await memberRepo.getAllMemberPaid(paid: true);
      allmembers = memberpaid0;

      emit(SucessMemberState(allmemberss: allmembers));
    } catch (e) {
      emit(ErrorMemberState(error: e.toString()));
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
}
