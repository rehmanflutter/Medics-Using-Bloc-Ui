import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_bloc/Chat/presenter/chat_bloc.dart';
import 'package:medical_bloc/Chat/presenter/chat_event.dart';
import 'package:medical_bloc/Chat/presenter/chat_stat.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatHistory extends StatelessWidget {
  const ChatHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            7.h.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textcustam(
                  text: 'Message',
                  size: 25,
                  weight: FontWeight.w700,
                ),
                SvgPicture.asset(Images.Search)
              ],
            ),
            3.h.height,
            FadeInRight(
              child: Container(
                  height: 7.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffE8F3F1)),
                  child: BlocBuilder<ChatBloc, ChatStats>(
                    buildWhen: (previous, current) =>
                        previous.indexselect != current.indexselect,
                    builder: (context, state) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ChatBloc>()
                                .add(UpdatateInteger(indexNo: 0));
                          },
                          child: Container(
                            height: 7.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: state.indexselect == 0
                                    ? appcolour
                                    : Colors.transparent),
                            child: Center(
                              child: Textcustam(
                                  text: 'All',
                                  weight: FontWeight.w600,
                                  col: state.indexselect == 0
                                      ? whiteColour
                                      : Color(0xff101623)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ChatBloc>()
                                .add(UpdatateInteger(indexNo: 1));
                          },
                          child: Container(
                            height: 7.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: state.indexselect == 1
                                    ? appcolour
                                    : Colors.transparent),
                            child: Center(
                              child: Textcustam(
                                  text: 'Group',
                                  weight: FontWeight.w600,
                                  col: state.indexselect == 1
                                      ? whiteColour
                                      : Color(0xff101623)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ChatBloc>()
                                .add(UpdatateInteger(indexNo: 2));
                          },
                          child: Container(
                            height: 7.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: state.indexselect == 2
                                    ? appcolour
                                    : Colors.transparent),
                            child: Center(
                              child: Textcustam(
                                text: 'Private',
                                weight: FontWeight.w600,
                                col: state.indexselect == 2
                                    ? whiteColour
                                    : Color(0xff101623),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            3.h.height,
            BlocBuilder<ChatBloc, ChatStats>(
              buildWhen: (previous, current) =>
                  previous.chatuser != current.chatuser,
              builder: (context, state) => Expanded(
                child: FadeInUp(
                  child: ListView.builder(
                    //  reverse: state.indexselect == 0 ? true : false,

                    itemCount: state.chatuser.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(bottom: 10),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage(state.chatuser[index].pick),
                        ),
                        title: Textcustam(
                          text: state.chatuser[index].Name,
                          size: 16,
                          weight: FontWeight.w600,
                        ),
                        subtitle: Textcustam(
                          text: state.chatuser[index].message,
                          size: 12,
                          col: Colors.grey,
                        ),
                        trailing: Column(
                          children: [
                            Textcustam(
                              text: state.chatuser[index].time,
                              size: 12,
                              col: Color(0xff555555),
                            ),
                            const Icon(
                              Icons.done_all,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FadeInLeft(
        child: CircleAvatar(
          radius: 30,
          backgroundColor: appcolour,
          child: SvgPicture.asset(
            Images.Chat,
          ),
        ),
      ),
    );
  }
}
