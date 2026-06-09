import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/booking_model.dart';
import '../providers/booking_provider.dart';

class EditBookingScreen extends StatefulWidget {
  final BookingModel booking;

  const EditBookingScreen({
    super.key,
    required this.booking,
  });

  @override
  State<EditBookingScreen> createState() =>
      _EditBookingScreenState();
}

class _EditBookingScreenState
    extends State<EditBookingScreen> {

  late TextEditingController namaController;
  late TextEditingController lapanganController;
  late TextEditingController tanggalController;
  late TextEditingController jamController;

  @override
  void initState() {
    super.initState();

    namaController =
        TextEditingController(
      text: widget.booking.namaPemesan,
    );

    lapanganController =
        TextEditingController(
      text: widget.booking.lapangan,
    );

    tanggalController =
        TextEditingController(
      text: widget.booking.tanggal,
    );

    jamController =
        TextEditingController(
      text: widget.booking.jam,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama Pemesan",
              ),
            ),

            TextField(
              controller: lapanganController,
              decoration: const InputDecoration(
                labelText: "Lapangan",
              ),
            ),

            TextField(
              controller: tanggalController,
              decoration: const InputDecoration(
                labelText: "Tanggal",
              ),
            ),

            TextField(
              controller: jamController,
              decoration: const InputDecoration(
                labelText: "Jam",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {

                final updated =
                    BookingModel(
                  id: widget.booking.id,
                  namaPemesan:
                      namaController.text,
                  lapangan:
                      lapanganController.text,
                  tanggal:
                      tanggalController.text,
                  jam:
                      jamController.text,
                );

                await context
                    .read<BookingProvider>()
                    .updateBooking(updated);

                if (mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text(
                "Update",
              ),
            ),
          ],
        ),
      ),
    );
  }
}