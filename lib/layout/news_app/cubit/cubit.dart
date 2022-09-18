import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';


import '../../../modules/news_app/business/business_screen.dart';
import '../../../modules/news_app/science/science_screen.dart';
import '../../../modules/news_app/sports/sports_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center_outlined),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_esports_outlined),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: '/v2/top-headlines',
      query: {
        'apiKey': '6b1ac04e0add48319ae1850c99891632',
        'country': 'eg',
        'category': 'business',
      },
    ).then((value) {
      business = value?.data['articles'];
      print(business[0]['publishedAt']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: '/v2/top-headlines',
      query: {
        'apiKey': '6b1ac04e0add48319ae1850c99891632',
        'country': 'eg',
        'category': 'sports',
      },
    ).then((value) {
      sports = value?.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: '/v2/top-headlines',
      query: {
        'apiKey': '6b1ac04e0add48319ae1850c99891632',
        'country': 'eg',
        'category': 'science',
      },
    ).then((value) {
      science = value?.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: '/v2/everything',
      query: {
        'apiKey': '6b1ac04e0add48319ae1850c99891632',
        'q': value,
      },
    ).then((value) {
      search = value!.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error));
    });
  }
}
