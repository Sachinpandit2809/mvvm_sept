import 'package:mvvm_sept/data/network/baseApiServices.dart';
import 'package:mvvm_sept/data/network/networkApiServices.dart';
import 'package:mvvm_sept/models/student_model.dart';
import 'package:mvvm_sept/models/students_data_model.dart';
import 'package:mvvm_sept/resource/api/app_url.dart';

class StudentDataRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<StudentsDataModel?> getStudentData() async {
    try {
      dynamic response = await _apiServices.getGetApiServices(AppUrl.mydata);
      final jsonData = StudentsDataModel.fromJson(response);
      return jsonData;
      // return response;
    } catch (e) {
      throw e;
    }
  }
}
