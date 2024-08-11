import 'package:flutter/material.dart';
import 'ratingDialogue.dart';
import 'filterUmkmDialogue.dart';
import 'umkmDetailPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UmkmVisitorPage extends StatefulWidget {
  const UmkmVisitorPage({super.key, required this.title});

  final String title;

  @override
  State<UmkmVisitorPage> createState() => _UmkmVisitorPageState();
}

class _UmkmVisitorPageState extends State<UmkmVisitorPage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
            SizedBox(
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Container(
                      width: 280.0,
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
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF669AD9),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  )
                ],
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
                      width: 310.0,
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
                    // IconButton(
                    //   icon: Icon(
                    //     Icons.filter_list_rounded,
                    //     size: 35,
                    //   ),
                    //   onPressed: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return FilterUmkmDialogue();
                    //       },
                    //     );
                    //   },
                    // ),
                    IconButton(
                      icon: Icon(
                        Icons.filter_list_rounded,
                        size: 35,
                      ),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 15),
                                FilterUmkmDialogue(),
                                const SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 100.0,
                      child: PageView(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 19.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 360.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD6E4F0),
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6FeM9xyfXso3joBifp3uVxFPXuxwDR3UH9A&usqp=CAU'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xFFD6E4F0).withOpacity(0.65),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        '#Direkomendasikan',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF1C355E),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 19.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 360.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD6E4F0),
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8afHgEPok38cfY9T4En6bfnMzLBs5UMvSGw&usqp=CAU'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xFFD6E4F0).withOpacity(0.65),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        '#Direkomendasikan',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF1C355E),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 19.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 360.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD6E4F0),
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm8dv8EZACOiR-A-runswAA3cCXFljUFPglw&usqp=CAU'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Color(0xFFD6E4F0).withOpacity(0.65),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        '#Direkomendasikan',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF1C355E),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                                    return Scaffold(
                                      body: UmkmDetailPage(
                                        id_investor: 0,
                                        id_dana: 0,
                                        id_umkm: 0,
                                        id_peminjaman: 0,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 165.0,
                                  height: 165.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTP_PWHlMmPa2A_tyVL3etll_SE2LAUSA8M9Q&usqp=CAU'),
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
                                        top: 8,
                                        bottom: 8,
                                        left: 13.0,
                                        right: 13),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.8),
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
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0.8),
                                          child: Row(
                                            children: [
                                              Text('Makanan'),
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
          ],
        ),
      ),
    );
  }
}
