import 'package:clean_arch/features/home/data/models/task_model.dart';
import 'package:clean_arch/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clean_arch/features/home/presentation/widgets/body/components/body_card.dart';
import 'package:clean_arch/core/styles/style.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeState homeState = context.watch<HomeState>();
    return FutureBuilder(
      future: homeState.dataBaseService.getTasks(),
      builder:
        (context, snapshot) =>
          (snapshot.data?.length != 0)
              ? ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final TaskModel task = snapshot.data![index];
                  return BodyCard(task: task);
                },
              )
              : Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text('Empty..', style: textEmpty),
                  ),
                ),
              ),
    );
  }
}
