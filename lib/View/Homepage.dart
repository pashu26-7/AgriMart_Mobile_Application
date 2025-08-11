// // // final

// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/View/allvegetable.dart';
// import 'package:ecommers_app/View/cart_screen.dart';
// import 'package:ecommers_app/View/checkout.dart';
// import 'package:ecommers_app/View/custom_drawer.dart';
// import 'package:ecommers_app/View/favourite.dart';
// import 'package:ecommers_app/View/flower.dart';
// import 'package:ecommers_app/View/fruits.dart';
// import 'package:ecommers_app/View/leafy.dart';
// import 'package:ecommers_app/View/notification.dart';
// // import 'package:ecommers_app/View/leafy.dart';
// // import 'package:ecommers_app/View/order.dart';
// import 'package:ecommers_app/View/orderhis.dart';
// import 'package:ecommers_app/View/pesticide.dart';
// import 'package:ecommers_app/View/vegi.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeScreen extends StatefulWidget {
//   final name;
//   const HomeScreen({super.key, this.name});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String? name;
//   String? email;

//   @override
//   void initState() {
//     log("init state");
//     fetchData();

//     _loadUserData();
//     super.initState();
//     super.initState();
//     _searchController.addListener(_filterSearchResults);
//     filteredCategoryImages = categoryImages;
//     filteredPopularImages = popularImages;
//     filteredTopImages = topImages;
//   }

//   void fetchData() async {
//     QuerySnapshot response =
//         await FirebaseFirestore.instance.collection("users").get();

//     for (int i = 0; i < response.docs.length; i++) {
//       log("NAME NAED:- ${response.docs[i]['name']}");
//       log("NAME EMAIL :- ${response.docs[i]['email']}");

//       if (email == response.docs[i]['email']) {
//         log("NAME :- ${response.docs[i]['name']}");

//         name = response.docs[i]['name'];
//       }
//     }
//     setState(() {});
//   }

//   Future<void> _loadUserData() async {
//     // ignore: unused_element
//     void fetchData() async {
//       QuerySnapshot response =
//           await FirebaseFirestore.instance.collection("users").get();

//       for (int i = 0; i < response.docs.length; i++) {
//         if (email == response.docs[i]['email']) {
//           log("NAME :- ${response.docs[i]['name']}");

//           name = response.docs[i]['name'];
//         }
//       }
//     }

//     final prefs = await SharedPreferences.getInstance();
//     String? retrievedName = name;
//     String? retrievedEmail = prefs.getString('email');

//     // If name and email are not found in SharedPreferences, fallback to Firebase user data
//     if (retrievedName == null || retrievedEmail == null) {
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         retrievedName =
//             user.displayName ?? "Your Name"; // Fallback if no display name
//         retrievedEmail = user.email ?? "Your Email"; // Fallback if no email
//       }
//     }

//     log('Retrieved Name: $retrievedName');
//     log('Retrieved Email: $retrievedEmail');

//     setState(() {
//       name = retrievedName ?? "Your Name"; // Default value if name is null
//       email = retrievedEmail ?? "Your Email"; // Default value if email is null
//     });
//   }

//   final List<String> categories = [
//     'Category 1',
//     'Category 2',
//     'Category 3',
//     'Category 4',
//     'Category 5',
//     'Category 6',
//     'Category 7',
//   ];
//   bool showAllCategories = false;

//   int _selectedIndex = 0;
//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = "";
//   List<Map<String, String>> favoriteItems = [];

//   List<Map<String, String>> categoryImages = [
//     {"imageUrl": "assets/images/all.jpg", "name": "All"},
//     {"imageUrl": "assets/images/broccali.png", "name": "Leafy vegetables"},
//     {"imageUrl": "assets/images/fruits.jpeg", "name": "Fruits"},
//     {"imageUrl": "assets/images/vegetable2.jpeg", "name": "Vegetables"},
//     {"imageUrl": "assets/images/flower.jpeg", "name": "Flowers"},
//     {"imageUrl": "assets/images/pestisides.jpg", "name": "Pestisides"},
//   ];

//   List<Map<String, String>> popularImages = [
//     {
//       "imageUrl": "assets/images/apple.jpeg",
//       "name": "Apple",
//       "description":
//           "Apple 🍎:\nApples are one of the most widely consumed fruits worldwide, known for their crisp texture, sweet or tart flavor, and vibrant colors like red, green, and yellow. Rich in essential nutrients like fiber, Vitamin C, and antioxidants, apples are excellent for boosting the immune system, promoting digestion, and supporting heart health. They are a great low-calorie snack and are often enjoyed fresh, juiced, or used in baking and cooking, such as in apple pies, salads, and smoothies. Apples are convenient, versatile, and provide a healthy, refreshing boost to your daily diet.",
//       "price": "₹60/kg"
//     },
//     {
//       "imageUrl": "assets/images/banana.jpg",
//       "name": "Banana",
//       "description":
//           "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
//       "price": "₹50dozen"
//     },
//     {
//       "imageUrl": "assets/images/orange.jpeg",
//       "name": "Orange",
//       "description":
//           "Orange 🍊:\nOranges are a popular citrus fruit recognized for their tangy, refreshing flavor and vibrant orange skin. Packed with Vitamin C, antioxidants, and fiber, oranges are perfect for supporting immunity, improving skin health, and enhancing digestion. They are commonly eaten fresh, juiced, or used in cooking and baking to add a burst of flavor. Oranges are an excellent hydrating fruit, rich in nutrients that help maintain overall health and energy levels, making them a go-to choice for a nutritious snack or beverage.",
//       "price": "₹80/kg"
//     },
//     {
//       "imageUrl": "assets/images/peru.jpeg",
//       "name": "Gauva",
//       "description":
//           "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
//       "price": "₹50dozen"
//     },
//     {
//       "imageUrl": "assets/images/peru.jpeg",
//       "name": "Gauva",
//       "description":
//           "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
//       "price": "₹50dozen"
//     },
//   ];

