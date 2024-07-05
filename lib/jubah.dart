class Jubah {
  String nama;
  int kekuatan;
  int kesehatan;

  Jubah(this.nama, this.kekuatan, this.kesehatan);

  int get tambahKesehatan => kesehatan * 10;
  int get nilaiKekuatan => kekuatan * 2;
}
