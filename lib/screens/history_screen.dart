import 'package:flutter/material.dart';
import 'package:finlog/widgets/navs/custom_bottom_navigation_bar.dart';
import 'package:finlog/widgets/headers/custom_app_bar.dart';


class HistoryScreen extends StatelessWidget{
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: const [
          Text('History Screen Content'),
        ],
      ),
    );
  }
}