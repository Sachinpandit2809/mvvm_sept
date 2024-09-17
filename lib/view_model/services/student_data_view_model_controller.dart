import 'package:flutter/material.dart';
import 'package:mvvm_sept/data/response/api_response.dart';
import 'package:mvvm_sept/models/movie_model.dart';
import 'package:mvvm_sept/models/students_data_model.dart';
import 'package:mvvm_sept/repository/student_data_repository.dart';

class StudentDataViewModelController with ChangeNotifier{
  final _studentDataRepository = StudentDataRepository();

  ApiResponse<StudentsDataModel> studentDataList = ApiResponse.loading();

  setStudentDataList(ApiResponse<StudentsDataModel> response) {
    studentDataList = response;
    notifyListeners();
  }

  void fetchStudentDataApi() async {
    setStudentDataList(ApiResponse.loading());

    _studentDataRepository.getStudentData().then((data) {
      print("before completed im here!");
      setStudentDataList(ApiResponse.completed(data));
    }).onError((error, stackTrace) {
      setStudentDataList(ApiResponse.error(error.toString()));
    });
  }
}