import 'package:clean_arch/features/home/presentation/provider/home_provider.dart';
import 'package:clean_arch/features/home/presentation/widgets/app_bar/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clean_arch/features/home/presentation/widgets/float_button/home_floating.dart';
import 'package:clean_arch/features/home/presentation/widgets/body/home_body.dart';
import 'package:clean_arch/core/utils/theme.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeState(),
      child: MaterialApp(
        theme: appTheme,
        home: Scaffold(
          appBar: HomeAppBar(),
          body: HomeBody(),
          floatingActionButton: HomeFloating(),
        ),
      ),
    );
  }
}
