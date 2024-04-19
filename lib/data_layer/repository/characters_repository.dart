import 'package:series_app/data_layer/models/characters.dart';
import 'package:series_app/data_layer/web_services_api/characters_web_services.dart';

class CharactersRepository{

 final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);



 Future<Character> getAllCharacters() async{

    final characters = await charactersWebServices.getAllCharacters();
    return  Character.fromJson(characters);

  }
}












// Future<List<Character>> getAllCharacters() async {
//   final data = await charactersWebServices.getAllCharacters();
//   //check if the returned data is not null
//   if (data != null) {
//     // Assuming the data is a Map with a key containing the List<dynamic>
//     // For example: { "results": [ ... ] }
//     //search for the first key in the map that contain a List-->data is a Map<k,v>, then store it in keyWithList variable
//     //returns the first element that satisfies the function condition
//     final keyWithList = data.keys.firstWhere(
//           (key) => data[key] is List,
//     );
//     if (keyWithList != null) {
//       List<dynamic> characterList = data[keyWithList];
//       return characterList.map((characterJson) =>
//           Character.fromJson(characterJson)).toList();
//     } else {
//       throw Exception('No List<dynamic> found in the API response');
//     }
//   } else {
//     throw Exception('Failed to fetch data from API');
//   }
// }