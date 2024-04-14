import 'package:flutter/material.dart';
import 'package:series_app/constans/strings.dart';
import 'package:series_app/presentation_layer/screens/characters_screen.dart';

import 'presentation_layer/screens/characters_details_screen.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case charactersScreen:
        return MaterialPageRoute(builder: (_)=>CharactersScreen());

      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_)=>CharacterDetailsScreen());
    }


  }
}