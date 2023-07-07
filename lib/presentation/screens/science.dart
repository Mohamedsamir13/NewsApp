import 'package:flutter/material.dart';
import 'package:newsapp/presentation/components/NewList.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  NewsList(type: NewsTypes.science,);
  }
}
