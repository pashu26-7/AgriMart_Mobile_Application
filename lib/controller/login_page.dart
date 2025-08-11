// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/Model/customSnaker.dart';
// import 'package:ecommers_app/View/Homepage.dart';
// import 'package:ecommers_app/controller/forgetpassword.dart';
// import 'package:ecommers_app/controller/signup.dart';
// import 'package:ecommers_app/screens/profile_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   final name;
//   const LoginPage({super.key, required this.name});

//   @override
//   State<LoginPage> createState() => _LoginPage();
// }

// class _LoginPage extends State<LoginPage> {
//   //  final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _emailTextEditingController =
//       TextEditingController();
//   final TextEditingController _passwordTextEditingController =
//       TextEditingController();

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   String? _emailError;
//   String? _passwordError;

//   // if(_emailTextEditingController.text.trim().isEmpty){
//   //   _emailError ="Email is required";

//   // }
//   // if(_PasswordTextEditingController.text.trim().isEmpty){
//   //   _emailError ="Email is required";

//   // }

//   Future<void> _login() async {
//     setState(() {
//       _emailError = null;
//       _passwordError = null;
//     });

//     if (_emailError == null && _passwordError == null) {
//       try {
//         final UserCredential userCredential =
//             await _firebaseAuth.signInWithEmailAndPassword(
//           email: _emailTextEditingController.text.trim(),
//           password: _passwordTextEditingController.text.trim(),
//         );

//         // Store user details in SharedPreferences
//         final userDoc = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(userCredential.user!.email)
//             .get();
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('name', userDoc['name']);
//         await prefs.setString('email', userCredential.user!.email!);

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const ProfileScreen()),
//         );
//       } on FirebaseAuthException catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(e.message ?? "Login failed")),
//         );
//       }
//     }
//   }

//   bool _showPassword = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/login/login4.jpeg'), fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         //drawerEnableOpenDragGesture: true,
//         backgroundColor: const Color.fromARGB(0, 125, 119, 119),
//         // appBar: AppBar(
//         //   title: Text(
//         //     "AgriMart",
//         //     style: GoogleFonts.quicksand(
//         //       fontSize: 25,
//         //       fontWeight: FontWeight.bold,
//         //       color: Colors.red
//         //     ),
//         //     ),
//         // ),
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 35, top: 165),
//                 child: Text(
//                   "WelCome To AgriMart",
//                   style: GoogleFonts.quicksand(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.36,
//                     right: 35,
//                     left: 35),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Login to AgriMart",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 30,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Please enter your credentails",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Text(
//                       "Email",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w300),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextField(
//                       controller: _emailTextEditingController,
//                       // style: GoogleFonts.quicksand(
//                       //   fontSize: 10,
//                       //   fontWeight: FontWeight.w600,
//                       //   color: Colors.white
//                       // ),
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: 'Email',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         // enabledBorder: const OutlineInputBorder(
//                         //   borderSide: BorderSide(
//                         //     color: Colors.white
//                         //   )
//                         // )
//                       ),
//                       //errorText: _emailError,
//                     ),
//                     if (_emailError != null)
//                       Text(
//                         _emailError!,
//                         style: const TextStyle(color: Colors.red, fontSize: 12),
//                       ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Password",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w300),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextField(
//                       controller: _passwordTextEditingController,
//                       obscureText: _showPassword,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: 'Password',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             _showPassword = !_showPassword;
//                             setState(() {});
//                           },
//                           child: Icon(
//                             (_showPassword)
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                     if (_passwordError != null)
//                       Text(
//                         _passwordError!,
//                         style: const TextStyle(color: Colors.red, fontSize: 12),
//                       ),
//                     const SizedBox(
//                       height: 6,
//                     ),
//                     // Padding(
//                     //   padding: const EdgeInsets.only(left: 200),
//                     //   child: SizedBox(
//                     //     child: Text(
//                     //       "Forgot Password?",
//                     //       style: GoogleFonts.quicksand(
//                     //           fontWeight: FontWeight.w600,
//                     //           fontSize: 14,
//                     //           color: const Color.fromARGB(255, 59, 56, 239)),
//                     //     ),
//                     //   ),
//                     // ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 200),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const ForgotPasswordPage()),
//                           );
//                         },
//                         child: Text(
//                           "Forgot Password?",
//                           style: GoogleFonts.quicksand(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14,
//                               color: const Color.fromARGB(255, 59, 56, 239)),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(left: 80),
//                       width: 250,
//                       child: ElevatedButton(
//                           style: const ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll(
//                               Color.fromARGB(255, 42, 133, 225),
//                             ),
//                           ),
//                           onPressed: () async {
//                             setState(() {
//                               _emailError = _emailTextEditingController.text
//                                       .trim()
//                                       .isEmpty
//                                   ? "Email is required"
//                                   : null;
//                               _passwordError = _passwordTextEditingController
//                                       .text
//                                       .trim()
//                                       .isEmpty
//                                   ? "Password is required"
//                                   : null;
//                             });