//   List<Map<String, String>> topImages = [
//     {
//       "imageUrl": "assets/images/peru.jpeg",
//       "name": "Gauva",
//       "description":
//           "Guava 🍈:\nGuavas are tropical fruits with a distinctive aroma, green or yellow skin, and succulent pink or white flesh, often dotted with small edible seeds. They are a nutritional powerhouse, exceptionally high in Vitamin C, fiber, and antioxidants, contributing to stronger immunity, improved digestion, and glowing skin. Guavas also contain potassium, which supports heart health, and are known for their ability to regulate blood sugar levels. They can be enjoyed fresh, sprinkled with chili powder and salt for a tangy treat, or processed into delicious jams, jellies, and juices. Guavas are a blend of taste and wellness, cherished across tropical regions.",
//       "price": "₹60/kg"
//     },
//     {
//       "imageUrl": "assets/images/tomato.jpg",
//       "name": "Tomato",
//       "description":
//           "Tomato 🍅:\nTomatoes are vibrant red, juicy fruits often mistaken for vegetables due to their savory flavor and culinary use. They are rich in essential nutrients, including Vitamin C, Vitamin A, potassium, and lycopene, a powerful antioxidant known for its role in promoting heart health and reducing the risk of chronic diseases. Tomatoes enhance skin health, improve digestion, and boost immunity. Their versatility in cooking makes them indispensable, featuring in fresh salads, hearty soups, tangy sauces, salsas, juices, and even pizzas. Tomatoes are a cornerstone of global cuisines, offering a balance of nutrition and taste.",
//       "price": "₹30/kg"
//     },
//     {
//       "imageUrl": "assets/images/banana.jpg",
//       "name": "Banana",
//       "description":
//           "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
//       "price": "₹50/dozen"
//     },
//     {
//       "imageUrl": "assets/images/karate.jpeg",
//       "name": "Karate",
//       "description":
//           "Karate (Pesticide) 🛡️:\nKarate is a highly effective pesticide widely used in agriculture to protect crops from pests and insects such as aphids, caterpillars, and beetles. Known for its fast-acting properties, Karate ensures healthy crop yields by targeting harmful pests while minimizing harm to beneficial insects and the environment. It is commonly applied to vegetables, fruits, and ornamental plants, ensuring that they remain vibrant and pest-free. Karate is an integral part of modern, sustainable farming practices, helping farmers maintain high-quality produce and reduce crop losses caused by infestations.",
//       "price": "₹250/500ml"
//     },
//     {
//     'imageUrl': 'assets/vegetable/sweet_potato.jpg',
//     'name': "Sweet Potato",
//     // 'quantity': "1 kg",
//     'price': "50.0/kg",
//     'description':
//         "Sweet Potato 🍠: Sweet potatoes are rich in fiber, antioxidants, and vitamins A and C. They are versatile in cooking and can be used in curries, fries, or even desserts. Sweet potatoes help regulate blood sugar, support gut health, and improve immune function."
//   },
//     {
//       'imageUrl': 'assets/flower/askoka.jpg',
//       'name': "Ashoka Flower	",
//       // 'quantity': "2 set",
//       'price': "80.0//set",
//       'description':
//           "Tatsoi 🌿:\nSacred in Indian culture, Ashoka flowers are used in religious rituals and Ayurveda to treat gynecological issues. The tree is associated with fertility and is revered in Hindu mythology.."
//     },
//     {
//       'imageUrl': 'assets/vegitable/avacoda1.jpg',
//       'name': "Avacoda",
//       // 'quantity': "2 set",
//       'price': "90.0/set",
//       'description':
//           " Avocado 🥑\nAvocado is a creamy, nutrient-dense fruit with a green, leathery skin and soft, buttery flesh. It's rich in healthy monounsaturated fats, Vitamin E, potassium, and fiber, making it great for heart health and skin. Avocados are versatile and can be used in salads, spreads like guacamole, smoothies, or eaten plain with a sprinkle of salt and pepper.",
//     },
//     {
//       'imageUrl': 'assets/flower/hibis.jpg',
//       'name': "Hibiscus	",
//       // 'quantity': "1 set",
//       'price': "60.0/set",
//       'description':
//           "Orach 🌱:\nThis bright red flower is sacred to Goddess Kali and Lord Ganesha. Hibiscus tea, made from its petals, is rich in antioxidants and beneficial for heart health. In Ayurveda, the flower is used for hair care and skin treatments. Its vibrant color also makes it a popular ornamental plant in Indian gardens."
//     },
//     {
//       'imageUrl': 'assets/vegitable/cherry.jpg',
//       'name': "Cherry",
//       // 'quantity': "2 set",
//       'price': "80.0/set",
//       'description':
//           "Cherry 🍒 :\nCherries are small, round, and vibrant red fruits celebrated for their sweet and tart flavors, juicy flesh, and glossy skin. Packed with essential nutrients, they are an excellent source of Vitamin C, potassium, antioxidants, and dietary fiber. These nutrients contribute to their health benefits, including supporting heart health, reducing inflammation, and promoting better sleep due to their natural melatonin content.Cherries are versatile and widely used in culinary dishes, enjoyed fresh as a snack, or incorporated into desserts like pies, tarts, jams, and cakes. They are also a delightful addition to smoothies, salads, and even savory recipes. Their unique taste, paired with impressive nutritional value, makes cherries a cherished treat worldwide."
//     },

//   ];
//   List<Map<String, String>> favorites = [];

//   List<Map<String, String>> filteredCategoryImages = [];
//   List<Map<String, String>> filteredPopularImages = [];
//   List<Map<String, String>> filteredTopImages = [];

//   // @override
//   // void initState() {
//   //   log("NAme ${widget.name}");
//   //   super.initState();
//   //   _searchController.addListener(_filterSearchResults);
//   //   filteredCategoryImages = categoryImages;
//   //   filteredPopularImages = popularImages;
//   //   filteredTopImages = topImages;
//   // }

//   void _filterSearchResults() {
//     setState(() {
//       _searchQuery = _searchController.text.toLowerCase();
//       filteredCategoryImages = categoryImages
//           .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
//           .toList();
//       filteredPopularImages = popularImages
//           .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
//           .toList();
//       filteredTopImages = topImages
//           .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
//           .toList();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const OrderHistoryScreen()),
//       ).then((_) {
//         setState(() {
//           _selectedIndex = 0;
//         });
//       });
//     } else if (index == 2) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => Favourite(favoriteItems: favorites)),
//       )

//       .then((_) {
//         setState(() {
//           _selectedIndex = 0;
//         });
//       });
//     } else if (index == 3) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) =>  const CheckoutScreen()),
//       ).then((_) {
//         setState(() {
//           _selectedIndex = 0;
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const CustomDrawer(),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 33, 136, 36),
//         elevation: 0,
//         title: Row(
//           children: [
//             const  Text(
//             "Hello, ",
//             style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//              Text(
//             name ?? "Loading..",
//             style: const TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),

//           ],
//         ),
//         actions: [
//           Stack(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.notifications,
//                     size: 35, color: Colors.white),
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const NotificationPage()));
//                 },
//               ),
//               Positioned(
//                 right: 8,
//                 top: 8,
//                 child: Container(
//                   padding: const EdgeInsets.all(2),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   constraints: const BoxConstraints(
//                     minWidth: 17,
//                     minHeight: 17,
//                   ),
//                   child: const Text(
//                     '4',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 10,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "What do you want to Buy?",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.search),
//                 hintText: "Search here...",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView(
//                 children: [
//                   buildSectionTitle("Categories", context),
//                   buildHorizontalList(filteredCategoryImages),
//                   buildSectionTitle("Popular", context),
//                   buildHorizontalList1(filteredPopularImages),
//                   buildSectionTitle("Top Picks", context),
//                   buildVerticalGrid(filteredTopImages),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home_sharp,
//               color: _selectedIndex == 0
//                   ? const Color.fromARGB(255, 33, 136, 36)
//                   : Colors.grey,
//               size: 40,
//             ),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.shopify_outlined,
//               color: _selectedIndex == 1
//                   ? const Color.fromARGB(255, 33, 136, 36)
//                   : Colors.grey,
//               size: 40,
//             ),
//             label: "Order",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.favorite,
//               color: _selectedIndex == 2
//                   ? const Color.fromARGB(255, 33, 136, 36)
//                   : Colors.grey,
//               size: 40,
//             ),
//             label: "Favourite",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.shopping_cart_outlined,
//               color: _selectedIndex == 3
//                   ? const Color.fromARGB(255, 33, 136, 36)
//                   : Colors.grey,
//               size: 40,
//             ),
//             label: "Cart",
//           ),
//         ],
//         selectedItemColor: const Color.fromARGB(255, 33, 136, 36),
//         unselectedItemColor: Colors.grey,
//       ),
//     );
//   }

// //  @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         buildSectionTitle("Categories", context),
// //         buildCategoryList(),
// //       ],
// //     );
// //   }
//   Widget buildSectionTitle(String title, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 // Toggle visibility of full category list
//                 showAllCategories = !showAllCategories;
//               });
//             },
//             child: Text(
//               showAllCategories ? "Show Less" : "See All",
//               style: GoogleFonts.quicksand(
//                   fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//           )
//         ],
//       ),
//     );
//   }

// // 1st row -category
//   Widget buildHorizontalList(List<Map<String, String>> imageDetails) {
//     return SizedBox(
//       height: 100,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: imageDetails.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate based on the category name
//                     switch (imageDetails[index]['name']) {
//                        case "All":
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const All()));
//                         break;
//                       case "Fruits":
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>const  Fruitscreen()));
//                         break;
//                       case "Vegetables":
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const   Vegetables()));
//                         break;
//                       case "Leafy vegetables":
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>  const Leaf()));
//                         break;
//                       case "Flowers":
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => const Flower()));
//                         break;
//                       case "Pestisides":
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>const  pesticide()));
//                         break;
//                       default:
//                         break;
//                     }
//                   },
//                   child: Container(
//                     width: 70,
//                     height: 70,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage(imageDetails[index]['imageUrl']!),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   imageDetails[index]['name']!,
//                   style: GoogleFonts.quicksand(
//                       fontSize: 15, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   /// 2nd  row- popular
//   Widget buildHorizontalList1(List<Map<String, String>> imageDetails) {
//     return SizedBox(
//       height: 100,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: imageDetails.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate based on the category name
//                     switch (imageDetails[index]['name']) {
//                       case "Apple":
//                         var name = imageDetails[index]['name'];
//                         var image = imageDetails[index]['imageUrl'];
//                         var priceString = imageDetails[index]['price'];
//                         var description = imageDetails[index]['description'];

