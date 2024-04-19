
import 'package:flutter/material.dart';
import 'package:series_app/constans/colors.dart';

class CharacterInfo extends StatelessWidget {
   CharacterInfo({super.key , required this.title,required this.value  });

  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(text: title,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),),
            TextSpan(text: value,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
              ),),
          ],
        ),);
  }
}
