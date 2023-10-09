import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenditt_task/Controller/HomeController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.defaultDialog(
                title: "Confirm Log out ?",
                content: Text("Are you sure you want to log out ??"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back(); // Close the dialog
                      // Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.logout();
                      Get.offAllNamed('/login');
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.movies.length,
                itemBuilder: (context, index) {
                  final movie = controller.movies[index];
                  return ListTile(
                    title: Text(movie.name),
                    subtitle: Text(movie.description),
                    leading: Image.network(
                      movie.imageUrl,
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/movie_booking', arguments: movie);
                      },
                      child: Text('Book Ticket'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
