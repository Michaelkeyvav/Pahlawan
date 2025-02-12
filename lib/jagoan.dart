import 'jubah.dart';
import 'senjata.dart';

class Jagoan {
  String nama;
  int kesehatanDasar;
  int kekuatanDasar;
  int derajat;
  int totalKerusakan;
  int kenaikanKesehatan;
  int kenaikanKekuatan;
  bool hidup;

  Jubah? jubah;
  Senjata? senjata;

  Jagoan(this.nama)
      : kesehatanDasar = 100,
        kekuatanDasar = 100,
        derajat = 1,
        totalKerusakan = 0,
        kenaikanKesehatan = 10,
        kenaikanKekuatan = 10,
        hidup = true;

  void setJubah(Jubah jubah) {
    this.jubah = jubah;
  }

  void setSenjata(Senjata senjata) {
    this.senjata = senjata;
  }

  String getNama() {
    return nama;
  }

  int sehatMaksimal() {
    return kesehatanDasar +
        (jubah?.tambahKesehatan ?? 0) +
        derajat * kenaikanKesehatan;
  }

  int getKekuatanSerangJagoan() {
    return kekuatanDasar +
        (senjata?.kekuatanSerang ?? 0) +
        derajat * kenaikanKekuatan;
  }

  int getNilaiKesehatan() {
    return sehatMaksimal() - totalKerusakan;
  }

  void naikDerajat() {
    derajat++;
  }

  bool getStatus() {
    return hidup;
  }

  void menyerang(Jagoan lawan) {
    int kerusakan = getKekuatanSerangJagoan();

    print('$nama menyerang ${lawan.getNama()} dengan kekuatan $kerusakan');

    lawan.bertahan(kerusakan);

    naikDerajat();
  }

  void bertahan(int kerusakan) {
    int kekuatanBertahan = jubah?.nilaiKekuatan ?? 0;
    int selisihKerusakan;

    print('$nama memiliki kekuatan bertahan: $kekuatanBertahan');

    if (kerusakan > kekuatanBertahan) {
      selisihKerusakan = kerusakan - kekuatanBertahan;
    } else {
      selisihKerusakan = 0;
    }

    print('Kerusakan yang diperoleh $selisihKerusakan\n');

    totalKerusakan += selisihKerusakan;

    if (getNilaiKesehatan() <= 0) {
      hidup = false;
      totalKerusakan = sehatMaksimal();
    }

    info();
  }

  void info() {
    print('Jagoan\t\t\t: $nama');
    print('Derajat\t\t\t: $derajat');
    print('Kesehatan Dasar\t\t: $kesehatanDasar');
    print('Kekuatan Dasar\t\t: $kekuatanDasar');
    print('Kesehatan\t\t: ${getNilaiKesehatan()}/${sehatMaksimal()}');
    print('Kekuatan Maksimal\t: ${getKekuatanSerangJagoan()}');
    print('Masih hidup?\t\t: $hidup\n');
  }

  void getNamaJubah() {
    print('Jubah\t\t\t: ${jubah?.nama}');
  }

  void getNamaSenjata() {
    print('Senjata\t\t\t: ${senjata?.nama}');
  }
}
