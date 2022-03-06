import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit.dart';
import 'package:news/layout/bloc/states.dart';
import 'package:news/shred/components/componant.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state){

        var list = NewsCubit.get(context).sports;

        return BuildCondition(
          condition: list.isNotEmpty,
          builder: (context) => Scaffold(
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => articleView(list[index], context),
              separatorBuilder: (context, index) => separator(),
              itemCount: list.length,
            ),
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

