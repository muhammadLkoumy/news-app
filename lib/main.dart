import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit.dart';
import 'package:news/layout/bloc/states.dart';
import 'package:news/layout/home_page.dart';
import 'package:news/shred/network/local/shared_pref.dart';
import 'package:news/shred/network/remote/dio.dart';
import 'package:news/shred/styles/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // if(Platform.isAndroid) {
  //   await DesktopWindow.setMaxWindowSize(const Size(300,600));
  // }

  DioHelper.init();
  await CacheHelper.init();

  var isDark = CacheHelper.getValue(key: 'isDark') ?? true;
  print(isDark);

  runApp(News(isDark));
}

class News extends StatelessWidget {

  final bool fromShared;

  const News(this.fromShared, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()..getBusiness()..getScience()..getSports()..changeMode(fromShared: fromShared),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, tate){},
        builder: (context, tate){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light(),
            darkTheme: dark(),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            home: const HomePage(),
            );
        },
      ),
    );
  }
}
