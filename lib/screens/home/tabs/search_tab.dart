import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/cubit/search/search_cubit.dart';
import 'package:movie_app/cubit/search/search_states.dart';

import 'package:movie_app/screens/home/widgets/search_item.dart';
import 'package:movie_app/screens/home/widgets/textformfield_widget.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16),
      child: Column(
        children: [
          TextformfieldWidget(
            controller: searchController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                SearchCubit.get(context).movieSearch(value);
              }
            },
          ),
          SizedBox(
            height: 40.h,
          ),
          // item with divider
          Expanded(
            child: BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                if (state is SearchLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchSuccessState) {
                  final results = state.searchModel.results;
                  if (results == null || results.isEmpty) {
                    return const Center(child: Text('No results found'));
                  }
                  return ListView.separated(
                    itemCount: results.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return SearchItem(results: results[index]);
                    },
                  );
                } else if (state is SearchErrorState) {
                  return Center(child: Text("ererro"));
                } else {
                  return const Center(child: Text('Start typing to search'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
