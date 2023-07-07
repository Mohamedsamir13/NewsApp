
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/controller/Cubits.dart';
import 'package:newsapp/controller/States.dart';
import 'package:newsapp/presentation/screens/layout_screen.dart';
import 'package:newsapp/shared/Network/diohelper.dart';
import 'package:newsapp/shared/theme/theme_mode.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
       child: BlocBuilder<AppCubit,Appstates>(
         builder:(context, state) =>           MaterialApp(
             title: 'Flutter Demo',
             theme: AppTheme.lightTheme,
             darkTheme: AppTheme.darkTheme,
             themeMode: AppCubit.i(context).mode,

             home: LayoutScreen()
         ),

       ),
    );
  }
}
