// //final
// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/Model/cart.dart';
// import 'package:ecommers_app/View/inner_product_details.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Flower extends StatefulWidget {
//   const Flower({super.key});

//   @override
//   _FlowerState createState() => _FlowerState();
// }

// class _FlowerState extends State<Flower> {
//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = "";
  // final List<Map<String, dynamic>> flowerList1 = [
  //   {
  //     'image': 'assets/vegitable/lotu.jpg',
  //     'title': "Lotus",
  //     'quantity': "1 set",
  //     'rupees': 13.0,
  //     'description':
  //         "Lotus 🌸:\nThe lotus is a symbol of purity, beauty, and spiritual enlightenment in many cultures. Known for its large, vibrant petals and serene floating leaves, the lotus thrives in aquatic environments such as ponds and lakes. It is often associated with tranquility and harmony. Lotuses are not just ornamental; parts of the plant, like the seeds and roots, are used in culinary dishes and traditional medicine. Their captivating presence makes them a favored choice for gardens and meditation spaces."
  //   },
  //   {
  //     'image': 'assets/vegitable/rosi.jpg',
  //     'title': "Rose",
  //     'quantity': "2 set",
  //     'rupees': 14.0,
  //     'description':
  //         "Rose 🌹:\nRoses are celebrated worldwide for their stunning beauty, captivating fragrance, and symbolic meaning of love and passion. With an array of colors like red, white, pink, and yellow, roses are versatile in expressing emotions. They are widely used in bouquets, perfumes, and skincare products due to their soothing properties. Beyond aesthetics, rose petals are used in culinary dishes like rose syrups, jams, and desserts. Their timeless charm and elegance make roses a cherished flower globally."
  //   },
  //   {
  //     'image': 'assets/vegitable/jas.jpg',
  //     'title': "Jasmine",
  //     'quantity': "2 set",
  //     'rupees': 160.0,
  //     'description':
  //         "Jasmine 🌼:\nJasmine is a delicate white flower known for its sweet and intoxicating fragrance. Commonly associated with purity and grace, jasmine is widely used in perfumes, teas, and essential oils. Its calming scent is believed to reduce stress and promote relaxation. Jasmine flowers are also used in traditional rituals and decorative garlands in many cultures. Their enchanting aroma and beauty make them a favorite in gardens and homes."
  //   },
  //   {
  //     'image': 'assets/vegitable/marig.jpg',
  //     'title': "Marigold",
  //     'quantity': "1 set",
  //     'rupees': 60.0,
  //     'description':
  //         "Marigold 🌼:\nMarigolds are bright, cheerful flowers known for their vibrant orange and yellow hues. Symbolizing positivity and energy, they are often used in decorations for festivals and ceremonies. Marigolds are also natural pest repellents, making them a valuable addition to gardens. Beyond their decorative value, they are used in traditional medicine and as natural dyes. Their versatility and vibrant appeal make marigolds a popular choice for various uses."
  //   },
  //   {
  //     'image': 'assets/vegitable/sunflo.jpg',
  //     'title': "Sunflower",
  //     'quantity': "2 set",
  //     'rupees': 80.0,
  //     'description':
  //         "Sunflower 🌻:\nSunflowers are iconic for their tall stems and large, radiant yellow blooms that resemble the sun. They symbolize loyalty, longevity, and happiness. Apart from their ornamental appeal, sunflower seeds are a rich source of nutrition and are used in cooking, snacks, and oils. Sunflowers also have ecological benefits, attracting pollinators and improving soil quality. Their sunny disposition and multifunctional use make sunflowers a beloved plant worldwide."
  //   },
  // ];


  // final List<Map<String, dynamic>> flowerList2 = [
  //   {
  //     'image': 'assets/flower/hibis.jpg',
  //     'title': "Hibiscus	",
  //     'quantity': "1 set",
  //     'rupees': 60.0,
  //     'description':
  //         "Orach 🌱:\nThis bright red flower is sacred to Goddess Kali and Lord Ganesha. Hibiscus tea, made from its petals, is rich in antioxidants and beneficial for heart health. In Ayurveda, the flower is used for hair care and skin treatments. Its vibrant color also makes it a popular ornamental plant in Indian gardens."
  //   },
  //   {
  //     'image': 'assets/flower/champa.jpg',
  //     'title': "Champa",
  //     'quantity': "2 set",
  //     'rupees': 80.0,
  //     'description':
  //         "Cabbage 🥬:\nChampa flowers are known for their exquisite fragrance and are often used in temple rituals and garlands. They symbolize immortality and spirituality. The flowers are also used in traditional perfumes and for ornamental purposes in gardens and homes."
  //   },
  //   {
  //     'image': 'assets/flower/pc.jpg',
  //     'title': "peacock flower	",
  //     'quantity': "2 set",
  //     'rupees': 160.0,
  //     'description':
  //         "Perilla 🍃:\nA bright, ornamental flower that resembles a peacock’s feathers. It is used for decorative purposes in gardens and has medicinal properties, including use in treating fever and skin conditions.."
  //   },
  //   {
  //     'image': 'assets/flower/gulmohar.jpg',
  //     'title': "Gulmohar",
  //     'quantity': "1 set",
  //     'rupees': 60.0,
  //     'description':
  //         "Chaya 🌿:\nAlso called the Flame Tree, Gulmohar is known for its fiery red-orange blossoms. It symbolizes flamboyance and is widely planted for its shade and ornamental value."
  //   },
  //   {
  //     'image': 'assets/flower/askoka.jpg',
  //     'title': "Ashoka Flower	",
  //     'quantity': "2 set",
  //     'rupees': 80.0,
  //     'description':
  //         "Tatsoi 🌿:\nSacred in Indian culture, Ashoka flowers are used in religious rituals and Ayurveda to treat gynecological issues. The tree is associated with fertility and is revered in Hindu mythology.."
  //   },
  // ];

  // final List<Map<String, dynamic>> flowerList3  = [
  //   {
  //     'image': 'assets/flower/frag.jpg',
  //     'title': "Frangipani	",
  //     'quantity': "1 set",
  //     'rupees': 60.0,
  //     'description':
  //         "Endive 🌿:\nKnown as Champa or Temple Flower, this fragrant bloom is used in rituals and as an offering in temples. Its delicate beauty symbolizes devotion and spirituality.."
  //   },
  //   {
  //     'image': 'assets/flower/ixo.jpg',
  //     'title': "Ixora",
  //     'quantity': "2 set",
  //     'rupees': 80.0,
  //     'description':
  //         "Bok Choy 🥬:\nCalled Jungle Flame, these small clustered flowers symbolize passion and youth. Ixora is a popular choice for gardens and is also used in Ayurveda."
  //   },
  //   {
  //     'image': 'assets/flower/Zini.jpg',
  //     'title': "Zinnia",
  //     'quantity': "2 set",
  //     'rupees': 160.0,
  //     'description':
  //         "Mustard Greens 🌱:\nKnown for their bright, daisy-like flowers, Zinnias symbolize endurance and are often used in bouquets and gardens for their cheerful colors."
  //   },
  //   {
  //     'image': 'assets/flower/jasmin.jpg',
  //     'title': "Jasmine",
  //     'quantity': "1 set",
  //     'rupees': 60.0,
  //     'description':
  //         "Butterhead Lettuce 🥬:\nKnown as “Queen of the Night” for its intoxicating fragrance, jasmine is used in garlands, essential oils, and perfumes. The flowers are woven into bridal hairstyles in South India. Jasmine oil is valued in Ayurveda for its calming properties. It is also associated with love and purity in Indian culture."
  //   },
  //   {
  //     'image': 'assets/flower/tulsi.jpg',
  //     'title': "Tulsi Flower",
  //     'quantity': "2 set",
  //     'rupees': 80.0,
  //     'description':
  //         "Mizuna 🌱:\n Tulsi, also known as Holy Basil, is considered sacred in Hindu households. Its small purple or white flowers are offered in prayers and used in Ayurvedic remedies for respiratory and digestive issues. Tulsi plants are often worshipped and found in courtyards across India.",
  //   },
  // ];

  

