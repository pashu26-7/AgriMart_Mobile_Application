// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/View/checkout.dart';
// import 'package:flutter/material.dart';

// class ProductDetails2 extends StatefulWidget {
//   final String? title;
//   final String? image;
//   final double? rupees;
//   // final String? quantity;
//   final String? description;

//   const ProductDetails2({
//     super.key,
//     required this.title,
//     required this.image,
//     required this.rupees,
//     // required this.quantity,
//     required this.description,
//   });

//   @override
//   State<ProductDetails2> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails2> {
//   bool isAddedToCart = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Product Details",
//           style: TextStyle(
//               fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
//         ),
//         backgroundColor: const Color.fromARGB(255, 33, 136, 36),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: Navigator.of(context).pop,
//           icon: const Icon(
//             Icons.arrow_back_ios_new_sharp,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display Product Image
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image.asset(
//                   widget.image!,
//                   height: 300,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Display Product Title
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 widget.title!,
//                 style:
//                     const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//             const SizedBox(height: 8),

//             // Display Product Price
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 '₹${widget.rupees?.toStringAsFixed(2)}',
//                 style: const TextStyle(
//                     fontSize: 24,
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 8),

//             // Display Product Quantity
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 16),
//             //   child: Text(
//             //     'Quantity: ${widget.quantity}',
//             //     style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
//             //   ),
//             // ),
//             const SizedBox(height: 16),

//             // Display Product Description
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 'Description:',
//                 style:
//                     TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Text(
//                 widget.description!,
//                 style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(16),
//         color: Colors.white,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   log("Add to cart");

//                   QuerySnapshot response =
//                       await FirebaseFirestore.instance.collection('cart').get();

//                   bool canadd = true;
//                   for (int i = 0; i < response.docs.length; i++) {
//                     if (response.docs[i]['name'] == widget.title) {
//                       canadd = false;
//                       return;
//                     }
//                   }
//                   if (canadd) {
//                     await FirebaseFirestore.instance.collection('cart').add({
//                       'name': widget.title,
//                       'price': widget.rupees,
//                       'image': widget.image,
//                       'quantity': 1,
//                     });

//                     log("added to cart");

//                     setState(() {
//                       isAddedToCart = !isAddedToCart;
//                     });

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           isAddedToCart
//                               ? '${widget.title} added to cart successfully'
//                               : '${widget.title} removed from cart successfully',
//                         ),
//                       ),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: isAddedToCart ? Colors.red : Colors.green,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Text(
//                   isAddedToCart ? "Remove from Cart" : "Add to Cart",
//                   style: const TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   log("Add to cart");

//                   QuerySnapshot response =
//                       await FirebaseFirestore.instance.collection('cart').get();

//                   bool canadd = true;
//                   for (int i = 0; i < response.docs.length; i++) {
//                     if (response.docs[i]['name'] == widget.title) {
//                       canadd = false;
//                       return;
//                     }
//                   }
//                   if (canadd) {
//                     await FirebaseFirestore.instance.collection('cart').add({
//                       'name': widget.title,
//                       'price': widget.rupees,
//                       'image': widget.image,
//                       'quantity': 1,
//                     });
//                     log("added to cart");
//                     setState(() {
//                       isAddedToCart = !isAddedToCart;
//                     });
//                   }
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return const CheckoutScreen();
//                       },
//                     ),
//                   );
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                         content: Text('Proceeding to buy ${widget.title}')),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 3, 75, 7),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   "Buy Now",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//final screen 1 - 18/7/25

// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/View/checkout.dart';
// import 'package:flutter/material.dart';

// class ProductDetails2 extends StatefulWidget {
//   final String? title;
//   final String? image;
//   final double? rupees;
//   final String? description;

//   const ProductDetails2({
//     super.key,
//     required this.title,
//     required this.image,
//     required this.rupees,
//     required this.description,
//   });

//   @override
//   State<ProductDetails2> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails2> {
//   bool isAddedToCart = false;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Product Details",
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.w700,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 33, 136, 36),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: Navigator.of(context).pop,
//           icon: const Icon(
//             Icons.arrow_back_ios_new_sharp,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image with shadow and rounded corners
//               Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Container(
//                   width: double.infinity,
//                   height: size.height * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.4),
//                         blurRadius: 12,
//                         offset: const Offset(0, 6),
//                       ),
//                     ],
//                     image: DecorationImage(
//                       image: AssetImage(widget.image!),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),

//               // Product Title
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   widget.title!,
//                   style: TextStyle(
//                     fontSize: size.width * 0.07,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 8),

//               // Product Price
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   '₹${widget.rupees?.toStringAsFixed(2)}',
//                   style: TextStyle(
//                     fontSize: size.width * 0.06,
//                     color: Colors.green.shade700,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 16),

