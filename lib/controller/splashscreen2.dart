// // final code 2
import 'package:flutter/material.dart';
import '../controller/login_page.dart';

class AgricultureScreen extends StatelessWidget {
  const AgricultureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
               // faint light green
              Color(0xFFFFFDE7), // faint creamy yellow
              Color.fromARGB(255, 140, 198, 74),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top image section
              Container(
                height: height * 0.7,
                width: width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    // topRight:  Radius.circular(30),
                    // topLeft:  Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/imagefarmer.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Bottom content
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AgriMart',
                        style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.025),
                      Text(
                        'Agriculture is a marketplace where you can find the best fruits and vegetable in Maharashtra.',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.03),
                
                      // Buttons
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 232, 240, 232),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(name: ""),
                            ),
                          );
                        },
                        child: const Text('Create Account'),
                      ),
                      //SizedBox(width: width * 0.04),
                
                      SizedBox(height: height * 0.02),
                
                      // Dots Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// final 3
// import 'package:flutter/material.dart';
// import '../controller/login_page.dart';

// class AgricultureScreen extends StatelessWidget {
//   const AgricultureScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 86, 135, 31), // faint light green
//               Color(0xFFFFFDE7), // faint creamy yellow
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Top image section
//               Container(
//                 height: height * 0.5,
//                 width: width,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     // topRight: Radius.circular(30),
//                     // topLeft: Radius.circular(30),
//                     // bottomLeft: Radius.circular(30),
//                     // bottomRight: Radius.circular(30),
//                   ),
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/image.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),

//               // Bottom half-circle with content
//               Expanded(
//                 child: Container(
//                   width: width,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color.fromARGB(255, 86, 135, 31), // faint light green
//                         Color(0xFFFFFDE7), // faint creamy yellow
//                       ],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(100),
//                       topRight: Radius.circular(100),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 10,
//                         offset: Offset(0, -5),
//                       )
//                     ],
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: width * 0.06),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Agriculture',
//                           style: TextStyle(
//                             fontSize: width * 0.09,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: height * 0.025),
//                         Text(
//                           'Agriculture is a marketplace where you can find the\nbest fruits and vegetable in Maharashtra.',
//                           style: TextStyle(
//                             fontSize: width * 0.040,
//                             color: Colors.grey[600],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: height * 0.03),

//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 const Color.fromARGB(255, 232, 240, 232),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const LoginPage(name: ""),
//                               ),
//                             );
//                           },
//                           child: const Text('Create Account'),
//                         ),

//                         SizedBox(height: height * 0.04),

//                         // Dots Indicator
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: 8,
//                               width: 8,
//                               decoration: const BoxDecoration(
//                                 color: Colors.black,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             const SizedBox(width: 6),
//                             Container(
//                               height: 8,
//                               width: 8,
//                               decoration: const BoxDecoration(
//                                 color: Colors.grey,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             const SizedBox(width: 6),
//                             Container(
//                               height: 8,
//                               width: 8,
//                               decoration: const BoxDecoration(
//                                 color: Colors.grey,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// final code 4

// import 'package:flutter/material.dart';
// import '../controller/login_page.dart';

// class AgricultureScreen extends StatelessWidget {
//   const AgricultureScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.grey.shade300,
//       body: Column(
//         children: [
//           // Top Image with rounded top corners
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(0),
//               bottomRight: Radius.circular(0),
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//             ),
//             child: Image.asset(
//               'assets/images/image.png',
//               height: height * 0.55,
//               width: width,
//               fit: BoxFit.cover,
//             ),
//           ),

//           // Bottom arc content
//           Expanded(
//             child: Stack(
//               children: [
//                 // Curved background
//                 Positioned(
//                   top: -50,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     height: height * 0.6,
//                     decoration: const BoxDecoration(
//                       color: Color(0xFF3E3E3E),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(300),
//                         topRight: Radius.circular(300),
//                       ),
//                     ),
//                   ),
//                 ),

//                 // Content on top of curved background
//                 Positioned.fill(
//                   top: 40,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Agriculture',
//                         style: TextStyle(
//                           fontSize: width * 0.08,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Agriculture is a marketplace where you can find the\nbest fruits and vegetable in Maharashtra.',
//                         style: TextStyle(
//                           fontSize: width * 0.040,
//                           color: Colors.white70,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 30),

//                       // Buttons
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: const Text('Sign in'),
//                           ),
//                           const SizedBox(width: 20),
//                           OutlinedButton(
//                             onPressed: () {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const LoginPage(name: ""),
//                                 ),
//                               );
//                             },
//                             style: OutlinedButton.styleFrom(
//                               side: const BorderSide(color: Colors.white),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: const Text(
//                               'Sign Up',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 20),
//                       const Text(
//                         "Don't have an account? Sign up",
//                         style: TextStyle(color: Colors.white70),
//                       ),
//                       const SizedBox(height: 20),

//                       // Dots indicator
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           CircleAvatar(radius: 4, backgroundColor: Colors.white),
//                           SizedBox(width: 6),
//                           CircleAvatar(radius: 4, backgroundColor: Colors.grey),
//                           SizedBox(width: 6),
//                           CircleAvatar(radius: 4, backgroundColor: Colors.grey),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// final 5

// import 'package:flutter/material.dart';
// import '../controller/login_page.dart';

// class AgricultureScreen extends StatelessWidget {
//   const AgricultureScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.grey.shade300,
//       body: Column(
//         children: [
//           // Top image section
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//             ),
//             child: Image.asset(
//               'assets/images/imagefarmer.png',
//               height: height * 0.55,
//               width: width,
//               fit: BoxFit.cover,
//             ),
//           ),

//           // Bottom arc content with gradient + original text/buttons
//           Expanded(
//             child: Stack(
//               children: [
//                 // Curved background with gradient
//                 Positioned(
//                   top: -70,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     height: height * 0.6,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Color.fromARGB(255, 86, 135, 31), // faint green
//                           Color(0xFFFFFDE7), // faint creamy yellow
//                         ],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                       ),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(300),
//                         topRight: Radius.circular(300),
//                       ),
//                     ),
//                   ),
//                 ),

//                 // Content on top of arc
//                 Positioned.fill(
//                   top: 40,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: width * 0.06),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Agriculture',
//                           style: TextStyle(
//                             fontSize: width * 0.09,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: height * 0.025),
//                         Text(
//                           'Agriculture is a marketplace where you can find the\nbest fruits and vegetable in Maharashtra.',
//                           style: TextStyle(
//                             fontSize: width * 0.040,
//                             color: Colors.grey[700],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: height * 0.03),

//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 const Color.fromARGB(255, 232, 240, 232),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const LoginPage(name: ""),
//                               ),
//                             );
//                           },
//                           child: const Text('Create Account'),
//                         ),

//                         SizedBox(height: height * 0.04),

//                         // Dots Indicator
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: 8,
//                               width: 8,
//                               decoration: const BoxDecoration(
//                                 color: Colors.black,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             const SizedBox(width: 6),
//                             Container(
//                               height: 8,
//                               width: 8,
//                               decoration: const BoxDecoration(
//                                 color: Colors.grey,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             const SizedBox(width: 6),
//                             Container(
//                               height: 8,
//                               width: 8,
//                               decoration: const BoxDecoration(
//                                 color: Colors.grey,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
