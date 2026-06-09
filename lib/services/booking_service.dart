import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking_model.dart';

class BookingService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<List<BookingModel>> getBookings() async {
    final snapshot =
        await _firestore.collection('bookings').get();

    return snapshot.docs.map((doc) {
      return BookingModel.fromMap(
        doc.id,
        doc.data(),
      );
    }).toList();
  }

  Future<void> addBooking(
      BookingModel booking) async {
    await _firestore
        .collection('bookings')
        .add(booking.toMap());
  }
  Future<void> updateBooking(
    BookingModel booking) async {
  await _firestore
      .collection('bookings')
      .doc(booking.id)
      .update(booking.toMap());
}

Future<void> deleteBooking(
    String id) async {
  await _firestore
      .collection('bookings')
      .doc(id)
      .delete();
}
}