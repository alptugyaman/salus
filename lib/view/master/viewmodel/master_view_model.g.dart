// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MasterViewModel on _MasterViewModelBase, Store {
  late final _$currentPageIndexAtom =
      Atom(name: '_MasterViewModelBase.currentPageIndex', context: context);

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  late final _$_MasterViewModelBaseActionController =
      ActionController(name: '_MasterViewModelBase', context: context);

  @override
  void onTabTapped(int index) {
    final _$actionInfo = _$_MasterViewModelBaseActionController.startAction(
        name: '_MasterViewModelBase.onTabTapped');
    try {
      return super.onTabTapped(index);
    } finally {
      _$_MasterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPageIndex: ${currentPageIndex}
    ''';
  }
}
