import 'package:get/get.dart';
import 'package:lenditt_task/Model/MovieModel.dart';

class HomeController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<Movie> movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 2), () {
      movies.assignAll(
        [
          Movie(
            name: 'Titanic',
            description: '1997 ‧ Romance/Drama ‧ 3h 14m',
            imageUrl:
                'https://resizing.flixster.com/CxlUfqBfGTFkRQ5NTohWVowd3f4=/740x380/v2/https://statcdn.fandango.com/MPX/image/NBCU_Fandango/704/859/thumb_9E3DEF45-35D5-440C-8251-3BA84763ABFE.jpg',
          ),
          Movie(
            name: 'Phir Hera Pheri',
            description: '2006 ‧ Comedy/Hindi cinema ‧ 2h 33m',
            imageUrl:
                'https://m.media-amazon.com/images/M/MV5BNzgzYjZjYzMtNjcyYy00NWI3LTg1NDItOTMzMzdhMjhjNWExXkEyXkFqcGdeQXVyNjA3OTI5MjA@._V1_FMjpg_UX500_.jpg',
          ),
          Movie(
            name: 'Dhamaal',
            description: '2007 ‧ Comedy/Hindi cinema ‧ 2h 16m',
            imageUrl:
                'https://m.media-amazon.com/images/S/pv-target-images/3028aff09398ecc49b7cbf7ca513a215c2f27239c835cce7a8a8dbb8f6e0372f.jpg',
          ),
          Movie(
            name: 'Jawaan',
            description: '2023 ‧ 2h 45m',
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/en/3/39/Jawan_film_poster.jpg',
          ),
          Movie(
            name: 'K.G.F: Chapter 1',
            description: '2018 ‧ 2h 35m',
            imageUrl:
                'https://m.media-amazon.com/images/M/MV5BZDNlNzBjMGUtYTA0Yy00OTI2LWJmZjMtODliYmUyYTI0OGFmXkEyXkFqcGdeQXVyODIwMDI1NjM@._V1_.jpg',
          ),
          Movie(
            name: 'K.G.F: Chapter 2',
            description: '2022 ‧ Action/Drama ‧ 2h 48m',
            imageUrl:
                'https://m.media-amazon.com/images/S/pv-target-images/f5a21f64af7359f7aaa7c29dee8a12a97630e707cdbf71e0ae6b063322fb8575.jpg',
          ),
          Movie(
            name: 'Baahubali: The Beginning',
            description: '2015 ‧ Action/War ‧ 2h 38m',
            imageUrl:
                'https://w0.peakpx.com/wallpaper/383/545/HD-wallpaper-baahubali-baahubali-2-bollywood-love-prabhaas-prabhas-rana-shivudu-telugu-thumbnail.jpg',
          ),
          Movie(
            name: 'Baahubali 2: The Conclusion',
            description: '2017 ‧ Action/Adventure ‧ 2h 47m',
            imageUrl:
                'https://m.media-amazon.com/images/I/71i8a-PnChL._AC_UF1000,1000_QL80_.jpg',
          ),
          Movie(
            name: 'Airlift',
            description: '2016 ‧ Thriller/Drama ‧ 2h 5m',
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/en/3/35/Airlift_poster.jpg',
          ),
          Movie(
            name: 'Jailer',
            description: '2023 ‧ Action/Crime ‧ 2h 48m',
            imageUrl:
                'https://m.media-amazon.com/images/M/MV5BMTJmZmQ2OGUtZTg0NS00ZmYzLWJjOGItYmFkNGYwMDM0NTQxXkEyXkFqcGdeQXVyMTY3ODkyNDkz._V1_.jpg',
          ),
        ],
      );
      isLoading.value = false;
    });
  }

  void logout() {}
}
