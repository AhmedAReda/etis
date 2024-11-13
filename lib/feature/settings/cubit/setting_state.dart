part of 'setting_cubit.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}

final class SettingLoading extends SettingState {}

final class SettingSucess extends SettingState {}

final class SettingFailure extends SettingState {}

final class SettingSignedOut extends SettingState {}

final class SettingSignedIn extends SettingState {
  final String email;

  SettingSignedIn({required this.email});
}

final class getemailstate extends SettingState {}
