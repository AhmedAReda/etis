import 'package:etislat/core/di/dipendency_injection.dart';
import 'package:etislat/core/routing/routes.dart';
import 'package:etislat/feature/allpaaidpage/logic/allpaid_cubit.dart';
import 'package:etislat/feature/allpaaidpage/ui/allPaidScreen.dart';
import 'package:etislat/feature/bottomNavBar/presentation/bloc/bottom_nav_bar_cubit.dart';
import 'package:etislat/feature/bottomNavBar/presentation/ui/bottm_nav_bar.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/collectionpage/logic/collection_cubit.dart';
import 'package:etislat/feature/collectionpage/ui/collection_screen.dart';
import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/logic/member_cubit.dart';
import 'package:etislat/feature/memberPage/presentation/pages/member_screen.dart';
import 'package:etislat/feature/memberPage/presentation/pages/profile_screen.dart';
import 'package:etislat/feature/unpaidpage/ui/unpaid_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Approuter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.collectionScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getit<CollectionCubit>()..getallcollection(),
            child: const CollectionScreen(),
          ),
        );
      case Routes.bottomNavBAr:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getit<BottomNavBarCubit>(),
            child: const BottmNavBar(),
          ),
        );
      case Routes.memberScreen:
        final collectionModel = settings.arguments as CollectionModel;
        // final collectionid = settings.arguments as int;

        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getit<MemberCubit>()
                    ..getMemberById(collectionmodel: collectionModel),
                  child: MemberScreen(collectionModel: collectionModel),
                ));
      case Routes.ProfileScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final member = args['member'] as Member;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getit<MemberCubit>(),
                  child: ProfileScreen(
                    member: member,
                  ),
                ));
// all member paid
      case Routes.allpaidscreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getit<AllpaidCubit>(),
                child: const Allpaidscreen()));
      case Routes.unpaidscreen:
        return MaterialPageRoute(builder: (context) => const UnpaidScreen());
      default:
        return null;
    }
  }
}
