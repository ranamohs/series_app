import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:series_app/business_layer/cubit/characters_cubit.dart';
import 'package:series_app/constans/strings.dart';
import 'package:series_app/data_layer/models/characters.dart';
import 'package:series_app/data_layer/repository/characters_repository.dart';
import 'package:series_app/data_layer/web_services_api/characters_web_services.dart';
import 'package:series_app/presentation_layer/screens/characters_screen.dart';

import 'presentation_layer/screens/characters_details_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                charactersCubit,
              child:CharactersScreen()
          ),

        );

      case characterDetailsScreen:
        final character = settings.arguments as Results;
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character: character,));
    }
  }
}
