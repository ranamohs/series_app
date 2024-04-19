
import 'package:flutter/material.dart';
import 'package:series_app/constans/colors.dart';

class BuildDivider extends StatelessWidget {
   BuildDivider({super.key , required this.endIndent});

  double endIndent ;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      color: AppColors.primaryColor,
      endIndent: endIndent,
      thickness: 2,

    );
  }
}
