import 'package:android/fundingNotification.dart';
import 'package:android/riwayatTransaksiUmkm.dart';
import 'package:android/topupNotification.dart';
import 'package:android/withdrawalNotification.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'ModelClass/danaMOdel.dart';
import 'Tarik-dana-investor.dart';
import 'isisaldo.dart';
import 'tarikdana.dart';

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
    case 'Investasi Dana':
      return FundingNotificationDialogue();
  }
}

List<riwayatTransaksi> data = [
  riwayatTransaksi(
    date: "20/05/2023",
    jenis: "Isi Saldo Dana",
    jumlah: 100000,
    status: "Sukses",
    warna: "green",
  ),
  riwayatTransaksi(
    date: "20/05/2023",
    jenis: "Isi Saldo Dana",
    jumlah: 100000,
    status: "Sukses",
    warna: "green",
  ),
  riwayatTransaksi(
    date: "20/05/2023",
    jenis: "Investasi Dana",
    jumlah: 200000,
    status: "Sukses",
    warna: "green",
  ),
  riwayatTransaksi(
    date: "20/05/2023",
    jenis: "Tarik Dana",
    jumlah: 100000,
    status: "Gagal",
    warna: "merah",
  ),
  riwayatTransaksi(
    date: "20/05/2023",
    jenis: "Tarik Dana",
    jumlah: 100000,
    status: "Sukses",
    warna: "green",
  ),
];

class Dana3 extends StatelessWidget {
  final danaCubit = DanaCubit();
  int id_investor;
  int id_dana;

  Dana3({required this.id_dana, required this.id_investor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DanaModel>(
          future: danaCubit.fetchData(id_dana),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final dana = snapshot.data;
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 0, 0, 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Dana',
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 24,
                          height: 2,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Hallo,',
                                    style: GoogleFonts.beVietnamPro(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Lihat Isi Dana mu",
                                    style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Dana Tersedia',
                                  style: GoogleFonts.beVietnamPro(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(dana!.saldo)}',
                                  style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF1C355E),
                                ),
                                width: 80,
                                child: FittedBox(
                                  child: IconButton(
                                    onPressed: () {
                                      print("aacddc");
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return IsiSaldo(
                                              id: id_investor,
                                              id_dana: id_dana,
                                              id_umkm: 0,
                                              role: "investor",
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.add_circle_outline),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Isi Saldo",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF1C355E),
                                ),
                                width: 80,
                                child: FittedBox(
                                  child: IconButton(
                                    onPressed: () {
                                      print("aacddc");
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return TarikDana(
                                              id: id_investor,
                                              id_dana: id_dana,
                                              id_umkm: 0,
                                              role: "investor",
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.change_circle),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Tarik Dana",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
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
                                topRight: Radius.circular(40),
                              ),
                            ),
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
                                  padding: const EdgeInsets.only(top: 5.0),
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
