import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/news_app/search/search_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'EGY-News',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: const Icon(Icons.search_sharp),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeAppMode();
                  NewsCubit.get(context).getBusiness();
                  NewsCubit.get(context).getScience();
                  NewsCubit.get(context).getSports();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
