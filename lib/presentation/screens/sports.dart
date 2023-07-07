import 'package:flutter/material.dart';
import 'package:newsapp/presentation/components/NewList.dart';
import 'package:newsapp/shared/Ui/AppText.dart';
import 'package:newsapp/shared/theme/app_color.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  NewsList(type: NewsTypes.sports );
  }
}
