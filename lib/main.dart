class Jagoan {
  String nama;
  Jubah? jubah;
  Senjata? senjata;
  int nilaiKesehatan = 100;

  Jagoan(this.nama);

  void setJubah(Jubah jubah) {
    this.jubah = jubah;
  }

  void setSenjata(Senjata senjata) {
    this.senjata = senjata;
  }

  void info() {
    print('$nama menggunakan ${jubah?.nama} dan senjata ${senjata?.nama}');
  }

  void menyerang(Jagoan lawan) {
    if (senjata != null) {
      lawan.nilaiKesehatan -= senjata!.kekuatan;
    }
  }

  bool getStatus() {
    return nilaiKesehatan > 0;
  }

  int getNilaiKesehatan() {
    return nilaiKesehatan;
  }

  String getNama() {
    return nama;
  }
}

class Jubah {
  String nama;
  int tingkat;
  int pertahanan;

  Jubah(this.nama, this.tingkat, this.pertahanan);
}

class Senjata {
  String nama;
  int kekuatan;

  Senjata(this.nama, this.kekuatan);
}

void main() {
  Jagoan pitung = Jagoan('Pitung');
  Jubah jubahSilatPutih = Jubah('Jubah Silat Putih', 7, 50);
  Senjata golok = Senjata('Golok', 20);

  pitung.setJubah(jubahSilatPutih);
  pitung.setSenjata(golok);

  Jagoan jakaSembung = Jagoan('Jaka Sembung');
  Jubah jubahSilatHitam = Jubah('Jubah Silat Hitam', 10, 50);
  Senjata toya = Senjata('Toya', 25);

  jakaSembung.setJubah(jubahSilatHitam);
  jakaSembung.setSenjata(toya);

  pitung.info();
  jakaSembung.info();

  for (int i = 0; i < 4; i++) {
    jakaSembung.menyerang(pitung);
  }

  for (int i = 0; i < 4; i++) {
    pitung.menyerang(jakaSembung);
  }

  print('${pitung.getNama()}: ${pitung.getNilaiKesehatan()}');
  print('${jakaSembung.getNama()}: ${jakaSembung.getNilaiKesehatan()}');

  if (pitung.getStatus() && !jakaSembung.getStatus()) {
    print('${pitung.getNama()} menang cuy!');
  } else if (!pitung.getStatus() && jakaSembung.getStatus()) {
    print('${jakaSembung.getNama()} menang cuy!');
  } else {
    if (pitung.getNilaiKesehatan() > jakaSembung.getNilaiKesehatan()) {
      print('${pitung.getNama()} menang cuy!');
    } else if (pitung.getNilaiKesehatan() < jakaSembung.getNilaiKesehatan()) {
      print('${jakaSembung.getNama()} menang cuy!');
    } else {
      print('Kedua jagoan seri, cuy!');
    }
  }
}
