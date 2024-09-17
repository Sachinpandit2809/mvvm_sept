import 'package:flutter/material.dart';
import 'package:mvvm_sept/data/response/api_response.dart';
import 'package:mvvm_sept/models/movie_model.dart';
import 'package:mvvm_sept/repository/home_repository.dart';

// class HomeViewModelController with ChangeNotifier {
//   final _myRepo = HomeRepository();
//   ApiResponse<MovieModel> moviesList =
//       ApiResponse.loading(); // creating variable
//   setMoviesList(ApiResponse<MovieModel> response) {
//     moviesList = response;
//     notifyListeners();
//   }

//   Future<void> fetchMovieList() async {
//     setMoviesList(ApiResponse.loading());
//     _myRepo.fetchMoviesList().then((onValue) {
//       setMoviesList(ApiResponse.completed(onValue));
//     }).onError(
//       (error, stackTrace) {
//         setMoviesList(ApiResponse.error(error.toString()));
//       },
//     );
//   }
// }

class HomeViewModel with ChangeNotifier {
  final _homeRepository = HomeRepository();

  ApiResponse<MovieModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieModel> response) {
    moviesList = response;
    notifyListeners();
  }

  void fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    _homeRepository.fetchMoviesList().then((data) {
      print("before completed im here!");
      setMoviesList(ApiResponse.completed(data));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
