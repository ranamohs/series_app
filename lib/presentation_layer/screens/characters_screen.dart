import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:series_app/business_layer/cubit/characters_cubit.dart';
import 'package:series_app/constans/colors.dart';
import 'package:series_app/data_layer/models/characters.dart';
import 'package:series_app/presentation_layer/widgets/character_item.dart';
import 'package:series_app/presentation_layer/widgets/no_internet_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  Character? allcharacters;
  List<Results>? searchOfCharacters;
  bool isSearching = false;
  final searchTextController = TextEditingController();

  Widget buildSerachField() {
    return TextField(
      controller: searchTextController,
      cursorColor: AppColors.primaryColor,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: AppColors.secondryColor,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: AppColors.secondryColor,
        fontSize: 18,
      ),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchList(String searchedCharacter) {
    searchOfCharacters = allcharacters!.results!.where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter)).toList();

    setState(() {

    });
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: AppColors.secondryColor,
          ),
        )
      ];
    } else {
      return [
        IconButton(
            onPressed: startSearch,
            icon: const Icon(
              Icons.search,
              color: AppColors.secondryColor,
            ))
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove:stopSearching ));
    setState(() {
      isSearching =true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allcharacters = (state).characters;
        return buildLoadedListWidget();
      } else {
        return showLoadingIndecator();
      }
    });
  }

  Widget showLoadingIndecator() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.secondryColor,
      ),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.secondryColor,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: searchTextController.text.isEmpty
            ? allcharacters?.results?.length
            : searchOfCharacters?.length,
        itemBuilder: (ctx, index) {
          return CharacterItem(
              character: searchTextController.text.isEmpty
                  ? allcharacters!.results![index]
                  : searchOfCharacters![index]);
        });
  }

  Widget buildAppBarTittle() {
    return const Text(
      'Characters',
      style: TextStyle(color: AppColors.whiteColor,fontSize: 26 , fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: isSearching ? buildSerachField() : buildAppBarTittle(),
        actions: buildAppBarActions(),
      ),
      body:
      OfflineBuilder(
          connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
          )
          {
            final bool connected = connectivity != ConnectivityResult.none;
            if(connected){
              return buildBlocWidget();
            }else{
              return const BuildNoInternetWidget();
            }
          },
        child: showLoadingIndecator(),
      )




    );
  }
}
