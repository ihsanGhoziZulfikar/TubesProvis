import 'package:flutter/material.dart';
import 'umkmDetailPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Umkm extends StatefulWidget {
  const Umkm({super.key, required this.title});

  final String title;

  @override
  State<Umkm> createState() => _UmkmState();
}

class _UmkmState extends State<Umkm> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 65,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 360.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF1C355E),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        "UMKM",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                        Icons.filter_list_rounded,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 0.0, left: 16.0, right: 16.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(right: 16.0),
                            width: 100.0,
                            child: Column(
                              children: [
                                Container(
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
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      height: 40.0,
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                          'Makanan',
                                          textAlign: TextAlign.center,
                                        ),
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
              Container(
                height: 100.0,
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 16.0, top: 10.0, bottom: 12.0),
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFD6E4F0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Image.asset(
                          'assets/images/toko.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 16.0, top: 10.0, bottom: 12.0),
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFD6E4F0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Image.asset(
                          'assets/images/toko.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 16.0, top: 10.0, bottom: 12.0),
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFD6E4F0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Image.asset(
                          'assets/images/toko.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: WormEffect(
                    activeDotColor: Color(0xFF669AD9),
                    dotColor: Color(0xFFD6E4F0),
                    dotHeight: 10.0,
                    dotWidth: 10.0),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return UmkmDetailPage(
                                id_investor: 0,
                                id_dana: 0,
                                id_umkm: 0,
                                id_peminjaman: 0,
                              );
                            },
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 165.0,
                            height: 150.0,
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
                            width: 165.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                              border: Border.all(
                                color: Color(0xFF1C355E),
                                width: 0.1,
                              ),
                              color: Colors.transparent,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 8, left: 13.0, right: 13),
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
                                        EdgeInsets.symmetric(vertical: 0.8),
                                    child: Row(
                                      children: [
                                        Text('Properti'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
