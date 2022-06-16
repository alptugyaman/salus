import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:salus/view/home/view/home_view.dart';
import 'package:salus/view/master/viewmodel/master_view_model.dart';
import 'package:salus/view/messages/messages_page/view/messages_view.dart';

class MasterView extends StatefulWidget {
  const MasterView({Key? key}) : super(key: key);

  @override
  State<MasterView> createState() => _MasterViewState();
}

class _MasterViewState extends State<MasterView> {
  late MasterViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = MasterViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(thickness: 0.5, height: 0),
              NavigationBar(
                height: 72,
                onDestinationSelected: viewModel.onTabTapped,
                selectedIndex: viewModel.currentPageIndex,
                destinations: const <Widget>[
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    label: 'Ana Sayfa',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.message_outlined),
                    label: 'Mesajlarım',
                  ),
                ],
              ),
            ],
          ),
          body: <Widget>[
            const HomeView(),
            const MessagesView(),
          ][viewModel.currentPageIndex],
        );
      },
    );
  }
}
