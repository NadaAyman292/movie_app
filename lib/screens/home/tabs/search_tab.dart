import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app/screens/home/widgets/search_item.dart';
import 'package:movie_app/screens/home/widgets/textformfield_widget.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16),
      child: Column(
        children: [
          const TextformfieldWidget(),
          SizedBox(
            height: 40.h,
          ),
          // item with divider
          const SearchItem()
        ],
      ),
    );
  }
}
