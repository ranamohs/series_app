import 'package:dio/dio.dart';
import 'package:series_app/constans/strings.dart';

class CharactersWebServices{

 late Dio dio ;
 CharactersWebServices (){
   BaseOptions options = BaseOptions(

     baseUrl: baseUrl,
     receiveDataWhenStatusError: true,
     connectTimeout: Duration(seconds: 20),
     receiveTimeout: Duration(seconds: 20)
   );

   dio = Dio(options);
 }

 Future<List<dynamic>> getAllCharacters() async{
   try{
     Response response = await dio.get('character');
     print(response.data.toString());
     return response.data;
   } catch(e){
     print(e.toString());
     return[];
   }
   
 }
}