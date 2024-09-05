import 'package:flutter/material.dart';
import 'package:movie_app/core/strings/images.dart';
import 'package:movie_app/core/theming/styles.dart';
import 'package:movie_app/models/geners_model.dart';
import 'package:movie_app/screens/filter_movies/category_movies.dart';

class BrowseItem extends StatelessWidget {
  final Genres genres;
  //Function onClicked;
  BrowseItem({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CategoryMovies.routeName,
            arguments: genres.id);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(MyImages.browse_image),
          SizedBox(
            child: Text(
              genres.name ?? "",
              style: TextStyles.font16white400Weight,
            ),
          )
        ],
      ),
    );
  }
}
