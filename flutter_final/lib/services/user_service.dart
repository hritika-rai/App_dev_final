// import 'package:dio/dio.dart';
// import '../models/user_model.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

// class UserService {
//   final Dio dio = Dio();

//   Future<List<Users>> getAllUsers() async {
//     try {
//       var connectivityResult = await Connectivity().checkConnectivity();
//       print(connectivityResult);
//       if (connectivityResult == ConnectivityResult.none) {
//         print("here");
//         throw Exception('No internet connection');
//       }
//       final response = await dio.get('https://jsonplaceholder.typicode.com/users');
//       if (response.statusCode == 200) {
//         final List<dynamic> data = response.data;
//         List<Users> userList = data.map((e) => Users.fromJson(e)).toList();
//         return userList;
//       } else {
//         throw Exception('Failed to load users');
//       }
//     } catch (e) {
//       throw Exception('No internet connection');
//     }
//   }
// }


// // class UserService {
// //   final dio = Dio();

// //   Future<List<Users>> getAllUsers() async {
// //     Response response;
// //     response = await dio.get('https://jsonplaceholder.typicode.com/users');
// //     if (response.statusCode == 200) {
// //       final List<dynamic> data = response.data;
// //       List<Users> userList = data.map((e) {
// //         return Users(
// //           id: e['id'],
// //           name: e['name'],
// //           username: e['username'],
// //           phone: e["phone"],
// //           website: e["website"],
// //           email: e["email"],
// //           address: Address(
// //             street: e['address']['street'],
// //             suite: e['address']['suite'],
// //             city: e['address']['city'],
// //             zipcode: e['address']['zipcode'],
// //             geo: Geo(
// //               lat: e['address']['geo']['lat'],
// //               lng: e['address']['geo']['lng'],
// //             ),
// //           ),
// //           company: Company(
// //             name: e['company']['name'],
// //             catchPhrase: e['company']['catchPhrase'],
// //             bs: e['company']['bs'],
// //           ),
// //         );
// //       }).toList();
// //       return userList;
// //     } else {
// //       return [];
// //     }
// //   }
// // }