//                             if (_emailTextEditingController.text
//                                     .trim()
//                                     .isNotEmpty &&
//                                 _passwordTextEditingController.text
//                                     .trim()
//                                     .isNotEmpty) {
//                               try {
//                                 UserCredential userCredential =
//                                     await _firebaseAuth
//                                         .signInWithEmailAndPassword(
//                                   email:
//                                       _emailTextEditingController.text.trim(),
//                                   password: _passwordTextEditingController.text
//                                       .trim(),
//                                 );
//                                 log("Agrimart : UserCredentials:${userCredential.user!.email}");
//                                 Navigator.of(context).pushReplacement(
//                                     MaterialPageRoute(builder: (context) {
//                                   return HomeScreen(
//                                     name: widget.name,
//                                   );
//                                 }));
//                               } on FirebaseAuthException catch (error) {
//                                 log("Agrimart : Error : ${error.code}");
//                                 log("Agrimart : Error : ${error.message}");
//                                 CustomSnackbar.showCustomSnackbar(
//                                     message: error.code, context: context);
//                               }
//                             }
//                           },
//                           child: Text(
//                             "Login",
//                             style: GoogleFonts.quicksand(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                                 color: Colors.black),
//                           )),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18.0, right: 18),
//                       child: Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               '-----------',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 30),
//                             ),
//                             Text(
//                               'Or Login With',
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               '----------',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 30),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                             height: 30,
//                             width: 80,
//                             decoration: BoxDecoration(
//                                 //color: const Color(0xff484848),
//                                 borderRadius: BorderRadius.circular(5)),
//                             //child:const Icon(Icons.g_mobiledata,color: Colors.pink,size: 50,),
//                             child: ClipRRect(
//                                 child: Image.asset(
//                               "assets/google.png",
//                             ))),
//                         Container(
//                           height: 50,
//                           width: 100,
//                           decoration: BoxDecoration(
//                               //color:const  Color(0xff484848),
//                               borderRadius: BorderRadius.circular(5)),
//                           child: const Icon(
//                             Icons.apple,
//                             color: Colors.black,
//                             size: 40,
//                           ),
//                         ),
//                         Container(
//                           height: 50,
//                           width: 100,
//                           decoration: BoxDecoration(
//                               //color:const  Color(0xff484848),
//                               borderRadius: BorderRadius.circular(5)),
//                           child: const Icon(
//                             Icons.facebook,
//                             color: Colors.blue,
//                             size: 40,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 70, top: 10),
//                       child: Text(
//                         "Don't have an account ?",
//                         style: GoogleFonts.quicksand(
//                             color: Colors.white,
//                             fontSize: 17,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(left: 80),
//                       width: 250,
//                       child: ElevatedButton(
//                           style: const ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll(
//                               Color.fromARGB(255, 204, 216, 32),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SignUpPage(),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             "Sign Up",
//                             style: GoogleFonts.quicksand(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                                 color: Colors.black),
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//final page 1

// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/Model/customSnaker.dart';
// //import 'package:ecommers_app/View/Homepage.dart';
// import 'package:ecommers_app/controller/forgetpassword.dart'; // Ensure this import is correct
// import 'package:ecommers_app/controller/signup.dart';
// import 'package:ecommers_app/screens/profile_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   final name;
//   const LoginPage({super.key, required this.name});

//   @override
//   State<LoginPage> createState() => _LoginPage();
// }

// class _LoginPage extends State<LoginPage> {
//   final TextEditingController _emailTextEditingController =
//       TextEditingController();
//   final TextEditingController _passwordTextEditingController =
//       TextEditingController();

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   String? _emailError;
//   String? _passwordError;

//   Future<void> _login() async {
//     setState(() {
//       _emailError = null;
//       _passwordError = null;
//     });

//     // Basic validation
//     if (_emailTextEditingController.text.trim().isEmpty) {
//       setState(() {
//         _emailError = "Email is required";
//       });
//       return;
//     }
//     if (_passwordTextEditingController.text.trim().isEmpty) {
//       setState(() {
//         _passwordError = "Password is required";
//       });
//       return;
//     }

//     try {
//       final UserCredential userCredential =
//           await _firebaseAuth.signInWithEmailAndPassword(
//         email: _emailTextEditingController.text.trim(),
//         password: _passwordTextEditingController.text.trim(),
//       );

//       // Store user details in SharedPreferences
//       // Assuming 'users' collection and document ID is user's email
//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user!.email)
//           .get();

//       if (userDoc.exists) {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('name', userDoc['name']);
//         await prefs.setString('email', userCredential.user!.email!);

//         // Navigate to ProfileScreen after successful login and data storage
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const ProfileScreen()),
//         );
//       } else {
//         // Handle case where user document doesn't exist after successful auth
//         CustomSnackbar.showCustomSnackbar(
//             message: "User data not found. Please contact support.",
//             context: context);
//         await _firebaseAuth.signOut(); // Sign out the user
//       }
//     } on FirebaseAuthException catch (e) {
//       log("Agrimart : Error Code: ${e.code}");
//       log("Agrimart : Error Message: ${e.message}");
//       String errorMessage;
//       switch (e.code) {
//         case 'user-not-found':
//           errorMessage = 'No user found for that email.';
//           break;
//         case 'wrong-password':
//           errorMessage = 'Wrong password provided for that user.';
//           break;
//         case 'invalid-email':
//           errorMessage = 'The email address is not valid.';
//           break;
//         case 'too-many-requests':
//           errorMessage = 'Too many login attempts. Please try again later.';
//           break;
//         default:
//           errorMessage = e.message ?? "Login failed. Please try again.";
//       }
//       CustomSnackbar.showCustomSnackbar(
//           message: errorMessage, context: context);
//     } catch (e) {
//       log("Agrimart : General Error during login: $e");
//       CustomSnackbar.showCustomSnackbar(
//           message: "An unexpected error occurred. Please try again.",
//           context: context);
//     }
//   }

