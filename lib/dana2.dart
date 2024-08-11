import 'package:android/paymentNotification.dart';
import 'package:android/riwayatTransaksiUmkm.dart';
import 'package:android/tarikdana.dart';
import 'package:android/topupNotification.dart';
import 'package:android/withdrawalNotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'Tarik-dana-investor.dart';
import 'bayarpinjaman.dart';
import 'isisaldo.dart';
import 'tarikpinjaman.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UmkmModel {
  int saldo;

  UmkmModel({
    required this.saldo,
  });

  factory UmkmModel.fromJson(Map<String, dynamic> json) {
    return UmkmModel(
      saldo: json['saldo'] ?? 0,
    );
  }
}

class UmkmCubit extends Cubit<UmkmModel> {
  UmkmCubit()
      : super(UmkmModel(
          saldo: 0,
        ));

  Future<UmkmModel> fetchData(id) async {
    try {
      String url = "http://127.0.0.1:8000/dana/$id";
      final response = await http.get(Uri.parse(url));
      print("bb");
      if (response.statusCode == 200) {
        print(response);
        final jsonData = jsonDecode(response.body);
        final data = jsonData['data'] as Map<String, dynamic>;
        final umkmModel = UmkmModel.fromJson(data);
        emit(umkmModel);
        return umkmModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data: $e');
    }
  }
}

class riwayatTransaksi {
  String date;
  String jenis;
  int jumlah;
  String status;
  String warna;
  riwayatTransaksi(
      {required this.date,
      required this.jenis,
      required this.jumlah,
      required this.status,
      required this.warna});
}

getPage(String jenis) {
  switch (jenis) {
    case 'Tarik Dana':
      return WithdrawalNotificationDialogue();
    case 'Isi Saldo Dana':
      return TopupNotificationDialogue();
    case 'Bayar Pinjaman':
      return PaymentNotificationDialogue();
  }
}

List<riwayatTransaksi> data = [
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Bayar Pinjaman",
      jumlah: 100000,
      status: "Belum Lunas",
      warna: "merah"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Bayar Pinjaman",
      jumlah: 100000,
      status: "Belum Lunas",
      warna: "merah"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Bayar Pinjaman",
      jumlah: 100000,
      status: "Lunas",
      warna: "green"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Isi Saldo Dana",
      jumlah: 100000,
      status: "",
      warna: "white"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Isi Saldo Dana",
      jumlah: 100000,
      status: "",
      warna: "white"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Isi Saldo Dana",
      jumlah: 100000,
      status: "",
      warna: "white"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Tarik Dana",
      jumlah: 100000,
      status: "",
      warna: "white"),
  riwayatTransaksi(
      date: "20/05/2023",
      jenis: "Tarik Dana",
      jumlah: 100000,
      status: "",
      warna: "white"),
];

class dana2 extends StatelessWidget {
  final umkmCubit = UmkmCubit();
  int id_peminjam;
  int id_umkm;
  int id_dana;

  dana2(
      {required this.id_umkm,
      required this.id_dana,
      required this.id_peminjam});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UmkmModel>(
          future: umkmCubit.fetchData(id_dana),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final umkm = snapshot.data;
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 0, 0, 45),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Dana',
                        style: GoogleFonts.beVietnamPro(
                          height: 2,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 40),
                            child: Text(
                              'Dana Tersedia',
                              style: GoogleFonts.beVietnamPro(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 25, left: 40),
                            child: Text(
                              'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(umkm!.saldo)}',
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 40, left: 40),
                            child: Text(
                              'Kontrol keuanganmu dalam genggaman.\nLihat saldo peminjamanmu dan histori\ntransaksi dengan mudah di sini!',
                              style: GoogleFonts.beVietnamPro(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return IsiSaldo(
                                    id: id_peminjam,
                                    id_dana: id_dana,
                                    id_umkm: id_umkm,
                                    role: "peminjam",
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFF1C355E),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: Text(
                                    'Isi Saldo\nDana',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(Icons.credit_card_sharp,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return TarikDana(
                                    id: id_peminjam,
                                    id_dana: id_dana,
                                    id_umkm: id_umkm,
                                    role: "peminjam",
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFF1C355E),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: Text(
                                    'Tarik\nDana',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(Icons.local_print_shop_sharp,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFD6E4F0),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 25, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Riwayat Transaksi',
                                  style: GoogleFonts.beVietnamPro(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return RiwayatTransaksiUmkm();
                                          },
                                        ),
                                      );
                                    },
                                    child: Icon(Icons.arrow_forward_ios_rounded,
                                        color: Colors.black, size: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFD6E4F0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 6),
                            child: GestureDetector(
                              onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(height: 15),
                                        getPage(data[index].jenis),
                                        const SizedBox(height: 15),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(11),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '${data[index].jenis}',
                                          style: GoogleFonts.beVietnamPro(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        // SizedBox(height: 5),
                                        Text(
                                          'Rp${data[index].jumlah},-',
                                          style: GoogleFonts.beVietnamPro(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          data[index].date,
                                          style: GoogleFonts.beVietnamPro(
                                            fontSize: 11,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '${data[index].status}',
                                          style: GoogleFonts.beVietnamPro(
                                            fontSize: 11,
                                            color: '${data[index].warna}' ==
                                                    'merah'
                                                ? Color.fromARGB(
                                                    255, 255, 17, 0)
                                                : Color.fromARGB(
                                                    255, 6, 232, 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
