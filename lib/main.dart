import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/shared/components/bloc_observe.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes/themes.dart';


import 'layout/news_app/cubit/cubit.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
      bool? isDark = CacheHelper.getData(key: 'isDark');
      runApp(MyApp(
        isDark: isDark ?? true,
      ));
}

// Stateless
// Stateful

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.isDark,
  }) : super(key: key);
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              dark: isDark,
            ),
        ),
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode:
          AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
          //themeMode: ThemeMode.dark,
          home: const NewsLayout(),
        ),
      ),
    );
  }
}