//                         print(
//                             'name: $name, image: $image, priceString: $priceString, description: $description');
//                         if (name != null &&
//                             image != null &&
//                             priceString != null &&
//                             description != null) {
//                           double price = 0.0;
//                           try {
//                             price = double.parse(
//                                 priceString.replaceAll(RegExp(r'[^\d.]'), ''));
//                           } catch (e) {
//                             price = 0.0;
//                           }
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => ProductDetails(
//                               name: name,
//                               image: image,
//                               price: price,
//                               description: description,
//                             ),
//                           ));
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 content:
//                                     Text('Missing data for Apple product')),
//                           );
//                         }
//                         break;

//                       case "Banana":
//                         var name = imageDetails[index]['name'];
//                         var image = imageDetails[index]['imageUrl'];
//                         var priceString = imageDetails[index]['price'];
//                         var description = imageDetails[index]['description'];

//                         print(
//                             'name: $name, image: $image, priceString: $priceString, description: $description');
//                         if (name != null &&
//                             image != null &&
//                             priceString != null &&
//                             description != null) {
//                           double price = 0.0;
//                           try {
//                             price = double.parse(
//                                 priceString.replaceAll(RegExp(r'[^\d.]'), ''));
//                           } catch (e) {
//                             price = 0.0;
//                           }
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => ProductDetails(
//                               name: name,
//                               image: image,
//                               price: price,
//                               description: description,
//                             ),
//                           ));
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 content:
//                                     Text('Missing data for Banana product')),
//                           );
//                         }
//                         break;

//                       case "Orange":
//                         var name = imageDetails[index]['name'];
//                         var image = imageDetails[index]['imageUrl'];
//                         var priceString = imageDetails[index]['price'];
//                         var description = imageDetails[index]['description'];

//                         print(
//                             'name: $name, image: $image, priceString: $priceString, description: $description');
//                         if (name != null &&
//                             image != null &&
//                             priceString != null &&
//                             description != null) {
//                           double price = 0.0;
//                           try {
//                             price = double.parse(
//                                 priceString.replaceAll(RegExp(r'[^\d.]'), ''));
//                           } catch (e) {
//                             price = 0.0;
//                           }
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => ProductDetails(
//                               name: name,
//                               image: image,
//                               price: price,
//                               description: description,
//                             ),
//                           ));
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 content:
//                                     Text('Missing data for Orange product')),
//                           );
//                         }
//                         break;
//                       case "Gauva":
//                         var name = imageDetails[index]['name'];
//                         var image = imageDetails[index]['imageUrl'];
//                         var priceString = imageDetails[index]['price'];
//                         var description = imageDetails[index]['description'];

//                         print(
//                             'name: $name, image: $image, priceString: $priceString, description: $description');
//                         if (name != null &&
//                             image != null &&
//                             priceString != null &&
//                             description != null) {
//                           double price = 0.0;
//                           try {
//                             price = double.parse(
//                                 priceString.replaceAll(RegExp(r'[^\d.]'), ''));
//                           } catch (e) {
//                             price = 0.0;
//                           }
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => ProductDetails(
//                               name: name,
//                               image: image,
//                               price: price,
//                               description: description,
//                             ),
//                           ));
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 content:
//                                     Text('Missing data for Gauva product')),
//                           );
//                         }
//                         break;
//                       default:
//                         break;
//                     }
//                   },
//                   child: Container(
//                     width: 70,
//                     height: 70,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage(imageDetails[index]['imageUrl']!),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   imageDetails[index]['name']!,
//                   style: GoogleFonts.quicksand(
//                       fontSize: 15, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//   // top tricks

//   Widget buildVerticalGrid(List<Map<String, String>> imageDetails) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         childAspectRatio: 3 / 4,
//       ),
//       itemCount: imageDetails.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => ProductDetails(
//                   name: imageDetails[index]['name']!,
//                   image: imageDetails[index]['imageUrl']!,
//                   price: double.parse(imageDetails[index]['price']!
//                       .replaceAll(RegExp(r'[^\d.]'), '')),
//                   description: imageDetails[index]['description']!,
//                 ),
//               ),
//             );
//           },
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             elevation: 3,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius:
//                         const BorderRadius.vertical(top: Radius.circular(10)),
//                     child: Image.asset(
//                       imageDetails[index]['imageUrl']!,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         imageDetails[index]['name']!,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         imageDetails[index]['price']!,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//   icon: const Icon(Icons.favorite_border),
//   color: Colors.red,
//   onPressed: () async {
//     final selectedItem = imageDetails[index];
//     final docId = selectedItem['id']; // Ensure each item has a unique ID.

//     // Add item to Firestore
//     await FirebaseFirestore.instance
//         .collection('favorites')
//         .doc(docId) // Use docId to avoid duplicates
//         .set(selectedItem);

//     // Show confirmation SnackBar
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("Added to favorites!", style: TextStyle(color: Colors.green)),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   },
// ),

//                           // IconButton(

//                           //   icon: const Icon(Icons.favorite_border),
//                           //   color: Colors.red,
//                           //   onPressed: () {
//                           //     setState(() {
//                           //       if (!favorites.contains(imageDetails[index])) {
//                           //         favorites.add(
//                           //             imageDetails[index]); // Avoid duplicates
//                           //       }
//                           //       // favorites.add(imageDetails[
//                           //       //     index]); // Add the item to favorites list
//                           //     });

//                           //     // Show confirmation SnackBar
//                           //     ScaffoldMessenger.of(context).showSnackBar(
//                           //       const SnackBar(
//                           //         content: Text("Added to favorites!",
//                           //             style: TextStyle(color: Colors.green)),
//                           //         duration: Duration(seconds: 2),
//                           //       ),
//                           //     );
//                           //   },
//                           // ),

//                           // IconButton(
//                           //   onPressed:(){},
//                           //   icon: Icon(Icons.favorite_border_rounded,
//                           //   color: Colors.red.shade600,)
//                           //   ),
//                           const Spacer(),
//                           IconButton(
//                             icon: const Icon(Icons.add_shopping_cart),
//                             color: Colors.green,
//                             onPressed: () {
//                               // Add to cart logic here
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// final by prashant 17/7/25

// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/Model/customSnaker.dart'; // Assuming this is still used for snackbars
// import 'package:ecommers_app/View/allvegetable.dart';
// import 'package:ecommers_app/View/cart_screen.dart';
// import 'package:ecommers_app/View/checkout.dart';
// import 'package:ecommers_app/View/custom_drawer.dart';
// import 'package:ecommers_app/View/favourite.dart';
// import 'package:ecommers_app/View/flower.dart';
// import 'package:ecommers_app/View/fruits.dart';
// import 'package:ecommers_app/View/leafy.dart';
// import 'package:ecommers_app/View/notification.dart';
// import 'package:ecommers_app/View/orderhis.dart';
// import 'package:ecommers_app/View/pesticide.dart';
// import 'package:ecommers_app/View/vegi.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // IMPORTANT: ProductDetails class is assumed to be defined in a separate file
// // For example, in 'package:ecommers_app/View/product_details.dart'
// // Make sure you have this import and the ProductDetails class defined there.
// // class ProductDetails extends StatelessWidget {
// //   final String name;
// //   final String image;
// //   final double price;
// //   final String description;

// //   const ProductDetails({
// //     Key? key,
// //     required this.name,
// //     required this.image,
// //     required this.price,
// //     required this.description,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(name),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Image.asset(image, fit: BoxFit.cover, width: double.infinity, height: 250),
// //             const SizedBox(height: 16),
// //             Text(
// //               name,
// //               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               '₹${price.toStringAsFixed(2)}',
// //               style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 16),
// //             Text(
// //               description,
// //               style: const TextStyle(fontSize: 16),
// //             ),
// //             // Add to cart button or other actions here
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class HomeScreen extends StatefulWidget {
//   final String? name; // Changed to String? to accept nullable name
//   const HomeScreen({super.key, this.name});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String? _userName; // Renamed to avoid conflict with widget.name
//   String? _userEmail;

//   final TextEditingController _searchController = TextEditingController();
//   String _searchQuery = "";
//   List<Map<String, String>> favoriteItems = []; // Renamed to avoid confusion with the method

//   // --- START OF DATA WITH UNIQUE IDs AND PARSEABLE PRICES ---
//   List<Map<String, String>> categoryImages = [
//     {"id": "cat_all", "imageUrl": "assets/images/all.jpg", "name": "All"},
//     {"id": "cat_leafy", "imageUrl": "assets/images/broccali.png", "name": "Leafy vegetables"},
//     {"id": "cat_fruits", "imageUrl": "assets/images/fruits.jpeg", "name": "Fruits"},
//     {"id": "cat_vegetables", "imageUrl": "assets/images/vegetable2.jpeg", "name": "Vegetables"},
//     {"id": "cat_flowers", "imageUrl": "assets/images/flower.jpeg", "name": "Flowers"},
//     {"id": "cat_pestisides", "imageUrl": "assets/images/pestisides.jpg", "name": "Pestisides"},
//   ];

//   List<Map<String, String>> popularImages = [
//     {
//       "id": "pop_apple",
//       "imageUrl": "assets/images/apple.jpeg",
//       "name": "Apple",
//       "description":
//           "Apple 🍎:\nApples are one of the most widely consumed fruits worldwide, known for their crisp texture, sweet or tart flavor, and vibrant colors like red, green, and yellow. Rich in essential nutrients like fiber, Vitamin C, and antioxidants, apples are excellent for boosting the immune system, promoting digestion, and supporting heart health. They are a great low-calorie snack and are often enjoyed fresh, juiced, or used in baking and cooking, such as in apple pies, salads, and smoothies. Apples are convenient, versatile, and provide a healthy, refreshing boost to your daily diet.",
//       "price": "60.0" // Changed to double string for easier parsing
//     },
//     {
//       "id": "pop_banana",
//       "imageUrl": "assets/images/banana.jpg",
//       "name": "Banana",
//       "description":
//           "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
//       "price": "50.0" // Changed to double string
//     },
//     {
//       "id": "pop_orange",
//       "imageUrl": "assets/images/orange.jpeg",
//       "name": "Orange",
//       "description":
//           "Orange 🍊:\nOranges are a popular citrus fruit recognized for their tangy, refreshing flavor and vibrant orange skin. Packed with Vitamin C, antioxidants, and fiber, oranges are perfect for supporting immunity, improving skin health, and enhancing digestion. They are commonly eaten fresh, juiced, or used in cooking and baking to add a burst of flavor. Oranges are an excellent hydrating fruit, rich in nutrients that help maintain overall health and energy levels, making them a go-to choice for a nutritious snack or beverage.",
//       "price": "80.0" // Changed to double string
//     },
//     {
//       "id": "pop_gauva_1",
//       "imageUrl": "assets/images/peru.jpeg",
//       "name": "Gauva",
//       "description":
//           "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
//       "price": "50.0" // Changed to double string
//     },
//     {
//       "id": "pop_gauva_2",
//       "imageUrl": "assets/images/peru.jpeg",
//       "name": "Gauva",
//       "description":
//           "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
//       "price": "50.0" // Changed to double string
//     },
//   ];

//   List<Map<String, String>> topImages = [
//     {
//       "id": "top_gauva",
//       "imageUrl": "assets/images/peru.jpeg",
//       "name": "Gauva",
//       "description":
//           "Guava 🍈:\nGuavas are tropical fruits with a distinctive aroma, green or yellow skin, and succulent pink or white flesh, often dotted with small edible seeds. They are a nutritional powerhouse, exceptionally high in Vitamin C, fiber, and antioxidants, contributing to stronger immunity, improved digestion, and glowing skin. Guavas also contain potassium, which supports heart health, and are known for their ability to regulate blood sugar levels. They can be enjoyed fresh, sprinkled with chili powder and salt for a tangy treat, or processed into delicious jams, jellies, and juices. Guavas are a blend of taste and wellness, cherished across tropical regions.",
//       "price": "60.0" // Changed to double string
//     },
//     {
//       "id": "top_tomato",
//       "imageUrl": "assets/images/tomato.jpg",
//       "name": "Tomato",
//       "description":
//           "Tomato 🍅:\nTomatoes are vibrant red, juicy fruits often mistaken for vegetables due to their savory flavor and culinary use. They are rich in essential nutrients, including Vitamin C, Vitamin A, potassium, and lycopene, a powerful antioxidant known for its role in promoting heart health and reducing the risk of chronic diseases. Tomatoes enhance skin health, improve digestion, and boost immunity. Their versatility in cooking makes them indispensable, featuring in fresh salads, hearty soups, tangy sauces, salsas, juices, and even pizzas. Tomatoes are a cornerstone of global cuisines, offering a balance of nutrition and taste.",
//       "price": "30.0" // Changed to double string
//     },
//     {
//       "id": "top_banana",
//       "imageUrl": "assets/images/banana.jpg",
//       "name": "Banana",
//       "description":
//           "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
//       "price": "50.0" // Changed to double string
//     },
//     {
//       "id": "top_karate",
//       "imageUrl": "assets/images/karate.jpeg",
//       "name": "Karate",
//       "description":
//           "Karate (Pesticide) 🛡️:\nKarate is a highly effective pesticide widely used in agriculture to protect crops from pests and insects such as aphids, caterpillars, and beetles. Known for its fast-acting properties, Karate ensures healthy crop yields by targeting harmful pests while minimizing harm to beneficial insects and the environment. It is commonly applied to vegetables, fruits, and ornamental plants, ensuring that they remain vibrant and pest-free. Karate is an integral part of modern, sustainable farming practices, helping farmers maintain high-quality produce and reduce crop losses caused by infestations.",
//       "price": "250.0"
//     },
//     {
//       "id": "top_sweet_potato",
//       'imageUrl': 'assets/vegetable/sweet_potato.jpg',
//       'name': "Sweet Potato",
//       'price': "50.0",
//       'description':
//           "Sweet Potato 🍠: Sweet potatoes are rich in fiber, antioxidants, and vitamins A and C. They are versatile in cooking and can be used in curries, fries, or even desserts. Sweet potatoes help regulate blood sugar, support gut health, and improve immune function."
//     },
//     {
//       "id": "top_ashoka",
//       'imageUrl': 'assets/flower/askoka.jpg',
//       'name': "Ashoka Flower",
//       'price': "80.0",
//       'description':
//           "Tatsoi 🌿:\nSacred in Indian culture, Ashoka flowers are used in religious rituals and Ayurveda to treat gynecological issues. The tree is associated with fertility and is revered in Hindu mythology.."
//     },
//     {
//       "id": "top_avacado",
//       'imageUrl': 'assets/vegitable/avacoda1.jpg',
//       'name': "Avacoda",
//       'price': "90.0",
//       'description':
//           " Avocado 🥑\nAvocado is a creamy, nutrient-dense fruit with a green, leathery skin and soft, buttery flesh. It's rich in healthy monounsaturated fats, Vitamin E, potassium, and fiber, making it great for heart health and skin. Avocados are versatile and can be used in salads, spreads like guacamole, smoothies, or eaten plain with a sprinkle of salt and pepper.",
//     },
//     {
//       "id": "top_hibiscus",
//       'imageUrl': 'assets/flower/hibis.jpg',
//       'name': "Hibiscus",
//       'price': "60.0",
//       'description':
//           "Orach 🌱:\nThis bright red flower is sacred to Goddess Kali and Lord Ganesha. Hibiscus tea, made from its petals, is rich in antioxidants and beneficial for heart health. In Ayurveda, the flower is used for hair care and skin treatments. Its vibrant color also makes it a popular ornamental plant in Indian gardens."
//     },
//     {
//       "id": "top_cherry",
//       'imageUrl': 'assets/vegitable/cherry.jpg',
//       'name': "Cherry",
//       'price': "80.0",
//       'description':
//           "Cherry 🍒 :\nCherries are small, round, and vibrant red fruits celebrated for their sweet and tart flavors, juicy flesh, and glossy skin. Packed with essential nutrients, they are an excellent source of Vitamin C, potassium, antioxidants, and dietary fiber. These nutrients contribute to their health benefits, including supporting heart health, reducing inflammation, and promoting better sleep due to their natural melatonin content.Cherries are versatile and widely used in culinary dishes, enjoyed fresh as a snack, or incorporated into desserts like pies, tarts, jams, and cakes. They are also a delightful addition to smoothies, salads, and even savory recipes. Their unique taste, paired with impressive nutritional value, makes cherries a cherished treat worldwide."
//     },
//   ];
//   // --- END OF DATA WITH UNIQUE IDs AND PARSEABLE PRICES ---

//   List<Map<String, String>> filteredCategoryImages = [];
//   List<Map<String, String>> filteredPopularImages = [];
//   List<Map<String, String>> filteredTopImages = [];

//   bool showAllCategories = false;
//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_filterSearchResults);
//     filteredCategoryImages = categoryImages;
//     filteredPopularImages = popularImages;
//     filteredTopImages = topImages;
//     _loadInitialData(); // Load user data when the screen initializes
//   }

//   // Consolidated function to load user data
//   Future<void> _loadInitialData() async {
//     String? tempName = widget.name; // Prioritize name passed from LoginPage
//     String? tempEmail;

//     // Try to load from SharedPreferences
//     final prefs = await SharedPreferences.getInstance();
//     tempName ??= prefs.getString('name'); // Use ??= to assign only if null
//     tempEmail = prefs.getString('email');

//     // If not found in SharedPreferences, try FirebaseAuth current user
//     if (tempName == null || tempEmail == null) {
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         tempName ??= user.displayName;
//         tempEmail ??= user.email;
//       }
//     }

//     // If email is available, fetch the name from Firestore to ensure it's up-to-date
//     if (tempEmail != null) {
//       try {
//         final userDoc = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(tempEmail)
//             .get();
//         if (userDoc.exists && userDoc.data() != null) {
//           tempName = userDoc['name']; // Update name from Firestore
//           log("HomeScreen: Name fetched from Firestore: $tempName");
//         }
//       } catch (e) {
//         log("HomeScreen: Error fetching user name from Firestore: $e");
//       }
//     }

//     setState(() {
//       _userName = tempName ?? "Your Name"; // Default if still null
//       _userEmail = tempEmail ?? "your.email@example.com"; // Default if still null
//     });

//     log('HomeScreen: Final Name: $_userName');
//     log('HomeScreen: Final Email: $_userEmail');
//   }

//   void _filterSearchResults() {
//     setState(() {
//       _searchQuery = _searchController.text.toLowerCase();
//       filteredCategoryImages = categoryImages
//           .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
//           .toList();
//       filteredPopularImages = popularImages
//           .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
//           .toList();
//       filteredTopImages = topImages
//           .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
//           .toList();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const OrderHistoryScreen()),
//       ).then((_) {
//         setState(() {
//           _selectedIndex = 0;
//         });
//       });
//     } else if (index == 2) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => Favourite(favoriteItems: favoriteItems)),
//       ).then((_) {
//         setState(() {
//           _selectedIndex = 0;
//         });
//       });
//     } else if (index == 3) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const CheckoutScreen()),
//       ).then((_) {
//         setState(() {
//           _selectedIndex = 0;
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // --- START OF MEDIA QUERY & BACKGROUND COLOR CHANGES ---
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       drawer: const CustomDrawer(),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 33, 136, 36),
//         elevation: 0,
//         title: Row(
//           children: [
//             Text(
//               "Hello, ",
//               style: TextStyle(
//                 fontSize: screenWidth * 0.06, // Responsive font size
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             Text(
//               _userName ?? "Loading..", // Use _userName state variable
//               style: TextStyle(
//                 fontSize: screenWidth * 0.06, // Responsive font size
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           Stack(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.notifications,
//                     size: screenWidth * 0.08, // Responsive icon size
//                     color: Colors.white),
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const NotificationPage()));
//                 },
//               ),
//               Positioned(
//                 right: screenWidth * 0.02, // Responsive positioning
//                 top: screenHeight * 0.01, // Responsive positioning
//                 child: Container(
//                   padding: const EdgeInsets.all(2),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   constraints: const BoxConstraints(
//                     minWidth: 17,
//                     minHeight: 17,
//                   ),
//                   child: const Text(
//                     '4',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 10,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Container(
//         // Apply the same agri-themed gradient background
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFFA5D6A7), // Light green, like fresh leaves
//               Color(0xFFFFF9C4), // Light yellow/beige, like harvest fields
//             ],
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(screenWidth * 0.025), // Responsive padding
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "What do you want to Buy?",
//                 style: TextStyle(
//                     fontSize: screenWidth * 0.055, // Responsive font size
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(height: screenHeight * 0.015), // Responsive spacing
//               TextField(
//                 controller: _searchController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.search, size: screenWidth * 0.06), // Responsive icon size
//                   hintText: "Search here...",
//                   hintStyle: TextStyle(fontSize: screenWidth * 0.04), // Responsive hint text size
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(screenWidth * 0.075), // Responsive border radius
//                     borderSide: BorderSide.none,
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.015), // Responsive padding
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.025), // Responsive spacing
//               Expanded(
//                 child: ListView(
//                   children: [
//                     buildSectionTitle("Categories", context),
//                     buildHorizontalList(filteredCategoryImages),
//                     buildSectionTitle("Popular", context),
//                     buildHorizontalList1(filteredPopularImages),
//                     buildSectionTitle("Top Picks", context),
//                     buildVerticalGrid(filteredTopImages),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home_sharp,
//               color: _selectedIndex == 0
//                   ? const Color.fromARGB(255, 33, 136, 36)
//                   : Colors.grey,
//               size: screenWidth * 0.09, // Responsive icon size
//             ),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.shopify_outlined,
//               color: _selectedIndex == 1
//                   ? const Color.fromARGB(255, 33, 136, 36)
//                   : Colors.grey,
//               size: screenWidth * 0.09, // Responsive icon size
//             ),
//             label: "Order",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.favorite,
//               color: _selectedIndex == 2
//                   ? const Color.fromARGB(255, 33, 136, 36)
//                   : Colors.grey,
//               size: screenWidth * 0.09, // Responsive icon size
//             ),
//             label: "Favourite",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.shopping_cart_outlined,
//               color: _selectedIndex == 3
//                   ? const Color.fromARGB(255, 33, 136, 36)
//                   : Colors.grey,
//               size: screenWidth * 0.09, // Responsive icon size
//             ),
//             label: "Cart",
//           ),
//         ],
//         selectedItemColor: const Color.fromARGB(255, 33, 136, 36),
//         unselectedItemColor: Colors.grey,
//         selectedLabelStyle: TextStyle(fontSize: screenWidth * 0.03), // Responsive label size
//         unselectedLabelStyle: TextStyle(fontSize: screenWidth * 0.028), // Responsive label size
//       ),
//     );
//   }

