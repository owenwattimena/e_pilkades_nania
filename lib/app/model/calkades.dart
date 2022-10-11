class Calkades {
  final int? id;
  final int? idCalkadesPeriode;
  final String? nama;
  final String? tempatLahir;
  final DateTime? tanggalLahir;
  final String? jenisKelamin;
  final String? agama;
  final String? statusPerkawinan;
  final String? namaPasangan;
  final String? visi;
  final String? misi;
  final String? moto;
  final String? foto;
  final String? nomorUrut;

  Calkades(
      {this.id,
      this.idCalkadesPeriode,
      this.nama,
      this.tempatLahir,
      this.tanggalLahir,
      this.jenisKelamin,
      this.agama,
      this.statusPerkawinan,
      this.namaPasangan,
      this.visi,
      this.misi,
      this.moto,
      this.foto,
      this.nomorUrut});

  factory Calkades.fromMap(Map<String, dynamic> map) {
   
    return Calkades(
        id: map['id'],
        idCalkadesPeriode: map['id_calkades_periode'],
        nama: map['nama'],
        tempatLahir: map['tempat_lahir'],
        tanggalLahir: map['tanggal_lahir'] != null
            ? DateTime.parse(map['tanggal_lahir'])
            : null,
        jenisKelamin: map['jenis_kelamin'],
        agama: map['agama'],
        statusPerkawinan: map['status_perkawinan'],
        namaPasangan: map['nama_pasangan'],
        visi: map['visi'],
        misi: map['misi'],
        foto: map['foto'],
        moto: map['moto'],
        nomorUrut: map['nomor_urut']);
  }
}
