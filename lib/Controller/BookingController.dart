import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lenditt_task/Model/MovieModel.dart';
import 'package:lenditt_task/Model/SeatMode.dart';

class BookingController extends GetxController {
  final List<Seat> seats =
      List.generate(20, (index) => Seat(name: 'Seat ${index + 1}')).obs;

  List<Seat> selectedSeats = [];
  RxInt finalSeat = RxInt(0);

  bool isSeatBooked(Seat seat) {
    return selectedSeats.contains(seat);
  }

  void toggleSeatSelection(Seat seat) {
    // seat.selected = !seat.selected;

    if (seat.selected == true) {
      finalSeat -= 1;
      seat.selected = false;
    } else {
      finalSeat += 1;
      seat.selected = true;
    }
    update();
  }

  void bookSelectedSeats(Movie movie) {
    for (final seat in selectedSeats) {
      if (!isSeatBooked(seat)) {
        seat.booked = true;
      }
    }

    selectedSeats.clear();

    final box = GetStorage();
    final bookedSeats =
        seats.where((seat) => seat.booked).map((seat) => seat.name).toList();
    box.write('booked_seats_${movie.name}', bookedSeats);
  }
}
