import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salus/config/global.dart';
import 'package:salus/view/auth/splash/viewmodel/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashViewModel viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel();
  }

  void _viewModel() {
    viewModel = SplashViewModel();
    viewModel.route();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFCF9F4),
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(maxWidth: .5.sw),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Global.imageService.splash),
          ),
        ),
      ),
    );
  }
}
