import 'package:flutter/material.dart';

import 'package:salus/core/components/appbars/appbar.dart';
import 'package:salus/core/components/container/bottom_container.dart';
import 'package:salus/core/components/tabbar/tabbar.dart';
import 'package:salus/view/messages/client/view/client_view.dart';
import 'package:salus/view/messages/professionals/view/professionals_view.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int? _cachedFromIdx;
  int? _cachedToIdx;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MessageAppBar(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //* for elevation
            Material(
              elevation: .5,
              //* for tabbars bg decoration
              child: BottomContainer(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                //* custom tabbar
                child: MessageTabbar(
                  tabController: _tabController,
                  tab: ['Danışanlar', 'Profesyoneller'],
                  cachedFromIdx: _cachedFromIdx,
                  cachedToIdx: _cachedToIdx,
                ),
              ),
            ),
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Clients(),
                  Professionals(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
