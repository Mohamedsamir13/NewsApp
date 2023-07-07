import 'package:flutter/material.dart';
import 'package:newsapp/shared/theme/app_color.dart';

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.text,
   required this.size ,
   required this.fontWeight,
     this.color,
    
  }) : super(key: key);
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
fontSize: size,
fontWeight: fontWeight,
          color: color
)
    );
  }
}
