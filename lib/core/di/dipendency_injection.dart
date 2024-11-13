import 'package:etislat/core/service/sqldb.dart';
import 'package:etislat/feature/allpaaidpage/logic/allpaid_cubit.dart';
import 'package:etislat/feature/bottomNavBar/presentation/bloc/bottom_nav_bar_cubit.dart';
import 'package:etislat/feature/collectionpage/data/repo/collection_repo.dart';
import 'package:etislat/feature/collectionpage/logic/collection_cubit.dart';
import 'package:etislat/feature/memberPage/data/repo/member_repo.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:etislat/feature/settings/cubit/setting_cubit.dart';
import 'package:etislat/feature/settings/data/googe_drive_repo.dart';
import 'package:etislat/feature/unpaidpage/bloc/unpaid_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getit = GetIt.instance;

Future<void> setGetit() async {
// cubit
  getit.registerFactory<CollectionCubit>(
      () => CollectionCubit(collectionRepo: getit()));
  getit.registerFactory<BottomNavBarCubit>(() => BottomNavBarCubit());
  getit.registerFactory<MemberCubit>(() => MemberCubit(memberRepo: getit()));
  getit.registerFactory<AllpaidCubit>(() => AllpaidCubit(memberRepo: getit()));
    getit.registerFactory<UnpaidCubit>(() => UnpaidCubit(memberRepo: getit()));
        getit.registerFactory<SettingCubit>(() =>  SettingCubit(driveScopeRepo: getit()));



// repo
  getit.registerLazySingleton<CollectionRepo>(
      () => CollectionRepo(mysql: getit()));
  getit.registerFactory<MemberRepo>(() => MemberRepo(mysql: getit()));
    getit.registerFactory<DriveScopeRepo>(() =>  DriveScopeRepo(
      sharedprefrences: getit(),
      mysql: getit()
      ));

// data
  getit.registerLazySingleton(() => SqlDb());

  // core 
    final sharedPreferences = await SharedPreferences.getInstance();

    getit.registerLazySingleton(
    () => sharedPreferences,
  );
}
