import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit.dart';
import 'package:news/layout/bloc/states.dart';
import 'package:news/modules/search_screen.dart';
import 'package:news/shared/components/component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex].toUpperCase()),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, const SearchScreen(),);
                },
                icon: Icon(
                  Icons.search,
                  color: cubit.isDark ? Colors.black : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                  color: cubit.isDark ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: NewsCubit.get(context).items,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeNavBottom(index);
            },
          ),
        );
      },
    );
  }
}
