import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:etislat/core/di/dipendency_injection.dart';
import 'package:etislat/feature/allpaaidpage/logic/allpaid_cubit.dart';
import 'package:etislat/feature/allpaaidpage/ui/allPaidScreen.dart';
import 'package:etislat/feature/collectionpage/logic/collection_cubit.dart';
import 'package:etislat/feature/collectionpage/ui/collection_screen.dart';
import 'package:etislat/feature/settings/cubit/setting_cubit.dart';
import 'package:etislat/feature/settings/ui/setting_screen.dart';
import 'package:etislat/feature/unpaidpage/bloc/unpaid_cubit.dart';
import 'package:etislat/feature/unpaidpage/ui/unpaid_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playAudio() async {
    await _audioPlayer
        .play(AssetSource('audio/move.mp3')); // Play audio from assets
  }

  int navigatorValue = 3;
  Widget currentscreen = const UnpaidScreen();

  void changeSelectedvalue(int selected_value) {
    navigatorValue = selected_value;
    switch (selected_value) {
      case 0:
        currentscreen = BlocProvider(
          create: (context) => getit<SettingCubit>()..getemail(),
          child: SettingScreen(),
        );
        break;
      case 1:
        currentscreen = BlocProvider(
          create: (context) => getit<CollectionCubit>()..getallcollection(),
          child: const CollectionScreen(),
        );
        break;
      case 2:
        currentscreen = BlocProvider(
          create: (context) => getit<AllpaidCubit>()..getAllMemberPaid(),
          child: const Allpaidscreen(),
        );
        break;
      case 3:
        currentscreen = BlocProvider(
          create: (context) => getit<UnpaidCubit>()..getAllMemberunPaid(),
          child: const UnpaidScreen(),
        );
        break;
    }
    emit(NavigateState(navigatValue: navigatorValue));
  }
}
