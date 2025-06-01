import 'package:flutter/material.dart';
import 'package:clean_arch/features/home/presentation/widgets/float_button/components/add_floating_dialog.dart';

class HomeFloating extends StatelessWidget {
  const HomeFloating({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.playlist_add_rounded),
      onPressed:
          () => showDialog(
            context: context,
            builder: (context) => AddFloatingDialog(),
          ),
    );
  }
}
