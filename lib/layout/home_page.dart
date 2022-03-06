import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit.dart';
import 'package:news/layout/bloc/states.dart';
import 'package:news/modules/search_screen.dart';


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
            title: Text(cubit.titles[cubit.currentIndex]),
            actions:
            [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),),);
              }, icon: const Icon(Icons.search),),
              IconButton(onPressed: (){
                cubit.changeMode();
              }, icon: const Icon(Icons.brightness_4_outlined),),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeNavBottom(index);
            },
          ),
        );
      },
    );
  }
}