//               // Description Heading
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   'Description:',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//               // Product Description
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Text(
//                   widget.description!,
//                   style: TextStyle(
//                     fontSize: size.width * 0.045,
//                     color: Colors.grey[700],
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       // Bottom Buttons
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(16),
//         color: Colors.white,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Add to Cart Button
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   log("Add to cart");

//                   QuerySnapshot response = await FirebaseFirestore.instance
//                       .collection('cart')
//                       .get();

//                   bool canAdd = true;
//                   for (var doc in response.docs) {
//                     if (doc['name'] == widget.title) {
//                       canAdd = false;
//                       return;
//                     }
//                   }

//                   if (canAdd) {
//                     await FirebaseFirestore.instance.collection('cart').add({
//                       'name': widget.title,
//                       'price': widget.rupees,
//                       'image': widget.image,
//                       'quantity': 1,
//                     });

//                     log("added to cart");

//                     setState(() {
//                       isAddedToCart = !isAddedToCart;
//                     });

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           isAddedToCart
//                               ? '${widget.title} added to cart successfully'
//                               : '${widget.title} removed from cart successfully',
//                         ),
//                       ),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: isAddedToCart ? Colors.red : Colors.green,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Text(
//                   isAddedToCart ? "Remove from Cart" : "Add to Cart",
//                   style: const TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),

//             // Buy Now Button
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   log("Buy Now clicked");

//                   QuerySnapshot response = await FirebaseFirestore.instance
//                       .collection('cart')
//                       .get();

//                   bool canAdd = true;
//                   for (var doc in response.docs) {
//                     if (doc['name'] == widget.title) {
//                       canAdd = false;
//                       return;
//                     }
//                   }

//                   if (canAdd) {
//                     await FirebaseFirestore.instance.collection('cart').add({
//                       'name': widget.title,
//                       'price': widget.rupees,
//                       'image': widget.image,
//                       'quantity': 1,
//                     });

//                     setState(() {
//                       isAddedToCart = true;
//                     });

//                     log("added to cart");
//                   }

//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => const CheckoutScreen(),
//                     ),
//                   );

//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Proceeding to buy ${widget.title}'),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 3, 75, 7),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   "Buy Now",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//final page 2
// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/View/checkout.dart';
// import 'package:flutter/material.dart';

// class ProductDetails2 extends StatefulWidget {
//   final String? title;
//   final String? image;
//   final double? rupees;
//   final String? description;

//   const ProductDetails2({
//     super.key,
//     required this.title,
//     required this.image,
//     required this.rupees,
//     required this.description,
//   });

//   @override
//   State<ProductDetails2> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails2> {
//   bool isAddedToCart = false;

//   @override
//   void initState() {
//     super.initState();
//     _checkIfAlreadyInCart();
//   }

//   // Function to check if the product is already in the cart on initialization
//   Future<void> _checkIfAlreadyInCart() async {
//     QuerySnapshot response = await FirebaseFirestore.instance.collection('cart').get();
//     for (var doc in response.docs) {
//       if (doc['name'] == widget.title) {
//         setState(() {
//           isAddedToCart = true;
//         });
//         return;
//       }
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Product Details",
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.w700,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 33, 136, 36),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: Navigator.of(context).pop,
//           icon: const Icon(
//             Icons.arrow_back_ios_new_sharp,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image with shadow and rounded corners
//               Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Container(
//                   width: double.infinity,
//                   height: size.height * 0.35,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.4),
//                         blurRadius: 12,
//                         offset: const Offset(0, 6),
//                       ),
//                     ],
//                     image: DecorationImage(
//                       image: AssetImage(widget.image!),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),

//               // Product Title
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   widget.title!,
//                   style: TextStyle(
//                     fontSize: size.width * 0.07,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 8),

//               // Product Price
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   '₹${widget.rupees?.toStringAsFixed(2)}',
//                   style: TextStyle(
//                     fontSize: size.width * 0.06,
//                     color: Colors.green.shade700,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 16),

