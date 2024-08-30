import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.font14white400Weight,
      cursorColor: Colors.green,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.r),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.r),
              borderSide: BorderSide(color: Colors.white)),
          hintText: "Search",
          hintStyle: TextStyles.font14white400Weight,
          filled: true,
          fillColor: MyColor.darkGreyColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.r),
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
