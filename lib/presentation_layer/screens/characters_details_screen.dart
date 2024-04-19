import 'package:flutter/material.dart';
import 'package:series_app/constans/colors.dart';
import 'package:series_app/data_layer/models/characters.dart';
import 'package:series_app/presentation_layer/widgets/character_info.dart';
import 'package:series_app/presentation_layer/widgets/defult_divider.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Results character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondryColor,
      body: CustomScrollView(
        slivers: [
          BuildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterInfo(title: 'Gender : ', value:  '  ${character.gender}'),
                    BuildDivider(endIndent: 330,),
                    CharacterInfo(title: 'status : ', value: '  ${character.status}'),
                    BuildDivider(endIndent: 250),
                    CharacterInfo(title: 'species : ', value: ' ${character.species}'),
                    BuildDivider(endIndent: 280),
                    CharacterInfo(title: 'origin : ', value: ' ${character.origin?.name}'),
                    BuildDivider(endIndent: 300),
                    CharacterInfo(title: 'location : ', value: ' ${character.location?.name}'),
                    BuildDivider(endIndent: 150),
                    character.type!.isEmpty ? const Text('Type is not defined' , style: TextStyle(
                      fontSize: 22,
                      color: AppColors.whiteColor
                    ),):
                    CharacterInfo(title: 'type : ', value: ' ${character.type}'),
                    BuildDivider(endIndent: 235),
                    CharacterInfo(title: 'created : ', value: ' ${character.created}'),
                    BuildDivider(endIndent: 290),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 420,
              )
            ]
          ),)
        ],
      ),
    );
  }

  Widget BuildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.secondryColor,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          '${character.name}',
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold
          ),
        ),
        background: Hero(
            tag: character.id!,
            child: Image.network(
              character.image!,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
