import 'package:mobx/mobx.dart';
part 'master_view_model.g.dart';

class MasterViewModel = _MasterViewModelBase with _$MasterViewModel;

abstract class _MasterViewModelBase with Store {
  @observable
  int currentPageIndex = 0;

  @action
  void onTabTapped(int index) {
    currentPageIndex = index;
  }
}
