import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit.dart';
import 'package:news/layout/bloc/states.dart';
import 'package:news/shred/components/componant.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../shared/components/component.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;

        return ScreenTypeLayout(
          mobile: Builder(
            builder: (context) {
              NewsCubit.get(context).changePlatform(false);
              return buildNewsScreen(list, context);
            },
          ),
          desktop: Builder(
            builder: (context) {
              NewsCubit.get(context).changePlatform(true);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: buildNewsScreen(list, context)),
                  if (list.isNotEmpty)
                    Expanded(child: Container(
                      height: double.infinity,
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                                height: 300,
                                child: Image.network('${list[NewsCubit.get(context).selectedItemIndex]['urlToImage']}', fit: BoxFit.fill,)),
                            const SizedBox( height: 30, ) ,
                            Text('${list[NewsCubit.get(context).selectedItemIndex]['description']}'),
                          ],
                        ),
                      ),
                    )),
                ],
              );
            },
          ),
          breakpoints: const ScreenBreakpoints(
            desktop: 800,
            tablet: 500,
            watch: 100,
          ),
        );
      },
    );
  }
}
