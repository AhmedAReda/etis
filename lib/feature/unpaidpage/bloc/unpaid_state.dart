part of 'unpaid_cubit.dart';

sealed class UnpaidState extends Equatable {
  const UnpaidState();

  @override
  List<Object> get props => [];
}

final class UnpaidInitial extends UnpaidState {}

final class MemberLoadingState extends UnpaidState {}

final class SucessMemberState extends UnpaidState {
  final List<Member> allmemberss;

  const SucessMemberState({required this.allmemberss});
}

final class ErrorMemberState extends UnpaidState {
  final String error;

  const ErrorMemberState({required this.error});
}
