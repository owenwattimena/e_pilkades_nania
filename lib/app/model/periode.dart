class Periode {
  final int? id;
  final String? masaJabatan;
  final DateTime? tanggalPemilihan;
  final String? jamMulaiPemilihan;
  final String? jamSelesaiPemilihan;
  final bool sudahMemilih;

  Periode(
      {this.id,
      this.masaJabatan,
      this.tanggalPemilihan,
      this.jamMulaiPemilihan,
      this.jamSelesaiPemilihan,
      this.sudahMemilih = false});

  factory Periode.fromMap(Map<String, dynamic> map) {
    if (map['periode_aktif'] != null) {
      return Periode(
          id: map['periode_aktif']['id'],
          masaJabatan: map['periode_aktif']['masa_jabatan'],
          tanggalPemilihan: map['periode_aktif']['tanggal_pemilihan'] != null
              ? DateTime.parse(map['periode_aktif']['tanggal_pemilihan'])
              : null,
          jamMulaiPemilihan: map['periode_aktif']['jam_mulai_pemilihan'],
          jamSelesaiPemilihan: map['periode_aktif']['jam_selesai_pemilihan'],
          sudahMemilih: map['sudah_memilih']);
    }
    return Periode();
  }
}
