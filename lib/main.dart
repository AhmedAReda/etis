import 'package:etislat/core/di/dipendency_injection.dart';
import 'package:etislat/core/routing/approuter.dart';
import 'package:etislat/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await setGetit();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Approuter approuter = Approuter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: approuter.generateRoute,
          initialRoute: Routes.bottomNavBAr),
    );
  }
}
