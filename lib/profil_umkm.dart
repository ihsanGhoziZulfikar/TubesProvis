import 'package:flutter/material.dart';

class ProfilUmkm extends StatefulWidget {
  const ProfilUmkm({super.key, required this.title});

  final String title;

  @override
  State<ProfilUmkm> createState() => _ProfilUmkmState();
}

class _ProfilUmkmState extends State<ProfilUmkm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 315.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFD6E4F0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        children: const [
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.search,
                            size: 35,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Cari Umkm ...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.notifications,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 20.0, right: 16.0, top: 8.0, bottom: 20.0),
              child: Row(
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
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                        TextSpan(
                            text: "Maulana",
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
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 12.0),
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
                    children: [Text("Rp 5.000.000")],
                  ),
                ],
              ),
            ),
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
                  Container(
                    height: 250.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 16.0),
                          width: 150.0,
                          child: Column(
                            children: [
                              Container(
                                height: 120.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
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
                                      top: 8, bottom: 8, left: 9.0, right: 9),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Ibu Ira",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              child: Row(children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 15.0,
                                                  color: Colors.amber,
                                                ),
                                                Text('5'),
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.8),
                                        child: Row(
                                          children: [
                                            Text('Properti'),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.8),
                                        child: Row(
                                          children: [
                                            Text('Rp150.000.000'),
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
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  color: Color(0xFF1C355E),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Aksi buat ngasih pinjaman
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF669AD9),
                                    padding: EdgeInsets.zero,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
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
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 5, left: 16.0, bottom: 16.0),
                  child: const Text(
                    'Watchlist',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 16.0),
              width: 360,
              decoration: BoxDecoration(
                color: Color(0xFFD6E4F0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 16.0),
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
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://swamediainc.storage.googleapis.com/swa.co.id/wp-content/uploads/2021/01/20122139/daging-sapi.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10.0, bottom: 10.0),
                              width: 245.0,
                              height: 80.0,
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
                                  SizedBox(height: 2.5),
                                  const Text(
                                    "Kang Dadang",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  const Text("Menjual daging sapi segar"),
                                  SizedBox(height: 5.5),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4.0),
                                      Text("Bandung"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
