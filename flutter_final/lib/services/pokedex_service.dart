// import 'dart:convert';
// import 'package:dio/dio.dart'; 
// import '../Model/pokedex_model.dart';

// class PokedexService {
//   final Dio _dio = Dio(); 

//   Future<List<Pokedex>> getAllPokedexs() async {
//     try {
//       final Response response = await _dio.get("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
//       if (response.statusCode == 200) {
//         print(response.data);
//         final json = jsonDecode(response.data)["pokemon"] as List;
//         List<Pokedex> pokemonList = List<Pokedex>.from(
//           json.map(
//             (dynamic items) => Pokedex.fromJson(items),
//           ),
//         );
//         return pokemonList;
//       }
//     } catch (e) {
//       print("Error fetching data: $e");
//     }

//     return []; 
//   }
// }