//   Widget buildSectionTitle(String title, BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: screenWidth * 0.05, // Responsive font size
//                 fontWeight: FontWeight.bold),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 showAllCategories = !showAllCategories;
//               });
//             },
//             child: Text(
//               showAllCategories ? "Show Less" : "See All",
//               style: GoogleFonts.quicksand(
//                   fontSize: screenWidth * 0.038, // Responsive font size
//                   fontWeight: FontWeight.bold),
//             ),
//           )
//         ],
//       ),
//     );
//   }

// // 1st row -category
//   Widget buildHorizontalList(List<Map<String, String>> imageDetails) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return SizedBox(
//       height: screenHeight * 0.13, // Responsive height
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: imageDetails.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Responsive padding
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     switch (imageDetails[index]['name']) {
//                       case "All":
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => const All()));
//                         break;
//                       case "Fruits":
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Fruitscreen()));
//                         break;
//                       case "Vegetables":
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Vegetables()));
//                         break;
//                       case "Leafy vegetables":
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Leaf()));
//                         break;
//                       case "Flowers":
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => const Flower()));
//                         break;
//                       case "Pestisides":
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const pesticide()));
//                         break;
//                       default:
//                         break;
//                     }
//                   },
//                   child: Container(
//                     width: screenWidth * 0.18, // Responsive width
//                     height: screenWidth * 0.18, // Responsive height
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage(imageDetails[index]['imageUrl']!),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.005), // Responsive spacing
//                 Text(
//                   imageDetails[index]['name']!,
//                   style: GoogleFonts.quicksand(
//                       fontSize: screenWidth * 0.035, // Responsive font size
//                       fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   /// 2nd row- popular
//   Widget buildHorizontalList1(List<Map<String, String>> imageDetails) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return SizedBox(
//       height: screenHeight * 0.13, // Responsive height
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: imageDetails.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Responsive padding
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     var name = imageDetails[index]['name'];
//                     var image = imageDetails[index]['imageUrl'];
//                     var priceString = imageDetails[index]['price'];
//                     var description = imageDetails[index]['description'];

