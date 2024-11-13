part of 'member_cubit.dart';

sealed class MemberState extends Equatable {
  const MemberState();

  @override
  List<Object> get props => [];
}

final class MemberInitial extends MemberState {}

final class MemberLoadingState extends MemberState {}

final class SucessMemberState extends MemberState {
  final List<Member> allmemberss;

  const SucessMemberState({required this.allmemberss});
}

final class ErrorMemberState extends MemberState {
  final String error;

  const ErrorMemberState({required this.error});
}

final class MemberpaidState extends MemberState {
  final bool ispaid;

const  MemberpaidState({required this.ispaid});
  
}

final class deleteMemberState extends MemberState{
    final List<Member> allmemberss;

  const deleteMemberState({required this.allmemberss});

}


final class editMemberState extends MemberState{
    final List<Member> allmemberss;

  const editMemberState({required this.allmemberss});

}