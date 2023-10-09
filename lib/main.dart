import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenditt_task/Controller/AuthController.dart';
import 'package:lenditt_task/Controller/BookingController.dart';
import 'package:lenditt_task/Controller/HomeController.dart';
import 'package:lenditt_task/Screen/HomePage.dart';
import 'package:lenditt_task/Screen/LoginPage.dart';
import 'package:lenditt_task/Screen/MovieBookingScreen.dart';

void main() async {
  runApp(
    GetMaterialApp(
      title: 'Lenditt Task',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/movie_booking',
          page: () => MovieBookingScreen(movie: Get.arguments),
          binding: MovieTicketBinding(),
        ),
      ],
    ),
  );
}

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class MovieTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookingController());
  }
}