//                     if (name != null &&
//                         image != null &&
//                         priceString != null &&
//                         description != null) {
//                       double price = 0.0;
//                       try {
//                         price = double.parse(priceString);
//                       } catch (e) {
//                         log("Error parsing price: $e");
//                         price = 0.0;
//                       }
//                       // Assuming ProductDetails is imported from elsewhere
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => ProductDetails(
//                           name: name,
//                           image: image,
//                           price: price,
//                           description: description,
//                         ),
//                       ));
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                             content: Text('Missing data for product')),
//                       );
//                     }
//                   },
//                   child: Container(
//                     width: screenWidth * 0.18, // Responsive width
//                     height: screenWidth * 0.18, // Responsive height
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage(imageDetails[index]['imageUrl']!),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.005), // Responsive spacing
//                 Text(
//                   imageDetails[index]['name']!,
//                   style: GoogleFonts.quicksand(
//                       fontSize: screenWidth * 0.035, // Responsive font size
//                       fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // top tricks
//   Widget buildVerticalGrid(List<Map<String, String>> imageDetails) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: screenWidth * 0.025, // Responsive spacing
//         mainAxisSpacing: screenHeight * 0.015, // Responsive spacing
//         childAspectRatio: 3 / 4,
//       ),
//       itemCount: imageDetails.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             var name = imageDetails[index]['name'];
//             var image = imageDetails[index]['imageUrl'];
//             var priceString = imageDetails[index]['price'];
//             var description = imageDetails[index]['description'];