//   bool _showPassword = false;

//   @override
//   Widget build(BuildContext context) {
//     // Get screen dimensions for responsiveness
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//       // Apply the two-color gradient background
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xFFA5D6A7), // Light green, like fresh leaves
//             Color(0xFFFFF9C4), // Light yellow/beige, like harvest fields
//           ],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors
//             .transparent, // Make Scaffold background transparent to show Container gradient
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               // Welcome text positioned relative to screen height
//               Container(
//                 padding: EdgeInsets.only(
//                     left: screenWidth * 0.09, top: screenHeight * 0.18),
//                 child: Text(
//                   "WelCome To AgriMart",
//                   style: GoogleFonts.quicksand(
//                       color: Colors.white,
//                       fontSize: screenWidth * 0.075, // Responsive font size
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//               // Login form container positioned relative to screen height
//               Container(
//                 padding: EdgeInsets.only(
//                     top: screenHeight * 0.36,
//                     right: screenWidth * 0.09,
//                     left: screenWidth * 0.09),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Login to AgriMart",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.075, // Responsive font size
//                           fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.012,
//                     ),
//                     Text(
//                       "Please enter your credentials",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.05, // Responsive font size
//                           fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.02,
//                     ),
//                     Text(
//                       "Email",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.04, // Responsive font size
//                           fontWeight: FontWeight.w300),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.005,
//                     ),
//                     TextField(
//                       controller: _emailTextEditingController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100.withOpacity(0.9),
//                         filled: true,
//                         hintText: 'Email',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         errorText: _emailError,
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.025,
//                     ),
//                     Text(
//                       "Password",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.04, // Responsive font size
//                           fontWeight: FontWeight.w300),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.005,
//                     ),
//                     TextField(
//                       controller: _passwordTextEditingController,
//                       obscureText: !_showPassword,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100.withOpacity(0.9),
//                         filled: true,
//                         hintText: 'Password',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _showPassword = !_showPassword;
//                             });
//                           },
//                           child: Icon(
//                             (_showPassword)
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             color: Colors.black,
//                           ),
//                         ),
//                         errorText: _passwordError,
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.01,
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const ForgotPasswordPage()),
//                           );
//                         },
//                         child: Text(
//                           "Forgot Password?",
//                           style: GoogleFonts.quicksand(
//                               fontWeight: FontWeight.w600,
//                               fontSize: screenWidth * 0.035, // Responsive font size
//                               color: const Color.fromARGB(255, 59, 56, 239)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.01,
//                     ),
//                     Center(
//                       child: SizedBox(
//                         width: screenWidth * 0.6, // Responsive width
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll(
//                               const Color.fromARGB(255, 42, 133, 225)
//                                   .withOpacity(0.9), // Slightly transparent
//                             ),
//                             padding: WidgetStatePropertyAll(
//                                 EdgeInsets.symmetric(
//                                     vertical: screenHeight * 0.015)),
//                             shape: WidgetStatePropertyAll(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ),
//                           onPressed: _login,
//                           child: Text(
//                             "Login",
//                             style: GoogleFonts.quicksand(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: screenWidth * 0.05, // Responsive font size
//                                 color: Colors.white), // Changed to white for better contrast
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.005,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.05), // Responsive padding
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Expanded(
//                             child: Divider(
//                               color: Colors.white.withOpacity(0.7),
//                               thickness: 1,
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
//                             child: Text(
//                               'Or Login With',
//                               style: GoogleFonts.quicksand(
//                                 color: Colors.white.withOpacity(0.9),
//                                 fontSize: screenWidth * 0.038,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Divider(
//                               color: Colors.white.withOpacity(0.7),
//                               thickness: 1,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.015,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         // Google Icon
//                         Container(
//                           height: screenHeight * 0.06, // Responsive height
//                           width: screenWidth * 0.15, // Responsive width
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.9),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 5,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Image.asset(
//                               "assets/google.png",
//                               height: screenHeight * 0.035,
//                             ),
//                           ),
//                         ),
//                         // Apple Icon
//                         Container(
//                           height: screenHeight * 0.06,
//                           width: screenWidth * 0.15,
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.9),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 5,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Icon(
//                               Icons.apple,
//                               color: Colors.black,
//                               size: screenHeight * 0.04,
//                             ),
//                           ),
//                         ),
//                         // Facebook Icon
//                         Container(
//                           height: screenHeight * 0.06,
//                           width: screenWidth * 0.15,
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.9),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 5,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Icon(
//                               Icons.facebook,
//                               color: Colors.blue.shade700,
//                               size: screenHeight * 0.04,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.02,
//                     ),
//                     Center(
//                       child: Text(
//                         "Don't have an account ?",
//                         style: GoogleFonts.quicksand(
//                             color: Colors.white,
//                             fontSize: screenWidth * 0.045, // Responsive font size
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.01,
//                     ),
//                     Center(
//                       child: SizedBox(
//                         width: screenWidth * 0.6, // Responsive width
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll(
//                               const Color.fromARGB(255, 204, 216, 32)
//                                   .withOpacity(0.9), // Slightly transparent
//                             ),
//                             padding: WidgetStatePropertyAll(
//                                 EdgeInsets.symmetric(
//                                     vertical: screenHeight * 0.015)),
//                             shape: WidgetStatePropertyAll(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SignUpPage(),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             "Sign Up",
//                             style: GoogleFonts.quicksand(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: screenWidth * 0.05, // Responsive font size
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.03), // Add some bottom padding
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//final page 2

// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/Model/customSnaker.dart';
// import 'package:ecommers_app/View/Homepage.dart';
// import 'package:ecommers_app/controller/forgetpassword.dart'; // Ensure this import is correct
// import 'package:ecommers_app/controller/signup.dart';
// import 'package:ecommers_app/screens/profile_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   final name;
//   const LoginPage({super.key, required this.name});

//   @override
//   State<LoginPage> createState() => _LoginPage();
// }

// class _LoginPage extends State<LoginPage> {
//   final TextEditingController _emailTextEditingController =
//       TextEditingController();
//   final TextEditingController _passwordTextEditingController =
//       TextEditingController();

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   String? _emailError;
//   String? _passwordError;

//   Future<void> _login() async {
//     setState(() {
//       _emailError = null;
//       _passwordError = null;
//     });

//     // Basic validation
//     if (_emailTextEditingController.text.trim().isEmpty) {
//       setState(() {
//         _emailError = "Email is required";
//       });
//       return;
//     }
//     if (_passwordTextEditingController.text.trim().isEmpty) {
//       setState(() {
//         _passwordError = "Password is required";
//       });
//       return;
//     }

//     try {
//       final UserCredential userCredential =
//           await _firebaseAuth.signInWithEmailAndPassword(
//         email: _emailTextEditingController.text.trim(),
//         password: _passwordTextEditingController.text.trim(),
//       );

//       // Store user details in SharedPreferences
//       // Assuming 'users' collection and document ID is user's email
//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user!.email)
//           .get();

//       if (userDoc.exists) {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('name', userDoc['name']);
//         await prefs.setString('email', userCredential.user!.email!);

//         // Navigate to ProfileScreen after successful login and data storage
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const ProfileScreen()),
//         );
//       } else {
//         // Handle case where user document doesn't exist after successful auth
//         CustomSnackbar.showCustomSnackbar(
//             message: "User data not found. Please contact support.",
//             context: context);
//         await _firebaseAuth.signOut(); // Sign out the user
//       }
//     } on FirebaseAuthException catch (e) {
//       log("Agrimart : Error Code: ${e.code}");
//       log("Agrimart : Error Message: ${e.message}");
//       String errorMessage;
//       switch (e.code) {
//         case 'user-not-found':
//           errorMessage = 'No user found for that email.';
//           break;
//         case 'wrong-password':
//           errorMessage = 'Wrong password provided for that user.';
//           break;
//         case 'invalid-email':
//           errorMessage = 'The email address is not valid.';
//           break;
//         case 'too-many-requests':
//           errorMessage = 'Too many login attempts. Please try again later.';
//           break;
//         default:
//           errorMessage = e.message ?? "Login failed. Please try again.";
//       }
//       CustomSnackbar.showCustomSnackbar(
//           message: errorMessage, context: context);
//     } catch (e) {
//       log("Agrimart : General Error during login: $e");
//       CustomSnackbar.showCustomSnackbar(
//           message: "An unexpected error occurred. Please try again.",
//           context: context);
//     }
//   }

