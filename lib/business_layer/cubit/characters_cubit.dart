import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:series_app/data_layer/models/characters.dart';
import 'package:series_app/data_layer/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
   Character? characters ;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  Character? getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters:characters ));
      this.characters = characters;
    });
    return characters;
  }
}