//             if (name != null &&
//                 image != null &&
//                 priceString != null &&
//                 description != null) {
//               double price = 0.0;
//               try {
//                 price = double.parse(priceString);
//               } catch (e) {
//                 log("Error parsing price: $e");
//                 price = 0.0;
//               }
//               // Assuming ProductDetails is imported from elsewhere
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => ProductDetails(
//                     name: name,
//                     image: image,
//                     price: price,
//                     description: description,
//                   ),
//                 ),
//               );
//             } else {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Missing data for product')),
//               );
//             }
//           },
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             elevation: 3,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius:
//                         const BorderRadius.vertical(top: Radius.circular(10)),
//                     child: Image.asset(
//                       imageDetails[index]['imageUrl']!,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         imageDetails[index]['name']!,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: screenWidth * 0.04, // Responsive font size
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.005), // Responsive spacing
//                       Text(
//                         '₹${imageDetails[index]['price']!}', // Display as string
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.04, // Responsive font size
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.favorite_border, size: screenWidth * 0.06), // Responsive icon size
//                             color: Colors.red,
//                             onPressed: () async {
//                               final selectedItem = imageDetails[index];
//                               final docId = selectedItem['id'];

//                               if (docId != null) {
//                                 await FirebaseFirestore.instance
//                                     .collection('favorites')
//                                     .doc(docId)
//                                     .set(selectedItem);

//                                 setState(() {
//                                   if (!favoriteItems.any((item) => item['id'] == docId)) {
//                                     favoriteItems.add(selectedItem);
//                                   }
//                                 });

