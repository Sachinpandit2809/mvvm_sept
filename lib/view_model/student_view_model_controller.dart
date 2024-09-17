import 'package:flutter/material.dart';
import 'package:mvvm_sept/data/response/api_response.dart';
import 'package:mvvm_sept/models/student_model.dart';
import 'package:mvvm_sept/repository/student_repository.dart';

////////////////////// MVVM  default//////////

class StudentViewModelController with ChangeNotifier {
  final _myRepo = StudentRepository();
  ApiResponse<StudentModel> studentList = ApiResponse.loading();
  void setStudentList(ApiResponse<StudentModel> response) {
    debugPrint(
        ".............Student.............................................");

    debugPrint(response.toString());
    studentList = response;
    notifyListeners();
  }

  void fetchStudentApi() async {
    setStudentList(ApiResponse.loading());
    _myRepo.getStudentData().then((value) {
      setStudentList(ApiResponse.completed(value));
    }).onError(
      (error, stackTrace) {
        setStudentList(ApiResponse.error(error.toString()));
      },
    );
  }
}

//////////// List<StudentModel> type//////////////

// class StudentViewModelController with ChangeNotifier {
//   final _myRepo = StudentRepository();
//   ApiResponse<List<StudentModel>> studentList = ApiResponse.loading();
//   setStudentList(ApiResponse<List<StudentModel>> response) {
//     studentList = response;
//     notifyListeners();
//   }

//   Future<void> fetchStudentList() async {
//     setStudentList(ApiResponse.loading());
//    _myRepo
//         .getStudentData()
//         .then((value) => setStudentList(ApiResponse.completed(StudentModel.fromJson(value)).toList()))
//         .onError(
//       (error, stackTrace) {
//         setStudentList(ApiResponse.error(error.toString()));
//       },
//     );
//   }
// }

////////////dynamic type//////////////

// class StudentViewModelController with ChangeNotifier {
//   final _myRepo = StudentRepository();
//   ApiResponse<List<dynamic>> studentList = ApiResponse.loading();
//   setStudentList(ApiResponse<List<dynamic>> response) {
//     studentList = response;
//     notifyListeners();
//   }

//   Future<void> fetchStudentList() async {
//     setStudentList(ApiResponse.loading());
//     _myRepo
//         .getStudentData()
//         .then((value) => setStudentList(ApiResponse.completed(value)))
//         .onError(
//       (error, stackTrace) {
//         setStudentList(ApiResponse.error(error.toString()));
//       },
//     );
//   }
// }
