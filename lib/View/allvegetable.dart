
// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/Model/cart.dart';
// import 'package:ecommers_app/View/inner_product_details.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class All extends StatefulWidget {
//   const All({super.key});

//   @override
//   _AllState createState() => _AllState();
// }

// class _AllState extends State<All> {
//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = "";

// final List<Map<String, dynamic>> vegList1 = [
//    {
//       'image': 'assets/vegitable/spina.jpg',
//       'title': "Spinach",
//       'quantity': "1 set",
//       'rupees': 13.0,
//       'description':
//           "Spinach 🌿:\nSpinach is a nutrient-dense leafy green known for its versatility in cooking. It is rich in iron, vitamins, and antioxidants, making it a popular choice for a healthy diet. Spinach can be eaten raw in salads, blended into smoothies, or cooked in soups and stews. It is low in calories and packed with vitamins A, C, and K, along with folate and calcium. Spinach is also known to support eye health, boost the immune system, and improve digestion."
//     },
//   {
//     'image': 'assets/vegitable/tomato.jpg',
//     'title': "Tomato",
//     'quantity': "1 kg",
//     'rupees': 40.0,
//     'description':
//         "Tomatoes 🍅: Tomatoes are a versatile fruit that is widely used in Indian cooking. They are rich in vitamin C, antioxidants, and lycopene, which help promote skin health and prevent heart disease. Tomatoes are commonly used in curries, soups, chutneys, and salads. They add a tangy flavor and contribute to the richness of the dish."
//   },
//  {
//     'image': 'assets/vegetable/potato.jpg',
//     'title': "Potato",
//     'quantity': "1 kg",
//     'rupees': 35.0,
//     'description':
//         "Potato 🥔: Potatoes are one of the most widely consumed vegetables in India. Rich in carbohydrates, fiber, and vitamin C, they provide energy and aid digestion. Potatoes are used in a variety of dishes like sabzis, aloo tikki, and parathas, and are versatile enough to be fried, mashed, or roasted."
//   },
//   {
//     'image': 'assets/vegetable/bottle_gourd.jpg',
//     'title': "Bottle Gourd",
//     'quantity': "1 medium",
//     'rupees': 20.0,
//     'description':
//         "Bottle Gourd 🥒: Bottle gourd, or Lauki, is a popular vegetable in Indian homes due to its light, refreshing taste and health benefits. It is low in calories, aids digestion, and helps in maintaining a healthy heart. Bottle gourd is commonly used in curries, soups, and juices, and is known for its ability to cool the body."
//   },
//   {
//     'image': 'assets/vegetable/cucumber.jpg',
//     'title': "Cucumber",
//     'quantity': "1 kg",
//     'rupees': 30.0,
//     'description':
//         "Cucumber 🥒: Cucumbers are hydrating and low in calories, making them a perfect vegetable for summer. They are rich in antioxidants, fiber, and vitamin K, and are commonly used in salads, raitas, and as a garnish. Cucumbers are also known for their cooling effect on the body."
//   },
// ];

// final List<Map<String, dynamic>> vegList2 = [
//  {
//     'image': 'assets/pesticide/Imidacloprid.jpg',
//     'title': "Imidacloprid",
//     'quantity': "500 ml",
//     'rupees': 230.0,
//     'description':
//         "Imidacloprid: Imidacloprid is a systemic insecticide used to control pests like whiteflies, rootworms, and termites. It is effective in crops such as cotton, paddy, and vegetables. Imidacloprid works by interfering with the insect's nervous system. It is effective even at low concentrations, but should be used carefully to avoid harm to pollinators."
//   },
//   {
//     'image': 'assets/vegetable/potato.jpg',
//     'title': "Potato",
//     'quantity': "1 kg",
//     'rupees': 35.0,
//     'description':
//         "Potato 🥔: Potatoes are one of the most widely consumed vegetables in India. Rich in carbohydrates, fiber, and vitamin C, they provide energy and aid digestion. Potatoes are used in a variety of dishes like sabzis, aloo tikki, and parathas, and are versatile enough to be fried, mashed, or roasted."
//   },
//   {
//       'image': 'assets/vegitable/mango.jpg',
//       'title': "Mango",
//       'quantity': "2 set",
//       'rupees': 80.0,
//       'description':
//           " Mango 🥭:\nMango, the 'king of fruits', is a tropical favorite with juicy, golden-yellow flesh and a sweet, aromatic flavor. It’s a rich source of Vitamin C, Vitamin A, and antioxidants that promote eye health and boost immunity. Mangoes can be enjoyed fresh, made into juices, added to desserts, or used in savory dishes like chutneys."
//     },
//   {
//     'image': 'assets/vegetable/okra.jpg',
//     'title': "Okra",
//     'quantity': "1 kg",
//     'rupees': 40.0,
//     'description':
//         "Okra 🍠: Okra, or bhindi, is a nutritious vegetable known for its high fiber content and vitamin C. It is commonly used in stir-fries, curries, and pickles. Okra supports healthy digestion, reduces blood sugar levels, and helps maintain heart health."
//   },
//   {
//       'image': 'assets/vegitable/ca.jpg',
//       'title': "Custordapple",
//       'quantity': "1 set",
//       'rupees': 60.0,
//       'description':
//           " Custard Apple 🍈:\nCustard apple, also known as sitaphal, is a creamy, sweet fruit with green, bumpy skin and soft, white flesh. It’s high in Vitamin C, potassium, and dietary fiber, promoting heart health and aiding digestion. Custard apples are often eaten fresh by scooping out the flesh and are also used in desserts like ice creams and milkshakes.",
//     },
// ];

