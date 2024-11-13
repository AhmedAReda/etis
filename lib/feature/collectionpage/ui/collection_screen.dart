import 'package:etislat/feature/collectionpage/ui/widget/collection_name_widget.dart';
import 'package:etislat/feature/collectionpage/ui/widget/collectios_widget.dart';
import 'package:etislat/feature/collectionpage/ui/widget/floating_button_widget.dart';
import 'package:etislat/feature/collectionpage/ui/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffCCCCCC),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingButtonWidget(),
         body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const CollectionNameWidget(),
                SizedBox(height: 10.h),
                const SearchWidget(),
                SizedBox(height: 10.h),
                const CollectiosWidget(),
              ],
            )),
      ),
    );
  }
}
