import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenditt_task/Controller/BookingController.dart';
import 'package:lenditt_task/Model/MovieModel.dart';
import 'package:lenditt_task/Model/SeatMode.dart';

class MovieBookingScreen extends StatelessWidget {
  final Movie movie;

  MovieBookingScreen({required this.movie});

  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    int totalSelectedSeat = 0;
    return GetBuilder<BookingController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Movie Booking'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Selected Movie: ${movie.name}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: controller.seats.length,
                  itemBuilder: (context, index) {
                    final seat = controller.seats[index];
                    final isBooked = controller.isSeatBooked(seat);

                    return GestureDetector(
                      onTap: () {
                        print('Total Seat Selected : ${controller.finalSeat}');
                        if (!isBooked) {
                          totalSelectedSeat++;
                          controller.toggleSeatSelection(seat);
                        } else {
                          totalSelectedSeat--;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isBooked
                              ? Colors.grey
                              : seat.selected
                                  ? Colors.blue
                                  : Colors.green,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            seat.name,
                            style: TextStyle(
                              color: isBooked ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Confirm ticket booking ?",
                    content: Text(
                        "Final Ticket price : ${(controller.finalSeat) * 500}/-"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                          Get.back();
                          controller.bookSelectedSeats(movie);
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
                child: Text('Book Selected Seats'),
              ),
              Text(
                'Total Number of Tickets Selected: ${(controller.finalSeat + 1) * 500}/-',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'Price of Ticket : 500/-',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