//               // Description Heading
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Text(
//                   'Description:',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),

//               // Product Description
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: Text(
//                   widget.description!,
//                   style: TextStyle(
//                     fontSize: size.width * 0.045,
//                     color: Colors.grey[700],
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       // Bottom Buttons
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(16),
//         color: Colors.white,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Add to Cart Button
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   log("Add to cart button pressed");

//                   QuerySnapshot response = await FirebaseFirestore.instance
//                       .collection('cart')
//                       .where('name', isEqualTo: widget.title) // Optimized query
//                       .get();

//                   if (response.docs.isEmpty) { // Item not in cart
//                     await FirebaseFirestore.instance.collection('cart').add({
//                       'name': widget.title,
//                       'price': widget.rupees,
//                       'image': widget.image,
//                       'quantity': 1,
//                     });
//                     log("Added to cart");
//                     setState(() {
//                       isAddedToCart = true;
//                     });
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${widget.title} added to cart successfully'),
//                       ),
//                     );
//                   } else { // Item is in cart, so remove it
//                     for (var doc in response.docs) {
//                       await FirebaseFirestore.instance.collection('cart').doc(doc.id).delete();
//                     }
//                     log("Removed from cart");
//                     setState(() {
//                       isAddedToCart = false;
//                     });
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('${widget.title} removed from cart successfully'),
//                       ),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: isAddedToCart ? Colors.red : Colors.green,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Text(
//                   isAddedToCart ? "Remove from Cart" : "Add to Cart",
//                   style: const TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),

//             // Buy Now Button
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   log("Buy Now clicked");

//                   // Check if the item is already in the cart
//                   QuerySnapshot response = await FirebaseFirestore.instance
//                       .collection('cart')
//                       .where('name', isEqualTo: widget.title) // Optimized query
//                       .get();

//                   // If not in cart, add it.
//                   if (response.docs.isEmpty) {
//                     await FirebaseFirestore.instance.collection('cart').add({
//                       'name': widget.title,
//                       'price': widget.rupees,
//                       'image': widget.image,
//                       'quantity': 1,
//                     });
//                     log("Added to cart for Buy Now");
//                     // Update the state so the "Add to Cart" button reflects the change
//                     setState(() {
//                       isAddedToCart = true;
//                     });
//                   } else {
//                     log("Item already in cart, no need to add again for Buy Now");
//                   }

//                   // Always navigate to CheckoutScreen after ensuring item is in cart (or was already there)
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => const CheckoutScreen(),
//                     ),
//                   );

//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Proceeding to buy ${widget.title}'),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 3, 75, 7),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   "Buy Now",
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// final page 3
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/View/checkout.dart';
import 'package:flutter/material.dart';

class ProductDetails2 extends StatefulWidget {
  final String? title;
  final String? image;
  final double? rupees;
  final String? description;

  const ProductDetails2({
    super.key,
    required this.title,
    required this.image,
    required this.rupees,
    required this.description,
  });

  @override
  State<ProductDetails2> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails2> {
  bool isAddedToCart = false;

  @override
  void initState() {
    super.initState();
    _checkIfAlreadyInCart();
  }

  Future<void> _checkIfAlreadyInCart() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('cart').get();
    for (var doc in response.docs) {
      if (doc['name'] == widget.title) {
        setState(() {
          isAddedToCart = true;
        });
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 136, 36),
        centerTitle: true,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
        ),
      ),

      /// FAINT BACKGROUND COLOR COMBINATION
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 228, 177, 240), // Light lavender top
              Color.fromARGB(255, 188, 238, 175), // Light beige bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with DARK SHADOW and rounded corners
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(1.0),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(widget.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.title!,
                    style: TextStyle(
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '₹${widget.rupees?.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    widget.description!,
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  log("Add to cart button pressed");

                  QuerySnapshot response = await FirebaseFirestore.instance
                      .collection('cart')
                      .where('name', isEqualTo: widget.title)
                      .get();

                  if (response.docs.isEmpty) {
                    await FirebaseFirestore.instance.collection('cart').add({
                      'name': widget.title,
                      'price': widget.rupees,
                      'image': widget.image,
                      'quantity': 1,
                    });
                    log("Added to cart");
                    setState(() {
                      isAddedToCart = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.title} added to cart successfully'),
                      ),
                    );
                  } else {
                    for (var doc in response.docs) {
                      await FirebaseFirestore.instance
                          .collection('cart')
                          .doc(doc.id)
                          .delete();
                    }
                    log("Removed from cart");
                    setState(() {
                      isAddedToCart = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.title} removed from cart successfully'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAddedToCart ? Colors.red : Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  isAddedToCart ? "Remove from Cart" : "Add to Cart",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  log("Buy Now clicked");

                  QuerySnapshot response = await FirebaseFirestore.instance
                      .collection('cart')
                      .where('name', isEqualTo: widget.title)
                      .get();

                  if (response.docs.isEmpty) {
                    await FirebaseFirestore.instance.collection('cart').add({
                      'name': widget.title,
                      'price': widget.rupees,
                      'image': widget.image,
                      'quantity': 1,
                    });
                    setState(() {
                      isAddedToCart = true;
                    });
                  }

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CheckoutScreen(),
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Proceeding to buy ${widget.title}'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 3, 75, 7),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
