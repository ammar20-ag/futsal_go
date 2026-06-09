import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_booking_screen.dart';
import '../providers/booking_provider.dart';
import 'add_booking_screen.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<BookingProvider>()
          .loadBookings();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<BookingProvider>();

    return Scaffold(
      appBar: AppBar(
  title: const Text(
    "Futsal Go",
  ),
  actions: [

    IconButton(
      icon: const Icon(
        Icons.logout,
      ),
      onPressed: () async {

        await AuthService()
            .logout();

        if (!mounted) return;

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) =>
                const LoginScreen(),
          ),
          (route) => false,
        );
      },
    ),

  ],
),

      body: ListView.builder(
        itemCount:
            provider.bookings.length,

        itemBuilder: (context, index) {

          final booking =
              provider.bookings[index];

          return Card(
            margin: const EdgeInsets.all(8),

            child: ListTile(

  onTap: () async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditBookingScreen(
          booking: booking,
        ),
      ),
    );

    context
        .read<BookingProvider>()
        .loadBookings();
  },

  onLongPress: () async {

    final result =
        await showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "Hapus Booking",
          ),
          content: const Text(
            "Yakin ingin menghapus data ini?",
          ),
        );
      },
    );

    if (result == true) {
      await context
          .read<BookingProvider>()
          .deleteBooking(
            booking.id,
          );
    }
  },

  title: Text(
    booking.lapangan,
  ),

  subtitle: Text(
    "${booking.namaPemesan}\n${booking.tanggal} ${booking.jam}",
  ),
),
          );
        },
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () async {

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AddBookingScreen(),
            ),
          );

          context
              .read<BookingProvider>()
              .loadBookings();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}