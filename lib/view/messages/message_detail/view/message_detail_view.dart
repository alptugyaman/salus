import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salus/config/global.dart';
import 'package:salus/core/components/circle_avatar/circle_avatar.dart';
import 'package:salus/core/components/container/chat_date.dart';
import 'package:salus/core/components/container/message.dart';
import 'package:salus/core/components/container/message_label.dart';
import 'package:salus/core/components/row/status.dart';
import 'package:salus/core/components/text/number.dart';
import 'package:salus/core/components/container/time_solo.dart';
import 'package:salus/core/components/text_field/comment_field.dart';
import 'package:salus/core/theme/color_theme.dart';
import 'package:salus/core/components/appbars/appbar.dart';
import 'package:salus/core/components/container/bottom_container.dart';
import 'package:salus/core/utils/date_calculation.dart';
import 'package:salus/view/messages/client/model/client_model.dart';

import 'package:salus/view/messages/message_detail/model/message_model.dart';

class MessageDetailView extends StatefulWidget {
  final Client client;

  const MessageDetailView({Key? key, required this.client}) : super(key: key);

  @override
  State<MessageDetailView> createState() => _MessageDetailViewState();
}

class _MessageDetailViewState extends State<MessageDetailView> {
  TextEditingController _controller = TextEditingController();
  final ScrollController _scontroller = ScrollController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // * after initialize jump
    Future.delayed(Duration(seconds: 1), () => _scrollDown());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // * Jump to the last msg
  void _scrollDown() {
    _scontroller.jumpTo(_scontroller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MessageAppBar(),
      body: _body(),
      bottomNavigationBar: _commentArea(context),
    );
  }

  CustomScrollView _body() {
    return CustomScrollView(
      controller: _scontroller,
      slivers: [_bottomAppBar(), _streamData()],
    );
  }

  SliverAppBar _bottomAppBar() {
    return SliverAppBar(
      expandedHeight: 72,
      toolbarHeight: 72,
      automaticallyImplyLeading: false,
      pinned: true,
      forceElevated: true,
      primary: true,
      flexibleSpace: FlexibleSpaceBar(
        background: BottomContainer(
          color: AppColors.neutral100,
          child: ListTile(
            leading: Avatar(
              capitals: widget.client.capitals,
              imageUrl: widget.client.imageUrl,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HashtagNumber(text: widget.client.hashNumber!),
                MessageLabel(
                  state: Client.getState(widget.client.messageState),
                ),
              ],
            ),
            subtitle: Status(status: widget.client.online),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _streamData() {
    return SliverToBoxAdapter(
      child: StreamBuilder<QuerySnapshot<MessageModel>>(
        stream: Global.firebaseManager.getUsersMessages(
          widget.client.hashNumber!,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SizedBox(
              height: .35.sh,
              child: Center(child: const Text('Hata.')),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: .35.sh,
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          final data = snapshot.requireData;
          List<MessageModel> _message = data.docs.map((e) {
            return MessageModel.fromQuery(e);
          }).toList();

          if (_message.isNotEmpty) return _messages(_message);

          return SizedBox(
            height: .35.sh,
            child: const Center(child: Text('Mesaj yok.')),
          );
        },
      ),
    );
  }

  ListView _messages(List<MessageModel> message) {
    return ListView.builder(
      itemCount: message.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index == 0)
              ChatDate(
                date: DateCalculation.howLongDate(
                  message[message.length - 1].sendTime!,
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Message(
                text: message[index].message!,
                sender: message[index].from == dotenv.env['FROM'],
              ),
            ),
            TimeSolo(
                time: DateCalculation.getHour(message[index].sendTime!)!,
                sender: message[index].from == dotenv.env['FROM']),
          ],
        );
      },
    );
  }

  Padding _commentArea(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        color: AppColors.neutral200,
        padding: EdgeInsets.all(0.0125.sw),
        child: Form(
          key: key,
          child: CommentField(
            controller: _controller,
            // * from professionals
            onLeftPressed: widget.client.hashNumber == '#941658722'
                ? () {
                    if (key.currentState!.validate()) {
                      Global.firebaseManager
                          .addMessageLeft(_controller.text)
                          .then((_) {
                        _controller.clear();
                        _scrollDown();
                      });
                    }
                  }
                : null,
            // * from clients
            onRightPressed: () {
              if (key.currentState!.validate()) {
                Global.firebaseManager
                    .addMessage(_controller.text, widget.client.hashNumber!)
                    .then((_) {
                  _controller.clear();
                  _scrollDown();
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
