part of 'allpaid_cubit.dart';

sealed class AllpaidState extends Equatable {
  const AllpaidState();

  @override
  List<Object> get props => [];
}

final class AllpaidInitial extends AllpaidState {}
final class MemberLoadingState extends AllpaidState {}

final class SucessMemberState extends AllpaidState {
  final List<Member> allmemberss;

  const SucessMemberState({required this.allmemberss});
}

final class ErrorMemberState extends AllpaidState {
  final String error;

  const ErrorMemberState({required this.error});
}
