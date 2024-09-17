import 'package:mvvm_sept/data/network/baseApiServices.dart';
import 'package:mvvm_sept/data/network/networkApiServices.dart';
import 'package:mvvm_sept/models/student_model.dart';
import 'package:mvvm_sept/resource/api/app_url.dart';

// class StudentRepository {
//   BaseApiServices _apiServices = NetworkApiServices();
//   Future<StudentModel?> getStudentData() async {
//     try {
//       dynamic response = await _apiServices.getGetApiServices(AppUrl.students);
//       final jsonData = StudentModel.fromJson(response);
//       return jsonData;
//       // return response;
//     } catch (e) {
//       throw e;
//     }
//   }
// }

class StudentRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<StudentModel?> getStudentData() async {
    try {
      dynamic response = await _apiServices.getGetApiServices(AppUrl.students);
      final jsonData = StudentModel.fromJson(response);
      return jsonData;
      // return response;
    } catch (e) {
      throw e;
    }
  }
}
