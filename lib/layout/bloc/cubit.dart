import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/states.dart';
import 'package:news/models/news_model.dart';
import 'package:news/modules/business.dart';
import 'package:news/modules/science.dart';
import 'package:news/modules/sports.dart';
import 'package:news/shred/network/local/shared_pref.dart';
import 'package:news/shred/network/remote/dio.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<String> titles = [
    'Business',
    'Science',
    'Sports',
  ];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
  ];

  List<Widget> screens = const [
    BusinessPage(),
    SciencePage(),
    SportsPage(),
  ];

  int currentIndex = 0;

  void changeNavBottom(int index) {
    currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  int selectedItemIndex = 0;
  bool isDesktop = false;

  void changeSelectedItem(int index) {
    selectedItemIndex = index;
    emit(ChangeSelectedItemState());
  }

  void changePlatform(bool value) {
    isDesktop = value;
    emit(ChangePlatformValueState());
  }

  // List<Article> articles = [];

  void getBusiness() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'aa565603ab594eac968d86565d6e90e8',
      },
    ).then((value) {

      business = value.data['articles'];


      // value.data.forEach((article){
      //   articles.add(Article.fromJson(article));
      // });
      emit(GetBusinessSuccessState());
    }).catchError((error) {
      emit(GetBusinessErrorState(error.toString()));
    });
  }

  void getScience() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'aa565603ab594eac968d86565d6e90e8',
      },
    ).then((value) {
      science = value.data['articles'];
      emit(GetScienceSuccessState());
    }).catchError((error) {
      emit(GetScienceErrorState(error.toString()));
    });
  }

  void getSports() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'aa565603ab594eac968d86565d6e90e8',
      },
    ).then((value) {
      sports = value.data['articles'];
      emit(GetSportsSuccessState());
    }).catchError((error) {
      emit(GetSportsErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void changeMode({
    bool? fromShared,
  }) {
    // to get th current value from shared perf
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      // set the new value then cache it
      isDark = !isDark;
      CacheHelper.setValue(key: 'isDark', value: isDark).then((value) {
        emit(ChangeModeState());
      });
    }
  }

  List<dynamic> search = [];

  void getSearch({
  required String value,
}) {
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': 'aa565603ab594eac968d86565d6e90e8',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(GetSearchSuccessState());
    }).catchError((error) {
      emit(GetSearchErrorState(error.toString()));
    });
  }

}