//   List<Map<String, dynamic>> _searchFlower(
//       List<Map<String, dynamic>> flowerList) {
//     return flowerList
//         .where((flower) =>
//             flower['title'].toLowerCase().contains(_searchQuery) ||
//             flower['description'].toLowerCase().contains(_searchQuery))
//         .toList();
//   }

//   Future<void> addToFavorites(Map<String, dynamic> item) async {
//     await FirebaseFirestore.instance.collection('favorites').add(item);
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text(
//           "Added to wishlist!",
//           style: TextStyle(color: Colors.green),
//         ),
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }

//   Future<void> addToCart(CartItem item) async {
//     QuerySnapshot response =
//         await FirebaseFirestore.instance.collection('cart').get();
//     for (int i = 0; i < response.docs.length; i++) {
//       if (response.docs[i]['name'] == item.title) {
//         return;
//       }
//     }
//     await FirebaseFirestore.instance.collection('cart').add({
//       'name': item.title,
//       'price': item.price,
//       'image': item.image,
//       'quantity': 1,
//     });
//   }

//   Widget buildflowerRow(List<Map<String, dynamic>> flowerList) {
//     return SizedBox(
//       height: 320,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: flowerList.length,
//         itemBuilder: (context, index) {
//           final item = flowerList[index];
//           return Container(
//             margin: const EdgeInsets.all(8.0),
//             color: Colors.grey.shade200,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 132,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.asset(
//                         item['image'],
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     "${item["title"]}\n${item["quantity"]}\n₹${item["rupees"]}",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                       color: Colors.black,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => ProductDetails2(
//                             title: item['title'],
//                             image: item['image'],
//                             rupees: item["rupees"],
//                             description: item['description'],
//                           ),
//                         ),
//                       );
//                       // Implement navigation to product details if needed
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Row(
//                           children: [
//                             Text(
//                               "View product details",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15,
//                                 color: Colors.green,
//                               ),
//                             ),
//                             Icon(Icons.arrow_drop_down_sharp),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             GestureDetector(
//                               onTap: () => addToFavorites(item),
//                               child: Icon(
//                                 Icons.favorite_border_rounded,
//                                 color: Colors.red.shade600,
//                               ),
//                             ),
//                             const SizedBox(width: 120),
//                             GestureDetector(
//                               onTap: () async {
//                                 log("Price: ${item['rupees']}");
//                                 CartItem cartItem = CartItem(
//                                   title: item['title'],
//                                   image: item['image'],
//                                   price: item["rupees"],
//                                   description: item['description'],
//                                   quantity:
//                                       1, // You can modify this if you allow quantity adjustments
//                                 );
//                                 await addToCart(cartItem);
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text("Added to  cart"),
//                                     backgroundColor: Colors.green,
//                                     duration: Duration(seconds: 2),
//                                   ),
//                                 );
//                                 // Navigator.of(context).push(
//                                 //    MaterialPageRoute(builder: (context) => CheckoutScreen()),
//                                 //      );
//                               },
//                               child: Icon(
//                                 Icons.shopping_cart_outlined,
//                                 color: Colors.blue.shade600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Flowers",
//           style: GoogleFonts.quicksand(
//             fontWeight: FontWeight.w600,
//             fontSize: 30,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 33, 136, 36),
//         leading: IconButton(
//           onPressed: () => Navigator.of(context).pop(),
//           icon: const Icon(
//             Icons.arrow_back_ios_new_sharp,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: TextField(
//                 controller: _searchController,
//                 decoration: const InputDecoration(
//                   hintText: "Search for flower",
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (query) {
//                   setState(() {
//                     _searchQuery = query.toLowerCase();
//                   });
//                 },
//               ),
//             ),
//             buildflowerRow(_searchFlower(flowerList1)),
//             buildflowerRow(_searchFlower(flowerList2)),
//             buildflowerRow(_searchFlower(flowerList3)),
//           ],
//         ),
//       ),
//     );
//   }
// }


// final page - 18/7/25

// Final Flower Screen with UI updated to match Leaf structure

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/cart.dart';
import 'package:ecommers_app/View/inner_product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Flower extends StatefulWidget {
  const Flower({super.key});

  @override
  _FlowerState createState() => _FlowerState();
}

class _FlowerState extends State<Flower> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

   final List<Map<String, dynamic>> flowerList1 = [
    {
      'image': 'assets/vegitable/lotu.jpg',
      'title': "Lotus",
      'quantity': "1 set",
      'rupees': 13.0,
      'description':
          "Lotus 🌸:\nThe lotus is a symbol of purity, beauty, and spiritual enlightenment in many cultures. Known for its large, vibrant petals and serene floating leaves, the lotus thrives in aquatic environments such as ponds and lakes. It is often associated with tranquility and harmony. Lotuses are not just ornamental; parts of the plant, like the seeds and roots, are used in culinary dishes and traditional medicine. Their captivating presence makes them a favored choice for gardens and meditation spaces."
    },
    {
      'image': 'assets/vegitable/rosi.jpg',
      'title': "Rose",
      'quantity': "2 set",
      'rupees': 14.0,
      'description':
          "Rose 🌹:\nRoses are celebrated worldwide for their stunning beauty, captivating fragrance, and symbolic meaning of love and passion. With an array of colors like red, white, pink, and yellow, roses are versatile in expressing emotions. They are widely used in bouquets, perfumes, and skincare products due to their soothing properties. Beyond aesthetics, rose petals are used in culinary dishes like rose syrups, jams, and desserts. Their timeless charm and elegance make roses a cherished flower globally."
    },
    {
      'image': 'assets/vegitable/jas.jpg',
      'title': "Jasmine",
      'quantity': "2 set",
      'rupees': 160.0,
      'description':
          "Jasmine 🌼:\nJasmine is a delicate white flower known for its sweet and intoxicating fragrance. Commonly associated with purity and grace, jasmine is widely used in perfumes, teas, and essential oils. Its calming scent is believed to reduce stress and promote relaxation. Jasmine flowers are also used in traditional rituals and decorative garlands in many cultures. Their enchanting aroma and beauty make them a favorite in gardens and homes."
    },
    {
      'image': 'assets/vegitable/marig.jpg',
      'title': "Marigold",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Marigold 🌼:\nMarigolds are bright, cheerful flowers known for their vibrant orange and yellow hues. Symbolizing positivity and energy, they are often used in decorations for festivals and ceremonies. Marigolds are also natural pest repellents, making them a valuable addition to gardens. Beyond their decorative value, they are used in traditional medicine and as natural dyes. Their versatility and vibrant appeal make marigolds a popular choice for various uses."
    },
    {
      'image': 'assets/vegitable/sunflo.jpg',
      'title': "Sunflower",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Sunflower 🌻:\nSunflowers are iconic for their tall stems and large, radiant yellow blooms that resemble the sun. They symbolize loyalty, longevity, and happiness. Apart from their ornamental appeal, sunflower seeds are a rich source of nutrition and are used in cooking, snacks, and oils. Sunflowers also have ecological benefits, attracting pollinators and improving soil quality. Their sunny disposition and multifunctional use make sunflowers a beloved plant worldwide."
    },
  ];


  final List<Map<String, dynamic>> flowerList2 = [
    {
      'image': 'assets/flower/hibis.jpg',
      'title': "Hibiscus	",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Orach 🌱:\nThis bright red flower is sacred to Goddess Kali and Lord Ganesha. Hibiscus tea, made from its petals, is rich in antioxidants and beneficial for heart health. In Ayurveda, the flower is used for hair care and skin treatments. Its vibrant color also makes it a popular ornamental plant in Indian gardens."
    },
    {
      'image': 'assets/flower/champa.jpg',
      'title': "Champa",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Cabbage 🥬:\nChampa flowers are known for their exquisite fragrance and are often used in temple rituals and garlands. They symbolize immortality and spirituality. The flowers are also used in traditional perfumes and for ornamental purposes in gardens and homes."
    },
    {
      'image': 'assets/flower/pc.jpg',
      'title': "peacock flower	",
      'quantity': "2 set",
      'rupees': 160.0,
      'description':
          "Perilla 🍃:\nA bright, ornamental flower that resembles a peacock’s feathers. It is used for decorative purposes in gardens and has medicinal properties, including use in treating fever and skin conditions.."
    },
    {
      'image': 'assets/flower/gulmohar.jpg',
      'title': "Gulmohar",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Chaya 🌿:\nAlso called the Flame Tree, Gulmohar is known for its fiery red-orange blossoms. It symbolizes flamboyance and is widely planted for its shade and ornamental value."
    },
    {
      'image': 'assets/flower/askoka.jpg',
      'title': "Ashoka Flower	",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Tatsoi 🌿:\nSacred in Indian culture, Ashoka flowers are used in religious rituals and Ayurveda to treat gynecological issues. The tree is associated with fertility and is revered in Hindu mythology.."
    },
  ];

  final List<Map<String, dynamic>> flowerList3  = [
    {
      'image': 'assets/flower/frag.jpg',
      'title': "Frangipani	",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Endive 🌿:\nKnown as Champa or Temple Flower, this fragrant bloom is used in rituals and as an offering in temples. Its delicate beauty symbolizes devotion and spirituality.."
    },
    {
      'image': 'assets/flower/ixo.jpg',
      'title': "Ixora",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Bok Choy 🥬:\nCalled Jungle Flame, these small clustered flowers symbolize passion and youth. Ixora is a popular choice for gardens and is also used in Ayurveda."
    },
    {
      'image': 'assets/flower/Zini.jpg',
      'title': "Zinnia",
      'quantity': "2 set",
      'rupees': 160.0,
      'description':
          "Mustard Greens 🌱:\nKnown for their bright, daisy-like flowers, Zinnias symbolize endurance and are often used in bouquets and gardens for their cheerful colors."
    },
    {
      'image': 'assets/flower/jasmin.jpg',
      'title': "Jasmine",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          "Butterhead Lettuce 🥬:\nKnown as “Queen of the Night” for its intoxicating fragrance, jasmine is used in garlands, essential oils, and perfumes. The flowers are woven into bridal hairstyles in South India. Jasmine oil is valued in Ayurveda for its calming properties. It is also associated with love and purity in Indian culture."
    },
    {
      'image': 'assets/flower/tulsi.jpg',
      'title': "Tulsi Flower",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Mizuna 🌱:\n Tulsi, also known as Holy Basil, is considered sacred in Hindu households. Its small purple or white flowers are offered in prayers and used in Ayurvedic remedies for respiratory and digestive issues. Tulsi plants are often worshipped and found in courtyards across India.",
    },
  ];
  List<Map<String, dynamic>> _searchFlower(List<Map<String, dynamic>> list) {
    return list
        .where((flower) =>
            flower['title'].toLowerCase().contains(_searchQuery) ||
            flower['description'].toLowerCase().contains(_searchQuery))
        .toList();
  }

  Future<void> addToFavorites(Map<String, dynamic> item) async {
    await FirebaseFirestore.instance.collection('favorites').add(item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Added to wishlist!",
            style: GoogleFonts.quicksand(color: Colors.green)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> addToCart(CartItem item) async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('cart').get();
    for (var doc in response.docs) {
      if (doc['name'] == item.title) return;
    }
    await FirebaseFirestore.instance.collection('cart').add({
      'name': item.title,
      'price': item.price,
      'image': item.image,
      'quantity': 1,
    });
  }

  Widget buildFlowerRow(List<Map<String, dynamic>> flowerList) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: flowerList.length,
        itemBuilder: (context, index) {
          final item = flowerList[index];
          return Container(
            width: 190,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 235, 245),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 5, 0, 0),
                  blurRadius: 8,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetails2(
                              title: item['title'],
                              image: item['image'],
                              rupees: item['rupees'],
                              description: item['description'],
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: Image.asset(
                          item['image'],
                          height: 110,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item["title"],
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${item['quantity']}, Price",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹${item["rupees"]}.00",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => addToFavorites(item),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.red.shade600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            CartItem cartItem = CartItem(
                              title: item['title'],
                              image: item['image'],
                              price: item['rupees'],
                              description: item['description'],
                              quantity: 1,
                            );
                            await addToCart(cartItem);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Added to cart",
                                    style: GoogleFonts.quicksand()),
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.add,
                                color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 255),
      appBar: AppBar(
        title: Text(
          "Flowers",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 136, 36),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search for Flowers",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query.toLowerCase();
                  });
                },
              ),
            ),
            buildFlowerRow(_searchFlower(flowerList1)),
            buildFlowerRow(_searchFlower(flowerList2)),
            buildFlowerRow(_searchFlower(flowerList3)),
          ],
        ),
      ),
    );
  }
}