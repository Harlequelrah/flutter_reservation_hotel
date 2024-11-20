import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const d_green = Color(0xFF54D3C2);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels Booking',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [SearchSection(), HotelSection()],
          ),
        ));
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[800], size: 20),
        onPressed: null,
      ),
      title: Text(
        'Explore',
        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_outline_rounded,
              color: Colors.grey[800], size: 20),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(Icons.place, color: Colors.grey[800], size: 20),
          onPressed: null,
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 50,
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: 'London',
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none),
                      ))),
              const SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: const Offset(0, 4))
                ], borderRadius: const BorderRadius.all(Radius.circular(25))),
                child: ElevatedButton(
                    onPressed: () {},
                    style: (ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: d_green,
                      padding: const EdgeInsets.all(10),
                    )),
                    child: const Icon(Icons.search, size: 26)),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Choose date',
                          style: GoogleFonts.nunito(
                              color: Colors.grey, fontSize: 15)),
                      const SizedBox(height: 8),
                      Text('12 Dec - 22 Dec',
                          style: GoogleFonts.nunito(
                              color: Colors.black, fontSize: 15)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Number of Rooms',
                          style: GoogleFonts.nunito(
                              color: Colors.grey, fontSize: 15)),
                      const SizedBox(height: 8),
                      Text('1 Room  - 2 Adults',
                          style: GoogleFonts.nunito(
                              color: Colors.black, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class HotelSection extends StatelessWidget {
  final List<Map<String, dynamic>> hotelList = const [
    {
      'title': 'Grand Royl Hotel',
      'place': 'Webley London',
      'distance': 2,
      'review': 36,
      'picture': 'images/hotel_1.png',
      'price': 180
    },
    {
      'title': 'Queen Hotel',
      'place': 'Webley London',
      'distance': 3,
      'review': 13,
      'picture': 'images/hotel_2.png',
      'price': 220
    },
    {
      'title': 'Grand Malt Hotel',
      'place': 'Webley London',
      'distance': 6,
      'review': 88,
      'picture': 'images/hotel_3.png',
      'price': 350
    },
    {
      'title': 'Hilton',
      'place': 'Webley London',
      'distance': 11,
      'review': 34,
      'picture': 'images/hotel_4.png',
      'price': 510
    },
  ];
  const HotelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10), // Fixed: Added closing parenthesis
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('550 hotels found',
                      style: GoogleFonts.nunito(
                          color: Colors.black, fontSize: 15)),
                  Row(
                    children: [
                      Text('Number of Rooms',
                          style: GoogleFonts.nunito(
                              color: Colors.black, fontSize: 15)),
                      const IconButton(
                        icon: Icon(Icons.filter_list_outlined,
                            color: d_green, size: 25),
                        onPressed: null,
                      )
                    ],
                  )
                ],
              )),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotelData: hotel);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map<String, dynamic> hotelData;
  const HotelCard({super.key, required this.hotelData});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        height: 230,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ]),
        child: Column(
          children: [
            Container(
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18)),
                    image: DecorationImage(
                        image: AssetImage(hotelData['picture']),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                        top: 5,
                        right: -15,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(0.25),
                          child: const MaterialButton(
                            shape: CircleBorder(),
                            onPressed: null,
                            child: Icon(Icons.favorite_outline_rounded,
                                color: d_green, size: 20),
                          ),
                        ))
                  ],
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(hotelData['title'],
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800)),
                  Text('\$${hotelData['price']}',
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(hotelData['place'],
                      style: GoogleFonts.nunito(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  Row(
                    children: [
                      const Icon(Icons.place, color: d_green, size: 14.8),
                      Text('${hotelData['distance']} km to city',
                          style: GoogleFonts.nunito(
                              color: Colors.grey[500],
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Text('per night',
                      style: GoogleFonts.nunito(
                          fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                child: Row(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.star_rate, color: d_green, size: 14),
                        Icon(Icons.star_rate, color: d_green, size: 14),
                        Icon(Icons.star_rate, color: d_green, size: 14),
                        Icon(Icons.star_rate, color: d_green, size: 14),
                        Icon(Icons.star_rate, color: d_green, size: 14),
                      ],
                    ),
                    Text(' ${hotelData['review']} reviews',
                        style: GoogleFonts.nunito(
                            color: Colors.grey[500],
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ],
                ))
          ],
        ));
  }
}
