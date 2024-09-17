import 'package:flutter/material.dart';
import 'package:mvvm_sept/utils/routes/routes_name.dart';
import 'package:mvvm_sept/view_model/student_view_model_controller.dart';
import 'package:mvvm_sept/view_model/user_view_model_controller.dart';

import 'package:provider/provider.dart';

import '../data/response/status.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  StudentViewModelController sdvmc = StudentViewModelController();

  @override
  void initState() {
    sdvmc.fetchStudentApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<UserViewModelController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Screen"),
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
                Navigator.pushNamed(context, RoutesName.home);
              },
              child: Icon(Icons.forward)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<StudentViewModelController>(
        create: (context) => sdvmc,
        child: Consumer<StudentViewModelController>(
          builder: (context, value, child) {
            switch (value.studentList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              case Status.ERROR:
                return Center(
                  child: Text(
                    value.studentList.message.toString(),
                  ),
                );
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.studentList.data!.students!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(value
                              .studentList.data!.students![index].name
                              .toString()),
                          subtitle: Text(value
                              .studentList.data!.students![index].course
                              .toString()),
                          leading: Text(value
                              .studentList.data!.students![index].id
                              .toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Text(
                              //   // Utils.averageRatings(value
                              //   //         .studentList.data!.students![index].ratings!)
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
