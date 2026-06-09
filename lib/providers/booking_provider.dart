import 'package:flutter/material.dart';
import '../models/booking_model.dart';
import '../services/booking_service.dart';

class BookingProvider extends ChangeNotifier {
  final BookingService service =
      BookingService();

  List<BookingModel> bookings = [];

  Future<void> loadBookings() async {
    bookings = await service.getBookings();
    notifyListeners();
  }

  Future<void> addBooking(
      BookingModel booking) async {
    await service.addBooking(booking);
    await loadBookings();
  }
  
  Future<void> updateBooking(
    BookingModel booking) async {
  await service.updateBooking(booking);
  await loadBookings();
}

Future<void> deleteBooking(
    String id) async {
  await service.deleteBooking(id);
  await loadBookings();
}
}