import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/memberPage/presentation/widget/member_widget/all_member_widget.dart';
import 'package:etislat/feature/memberPage/presentation/widget/member_widget/floating_button_member_widget.dart';
import 'package:etislat/feature/memberPage/presentation/widget/member_widget/member_name_widget.dart';
import 'package:etislat/feature/memberPage/presentation/widget/member_widget/search_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key, required this.collectionModel});
   final CollectionModel collectionModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: Color(0xffCCCCCC),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton:
            FloatingButtonMemberWidget(collectionModel: collectionModel),
        body: Container(
            padding: EdgeInsets.only(top: 20.h, right: 6.w, left: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MemberNameWidget(
                    collectionname: collectionModel.collectionname),
                SizedBox(height: 5.h),
                const SearchMemberWidget(),
                AllMemberWidget(
                  collectionModel: collectionModel,
                )
              ],
            )),
      ),
    );
  }
}
