import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import '../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }


  bool isDark = false;

  void changeAppMode({bool? dark}) {
    if (dark != null) {
      isDark = dark;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putDate(key: 'isDark', value: isDark);
      emit(AppChangeModeState());
    }
  }
}
