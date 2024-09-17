import 'package:flutter/material.dart';
import 'package:mvvm_sept/data/response/api_response.dart';
import 'package:mvvm_sept/data/response/status.dart';
import 'package:mvvm_sept/models/movie_model.dart';
import 'package:mvvm_sept/repository/home_repository.dart';
import 'package:mvvm_sept/resource/colors/app_colors.dart';
import 'package:mvvm_sept/utils/routes/routes_name.dart';
import 'package:mvvm_sept/utils/utils.dart';
import 'package:mvvm_sept/view_model/home_view_model_controller.dart';
import 'package:mvvm_sept/view_model/user_view_model_controller.dart';
import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   HomeViewModelController homeViewModelController = HomeViewModelController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     homeViewModelController.fetchMovieList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userPreference = Provider.of<UserViewModelController>(context);
//     //HomeViewModelController homeViewModelController = HomeViewModelController();

//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.amber,
//           title: const Text("HomeScreen "),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   userPreference.removeUser().then((onValue) {
//                     Navigator.pushNamed(context, RoutesName.login);
//                   });
//                 },
//                 icon: const Icon(Icons.logout))
//           ],
//         ),
//         body: ChangeNotifierProvider<HomeViewModelController>(
//           create: (BuildContext context) => homeViewModelController,
//           child: Consumer<HomeViewModelController>(
//             builder: (context, value, child) {
//               switch (value.moviesList.status) {
//                 case Status.LOADING:
//                   return const Center(
//                       child: CircularProgressIndicator(
//                     color: AppColors.whiteColor,
//                   ));
//                 case Status.ERROR:
//                   return Center(
//                       child: Text(value.moviesList.message.toString()));
//                 case Status.COMPLETED:
//                   return Center(
//                       child: ListView.builder(
//                     itemCount: value.moviesList.data!.movies!.length,
//                     itemBuilder: (context, index) {
//                       return Text("Hello guiz ()");
//                     },
//                   ));
//                 case null:
//                   // TODO: Handle this case.
//                   return SizedBox();
//               }
//               // return SizedBox();
//             },
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel hm = HomeViewModel();

  @override
  void initState() {
    hm.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<UserViewModelController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
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
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => hm,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              case Status.ERROR:
                return Center(
                  child: Text(
                    value.moviesList.message.toString(),
                  ),
                );
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(value
                              .moviesList.data!.movies![index].title
                              .toString()),
                          subtitle: Text(value
                              .moviesList.data!.movies![index].year
                              .toString()),
                          // leading: Image.network(
                          //   value.moviesList.data!.movies![index].posterurl
                          //       .toString(),
                          //   errorBuilder: (context, error, stackTrace) {
                          //     return const Icon(
                          //       Icons.error,
                          //       color: Colors.red,
                          //     );
                          //   },
                          //   height: 40,
                          //   width: 40,
                          //   fit: BoxFit.cover,
                          // ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Text(
                              //   // Utils.averageRatings(value
                              //   //         .moviesList.data!.movies![index].ratings!)
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
