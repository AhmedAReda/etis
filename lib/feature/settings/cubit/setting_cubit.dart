import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:etislat/feature/settings/data/googe_drive_repo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart'; // Import this

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final DriveScopeRepo driveScopeRepo;

  SettingCubit({required this.driveScopeRepo}) : super(SettingInitial());
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? email;
  Future getemail() async {
    print("ff---------- go");
    email = await driveScopeRepo.getemail();
    print("---- $email");

    print("ff---------- ss");
    emit(getemailstate());
  }

  Future<void> playAudio({required String audio}) async {
    await _audioPlayer.play(AssetSource(audio)); // Play audio from assets
  }

  // Method to check for internet connectivity
  Future<bool> _hasInternetConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }

  // Upload data to Google Drive
  uploadData() async {
    emit(SettingLoading());

    // Check if the device has internet access
    bool hasConnection = await _hasInternetConnection();
    if (!hasConnection) {
      emit(SettingFailure()); // Emit failure if no internet
      return;
    }

    try {
      await driveScopeRepo.upload1();
      emit(SettingSucess());
      playAudio(audio: 'audio/gdrive.mp3');
    } catch (e) {
      emit(SettingFailure());
    }
  }

  // Restore data from Google Drive
  restoreData() async {
    emit(SettingLoading());

    // Check if the device has internet access
    bool hasConnection = await _hasInternetConnection();
    if (!hasConnection) {
      emit(SettingFailure()); // Emit failure if no internet
      return;
    }

    try {
      await driveScopeRepo.restoreDatabaseFromDrive();
      playAudio(audio: 'audio/gdrive.mp3');

      emit(SettingSucess());
    } catch (e) {
      emit(SettingFailure());
    }
  }

  Future<void> signIn() async {
    print('nn ->> ------- ${email == 'No Email Found'}');
    if (email == null || email == 'null' || email =='No Email Found') {
      try {
        emit(SettingLoading());
            print('------------ 11');
        String? email = await driveScopeRepo.signIn();
        if (email != null) {
           print('------------ 222');
          emit(SettingSignedIn(email: email));
          await getemail();
          await restoreData();
        } else {
          emit(SettingFailure());
        }
      } catch (e) {
        emit(SettingFailure());
      }
    } else {
      print("------------ no");
    }
  }

  Future<void> signOut() async {
    print("-------- 11");
    emit(SettingLoading());
    try {
      if (email != null) {
        print("------------ 44");
        await uploadData();
        // await driveScopeRepo.upload1();
        print("------------ 66");
      }
      await driveScopeRepo.signOut();
      print("-------- 22");
      emit(SettingSignedOut()); // Emit signed out state
      getemail();
    } catch (e) {
      print("-------- 33");
      emit(SettingFailure());
    }
  }

  String? getSignedInUserEmail() {
    return driveScopeRepo.googleUser?.email;
  }
}
