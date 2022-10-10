
class HasilPemilihan {
  final int? id;
  final String? nama;
  final String? moto;
  final String? nomorUrut;
  final int? jumlahSuara;

  HasilPemilihan({this.id, this.nama, this.moto, this.nomorUrut, this.jumlahSuara});

  factory HasilPemilihan.fromMap(Map<String, dynamic> map)
  {
    return HasilPemilihan(
      id: map['id'],
      nama: map['nama'],
      moto: map['moto'],
      nomorUrut: map['nomor_urut'],
      jumlahSuara: map['jumlah_suara'],
    );
  }
}