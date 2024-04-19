part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

final class CharactersInitial extends CharactersState {}


class CharactersLoaded extends CharactersState{
  final Character characters;

  CharactersLoaded({required this.characters});
}