//   bool _showPassword = false;

//   @override
//   Widget build(BuildContext context) {
//     // Get screen dimensions for responsiveness
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//       // Apply the two-color gradient background
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xFFA5D6A7), // Light green, like fresh leaves
//             Color(0xFFFFF9C4), // Light yellow/beige, like harvest fields
//           ],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors
//             .transparent, // Make Scaffold background transparent to show Container gradient
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               // Welcome text positioned relative to screen height
//               Container(
//                 padding: EdgeInsets.only(
//                     left: screenWidth * 0.09, top: screenHeight * 0.18),
//                 child: Text(
//                   "WelCome To AgriMart",
//                   style: GoogleFonts.quicksand(
//                       color: Colors.white,
//                       fontSize: screenWidth * 0.075, // Responsive font size
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//               // Login form container positioned relative to screen height
//               Container(
//                 padding: EdgeInsets.only(
//                     top: screenHeight * 0.36,
//                     right: screenWidth * 0.09,
//                     left: screenWidth * 0.09),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Login to AgriMart",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.075, // Responsive font size
//                           fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.012,
//                     ),
//                     Text(
//                       "Please enter your credentials",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.05, // Responsive font size
//                           fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.02),
//                     Text(
//                       "Email",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.04, // Responsive font size
//                           fontWeight: FontWeight.w300),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.005,
//                     ),
//                     TextField(
//                       controller: _emailTextEditingController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100.withOpacity(0.9),
//                         filled: true,
//                         hintText: 'Email',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         errorText: _emailError,
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.025,
//                     ),
//                     Text(
//                       "Password",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.04, // Responsive font size
//                           fontWeight: FontWeight.w300),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.005,
//                     ),
//                     TextField(
//                       controller: _passwordTextEditingController,
//                       obscureText: !_showPassword,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100.withOpacity(0.9),
//                         filled: true,
//                         hintText: 'Password',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _showPassword = !_showPassword;
//                             });
//                           },
//                           child: Icon(
//                             (_showPassword)
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             color: Colors.black,
//                           ),
//                         ),
//                         errorText: _passwordError,
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.01,
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const ForgotPasswordPage()),
//                           );
//                         },
//                         child: Text(
//                           "Forgot Password?",
//                           style: GoogleFonts.quicksand(
//                               fontWeight: FontWeight.w600,
//                               fontSize: screenWidth * 0.035, // Responsive font size
//                               color: const Color.fromARGB(255, 59, 56, 239)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.01,
//                     ),
//                     Center(
//                       child: SizedBox(
//                         width: screenWidth * 0.6, // Responsive width
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll(
//                               const Color(0xFF4CAF50)
//                                   .withOpacity(0.9), // Darker green for Login
//                             ),
//                             padding: WidgetStatePropertyAll(
//                                 EdgeInsets.symmetric(
//                                     vertical: screenHeight * 0.015)),
//                             shape: WidgetStatePropertyAll(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ),
//                           onPressed: _login,
//                           child: Text(
//                             "Login",
//                             style: GoogleFonts.quicksand(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: screenWidth * 0.05, // Responsive font size
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.005,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.05), // Responsive padding
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Expanded(
//                             child: Divider(
//                               color: Colors.white.withOpacity(0.7),
//                               thickness: 1,
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
//                             child: Text(
//                               'Or Login With',
//                               style: GoogleFonts.quicksand(
//                                 color: Colors.white.withOpacity(0.9),
//                                 fontSize: screenWidth * 0.038,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Divider(
//                               color: Colors.white.withOpacity(0.7),
//                               thickness: 1,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.015,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         // Google Icon
//                         Container(
//                           height: screenHeight * 0.06, // Responsive height
//                           width: screenWidth * 0.15, // Responsive width
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.9),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 5,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Image.asset(
//                               "assets/google.png",
//                               height: screenHeight * 0.035,
//                             ),
//                           ),
//                         ),
//                         // Apple Icon
//                         Container(
//                           height: screenHeight * 0.06,
//                           width: screenWidth * 0.15,
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.9),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 5,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Icon(
//                               Icons.apple,
//                               color: Colors.black,
//                               size: screenHeight * 0.04,
//                             ),
//                           ),
//                         ),
//                         // Facebook Icon
//                         Container(
//                           height: screenHeight * 0.06,
//                           width: screenWidth * 0.15,
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.9),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 5,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Icon(
//                               Icons.facebook,
//                               color: Colors.blue.shade700,
//                               size: screenHeight * 0.04,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.02,
//                     ),
//                     Center(
//                       child: Text(
//                         "Don't have an account ?",
//                         style: GoogleFonts.quicksand(
//                             color: Colors.white,
//                             fontSize: screenWidth * 0.045, // Responsive font size
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.01,
//                     ),
//                     Center(
//                       child: SizedBox(
//                         width: screenWidth * 0.6, // Responsive width
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll(
//                               const Color(0xFF8BC34A)
//                                   .withOpacity(0.9), // Lighter green for Sign Up
//                             ),
//                             padding: WidgetStatePropertyAll(
//                                 EdgeInsets.symmetric(
//                                     vertical: screenHeight * 0.015)),
//                             shape: WidgetStatePropertyAll(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SignUpPage(),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             "Sign Up",
//                             style: GoogleFonts.quicksand(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: screenWidth * 0.05, // Responsive font size
//                                 color: Colors.black), // Black text for contrast
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.03), // Add some bottom padding
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//final 3

// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/Model/customSnaker.dart';
// import 'package:ecommers_app/View/Homepage.dart';
// import 'package:ecommers_app/controller/forgetpassword.dart'; // Ensure this import is correct
// import 'package:ecommers_app/controller/signup.dart';
// import 'package:ecommers_app/screens/profile_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   final name;
//   const LoginPage({super.key, required this.name});

//   @override
//   State<LoginPage> createState() => _LoginPage();
// }

// class _LoginPage extends State<LoginPage> {
//   final TextEditingController _emailTextEditingController =
//       TextEditingController();
//   final TextEditingController _passwordTextEditingController =
//       TextEditingController();

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   String? _emailError;
//   String? _passwordError;

//   Future<void> _login() async {
//     setState(() {
//       _emailError = null;
//       _passwordError = null;
//     });

//     // Basic validation for empty fields
//     if (_emailTextEditingController.text.trim().isEmpty) {
//       setState(() {
//         _emailError = "Email is required";
//       });
//       return;
//     }
//     if (_passwordTextEditingController.text.trim().isEmpty) {
//       setState(() {
//         _passwordError = "Password is required";
//       });
//       return;
//     }

//     try {
//       // 1. Authenticate the user with Firebase Auth
//       final UserCredential userCredential =
//           await _firebaseAuth.signInWithEmailAndPassword(
//         email: _emailTextEditingController.text.trim(),
//         password: _passwordTextEditingController.text.trim(),
//       );

//       // Check if the user object is not null (should be handled by try-catch, but good practice)
//       if (userCredential.user == null) {
//         CustomSnackbar.showCustomSnackbar(
//             message: "Login failed: User object is null.", context: context);
//         return;
//       }

//       // 2. Attempt to fetch user details from Firestore
//       // IMPORTANT: Ensure your Firestore document ID for users matches the email
//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user!.email) // Using email as document ID
//           .get();

//       // 3. Check if the Firestore document exists
//       if (userDoc.exists) {
//         // Store user details in SharedPreferences
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('name', userDoc['name']);
//         await prefs.setString('email', userCredential.user!.email!);

//         // Navigate to ProfileScreen after successful login and data storage
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const ProfileScreen()),
//         );
//       } else {
//         // User authenticated, but their data document is not found in Firestore
//         log("Agrimart : User data document not found for ${userCredential.user!.email}");
//         CustomSnackbar.showCustomSnackbar(
//             message:
//                 "User profile data not found. Please contact support or try signing up again.",
//             context: context);
//         // It's good practice to sign out the user if their profile data is missing
//         await _firebaseAuth.signOut();
//       }
//     } on FirebaseAuthException catch (e) {
//       log("Agrimart : FirebaseAuth Error Code: ${e.code}");
//       log("Agrimart : FirebaseAuth Error Message: ${e.message}");
//       String errorMessage;
//       switch (e.code) {
//         case 'user-not-found':
//           errorMessage = 'No user found for that email. Please sign up.';
//           break;
//         case 'wrong-password':
//           errorMessage = 'Incorrect password. Please try again.';
//           break;
//         case 'invalid-email':
//           errorMessage = 'The email address is not valid.';
//           break;
//         case 'too-many-requests':
//           errorMessage =
//               'Too many failed login attempts. Please try again later.';
//           break;
//         case 'network-request-failed':
//           errorMessage = 'No internet connection. Please check your network.';
//           break;
//         default:
//           errorMessage = e.message ?? "Login failed. Please try again.";
//       }
//       CustomSnackbar.showCustomSnackbar(
//           message: errorMessage, context: context);
//     } catch (e) {
//       // Catch any other unexpected errors
//       log("Agrimart : General Error during login: $e");
//       CustomSnackbar.showCustomSnackbar(
//           message: "An unexpected error occurred. Please try again.",
//           context: context);
//     }
//   }