//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text("Added to favorites!",
//                                         style: TextStyle(color: Colors.white)),
//                                     backgroundColor: Colors.green,
//                                     duration: Duration(seconds: 2),
//                                   ),
//                                 );
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text("Error: Item ID missing for favorites.",
//                                         style: TextStyle(color: Colors.white)),
//                                     backgroundColor: Colors.red,
//                                     duration: Duration(seconds: 2),
//                                   ),
//                                 );
//                               }
//                             },
//                           ),
//                           const Spacer(),
//                           IconButton(
//                             icon: Icon(Icons.add_shopping_cart, size: screenWidth * 0.06), // Responsive icon size
//                             color: Colors.green,
//                             onPressed: () {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text("Added to cart!",
//                                       style: TextStyle(color: Colors.white)),
//                                   backgroundColor: Colors.blue,
//                                   duration: Duration(seconds: 1),
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

//final page 2 17/7/25

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommers_app/View/allvegetable.dart';
import 'package:ecommers_app/View/cart_screen.dart';
import 'package:ecommers_app/View/checkout.dart';
import 'package:ecommers_app/View/custom_drawer.dart';
import 'package:ecommers_app/View/favourite.dart';
import 'package:ecommers_app/View/flower.dart';
import 'package:ecommers_app/View/fruits.dart';
import 'package:ecommers_app/View/leafy.dart';
import 'package:ecommers_app/View/notification.dart';
// import 'package:ecommers_app/View/leafy.dart';
// import 'package:ecommers_app/View/order.dart';
import 'package:ecommers_app/View/orderhis.dart';
import 'package:ecommers_app/View/pesticide.dart';
import 'package:ecommers_app/View/vegi.dart'; // Assuming ProductDetails is in vegi.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final name;
  const HomeScreen({super.key, this.name});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? name;
  String? email;

  @override
  void initState() {
    log("init state");
    fetchData();

    _loadUserData();
    super.initState();
    _searchController.addListener(_filterSearchResults);
    filteredCategoryImages = categoryImages;
    filteredPopularImages = popularImages;
    filteredTopImages = topImages;
  }

  void fetchData() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("users").get();

    for (int i = 0; i < response.docs.length; i++) {
      log("NAME NAED:- ${response.docs[i]['name']}");
      log("NAME EMAIL :- ${response.docs[i]['email']}");

      if (email == response.docs[i]['email']) {
        log("NAME :- ${response.docs[i]['name']}");

        name = response.docs[i]['name'];
      }
    }
    setState(() {});
  }

  Future<void> _loadUserData() async {
    // ignore: unused_element
    void fetchData() async {
      QuerySnapshot response =
          await FirebaseFirestore.instance.collection("users").get();

      for (int i = 0; i < response.docs.length; i++) {
        if (email == response.docs[i]['email']) {
          log("NAME :- ${response.docs[i]['name']}");

          name = response.docs[i]['name'];
        }
      }
    }

    final prefs = await SharedPreferences.getInstance();
    String? retrievedName = name;
    String? retrievedEmail = prefs.getString('email');

    // If name and email are not found in SharedPreferences, fallback to Firebase user data
    if (retrievedName == null || retrievedEmail == null) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        retrievedName =
            user.displayName ?? "Your Name"; // Fallback if no display name
        retrievedEmail = user.email ?? "Your Email"; // Fallback if no email
      }
    }

    log('Retrieved Name: $retrievedName');
    log('Retrieved Email: $retrievedEmail');

    setState(() {
      name = retrievedName ?? "Your Name"; // Default value if name is null
      email = retrievedEmail ?? "Your Email"; // Default value if email is null
    });
  }

  final List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
    'Category 6',
    'Category 7',
  ];
  bool showAllCategories = false;

  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  List<Map<String, String>> favoriteItems = [];

  List<Map<String, String>> categoryImages = [
    {"imageUrl": "assets/images/all.jpg", "name": "All", "id": "all_category"},
    {
      "imageUrl": "assets/images/broccali.png",
      "name": "Leafy vegetables",
      "id": "leafy_category"
    },
    {
      "imageUrl": "assets/images/fruits.jpeg",
      "name": "Fruits",
      "id": "fruits_category"
    },
    {
      "imageUrl": "assets/images/vegetable2.jpeg",
      "name": "Vegetables",
      "id": "vegetables_category"
    },
    {
      "imageUrl": "assets/images/flower.jpeg",
      "name": "Flowers",
      "id": "flowers_category"
    },
    {
      "imageUrl": "assets/images/pestisides.jpg",
      "name": "Pestisides",
      "id": "pestisides_category"
    },
  ];

  List<Map<String, String>> popularImages = [
    {
      "imageUrl": "assets/images/apple.jpeg",
      "name": "Apple",
      "description":
          "Apple 🍎:\nApples are one of the most widely consumed fruits worldwide, known for their crisp texture, sweet or tart flavor, and vibrant colors like red, green, and yellow. Rich in essential nutrients like fiber, Vitamin C, and antioxidants, apples are excellent for boosting the immune system, promoting digestion, and supporting heart health. They are a great low-calorie snack and are often enjoyed fresh, juiced, or used in baking and cooking, such as in apple pies, salads, and smoothies. Apples are convenient, versatile, and provide a healthy, refreshing boost to your daily diet.",
      "price": "₹60/kg",
      "id": "apple_popular"
    },
    {
      "imageUrl": "assets/images/banana.jpg",
      "name": "Banana",
      "description":
          "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
      "price": "₹50dozen",
      "id": "banana_popular"
    },
    {
      "imageUrl": "assets/images/orange.jpeg",
      "name": "Orange",
      "description":
          "Orange 🍊:\nOranges are a popular citrus fruit recognized for their tangy, refreshing flavor and vibrant orange skin. Packed with Vitamin C, antioxidants, and fiber, oranges are perfect for supporting immunity, improving skin health, and enhancing digestion. They are commonly eaten fresh, juiced, or used in cooking and baking to add a burst of flavor. Oranges are an excellent hydrating fruit, rich in nutrients that help maintain overall health and energy levels, making them a go-to choice for a nutritious snack or beverage.",
      "price": "₹80/kg",
      "id": "orange_popular"
    },
    {
      "imageUrl": "assets/images/peru.jpeg",
      "name": "Gauva",
      "description":
          "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
      "price": "₹50dozen",
      "id": "gauva_popular"
    },
    {
      "imageUrl": "assets/images/peru.jpeg",
      "name": "Gauva",
      "description":
          "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
      "price": "₹50dozen",
      "id": "gauva_popular_2"
    },
  ];

  List<Map<String, String>> topImages = [
    {
      "imageUrl": "assets/images/peru.jpeg",
      "name": "Gauva",
      "description":
          "Guava 🍈:\nGuavas are tropical fruits with a distinctive aroma, green or yellow skin, and succulent pink or white flesh, often dotted with small edible seeds. They are a nutritional powerhouse, exceptionally high in Vitamin C, fiber, and antioxidants, contributing to stronger immunity, improved digestion, and glowing skin. Guavas also contain potassium, which supports heart health, and are known for their ability to regulate blood sugar levels. They can be enjoyed fresh, sprinkled with chili powder and salt for a tangy treat, or processed into delicious jams, jellies, and juices. Guavas are a blend of taste and wellness, cherished across tropical regions.",
      "price": "₹60/kg",
      "id": "gauva_top"
    },
    {
      "imageUrl": "assets/images/tomato.jpg",
      "name": "Tomato",
      "description":
          "Tomato 🍅:\nTomatoes are vibrant red, juicy fruits often mistaken for vegetables due to their savory flavor and culinary use. They are rich in essential nutrients, including Vitamin C, Vitamin A, potassium, and lycopene, a powerful antioxidant known for its role in promoting heart health and reducing the risk of chronic diseases. Tomatoes enhance skin health, improve digestion, and boost immunity. Their versatility in cooking makes them indispensable, featuring in fresh salads, hearty soups, tangy sauces, salsas, juices, and even pizzas. Tomatoes are a cornerstone of global cuisines, offering a balance of nutrition and taste.",
      "price": "₹30/kg",
      "id": "tomato_top"
    },
    {
      "imageUrl": "assets/images/banana.jpg",
      "name": "Banana",
      "description":
          "Banana 🍌:\nBananas are tropical fruits recognized for their elongated shape, soft creamy flesh, and vibrant yellow peel when fully ripe. They are naturally sweet and loaded with essential nutrients such as potassium, Vitamin B6, Vitamin C, and dietary fiber, making them a powerhouse of energy and nutrition. Bananas are excellent for heart health, muscle function, and digestion. They are versatile in culinary uses, commonly enjoyed as a quick snack, blended into smoothies, used as a natural sweetener in baking (e.g., banana bread), or paired with desserts like ice creams and pancakes. Their convenience and health benefits make them a global favorite.",
      "price": "₹50/dozen",
      "id": "banana_top"
    },
    {
      "imageUrl": "assets/images/karate.jpeg",
      "name": "Karate",
      "description":
          "Karate (Pesticide) 🛡️:\nKarate is a highly effective pesticide widely used in agriculture to protect crops from pests and insects such as aphids, caterpillars, and beetles. Known for its fast-acting properties, Karate ensures healthy crop yields by targeting harmful pests while minimizing harm to beneficial insects and the environment. It is commonly applied to vegetables, fruits, and ornamental plants, ensuring that they remain vibrant and pest-free. Karate is an integral part of modern, sustainable farming practices, helping farmers maintain high-quality produce and reduce crop losses caused by infestations.",
      "price": "₹250/500ml",
      "id": "karate_top"
    },
    {
      'imageUrl': 'assets/vegetable/sweet_potato.jpg',
      'name': "Sweet Potato",
      // 'quantity': "1 kg",
      'price': "50.0/kg",
      'description':
          "Sweet Potato 🍠: Sweet potatoes are rich in fiber, antioxidants, and vitamins A and C. They are versatile in cooking and can be used in curries, fries, or even desserts. Sweet potatoes help regulate blood sugar, support gut health, and improve immune function.",
      "id": "sweet_potato_top"
    },
    {
      'imageUrl': 'assets/flower/askoka.jpg',
      'name': "Ashoka Flower",
      // 'quantity': "2 set",
      'price': "80.0//set",
      'description':
          "Tatsoi 🌿:\nSacred in Indian culture, Ashoka flowers are used in religious rituals and Ayurveda to treat gynecological issues. The tree is associated with fertility and is revered in Hindu mythology..",
      "id": "ashoka_flower_top"
    },
    {
      'imageUrl': 'assets/vegitable/avacoda1.jpg',
      'name': "Avacoda",
      // 'quantity': "2 set",
      'price': "90.0/set",
      'description':
          " Avocado 🥑\nAvocado is a creamy, nutrient-dense fruit with a green, leathery skin and soft, buttery flesh. It's rich in healthy monounsaturated fats, Vitamin E, potassium, and fiber, making it great for heart health and skin. Avocados are versatile and can be used in salads, spreads like guacamole, smoothies, or eaten plain with a sprinkle of salt and pepper.",
      "id": "avacado_top"
    },
    {
      'imageUrl': 'assets/flower/hibis.jpg',
      'name': "Hibiscus",
      // 'quantity': "1 set",
      'price': "60.0/set",
      'description':
          "Orach 🌱:\nThis bright red flower is sacred to Goddess Kali and Lord Ganesha. Hibiscus tea, made from its petals, is rich in antioxidants and beneficial for heart health. In Ayurveda, the flower is used for hair care and skin treatments. Its vibrant color also makes it a popular ornamental plant in Indian gardens.",
      "id": "hibiscus_top"
    },
    {
      'imageUrl': 'assets/vegitable/cherry.jpg',
      'name': "Cherry",
      // 'quantity': "2 set",
      'price': "80.0/set",
      'description':
          "Cherry 🍒 :\nCherries are small, round, and vibrant red fruits celebrated for their sweet and tart flavors, juicy flesh, and glossy skin. Packed with essential nutrients, they are an excellent source of Vitamin C, potassium, antioxidants, and dietary fiber. These nutrients contribute to their health benefits, including supporting heart health, reducing inflammation, and promoting better sleep due to their natural melatonin content.Cherries are versatile and widely used in culinary dishes, enjoyed fresh as a snack, or incorporated into desserts like pies, tarts, jams, and cakes. They are also a delightful addition to smoothies, salads, and even savory recipes. Their unique taste, paired with impressive nutritional value, makes cherries a cherished treat worldwide.",
      "id": "cherry_top"
    },
  ];
  List<Map<String, String>> favorites = [];

  List<Map<String, String>> filteredCategoryImages = [];
  List<Map<String, String>> filteredPopularImages = [];
  List<Map<String, String>> filteredTopImages = [];

  void _filterSearchResults() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      filteredCategoryImages = categoryImages
          .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
          .toList();
      filteredPopularImages = popularImages
          .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
          .toList();
      filteredTopImages = topImages
          .where((item) => item['name']!.toLowerCase().contains(_searchQuery))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OrderHistoryScreen()),
      ).then((_) {
        setState(() {
          _selectedIndex = 0;
        });
      });
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Favourite(favoriteItems: favorites)),
      ).then((_) {
        setState(() {
          _selectedIndex = 0;
        });
      });
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CheckoutScreen()),
      ).then((_) {
        setState(() {
          _selectedIndex = 0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 136, 36),
        elevation: 0,
        title: Row(
          children: [
            const Text(
              "Hello, ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              name ?? "Loading..",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications,
                    size: 35, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 17,
                    minHeight: 17,
                  ),
                  child: const Text(
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // Apply the gradient background to the body
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.8), // Faint white
              const Color.fromARGB(255, 33, 136, 36)
                  .withOpacity(0.1), // Faint green from AppBar
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What do you want to Buy?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    buildSectionTitle("Categories", context),
                    buildHorizontalList(filteredCategoryImages),
                    buildSectionTitle("Popular", context),
                    buildHorizontalList1(filteredPopularImages),
                    buildSectionTitle("Top Picks", context),
                    buildVerticalGrid(filteredTopImages),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        color: Colors.grey,
        activeColor: const Color.fromARGB(255, 33, 136, 36),
        style: TabStyle.react, // Bouncing animation style
        items: [
          TabItem(
            icon: Icon(
              Icons.home_sharp,
              color: _selectedIndex == 0
                  ? const Color.fromARGB(255, 33, 136, 36)
                  : Colors.grey,
              size: 32
            ),
            title: "Home",
          ),
          TabItem(
            icon: Icon(
              Icons.shopify_outlined,
              color: _selectedIndex == 1
                  ? const Color.fromARGB(255, 33, 136, 36)
                  : Colors.grey,
              size: 32
            ),
            title: "Order",
          ),
          TabItem(
            icon: Icon(
              Icons.favorite,
              color: _selectedIndex == 2
                  ? const Color.fromARGB(255, 33, 136, 36)
                  : Colors.grey,
              size: 32
            ),
            title: "Favourite",
          ),
          TabItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: _selectedIndex == 3
                  ? const Color.fromARGB(255, 33, 136, 36)
                  : Colors.grey,
              size: 32
            ),
            title: "Cart",
          ),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      //BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home_sharp,
      //         color: _selectedIndex == 0
      //             ? const Color.fromARGB(255, 33, 136, 36)
      //             : Colors.grey,
      //         size: 40,
      //       ),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.shopify_outlined,
      //         color: _selectedIndex == 1
      //             ? const Color.fromARGB(255, 33, 136, 36)
      //             : Colors.grey,
      //         size: 40,
      //       ),
      //       label: "Order",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.favorite,
      //         color: _selectedIndex == 2
      //             ? const Color.fromARGB(255, 33, 136, 36)
      //             : Colors.grey,
      //         size: 40,
      //       ),
      //       label: "Favourite",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.shopping_cart_outlined,
      //         color: _selectedIndex == 3
      //             ? const Color.fromARGB(255, 33, 136, 36)
      //             : Colors.grey,
      //         size: 40,
      //       ),
      //       label: "Cart",
      //     ),
      //   ],
      //   selectedItemColor: const Color.fromARGB(255, 33, 136, 36),
      //   unselectedItemColor: Colors.grey,
      // ),
    );
  }

  Widget buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                // Toggle visibility of full category list
                showAllCategories = !showAllCategories;
              });
            },
            child: Text(
              showAllCategories ? "Show Less" : "See All",
              style: GoogleFonts.quicksand(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

// 1st row -category
  Widget buildHorizontalList(List<Map<String, String>> imageDetails) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageDetails.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate based on the category name
                    switch (imageDetails[index]['name']) {
                      case "All":
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const All()));
                        break;
                      case "Fruits":
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Fruitscreen()));
                        break;
                      case "Vegetables":
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Vegetables()));
                        break;
                      case "Leafy vegetables":
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Leaf()));
                        break;
                      case "Flowers":
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Flower()));
                        break;
                      case "Pestisides":
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pesticide()));
                        break;
                      default:
                        break;
                    }
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imageDetails[index]['imageUrl']!),
                        fit: BoxFit.cover,
                      ),
                      // Add faint shadow to circular images
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  imageDetails[index]['name']!,
                  style: GoogleFonts.quicksand(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// 2nd  row- popular
  Widget buildHorizontalList1(List<Map<String, String>> imageDetails) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageDetails.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate based on the category name
                    switch (imageDetails[index]['name']) {
                      case "Apple":
                        var name = imageDetails[index]['name'];
                        var image = imageDetails[index]['imageUrl'];
                        var priceString = imageDetails[index]['price'];
                        var description = imageDetails[index]['description'];

                        print(
                            'name: $name, image: $image, priceString: $priceString, description: $description');
                        if (name != null &&
                            image != null &&
                            priceString != null &&
                            description != null) {
                          double price = 0.0;
                          try {
                            price = double.parse(
                                priceString.replaceAll(RegExp(r'[^\d.]'), ''));
                          } catch (e) {
                            price = 0.0;
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              name: name,
                              image: image,
                              price: price,
                              description: description,
                            ),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Missing data for Apple product')),
                          );
                        }
                        break;

                      case "Banana":
                        var name = imageDetails[index]['name'];
                        var image = imageDetails[index]['imageUrl'];
                        var priceString = imageDetails[index]['price'];
                        var description = imageDetails[index]['description'];

                        print(
                            'name: $name, image: $image, priceString: $priceString, description: $description');
                        if (name != null &&
                            image != null &&
                            priceString != null &&
                            description != null) {
                          double price = 0.0;
                          try {
                            price = double.parse(
                                priceString.replaceAll(RegExp(r'[^\d.]'), ''));
                          } catch (e) {
                            price = 0.0;
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              name: name,
                              image: image,
                              price: price,
                              description: description,
                            ),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Missing data for Banana product')),
                          );
                        }
                        break;

                      case "Orange":
                        var name = imageDetails[index]['name'];
                        var image = imageDetails[index]['imageUrl'];
                        var priceString = imageDetails[index]['price'];
                        var description = imageDetails[index]['description'];

                        print(
                            'name: $name, image: $image, priceString: $priceString, description: $description');
                        if (name != null &&
                            image != null &&
                            priceString != null &&
                            description != null) {
                          double price = 0.0;
                          try {
                            price = double.parse(
                                priceString.replaceAll(RegExp(r'[^\d.]'), ''));
                          } catch (e) {
                            price = 0.0;
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              name: name,
                              image: image,
                              price: price,
                              description: description,
                            ),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Missing data for Orange product')),
                          );
                        }
                        break;
                      case "Gauva":
                        var name = imageDetails[index]['name'];
                        var image = imageDetails[index]['imageUrl'];
                        var priceString = imageDetails[index]['price'];
                        var description = imageDetails[index]['description'];

                        print(
                            'name: $name, image: $image, priceString: $priceString, description: $description');
                        if (name != null &&
                            image != null &&
                            priceString != null &&
                            description != null) {
                          double price = 0.0;
                          try {
                            price = double.parse(
                                priceString.replaceAll(RegExp(r'[^\d.]'), ''));
                          } catch (e) {
                            price = 0.0;
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              name: name,
                              image: image,
                              price: price,
                              description: description,
                            ),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Missing data for Gauva product')),
                          );
                        }
                        break;
                      default:
                        break;
                    }
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imageDetails[index]['imageUrl']!),
                        fit: BoxFit.cover,
                      ),
                      // Add faint shadow to circular images
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  imageDetails[index]['name']!,
                  style: GoogleFonts.quicksand(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  // top tricks

  Widget buildVerticalGrid(List<Map<String, String>> imageDetails) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: imageDetails.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  name: imageDetails[index]['name']!,
                  image: imageDetails[index]['imageUrl']!,
                  price: double.parse(imageDetails[index]['price']!
                      .replaceAll(RegExp(r'[^\d.]'), '')),
                  description: imageDetails[index]['description']!,
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 3,
            // Add faint shadow to card images
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      imageDetails[index]['imageUrl']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        imageDetails[index]['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        imageDetails[index]['price']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            color: Colors.red,
                            onPressed: () async {
                              final selectedItem = imageDetails[index];
                              // Ensure each item has a unique ID, creating one if not present
                              final docId = selectedItem['id'] ??
                                  FirebaseFirestore.instance
                                      .collection('favorites')
                                      .doc()
                                      .id;
                              selectedItem['id'] =
                                  docId; // Store the ID back in the map

                              // Add item to Firestore
                              await FirebaseFirestore.instance
                                  .collection('favorites')
                                  .doc(docId) // Use docId to avoid duplicates
                                  .set(selectedItem);

                              // Show confirmation SnackBar
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Added to favorites!",
                                      style: TextStyle(color: Colors.green)),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.add_shopping_cart),
                            color: Colors.green,
                            onPressed: () {
                              // Add to cart logic here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
