import 'package:flutter/material.dart';
import 'package:series_app/constans/colors.dart';
import 'package:series_app/constans/strings.dart';
import 'package:series_app/data_layer/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Results character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(context, characterDetailsScreen ,arguments: character),
        child: GridTile(
            footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text('${character.name}',style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold
            ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
            child: Hero(
              tag: character.id!,
              child: Container(
                        color: AppColors.secondryColor,
                        child: character.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
              width: double.infinity,
                    height: double.infinity,
                    placeholder: 'assets/images/loading_image.gif',
                    image: character.image!,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/wallepaper.jpg'),
                      ),
            ),
        ),
      ),
    );
  }
}
