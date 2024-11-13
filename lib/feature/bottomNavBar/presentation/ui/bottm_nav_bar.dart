import 'package:etislat/core/di/dipendency_injection.dart';
import 'package:etislat/feature/bottomNavBar/presentation/bloc/bottom_nav_bar_cubit.dart';
import 'package:etislat/feature/unpaidpage/bloc/unpaid_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottmNavBar extends StatelessWidget {
  const BottmNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getit<UnpaidCubit>()..getAllMemberunPaid(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xffCCCCCC),
            bottomNavigationBar: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: Container(
                margin: EdgeInsets.only(right: 5.w, left: 5.w, bottom: 8.h),
                // margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 30,
                        offset: const Offset(8, 20))
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                    backgroundColor: Colors.white,
                    selectedItemColor: const Color(0xffFE0000),
                    unselectedItemColor: Color.fromARGB(255, 117, 116, 116),
                    currentIndex:
                        context.read<BottomNavBarCubit>().navigatorValue,
                    onTap: (value) {
                     context.read<BottomNavBarCubit>().playAudio();
                      context
                          .read<BottomNavBarCubit>()
                          .changeSelectedvalue(value);
                     },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.settings,
                            size: 29,
                          ),
                          label: "اعدادات"),
                      BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.users,
                          size: 29,
                        ),
                        label: "المجموعات",
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(
                            FontAwesomeIcons.check,
                            size: 29,
                          ),
                          label: "تم الدفع"),
                      BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.xmark,
                          size: 29,
                        ),
                        label: "لم يدفع",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: context.read<BottomNavBarCubit>().currentscreen,
          );
        },
      ),
    );
  }
}
