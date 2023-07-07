import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/controller/Cubits.dart';
import 'package:newsapp/controller/States.dart';
import 'package:newsapp/presentation/screens/business.dart';
import 'package:newsapp/presentation/screens/science.dart';
import 'package:newsapp/presentation/screens/sports.dart';
import 'package:newsapp/shared/Ui/AppText.dart';
import 'package:newsapp/shared/theme/app_color.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({Key? key}) : super(key: key);
  final PageController controller = PageController();
  List<Widget> pages = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
      builder: (context, state) {
        final cubit = AppCubit.i(context);

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.deepPurple),
            title: const AppText(
                size: 25,
                fontWeight: FontWeight.bold,
                text: "NewsApp",
                color: AppColors.AppWhite),
            backgroundColor: Colors.deepPurple,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {
                AppCubit.i(context).handleMode();
              }, icon: const Icon(Icons.dark_mode_outlined))
            ],
          ),
          body: PageView(
            onPageChanged: (int value) {
              cubit.ChangeIndex(value);
            },
            controller: controller,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: "Business"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: "Science"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: "Sports")
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.ChangeIndex(index);
              controller.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linearToEaseOut);
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
