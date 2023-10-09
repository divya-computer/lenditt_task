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
        ],
      );
      isLoading.value = false;
    });
  }

  void logout() {}
}
