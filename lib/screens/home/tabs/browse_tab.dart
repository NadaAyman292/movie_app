import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/cubit/genres/genres_cubit.dart';
import 'package:movie_app/cubit/genres/genres_states.dart';
import 'package:movie_app/repo/genres/genres_remote_repo.dart';
import 'package:movie_app/screens/home/widgets/browse_item.dart';

class BrowseTab extends StatelessWidget {
  BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor,
      ),
      body: BlocProvider(
          create: (context) =>
              GenresCubit(GenresRemoteRepo())..getGenresMovies(),
          child:
              BlocBuilder<GenresCubit, GenresStates>(builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Browse Category ",
                    style: TextStyles.font22white400Weight,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.3),
                        itemCount:
                            GenresCubit.get(context).model?.genres?.length ?? 0,
                        itemBuilder: (context, index) {
                          return BrowseItem(
                            genres:
                                GenresCubit.get(context).model!.genres![index],
                          );
                        }),
                  )
                ],
              ),
            );
          })),
    );
  }
}
