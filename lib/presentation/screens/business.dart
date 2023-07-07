import 'package:flutter/material.dart';
import 'package:newsapp/presentation/components/NewList.dart';
class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  NewsList(type: NewsTypes.business,);
  }
}
