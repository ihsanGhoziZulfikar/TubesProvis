import 'package:android/ulasanUmkm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'ModelClass/peminjamanModel.dart';
import 'ModelClass/umkmModel.dart';
import 'bayarpinjaman.dart';
import 'beriPinjamanInvestor.dart';

class UmkmDetailPage extends StatelessWidget {
  int id_investor;
  int id_dana;
  int id_umkm;
  int id_peminjaman;
  final umkmCubit = UmkmCubit();
  final peminjamanCubit = PeminjamanCubit();

  UmkmDetailPage({
    required this.id_investor,
    required this.id_dana,
    required this.id_umkm,
    required this.id_peminjaman,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PeminjamanModel>(
        future: peminjamanCubit.fetchData(id_peminjaman),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final peminjaman = snapshot.data;
            return FutureBuilder<UmkmModel>(
              future: umkmCubit.fetchData(id_umkm),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final umkm = snapshot.data;
                  return SafeArea(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50.0),
                                  bottomRight: Radius.circular(50.0),
                                ),
                                child: Image.asset(
                                  'assets/images/toko.jpg',
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: 80,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: List.generate(
                                      3,
                                      (index) => Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 10),
                                        child: Container(
                                          width: 35,
                                          color: Colors.grey,
                                          child: Image.asset(
                                            'assets/images/icon-camera.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(27),
                            child: Text(
                              umkm!.jenis,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        umkm.nama,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w400,
                                          height: 0.6,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        peminjaman!.nama_peminjam,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.yellow[700],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '5.0',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text(
                                            '4 Ulasan Investor',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Icon(Icons.thumb_up,
                                                size: 15,
                                                color: Color(0xff669ad9)),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'UMKM direkomendasikan',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Deskripsi',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        peminjaman!.deskripsi,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Kebutuhan Dana',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(peminjaman!.dana_terkumpul)}',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              '/',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(peminjaman!.total_pinjaman)}',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 33,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 150,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 17),
                                      decoration: BoxDecoration(
                                        color: Color(0xff669ad9),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return UlasanUmkm();
                                              },
                                            ),
                                          );
                                        },
                                        child: Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Image.asset(
                                                  'assets/images/icon-document.png',
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Lihat Ulasan',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return BeriPinjamanInvestor(
                                                id_investor: id_investor,
                                                id_dana: id_dana,
                                                id_umkm: id_umkm,
                                                id_peminjaman: peminjaman.id,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 150,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 12),
                                        decoration: BoxDecoration(
                                          color: Color(0xff669ad9),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Image.asset(
                                                  'assets/images/icon-global-currency.png',
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Beri Pinjaman',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
