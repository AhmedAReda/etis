import 'package:audioplayers/audioplayers.dart';
import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Define the callback type
typedef MemberPaidCallback = Future<void> Function(bool? paid);

class MemberWidgetTest extends StatefulWidget {
  const MemberWidgetTest(
      {super.key,
      required this.memberModel,
      required this.onMemberPaid,
      required this.phone,
      required this.whats,
      this.goToCollection,
      this.color,
      this.phonecolor,
      this.smscolor,
      this.namecolor,
      this.checkcolor});

  final Member memberModel;
  final MemberPaidCallback onMemberPaid;
  final void Function()? phone;
  final void Function()? whats;
  final void Function()? goToCollection;
  final Color? color;
  final Color? phonecolor;
  final Color? checkcolor;
  final Color? namecolor;
  final Color? smscolor;

  @override
  _MemberWidgetState createState() => _MemberWidgetState();
}

class _MemberWidgetState extends State<MemberWidgetTest> {
  bool? _isPaid;

  @override
  void initState() {
    super.initState();
    _isPaid = widget.memberModel.paid;
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playAudio() async {
    await _audioPlayer.play(AssetSource('audio.mp3')); // Play audio from assets
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color ?? Colors.white,
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                    color:
                        widget.memberModel.note != null ? Colors.yellow : null,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  widget.memberModel.name,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: widget.memberModel.note != null
                          ? Colors.black
                          : widget.namecolor??
                          Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Checkbox(
                activeColor: widget.checkcolor ?? Colors.black,
                checkColor: Colors.white,
                value: _isPaid,
                onChanged: (value) async {
                  await playAudio();
                  setState(() {
                    _isPaid = value;
                  });
                  await widget.onMemberPaid(value);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: widget.phone,
                    icon: Icon(
                      Icons.phone,
                      color: widget.phonecolor ??
                          Color.fromARGB(255, 22, 105, 173),
                      size: 25,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  IconButton(
                    onPressed: widget.whats,
                    icon: Icon(
                      Icons.message,
                      color: widget.smscolor ?? Color.fromARGB(255, 4, 107, 7),
                      size: 25,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      widget.memberModel.money,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          decoration:
                              TextDecoration.underline), // Underline text
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  InkWell(
                    onTap: () {
                      if (widget.goToCollection != null) {
                        widget.goToCollection!();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffFE0000),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        widget.memberModel.collectionName,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            decoration:
                                TextDecoration.underline), // Underline text
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
/////
        ],
      ),
    );
  }
}
