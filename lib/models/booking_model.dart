class BookingModel {
  String id;
  String namaPemesan;
  String lapangan;
  String tanggal;
  String jam;

  BookingModel({
    required this.id,
    required this.namaPemesan,
    required this.lapangan,
    required this.tanggal,
    required this.jam,
  });

  Map<String, dynamic> toMap() {
    return {
      'namaPemesan': namaPemesan,
      'lapangan': lapangan,
      'tanggal': tanggal,
      'jam': jam,
    };
  }

  factory BookingModel.fromMap(
      String id, Map<String, dynamic> map) {
    return BookingModel(
      id: id,
      namaPemesan: map['namaPemesan'] ?? '',
      lapangan: map['lapangan'] ?? '',
      tanggal: map['tanggal'] ?? '',
      jam: map['jam'] ?? '',
    );
  }
}