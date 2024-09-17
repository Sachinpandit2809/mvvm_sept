import 'package:flutter/material.dart';
import 'package:mvvm_sept/data/network/baseApiServices.dart';
import 'package:mvvm_sept/data/network/networkApiServices.dart';
import 'package:mvvm_sept/models/movie_model.dart';
import 'package:mvvm_sept/resource/api/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieModel> fetchMoviesList() async {
    // parsing into model;
    try {
      dynamic response =await _apiServices.getGetApiServices(AppUrl.moviesUrl);

      debugPrint(response.toString());
      // return MovieModel.fromJson(response);
      return response = MovieModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}

// class HomeRepository {
//   final BaseApiServices _apiServices = NetworkApiServices();
//   Future<MovieListModel> fetchMoviesList() async {
//     try {
//       print("first line fetchMoviesList function");
//       dynamic response =
//           await _apiServices.getGetApiResponse(AppUrls.moviesListEndPoint);
//       return response = MovieListModel.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