//   bool _showPassword = false;

//   @override
//   Widget build(BuildContext context) {
//     // Get screen dimensions for responsiveness
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//       // Apply the two-color gradient background
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xFFA5D6A7), // Light green, like fresh leaves
//             Color(0xFFFFF9C4), // Light yellow/beige, like harvest fields
//           ],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors
//             .transparent, // Make Scaffold background transparent to show Container gradient
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               // Welcome text positioned relative to screen height
//               Container(
//                 padding: EdgeInsets.only(
//                     left: screenWidth * 0.09, top: screenHeight * 0.18),
//                 child: Text(
//                   "WelCome To AgriMart",
//                   style: GoogleFonts.quicksand(
//                       color: Colors.white,
//                       fontSize: screenWidth * 0.075, // Responsive font size
//                       fontWeight: FontWeight.w700),
//                 ),
//               ),
//               // Login form container positioned relative to screen height
//               Container(
//                 padding: EdgeInsets.only(
//                     top: screenHeight * 0.36,
//                     right: screenWidth * 0.09,
//                     left: screenWidth * 0.09),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Login to AgriMart",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.075, // Responsive font size
//                           fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.012,
//                     ),
//                     Text(
//                       "Please enter your credentials",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.05, // Responsive font size
//                           fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.02),
//                     Text(
//                       "Email",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.04, // Responsive font size
//                           fontWeight: FontWeight.w300),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.005,
//                     ),
//                     TextField(
//                       controller: _emailTextEditingController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100.withOpacity(0.9),
//                         filled: true,
//                         hintText: 'Email',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         errorText: _emailError,
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.025,
//                     ),
//                     Text(
//                       "Password",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.04, // Responsive font size
//                           fontWeight: FontWeight.w300),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.005,
//                     ),
//                     TextField(
//                       controller: _passwordTextEditingController,
//                       obscureText: !_showPassword,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100.withOpacity(0.9),
//                         filled: true,
//                         hintText: 'Password',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _showPassword = !_showPassword;
//                             });
//                           },
//                           child: Icon(
//                             (_showPassword)
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             color: Colors.black,
//                           ),
//                         ),
//                         errorText: _passwordError,
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.01,
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     const ForgotPasswordPage()),
//                           );
//                         },
//                         child: Text(
//                           "Forgot Password?",
//                           style: GoogleFonts.quicksand(
//                               fontWeight: FontWeight.w600,
//                               fontSize: screenWidth * 0.035, // Responsive font size
//                               color: const Color.fromARGB(255, 59, 56, 239)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.01,
//                     ),
//                     Center(
//                       child: SizedBox(
//                         width: screenWidth * 0.6, // Responsive width
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll(
//                               const Color(0xFF4CAF50)
//                                   .withOpacity(0.9), // Darker green for Login
//                             ),
//                             padding: WidgetStatePropertyAll(
//                                 EdgeInsets.symmetric(
//                                     vertical: screenHeight * 0.015)),
//                             shape: WidgetStatePropertyAll(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ),
//                           onPressed: _login,
//                           child: Text(
//                             "Login",
//                             style: GoogleFonts.quicksand(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: screenWidth * 0.05, // Responsive font size
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.005,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.05), // Responsive padding
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Expanded(
//                             child: Divider(
//                               color: Colors.white.withOpacity(0.7),
//                               thickness: 1,
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
//                             child: Text(
//                               'Or Login With',
//                               style: GoogleFonts.quicksand(
//                                 color: Colors.white.withOpacity(0.9),
//                                 fontSize: screenWidth * 0.038,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Divider(
//                               color: Colors.white.withOpacity(0.7),
//                               thickness: 1,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.015,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         // Google Icon
//                         Container(
//                           height: screenHeight * 0.06, // Responsive height
//                           width: screenWidth * 0.15, // Responsive width
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.9),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 5,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Image.asset(
//                               "assets/google.png",
//                               height: screenHeight * 0.035,
//                             ),
//                           ),
//                         ),
//                         // Apple Icon
//                         Container(
//                           height: screenHeight * 0.06,
//                           width: screenWidth * 0.15,
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.9),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 5,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Icon(
//                               Icons.apple,
//                               color: Colors.black,
//                               size: screenHeight * 0.04,
//                             ),
//                           ),
//                         ),
//                         // Facebook Icon
//                         Container(
//                           height: screenHeight * 0.06,
//                           width: screenWidth * 0.15,
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.9),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 5,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Icon(
//                               Icons.facebook,
//                               color: Colors.blue.shade700,
//                               size: screenHeight * 0.04,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.02,
//                     ),
//                     Center(
//                       child: Text(
//                         "Don't have an account ?",
//                         style: GoogleFonts.quicksand(
//                             color: Colors.white,
//                             fontSize: screenWidth * 0.045, // Responsive font size
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     SizedBox(
//                       height: screenHeight * 0.01,
//                     ),
//                     Center(
//                       child: SizedBox(
//                         width: screenWidth * 0.6, // Responsive width
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll(
//                               const Color(0xFF8BC34A)
//                                   .withOpacity(0.9), // Lighter green for Sign Up
//                             ),
//                             padding: WidgetStatePropertyAll(
//                                 EdgeInsets.symmetric(
//                                     vertical: screenHeight * 0.015)),
//                             shape: WidgetStatePropertyAll(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const SignUpPage(),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             "Sign Up",
//                             style: GoogleFonts.quicksand(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: screenWidth * 0.05, // Responsive font size
//                                 color: Colors.black), // Black text for contrast
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.03), // Add some bottom padding
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ... (imports remain the same)
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/customSnaker.dart';
import 'package:ecommers_app/View/Homepage.dart';
import 'package:ecommers_app/controller/forgetpassword.dart';
import 'package:ecommers_app/controller/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Ensure this is imported for HomeScreen

class LoginPage extends StatefulWidget {
  final name;
  const LoginPage({super.key, required this.name});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? _emailError;
  String? _passwordError;

  Future<void> _login() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    // Basic validation for empty fields
    if (_emailTextEditingController.text.trim().isEmpty) {
      setState(() {
        _emailError = "Email is required";
      });
      return;
    }
    if (_passwordTextEditingController.text.trim().isEmpty) {
      setState(() {
        _passwordError = "Password is required";
      });
      return;
    }

    try {
      // 1. Authenticate the user with Firebase Auth
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailTextEditingController.text.trim(),
        password: _passwordTextEditingController.text.trim(),
      );

      // Check if the user object is not null (should be handled by try-catch, but good practice)
      if (userCredential.user == null) {
        CustomSnackbar.showCustomSnackbar(
            message: "Login failed: User object is null.", context: context);
        return;
      }

      // 2. Attempt to fetch user details from Firestore
      // IMPORTANT: Ensure your Firestore document ID for users matches the email
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.email) // Using email as document ID
          .get();

      // 3. Check if the Firestore document exists
      if (userDoc.exists) {
        // Store user details in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', userDoc['name']);
        await prefs.setString('email', userCredential.user!.email!);

        // Navigate to HomeScreen after successful login and data storage
        // --- CHANGE START ---
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                  name: userDoc['name'])), // Pass the name from Firestore
        );
        // --- CHANGE END ---
      } else {
        // User authenticated, but their data document is not found in Firestore
        log("Agrimart : User data document not found for ${userCredential.user!.email}");
        CustomSnackbar.showCustomSnackbar(
            message:
                "User profile data not found. Please ensure you have signed up, or contact support.",
            context: context);
        // It's good practice to sign out the user if their profile data is missing
        await _firebaseAuth.signOut();
      }
    } on FirebaseAuthException catch (e) {
      log("Agrimart : FirebaseAuth Error Code: ${e.code}");
      log("Agrimart : FirebaseAuth Error Message: ${e.message}");
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email. Please sign up.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'too-many-requests':
          errorMessage =
              'Too many failed login attempts. Please try again later.';
          break;
        case 'network-request-failed':
          errorMessage = 'No internet connection. Please check your network.';
          break;
        default:
          errorMessage = e.message ?? "Login failed. Please try again.";
      }
      CustomSnackbar.showCustomSnackbar(
          message: errorMessage, context: context);
    } catch (e) {
      // Catch any other unexpected errors
      log("Agrimart : General Error during login: $e");
      CustomSnackbar.showCustomSnackbar(
          message: "An unexpected error occurred. Please try again.",
          context: context);
    }
  }

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      // Apply the two-color gradient background
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFA5D6A7), // Light green, like fresh leaves
            Color(0xFFFFF9C4), // Light yellow/beige, like harvest fields
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors
            .transparent, // Make Scaffold background transparent to show Container gradient
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Welcome text positioned relative to screen height
              Container(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.09, top: screenHeight * 0.18),
                child: Text(
                  "WelCome To AgriMart",
                  style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: screenWidth * 0.075, // Responsive font size
                      fontWeight: FontWeight.w700),
                ),
              ),
              // Login form container positioned relative to screen height
              Container(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.36,
                    right: screenWidth * 0.09,
                    left: screenWidth * 0.09),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login to AgriMart",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: screenWidth * 0.075, // Responsive font size
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: screenHeight * 0.012,
                    ),
                    Text(
                      "Please enter your credentials",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: screenWidth * 0.05, // Responsive font size
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02),
                    Text(
                      "Email",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    TextField(
                      controller: _emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100.withOpacity(0.9),
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: _emailError,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.025,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    TextField(
                      controller: _passwordTextEditingController,
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100.withOpacity(0.9),
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                            (_showPassword)
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        errorText: _passwordError,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.035, // Responsive font size
                              color: const Color.fromARGB(255, 59, 56, 239)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Center(
                      child: SizedBox(
                        width: screenWidth * 0.6, // Responsive width
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              const Color(0xFF4CAF50)
                                  .withOpacity(0.9), // Darker green for Login
                            ),
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.015)),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          onPressed: _login,
                          child: Text(
                            "Login",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.05, // Responsive font size
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05), // Responsive padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Divider(
                              color: const Color.fromARGB(255, 15, 0, 0).withOpacity(0.7),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                            child: Text(
                              'Or Login With',
                              style: GoogleFonts.quicksand(
                                color: const Color.fromARGB(255, 12, 0, 0).withOpacity(0.9),
                                fontSize: screenWidth * 0.038,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: const Color.fromARGB(255, 13, 1, 1).withOpacity(0.7),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Google Icon
                        Container(
                          height: screenHeight * 0.06, // Responsive height
                          width: screenWidth * 0.15, // Responsive width
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/google.png",
                              height: screenHeight * 0.035,
                            ),
                          ),
                        ),
                        // Apple Icon
                        Container(
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                              ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.apple,
                              color: Colors.black,
                              size: screenHeight * 0.04,
                            ),
                          ),
                        ),
                        // Facebook Icon
                        Container(
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.facebook,
                              color: Colors.blue.shade700,
                              size: screenHeight * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Don't have an account ?",
                            style: GoogleFonts.quicksand(
                                color: const Color.fromARGB(255, 9, 0, 0),
                                decoration: TextDecoration.underline,
                                fontSize: screenWidth * 0.045, // Responsive font size
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Center(
                      child: SizedBox(
                        width: screenWidth * 0.2, // Responsive width
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                fontSize: screenWidth * 0.045, // Responsive font size
                                color: Colors.black), // Black text for contrast
                          ),
                        ),
                      ),
                    ),
                      ],
                    ),
                    // SizedBox(
                    //   height: screenHeight * 0.01,
                    // ),
                    // Center(
                    //   child: SizedBox(
                    //     width: screenWidth * 0.6, // Responsive width
                    //     child: ElevatedButton(
                    //       style: ButtonStyle(
                    //         backgroundColor: WidgetStatePropertyAll(
                    //           const Color(0xFF8BC34A)
                    //               .withOpacity(0.9), // Lighter green for Sign Up
                    //         ),
                    //         padding: WidgetStatePropertyAll(
                    //             EdgeInsets.symmetric(
                    //                 vertical: screenHeight * 0.015)),
                    //         shape: WidgetStatePropertyAll(
                    //           RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(12),
                    //           ),
                    //         ),
                    //       ),
                    //       onPressed: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => const SignUpPage(),
                    //           ),
                    //         );
                    //       },
                    //       child: Text(
                    //         "Sign Up",
                    //         style: GoogleFonts.quicksand(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: screenWidth * 0.05, // Responsive font size
                    //             color: Colors.black), // Black text for contrast
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: screenHeight * 0.03), // Add some bottom padding
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}