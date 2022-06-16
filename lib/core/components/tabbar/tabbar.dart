// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:salus/core/theme/color_theme.dart';

class MessageTabbar extends StatelessWidget {
  final List<String> tab;
  final TabController tabController;
  int? cachedFromIdx;
  int? cachedToIdx;

  MessageTabbar({
    Key? key,
    required this.tab,
    required this.tabController,
    this.cachedFromIdx,
    this.cachedToIdx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: tab.asMap().entries.map((entry) {
        return _animatedBuilder(entry);
      }).toList(),
      physics: const ClampingScrollPhysics(),
      labelPadding: EdgeInsets.symmetric(horizontal: 4),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  AnimatedBuilder _animatedBuilder(MapEntry<int, String> entry) {
    return AnimatedBuilder(
      animation: tabController.animation!,
      builder: (_, __) {
        final forward = tabController.offset > 0;
        final backward = tabController.offset < 0;
        int _fromIndex;
        int _toIndex;
        double progress;
        if (tabController.indexIsChanging) {
          _fromIndex = tabController.previousIndex;
          _toIndex = tabController.index;
          cachedFromIdx = tabController.previousIndex;
          cachedToIdx = tabController.index;
          progress = (tabController.animation!.value - _fromIndex).abs() /
              (_toIndex - _fromIndex).abs();
        } else {
          if (cachedFromIdx == tabController.previousIndex &&
              cachedToIdx == tabController.index) {
            _fromIndex = cachedFromIdx!;
            _toIndex = cachedToIdx!;
            progress = 1;
            cachedToIdx = 0;
            cachedFromIdx = 0;
          } else {
            cachedToIdx = 0;
            cachedFromIdx = 0;
            _fromIndex = tabController.index;
            _toIndex = forward
                ? _fromIndex + 1
                : backward
                    ? _fromIndex - 1
                    : _fromIndex;
            progress = (tabController.animation!.value - _fromIndex).abs();
          }
        }

        return _customIndicator(entry, _fromIndex, progress, _toIndex);
      },
    );
  }

  Container _customIndicator(MapEntry<int, String> entry, int _fromIndex,
      double progress, int _toIndex) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: entry.key == _fromIndex
            ? Color.lerp(AppColors.secondaryMain, Colors.white, progress)
            : entry.key == _toIndex
                ? Color.lerp(Colors.white, AppColors.secondaryMain, progress)
                : Color.lerp(Colors.white, Colors.white, progress),
      ),
      child: Text(
        entry.value,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
      ),
    );
  }
}
