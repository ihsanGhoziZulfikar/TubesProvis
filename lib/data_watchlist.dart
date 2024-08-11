import 'package:android/umkmProfile.dart';
import 'package:flutter/material.dart';
import 'package:android/umkmDetailPage.dart';

class DataWatchlist extends StatelessWidget {
  final int id;
  final String img;
  final String nama;
  final String nama_peminjam;
  final String jenis;
  final String alamat;
  final String deskripsi;

  const DataWatchlist({
    super.key,
    required this.id,
    required this.img,
    required this.nama,
    required this.nama_peminjam,
    required this.alamat,
    required this.deskripsi,
    required this.jenis,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return UmkmProfile(
                id: id,
                img: img,
                nama: nama,
                alamat: alamat,
                deskripsi: deskripsi,
                jenis: jenis,
                nama_peminjam: nama_peminjam,
              );
            },
          ),
        );
      },
      child: Container(
        child: Row(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 10.0, bottom: 10.0),
              width: 245.0,
              height: 81.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 2.5),
                  Text(
                    nama,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 2.0),
                  Text(jenis),
                  // SizedBox(height: 5.5),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 16,
                      ),
                      SizedBox(width: 4.0),
                      Text(alamat),
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
}
