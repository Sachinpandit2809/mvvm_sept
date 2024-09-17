import 'package:flutter/material.dart';
import 'package:mvvm_sept/utils/routes/routes_name.dart';
import 'package:mvvm_sept/view_model/services/student_data_view_model_controller.dart';
import 'package:mvvm_sept/view_model/user_view_model_controller.dart';

import 'package:provider/provider.dart';

import '../data/response/status.dart';

class StudentDataScreen extends StatefulWidget {
  const StudentDataScreen({super.key});

  @override
  State<StudentDataScreen> createState() => _StudentDataScreenState();
}

class _StudentDataScreenState extends State<StudentDataScreen> {
  StudentDataViewModelController sdvmc = StudentDataViewModelController();

  @override
  void initState() {
    sdvmc.fetchStudentDataApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<UserViewModelController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("StudentDataDB Screen"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              preferences.removeUser().then((value) {
                Navigator.pop(context);
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Ink(
                child: const Text("Logout"),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.student);
              },
              child: Icon(Icons.forward)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<StudentDataViewModelController>(
        create: (context) => sdvmc,
        child: Consumer<StudentDataViewModelController>(
          builder: (context, value, child) {
            switch (value.studentDataList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              case Status.ERROR:
                return Center(
                  child: Text(
                    value.studentDataList.message.toString(),
                  ),
                );
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.studentDataList.data!.students!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(value
                              .studentDataList.data!.students![index].name
                              .toString()),
                          subtitle: Text(value
                              .studentDataList.data!.students![index].course
                              .toString()),
                          leading: Text(value
                              .studentDataList.data!.students![index].id
                              .toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Text(
                              //   // Utils.averageRatings(value
                              //   //         .studentDataList.data!.students![index].ratings!)
                              //   //     .toStringAsFixed(1),
                              // ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ),
                      );
                    });

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
