import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/cubit/search/search_cubit.dart';
import 'package:movie_app/cubit/search/search_states.dart';
import 'package:movie_app/repo/search/search_remote_repo.dart';
import 'package:movie_app/screens/home/widgets/search_item.dart';
import 'package:movie_app/screens/home/widgets/textformfield_widget.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRemoteRepo()),
      child: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
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
                SizedBox(height: 40.h),
                Expanded(
                  child: (SearchCubit.get(context)
                              .searchModel
                              ?.results
                              ?.isEmpty ??
                          true)
                      ? Image.asset("assets/images/no_movies_found.png")
                      : ListView.separated(
                          itemCount: SearchCubit.get(context)
                                  .searchModel
                                  ?.results
                                  ?.length ??
                              0,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            return SearchItem(
                                results: SearchCubit.get(context)
                                    .searchModel!
                                    .results![index]);
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
