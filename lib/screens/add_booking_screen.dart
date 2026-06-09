import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/booking_model.dart';
import '../providers/booking_provider.dart';

class AddBookingScreen extends StatefulWidget {
  const AddBookingScreen({super.key});

  @override
  State<AddBookingScreen> createState() =>
      _AddBookingScreenState();
}

class _AddBookingScreenState
    extends State<AddBookingScreen> {

  final namaController =
      TextEditingController();

  final lapanganController =
      TextEditingController();

  final tanggalController =
      TextEditingController();

  final jamController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Booking"),
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

                if (namaController.text.isEmpty ||
                    lapanganController.text.isEmpty) {
                  return;
                }

                final booking =
                    BookingModel(
                  id: '',
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
                    .addBooking(booking);

                if (mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text(
                "Simpan Booking",
              ),
            ),
          ],
        ),
      ),
    );
  }
}