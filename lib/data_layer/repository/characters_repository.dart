import 'package:series_app/data_layer/models/characters.dart';
import 'package:series_app/data_layer/web_services_api/characters_web_services.dart';

class CharactersRepository{

 final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);


  Future<List<dynamic>> getAllCharacters() async{

    final characters = await charactersWebServices.getAllCharacters();
    
    return characters.map((character) => Character.fromJson(character)).toList( );

  }
}