// final List<Map<String, dynamic>> vegList3 = [
//    {
//       'image': 'assets/vegitable/grapes.jpg',
//       'title': "Grapes Leaves",
//       'quantity': "2 set",
//       'rupees': 80.0,
//       'description':
//           "Grapes Leaves 🍇:\nGrapes leaves are often used in Mediterranean cuisine for wrapping foods like dolma (stuffed grape leaves). They are high in antioxidants and nutrients like vitamins A, C, and K. When cooked, grape leaves take on a tender texture and can be a healthy addition to wraps, salads, and stews. Rich in fiber, they support digestive health and help regulate blood sugar levels."
//     },
//   {
//     'image': 'assets/vegetable/peas.jpg',
//     'title': "Green Peas",
//     'quantity': "500 g",
//     'rupees': 40.0,
//     'description':
//         "Green Peas 🍃: Green peas are an excellent source of vitamins A, B, and C, as well as dietary fiber. They are commonly used in Indian dishes like aloo matar, curries, and pulao. Green peas promote digestion and are known to help lower cholesterol levels."
//   },
//    {
//       'image': 'assets/vegitable/wat.jpg',
//       'title': "Watermelon",
//       'quantity': "1 set",
//       'rupees': 70.0,
//       'description':
//           "Watermelon 🍉:\nWatermelon is a large, refreshing fruit known for its green rind and juicy red or pink interior filled with black seeds. It's composed of over 90% water, making it an excellent choice for hydration on hot days. Watermelons are rich in vitamins A and C, antioxidants, and lycopene, which supports heart health and reduces inflammation. They are often eaten fresh, blended into smoothies, or served in fruit salads."
//     },
//   {
//     'image': 'assets/vegetable/corn.jpg',
//     'title': "Corn",
//     'quantity': "500 g",
//     'rupees': 30.0,
//     'description':
//         "Corn 🌽: Corn is a popular vegetable used in a variety of Indian dishes, such as corn and peas pulao, and as a snack. It is rich in fiber, antioxidants, and B vitamins. Corn promotes digestive health and provides energy, making it a great addition to a balanced diet."
//   },
//   {
//     'image': 'assets/vegetable/radish.jpg',
//     'title': "Radish",
//     'quantity': "500 g",
//     'rupees': 20.0,
//     'description':
//         "Radish 🌶️: Radishes are crunchy root vegetables known for their spicy flavor. They are rich in vitamin C, fiber, and antioxidants. In Indian cuisine, they are often used in salads, raitas, or pickles. Radishes help with detoxification, improve digestion, and support skin health."
//   },
// ];





//   List<Map<String, dynamic>> _searchVegetables(
//       List<Map<String, dynamic>> allList) {
//     return allList
//         .where((all) =>
//             all['title'].toLowerCase().contains(_searchQuery) ||
//             all['description'].toLowerCase().contains(_searchQuery))
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

