import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/data/repo/member_repo.dart';
import 'package:flutter/material.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  MemberCubit({required this.memberRepo}) : super(MemberInitial());
  final MemberRepo memberRepo;
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController moneycontroller = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();
  TextEditingController editnamecontroller = TextEditingController();
  TextEditingController editphonehcontroller = TextEditingController();
  TextEditingController editmoneycontroller = TextEditingController();
  TextEditingController notecontroller = TextEditingController();
  List<Member> allmembers = [];
  List<Member> filterdmember = [];
  FocusNode focusNode = FocusNode();

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playAudio({required String audio}) async {
    await _audioPlayer.play(AssetSource(audio)); // Play audio from assets
  }

   

  addNewMmber(CollectionModel collectionmodel) async {
    try {
      emit(MemberLoadingState());
      Member newMembber = Member(
        id: 20,
        name: //'aaaQ',
            namecontroller.text,
        phone: //142,
            int.parse(phonecontroller.text),
        paid: false,
        collectionId: //36,
            collectionmodel.collectoinid,
        money: //'300',
            moneycontroller.text,
        collectionName: //"co name"
            collectionmodel.collectionname,
      );
      await memberRepo.addMember(newMembber);
      final members = await memberRepo.getMembersByCollection(
          collectionId: collectionmodel.collectoinid);
      //  final testmemer = await memberRepo.getAllMembers();
      allmembers = members;
      namecontroller.clear();
      phonecontroller.clear();
      moneycontroller.clear();
      emit(SucessMemberState(allmemberss: allmembers));
    } catch (e) {
      emit(ErrorMemberState(error: e.toString()));
    }
  }

  getMemberById({required CollectionModel collectionmodel}) async {
    try {
      emit(MemberLoadingState());
      final memberinCollection = await memberRepo.getMembersByCollection(
          collectionId: collectionmodel.collectoinid);
      allmembers = memberinCollection;
      emit(SucessMemberState(allmemberss: allmembers));
    } catch (e) {
      emit(ErrorMemberState(error: e.toString()));
    }
  }

  getMemberByIdt({required int colectionid}) async {
    try {
      emit(MemberLoadingState());
      final memberinCollection =
          await memberRepo.getMembersByCollection(collectionId: colectionid);
      allmembers = memberinCollection;
      emit(SucessMemberState(allmemberss: allmembers));
    } catch (e) {
      emit(ErrorMemberState(error: e.toString()));
    }
  }

  filtermember({required String value}) {
    emit(MemberLoadingState());
    if (searchcontroller.text.isNotEmpty) {
      filterdmember = allmembers
          .where(
              (user) => user.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
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

  deletememberById({required int memberId}) async {
    emit(MemberLoadingState());

    await memberRepo.deleteMember(memberId);
    emit(deleteMemberState(allmemberss: allmembers));
  }

  editmemberById({required Member member}) async {
    emit(MemberLoadingState());
    await memberRepo.updateMember(member: member);
    emit(editMemberState(allmemberss: allmembers));
  }

  updateNote({
    required int memberid,
  }) async {
    emit(MemberLoadingState());
    await memberRepo.updateNote(memberid: memberid, note: notecontroller.text);
    emit(editMemberState(allmemberss: allmembers));
  }

  deleteNote({
    required int memberid,
  }) async {
    emit(MemberLoadingState());
    await memberRepo.deleteNote(memberid: memberid);
    emit(editMemberState(allmemberss: allmembers));
  }

  callmember({required String phone}) async {
    playAudio(audio: 'audio/move.mp3');
    await memberRepo.callmember(phone: phone);
  }
  snendSms({required String phone}) async {
    playAudio(audio: 'audio/move.mp3');

    await memberRepo.sendsms(phone: phone);
  }
  sendWhatsappMessage({required String phone, required String name}) async {
    playAudio(audio: 'audio/move.mp3');
    await memberRepo.sendWhatsAppMessage(phone: phone, name: name);
  }
}
