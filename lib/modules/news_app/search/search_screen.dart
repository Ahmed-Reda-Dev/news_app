import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';

import '../../../layout/news_app/cubit/cubit.dart';
import '../../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  label: 'Search',
                  prefix: Icons.search_rounded,
                  radius: 25.0,
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(child: articleBuilder(list, context, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
