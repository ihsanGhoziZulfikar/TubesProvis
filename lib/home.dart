import 'package:android/ModelClass/investorUmkmModel.dart';
import 'package:android/ModelClass/peminjamModel.dart';
import 'package:android/notifikasiInvestor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'ModelClass/peminjamanModel.dart';
import 'isisaldo.dart';
import 'profil_umkm.dart';
import 'umkmDetailPage.dart';
import 'umkmProfile.dart';
import 'ModelClass/accountModel.dart';
import 'ModelClass/umkmModel.dart';
import 'ModelClass/danaModel.dart';

import 'data_watchlist.dart';
import 'konfirmasi.dart';

class Home extends StatefulWidget {
  int id_investor;
  int id_dana;

  Home({
    super.key,
    required this.id_investor,
    required this.id_dana,
  });

  final String title = "bizaid";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final accountCubit = AccountCubit();
  final listUmkmCubit = ListUmkmCubit();
  final danaCubit = DanaCubit();
  final listPeminjamanCubit = ListPeminjamanCubit();
  final listPeminjamanSedangCubit = ListPeminjamanSedangCubit();
  final listInvestorUmkmSedangCubit = ListInvestorUmkmSedangCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AccountModel>(
        future: accountCubit.fetchData(widget.id_investor, "investor"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final account = snapshot.data;
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 25.0, bottom: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/4086/4086679.png',
                                ),
                              ),
                              SizedBox(width: 10.0),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Selamat datang, ',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                    ),
                                    TextSpan(
                                        text: account!.nama,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        )),
                                    WidgetSpan(
                                      child: Text(
                                        '! 👋',
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return NotifikasiInvestor();
                                  },
                                ),
                              );
                            },
                            child: Icon(
                              Icons.notifications,
                              size: 35,
                              color: Color(0xFF1C355E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<DanaModel>(
                        future: danaCubit.fetchData(widget.id_dana),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final dana = snapshot.data;
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 16.0, top: 10.0, bottom: 12.0),
                              width: 360.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFD6E4F0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Dana yang tersedia :",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(dana!.saldo)}',
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rekomendasi Usaha Mitra Hari Ini',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          FutureBuilder<List<PeminjamanModel>>(
                            future: listPeminjamanSedangCubit.fetchData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                final listPeminjaman = snapshot.data;
                                return Container(
                                  height: 254.0,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listPeminjaman?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 16.0),
                                        width: 150.0,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 120.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                ),
                                                image: const DecorationImage(
                                                  image: NetworkImage(
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM_FtZK4TZilSzN8leRpCWY9wWpaIpoR-sOA&usqp=CAU'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xFF1C355E),
                                                  width: 0.1,
                                                ),
                                                color: Colors.transparent,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 8,
                                                    bottom: 8,
                                                    left: 9.0,
                                                    right: 9),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 2.8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            listPeminjaman![
                                                                    index]
                                                                .nama_umkm,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Container(
                                                            child:
                                                                Row(children: [
                                                              Icon(
                                                                Icons.star,
                                                                size: 15.0,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                              Text('5'),
                                                            ]),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 2.8),
                                                      child: Row(
                                                        children: [
                                                          Text(listPeminjaman[
                                                                  index]
                                                              .alamat),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 2.8),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                              'Rp${NumberFormat.currency(locale: 'id_ID', symbol: '').format(listPeminjaman![index].total_pinjaman)}'),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                ),
                                                color: Color(0xFF1C355E),
                                              ),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return UmkmDetailPage(
                                                          id_investor: widget
                                                              .id_investor,
                                                          id_dana:
                                                              widget.id_dana,
                                                          id_umkm:
                                                              listPeminjaman[
                                                                      index]
                                                                  .id_umkm,
                                                          id_peminjaman:
                                                              listPeminjaman[
                                                                      index]
                                                                  .id,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                  // Aksi buat ngasih pinjaman
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xFF669AD9),
                                                  padding: EdgeInsets.zero,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(20.0),
                                                      bottomRight:
                                                          Radius.circular(20.0),
                                                    ),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Text(
                                                    'Beri Pinjaman',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: const Text(
                            'Usaha Mitra Yang Didanai',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color(0xFFD6E4F0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: FutureBuilder<List<InvestorUmkmModel>>(
                        future: listInvestorUmkmSedangCubit
                            .fetchData(widget.id_investor),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Anda belum mendanai umkm manapun.')
                              ],
                            );
                          } else {
                            final investorUmkmSedangList = snapshot.data;
                            return Container(
                              height: 500,
                              child: ListView.builder(
                                itemCount: investorUmkmSedangList?.length,
                                itemBuilder: (context, index) {
                                  if (investorUmkmSedangList![0].nama_umkm !=
                                      "") {
                                    return Column(
                                      children: [
                                        DataWatchlist(
                                          id: investorUmkmSedangList[index].id,
                                          img:
                                              'https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg',
                                          nama: investorUmkmSedangList[index]
                                              .nama_umkm,
                                          alamat: investorUmkmSedangList[index]
                                              .alamat_umkm,
                                          deskripsi:
                                              investorUmkmSedangList[index]
                                                  .deskripsi,
                                          jenis: investorUmkmSedangList[index]
                                              .jenis_umkm,
                                          nama_peminjam:
                                              investorUmkmSedangList[index]
                                                  .nama_peminjam,
                                        ),
                                        SizedBox(height: 16),
                                      ],
                                    );
                                  }
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
