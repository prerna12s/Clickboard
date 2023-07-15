import 'package:flutter/material.dart';
import 'package:jgec_notice/src/common_widgets/my_app_bar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'Settings'),
      body: const Column(
        children: [],
      ),
    );
  }
}
