import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salus/config/global.dart';
import 'package:salus/core/components/circle_avatar/circle_avatar.dart';
import 'package:salus/core/components/container/chip.dart';
import 'package:salus/core/components/container/message_label.dart';
import 'package:salus/core/components/container/online.dart';
import 'package:salus/core/components/text/message_short.dart';
import 'package:salus/core/components/text/number.dart';
import 'package:salus/core/components/text/time_in_column.dart';
import 'package:salus/core/constant/navigation/navigation_constants.dart';
import 'package:salus/core/theme/color_theme.dart';
import 'package:salus/view/messages/client/model/client_model.dart';

class Clients extends StatelessWidget {
  const Clients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Client>>(
      stream: Global.firebaseManager.getClientList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Hata');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.requireData;
        List<Client> _client = data.docs.map((e) {
          return Client.fromQuery(e);
        }).toList();

        if (_client.isNotEmpty) return _clientList(_client);
        return const Center(child: Text('Danışan Yok'));
      },
    );
  }

  ListView _clientList(List<Client> _client) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _client.length,
      separatorBuilder: (context, index) => _divider(),
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Global.navigationService.push(
              path: NavigationConstants.MESSAGE_DETAIL_VIEW,
              object: _client[index],
            );
          },
          leading: _leading(_client, index),
          title: _title(_client, index),
          subtitle: _subtitle(_client, index),
          trailing: _trailing(_client, index),
        );
      },
    );
  }

  Divider _divider() {
    return const Divider(
      color: AppColors.neutral200,
      height: 1,
      thickness: 1,
    );
  }

  Stack _leading(List<Client> _client, int index) {
    return Stack(
      children: [
        Avatar(
          capitals: _client[index].capitals,
          imageUrl: _client[index].imageUrl,
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: Online(status: _client[index].online),
        )
      ],
    );
  }

  Row _title(List<Client> _client, int index) {
    return Row(
      children: [
        HashtagNumber(text: _client[index].hashNumber!),
        SizedBox(width: 4),
        MessageLabel(state: Client.getState(_client[index].messageState)),
      ],
    );
  }

  MessageShort _subtitle(List<Client> _client, int index) {
    return MessageShort(
      read: _client[index].read,
      text: _client[index].lastMessage,
    );
  }

  Column _trailing(List<Client> _client, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _client[index].time != null
            ? TimeList(time: _client[index].time!)
            : SizedBox(),
        const SizedBox(height: 8),
        (_client[index].count ?? 0) != 0
            ? MessageChip(count: _client[index].count!)
            : SizedBox()
      ],
    );
  }
}
