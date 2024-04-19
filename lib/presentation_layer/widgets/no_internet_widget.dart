import 'package:flutter/material.dart';
import 'package:series_app/constans/colors.dart';

class BuildNoInternetWidget extends StatelessWidget {
  const BuildNoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text( 'Can`t Connect ... check Internet' , style: TextStyle(
               fontSize: 22,
              color: AppColors.secondryColor,
            ),
            ),
             Image(image: AssetImage('assets/images/Nointernet.png'))
          ],
        ),
      ),
    );
  }
}