//   Widget buildallRow(List<Map<String, dynamic>> allList) {
//     return SizedBox(
//       height: 320,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: allList.length,
//         itemBuilder: (context, index) {
//           final item = allList[index];
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
//                                  ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text("Added to  cart"),
//                                     backgroundColor: Colors.green,
//                                     duration: Duration(seconds: 2),
//                                   ),
//                                 );
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
//           "All",
//           style: GoogleFonts.quicksand(
//             fontWeight: FontWeight.bold,
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
//                   hintText: "Search.....",
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (query) {
//                   setState(() {
//                     _searchQuery = query.toLowerCase();
//                   });
//                 },
//               ),
//             ),
//             buildallRow(_searchVegetables(vegList1)),
//             buildallRow(_searchVegetables(vegList2)),
//             buildallRow(_searchVegetables(vegList3)),
//           ],
//         ),
//       ),
//     );
//   }
// }


// final page- 18/7/25


import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/cart.dart';
import 'package:ecommers_app/View/inner_product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

final List<Map<String, dynamic>> vegList1 = [
   {
      'image': 'assets/vegitable/spina.jpg',
      'title': "Spinach",
      'quantity': "1 set",
      'rupees': 13.0,
      'description':
          "Spinach 🌿:\nSpinach is a nutrient-dense leafy green known for its versatility in cooking. It is rich in iron, vitamins, and antioxidants, making it a popular choice for a healthy diet. Spinach can be eaten raw in salads, blended into smoothies, or cooked in soups and stews. It is low in calories and packed with vitamins A, C, and K, along with folate and calcium. Spinach is also known to support eye health, boost the immune system, and improve digestion."
    },
  {
    'image': 'assets/vegitable/tomato.jpg',
    'title': "Tomato",
    'quantity': "1 kg",
    'rupees': 40.0,
    'description':
        "Tomatoes 🍅: Tomatoes are a versatile fruit that is widely used in Indian cooking. They are rich in vitamin C, antioxidants, and lycopene, which help promote skin health and prevent heart disease. Tomatoes are commonly used in curries, soups, chutneys, and salads. They add a tangy flavor and contribute to the richness of the dish."
  },
 {
    'image': 'assets/vegetable/potato.jpg',
    'title': "Potato",
    'quantity': "1 kg",
    'rupees': 35.0,
    'description':
        "Potato 🥔: Potatoes are one of the most widely consumed vegetables in India. Rich in carbohydrates, fiber, and vitamin C, they provide energy and aid digestion. Potatoes are used in a variety of dishes like sabzis, aloo tikki, and parathas, and are versatile enough to be fried, mashed, or roasted."
  },
  {
    'image': 'assets/vegetable/bottle_gourd.jpg',
    'title': "Bottle Gourd",
    'quantity': "1 medium",
    'rupees': 20.0,
    'description':
        "Bottle Gourd 🥒: Bottle gourd, or Lauki, is a popular vegetable in Indian homes due to its light, refreshing taste and health benefits. It is low in calories, aids digestion, and helps in maintaining a healthy heart. Bottle gourd is commonly used in curries, soups, and juices, and is known for its ability to cool the body."
  },
  {
    'image': 'assets/vegetable/cucumber.jpg',
    'title': "Cucumber",
    'quantity': "1 kg",
    'rupees': 30.0,
    'description':
        "Cucumber 🥒: Cucumbers are hydrating and low in calories, making them a perfect vegetable for summer. They are rich in antioxidants, fiber, and vitamin K, and are commonly used in salads, raitas, and as a garnish. Cucumbers are also known for their cooling effect on the body."
  },
];

final List<Map<String, dynamic>> vegList2 = [
 {
    'image': 'assets/pesticide/Imidacloprid.jpg',
    'title': "Imidacloprid",
    'quantity': "500 ml",
    'rupees': 230.0,
    'description':
        "Imidacloprid: Imidacloprid is a systemic insecticide used to control pests like whiteflies, rootworms, and termites. It is effective in crops such as cotton, paddy, and vegetables. Imidacloprid works by interfering with the insect's nervous system. It is effective even at low concentrations, but should be used carefully to avoid harm to pollinators."
  },
  {
    'image': 'assets/vegetable/potato.jpg',
    'title': "Potato",
    'quantity': "1 kg",
    'rupees': 35.0,
    'description':
        "Potato 🥔: Potatoes are one of the most widely consumed vegetables in India. Rich in carbohydrates, fiber, and vitamin C, they provide energy and aid digestion. Potatoes are used in a variety of dishes like sabzis, aloo tikki, and parathas, and are versatile enough to be fried, mashed, or roasted."
  },
  {
      'image': 'assets/vegitable/mango.jpg',
      'title': "Mango",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          " Mango 🥭:\nMango, the 'king of fruits', is a tropical favorite with juicy, golden-yellow flesh and a sweet, aromatic flavor. It’s a rich source of Vitamin C, Vitamin A, and antioxidants that promote eye health and boost immunity. Mangoes can be enjoyed fresh, made into juices, added to desserts, or used in savory dishes like chutneys."
    },
  {
    'image': 'assets/vegetable/okra.jpg',
    'title': "Okra",
    'quantity': "1 kg",
    'rupees': 40.0,
    'description':
        "Okra 🍠: Okra, or bhindi, is a nutritious vegetable known for its high fiber content and vitamin C. It is commonly used in stir-fries, curries, and pickles. Okra supports healthy digestion, reduces blood sugar levels, and helps maintain heart health."
  },
  {
      'image': 'assets/vegitable/ca.jpg',
      'title': "Custordapple",
      'quantity': "1 set",
      'rupees': 60.0,
      'description':
          " Custard Apple 🍈:\nCustard apple, also known as sitaphal, is a creamy, sweet fruit with green, bumpy skin and soft, white flesh. It’s high in Vitamin C, potassium, and dietary fiber, promoting heart health and aiding digestion. Custard apples are often eaten fresh by scooping out the flesh and are also used in desserts like ice creams and milkshakes.",
    },
];

final List<Map<String, dynamic>> vegList3 = [
   {
      'image': 'assets/vegitable/grapes.jpg',
      'title': "Grapes Leaves",
      'quantity': "2 set",
      'rupees': 80.0,
      'description':
          "Grapes Leaves 🍇:\nGrapes leaves are often used in Mediterranean cuisine for wrapping foods like dolma (stuffed grape leaves). They are high in antioxidants and nutrients like vitamins A, C, and K. When cooked, grape leaves take on a tender texture and can be a healthy addition to wraps, salads, and stews. Rich in fiber, they support digestive health and help regulate blood sugar levels."
    },
  {
    'image': 'assets/vegetable/peas.jpg',
    'title': "Green Peas",
    'quantity': "500 g",
    'rupees': 40.0,
    'description':
        "Green Peas 🍃: Green peas are an excellent source of vitamins A, B, and C, as well as dietary fiber. They are commonly used in Indian dishes like aloo matar, curries, and pulao. Green peas promote digestion and are known to help lower cholesterol levels."
  },
   {
      'image': 'assets/vegitable/wat.jpg',
      'title': "Watermelon",
      'quantity': "1 set",
      'rupees': 70.0,
      'description':
          "Watermelon 🍉:\nWatermelon is a large, refreshing fruit known for its green rind and juicy red or pink interior filled with black seeds. It's composed of over 90% water, making it an excellent choice for hydration on hot days. Watermelons are rich in vitamins A and C, antioxidants, and lycopene, which supports heart health and reduces inflammation. They are often eaten fresh, blended into smoothies, or served in fruit salads."
    },
  {
    'image': 'assets/vegetable/corn.jpg',
    'title': "Corn",
    'quantity': "500 g",
    'rupees': 30.0,
    'description':
        "Corn 🌽: Corn is a popular vegetable used in a variety of Indian dishes, such as corn and peas pulao, and as a snack. It is rich in fiber, antioxidants, and B vitamins. Corn promotes digestive health and provides energy, making it a great addition to a balanced diet."
  },
  {
    'image': 'assets/vegetable/radish.jpg',
    'title': "Radish",
    'quantity': "500 g",
    'rupees': 20.0,
    'description':
        "Radish 🌶️: Radishes are crunchy root vegetables known for their spicy flavor. They are rich in vitamin C, fiber, and antioxidants. In Indian cuisine, they are often used in salads, raitas, or pickles. Radishes help with detoxification, improve digestion, and support skin health."
  },
];


  List<Map<String, dynamic>> _searchVegetables(List<Map<String, dynamic>> list) {
    return list
        .where((veg) =>
            veg['title'].toLowerCase().contains(_searchQuery) ||
            veg['description'].toLowerCase().contains(_searchQuery))
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

  Widget buildAllRow(List<Map<String, dynamic>> list) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return Container(
            width: 190,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 235, 245),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                   color: const Color.fromARGB(255, 0, 12, 0).withOpacity(0.9),
                  blurRadius: 8,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => addToFavorites(item),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red.shade600,
                    ),
                  ),
                ),
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
          "All",
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
                  hintText: "Search in All items",
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
            buildAllRow(_searchVegetables(vegList1)),
            buildAllRow(_searchVegetables(vegList2)),
            buildAllRow(_searchVegetables(vegList3)),
          ],
        ),
      ),
    );
  }
}


