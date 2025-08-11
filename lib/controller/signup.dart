// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommers_app/Model/customSnaker.dart';
// import 'package:ecommers_app/controller/login_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController _nameTextEditingController =
//       TextEditingController();
//   final TextEditingController _emailTextEditingController =
//       TextEditingController();
//   final TextEditingController _passwordTextEditingController =
//       TextEditingController();
//   final TextEditingController _repasswordTextEditingController =
//       TextEditingController();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   String? _nameError;
//   String? _emailError;
//   String? _passwordError;
//   String? _repasswordError;

//   String? name;
//   String? email;

//   // Future<void> _signup() async {
//   //   setState(() {
//   //     _nameError = _nameTextEditingController.text.trim().isEmpty
//   //         ? "Name is required."
//   //         : null;
//   //     _emailError = _emailTextEditingController.text.trim().isEmpty
//   //         ? "Email is required."
//   //         : null;
//   //     _passwordError = _passwordTextEditingController.text.trim().isEmpty
//   //         ? "Password is required."
//   //         : null;
//   //   });

//   //   if (_nameError == null && _emailError == null && _passwordError == null) {
//   //     try {
//   //       final UserCredential userCredential =
//   //           await _firebaseAuth.createUserWithEmailAndPassword(
//   //         email: _emailTextEditingController.text.trim(),
//   //         password: _passwordTextEditingController.text.trim(),
//   //       );
//   //       await userCredential.user
//   //           ?.updateDisplayName(_nameTextEditingController.text.trim());

//   //       await FirebaseFirestore.instance
//   //           .collection('users')
//   //           .doc(userCredential.user!.email)
//   //           .set({
//   //         'name': _nameTextEditingController.text.trim(),
//   //         'email': _emailTextEditingController.text.trim(),
//   //       });
//   //       final prefs = await SharedPreferences.getInstance();
//   //      await prefs.setString('name', _nameTextEditingController.text.trim());
//   //      await  prefs.setString('email', _emailTextEditingController.text.trim());

//   //       log('Saved Name: ${prefs.getString('name')}');
//   //       log('Saved Email: ${prefs.getString('email')}');

//   //       Navigator.pushReplacement(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => const LoginPage()),
//   //       );
//   //     } on FirebaseAuthException catch (e) {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(content: Text(e.message ?? "Signup failed")),
//   //       );
//   //     }
//   //   }
//   // }


// //akash
// Future<void> _loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       name = prefs.getString('name') ?? "Loading..";
//       email = prefs.getString('email') ?? "Loading..";
//     });
//   }

//   Future<void> _signup() async {
//   setState(() {
//     _nameError = _nameTextEditingController.text.trim().isEmpty
//         ? "Name is required."
//         : null;
//     _emailError = _emailTextEditingController.text.trim().isEmpty
//         ? "Email is required."
//         : null;
//     _passwordError = _passwordTextEditingController.text.trim().isEmpty
//         ? "Password is required."
//         : null;
//   });

//   if (_nameError == null && _emailError == null && _passwordError == null) {
//     try {
//       // Create user with email and password
//       final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: _emailTextEditingController.text.trim(),
//         password: _passwordTextEditingController.text.trim(),
//       );

//       // Update the display name of the user
//       await userCredential.user?.updateDisplayName(_nameTextEditingController.text.trim());

//       // Save the name and email in Firestore under the user's email as doc ID
//       await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.email).set({
//         'name': _nameTextEditingController.text.trim(),
//         'email': _emailTextEditingController.text.trim(),
//       });

//       // Save name and email in SharedPreferences
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('name', _nameTextEditingController.text.trim());
//       await prefs.setString('email', _emailTextEditingController.text.trim());

//       log('Saved Name: ${prefs.getString('name')}');
//       log('Saved Email: ${prefs.getString('email')}');

//       // Navigate to LoginPage after successful signup
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) =>  LoginPage(name: _nameTextEditingController.text,)),
//       );
//     } on FirebaseAuthException catch (e) {
//       // Handle signup error
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.message ?? "Signup failed")),
//       );
//     }
//   }
// }


//   bool _showPassword = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/login/sign.jpg'), fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           title: Text(
//             "SignUp",
//             style: GoogleFonts.quicksand(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.pinkAccent),
//           ),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.black12,
//         ),
//         body: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 105, top: 10),
//               child: SizedBox(
//                 width: 200,
//                 height: 200,

//                 // child: Text(
//                 //   "  Create \n  Account",
//                 //   style: GoogleFonts.quicksand(
//                 //       color: Colors.white,
//                 //       fontSize: 30,
//                 //       fontWeight: FontWeight.w700),
//                 // ),
//                 child: Image.asset(
//                   'assets/logo1.png',
//                   filterQuality: FilterQuality.high,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.23,
//                   right: 35,
//                   left: 35),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Name",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextField(
//                       controller: _nameTextEditingController,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: 'Name',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ),
//                     if (_nameError != null)
//                       Text(
//                         _nameError!,
//                         style: const TextStyle(color: Colors.red, fontSize: 12),
//                       ),
//                     const SizedBox(
//                       height: 21,
//                     ),
//                     Text(
//                       "Email",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextField(
//                       controller: _emailTextEditingController,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: 'Email',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ),
//                     if (_emailError != null)
//                       Text(
//                         _emailError!,
//                         style: const TextStyle(color: Colors.red, fontSize: 12),
//                       ),
//                     const SizedBox(
//                       height: 21,
//                     ),
//                     Text(
//                       "Password",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextField(
//                       controller: _passwordTextEditingController,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: 'Password',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         suffixIcon: GestureDetector(
//                         onTap: () {
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
//                       height: 21,
//                     ),
//                     Text(
//                       "Re-Password",
//                       style: GoogleFonts.quicksand(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextField(
//                       controller: _repasswordTextEditingController,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: 'Re-Password',
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
//                     if (_repasswordError != null)
//                       Text(
//                         _repasswordError!,
//                         style: const TextStyle(color: Colors.red, fontSize: 12),
//                       ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(left: 80),
//                       width: 250,
//                       child: ElevatedButton(
//                           style: const ButtonStyle(
//                             backgroundColor: WidgetStatePropertyAll(
//                               Color.fromARGB(255, 210, 233, 8),
//                             ),
//                           ),
//                           onPressed: () async {
//                             setState(() {
//                               _nameError =
//                                   _nameTextEditingController.text.trim().isEmpty
//                                       ? "Name is required"
//                                       : null;
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
//                               _repasswordError =
//                                   _repasswordTextEditingController.text
//                                           .trim()
//                                           .isEmpty
//                                       ? "RePassword is required"
//                                       : null;
//                             });

//                             if (_nameTextEditingController.text
//                                     .trim()
//                                     .isNotEmpty &&
//                                 _emailTextEditingController.text
//                                     .trim()
//                                     .isNotEmpty &&
//                                 _passwordTextEditingController.text
//                                     .trim()
//                                     .isNotEmpty &&
//                                 _repasswordTextEditingController.text
//                                     .trim()
//                                     .isNotEmpty) {
//                               try {
//                                 UserCredential userCredential =
//                                     await _firebaseAuth
//                                         .createUserWithEmailAndPassword(
//                                   email:
//                                       _emailTextEditingController.text.trim(),
//                                   password: _passwordTextEditingController.text
//                                       .trim(),
//                                 );



//                                 await  FirebaseFirestore.instance.collection("users").add({
//                                   "avatarUrl":null,
//                                   "email":_emailTextEditingController.text,
//                                   "name":_nameTextEditingController.text,
//                                   "phone":"1234567890"

//                                } );

//                                 log("User : $userCredential");


//                                 CustomSnackbar.showCustomSnackbar(
//                                     context: context,
//                                     message: "User Regester successfully");
//                                 // Navigator.of(context).pop();

//                                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage(name: _nameTextEditingController,)));
//                               } on FirebaseAuthException catch (error) {
//                                 log(error.code);
//                                 log("${error.message}");
//                                 CustomSnackbar.showCustomSnackbar(
//                                     message: error.message!, context: context);
//                               }
//                             } else {
//                               CustomSnackbar.showCustomSnackbar(
//                                   message: "Please Enter Valid Data",
//                                   context: context);
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
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // onTap: ()  async{
// //   if(_nameTextEditingController.text.trim().isNotEmpty &&
// //   _emailTextEditingController.text.trim().isNotEmpty &&
// //   _passwordTextEditingController.text.trim().isNotEmpty &&
// //    _repasswordTextEditingController.text.trim().isNotEmpty
// //   ){
// //     try{
// //        UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
// //         email: _emailTextEditingController.text.trim(),
// //         password: _passwordTextEditingController.text.trim(),
// //         );
// //         log("User : $userCredential");
// //         CustomSnackbar.showCustomSnackbar(
// //           context: context,
// //           message: "User Regester successfully"
// //         );
// //         Navigator.of(context).pop();
// //     }on FirebaseAuthException catch(error){
// //       log("${error.code}");
// //       log("${error.message}");
// //       CustomSnackbar.showCustomSnackbar(message: error.message!, context: context
// //       );
// //     }
// //   }
// //   else{
// //       CustomSnackbar.showCustomSnackbar(message: "please enter valid data", context: context
// //       );

// //   }
// // },

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers_app/Model/customSnaker.dart';
import 'package:ecommers_app/controller/login_page.dart'; // Correct import for LoginPage
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _repasswordTextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _repasswordError;

  // No need for these to be state variables unless displayed directly
  // String? name;
  // String? email;

  // This function is for demonstration if you want to load data (not directly used in signup logic)
  // Future<void> _loadUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = prefs.getString('name') ?? "Loading..";
  //     email = prefs.getString('email') ?? "Loading..";
  //   });
  // }

  // --- START OF SIGNIFICANT CHANGES IN _signup FUNCTION ---
  Future<void> _signup() async {
    // Reset errors
    setState(() {
      _nameError = null;
      _emailError = null;
      _passwordError = null;
      _repasswordError = null;
    });

    // Validate fields
    if (_nameTextEditingController.text.trim().isEmpty) {
      setState(() {
        _nameError = "Name is required.";
      });
      return;
    }
    if (_emailTextEditingController.text.trim().isEmpty) {
      setState(() {
        _emailError = "Email is required.";
      });
      return;
    }
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailTextEditingController.text.trim())) {
      setState(() {
        _emailError = "Enter a valid email address.";
      });
      return;
    }
    if (_passwordTextEditingController.text.trim().isEmpty) {
      setState(() {
        _passwordError = "Password is required.";
      });
      return;
    }
    if (_passwordTextEditingController.text.trim().length < 6) {
      setState(() {
        _passwordError = "Password must be at least 6 characters.";
      });
      return;
    }
    if (_repasswordTextEditingController.text.trim().isEmpty) {
      setState(() {
        _repasswordError = "Re-enter password is required.";
      });
      return;
    }
    if (_passwordTextEditingController.text.trim() !=
        _repasswordTextEditingController.text.trim()) {
      setState(() {
        _repasswordError = "Passwords do not match.";
      });
      return;
    }

    try {
      // 1. Create user with email and password in Firebase Authentication
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailTextEditingController.text.trim(),
        password: _passwordTextEditingController.text.trim(),
      );

      // Check if user object exists after creation
      if (userCredential.user == null) {
        CustomSnackbar.showCustomSnackbar(
            message: "Signup failed: User object is null after creation.",
            context: context);
        return;
      }

      // Update the display name of the user in Firebase Auth
      await userCredential.user
          ?.updateDisplayName(_nameTextEditingController.text.trim());

      // 2. Save user data in Firestore with the user's email as the document ID
      // This is crucial for the LoginPage to find the user's profile data.
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.email) // <-- CHANGED: Using .doc(email) instead of .add()
          .set({
        'name': _nameTextEditingController.text.trim(),
        'email': _emailTextEditingController.text.trim(),
        'createdAt': Timestamp.now(),
        'phone': "N/A", // Added a default phone field
        'avatarUrl': null, // Added a default avatarUrl field
      });

      // 3. Save name and email in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _nameTextEditingController.text.trim());
      await prefs.setString('email', _emailTextEditingController.text.trim());

      log('Saved Name to SharedPreferences: ${prefs.getString('name')}');
      log('Saved Email to SharedPreferences: ${prefs.getString('email')}');
      log('Firebase User UID: ${userCredential.user!.uid}');
      log('Firestore Document Created for Email: ${userCredential.user!.email}');


      CustomSnackbar.showCustomSnackbar(
          context: context, message: "User registered successfully!");

      // 4. Navigate to LoginPage after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginPage(name: _nameTextEditingController.text)),
      );
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuth Error Code: ${e.code}");
      log("FirebaseAuth Error Message: ${e.message}");
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage =
              'The email address is already in use by another account.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'network-request-failed':
          errorMessage = 'No internet connection. Please check your network.';
          break;
        default:
          errorMessage = e.message ?? "Signup failed. Please try again.";
      }
      CustomSnackbar.showCustomSnackbar(
          message: errorMessage, context: context);
    } catch (e) {
      // Catch any other unexpected errors
      log("General Error during signup: $e");
      CustomSnackbar.showCustomSnackbar(
          message: "An unexpected error occurred. Please try again.",
          context: context);
    }
  }
  // --- END OF SIGNIFICANT CHANGES IN _signup FUNCTION ---

  bool _showPassword = false; // For both password fields

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      // Background gradient for agri-theme
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFC8E6C9), // Very light green (fresh sprout)
            Color(0xFFD7CCC8), // Light brown/tan (soil)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Make Scaffold transparent
        appBar: AppBar(
          title: Text(
            "Sign Up", // Changed from "SignUp" to "Sign Up"
            style: GoogleFonts.quicksand(
              fontSize: screenWidth * 0.07, // Responsive font size
              fontWeight: FontWeight.bold,
              color: const Color(0xFF388E3C), // Dark green for app bar title
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF388E3C), // Dark green for back button
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent, // Transparent app bar
          elevation: 0, // No shadow
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Logo/Image positioning
              Positioned(
                top: screenHeight * 0.01, // Adjusted for responsiveness
                left: screenWidth * 0.25, // Adjusted for responsiveness
                right: screenWidth * 0.25, // Adjusted for responsiveness
                child: SizedBox(
                  width: screenWidth * 0.6, // Responsive width
                  height: screenWidth * 0.5, // Responsive height (square)
                  child: Image.asset(
                    'assets/images/agri_basket2.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain, // Use contain to fit without cropping
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.23, // Adjusted for responsiveness
                  right: screenWidth * 0.08, // Responsive padding
                  left: screenWidth * 0.08, // Responsive padding
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    TextField(
                      controller: _nameTextEditingController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100.withOpacity(0.9),
                        filled: true,
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: _nameError,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Text(
                      "Email",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    TextField(
                      controller: _emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100.withOpacity(0.9),
                        filled: true,
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: _emailError,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Text(
                      "Password",
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    TextField(
                      controller: _passwordTextEditingController,
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100.withOpacity(0.9),
                        filled: true,
                        hintText: 'Enter your password',
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
                    SizedBox(height: screenHeight * 0.025),
                    Text(
                      "Confirm Password", // Changed from Re-Password
                      style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontSize: screenWidth * 0.04, // Responsive font size
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    TextField(
                      controller: _repasswordTextEditingController,
                      obscureText: !_showPassword, // Uses the same toggle
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100.withOpacity(0.9),
                        filled: true,
                        hintText: 'Re-enter your password',
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
                        errorText: _repasswordError,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04), // Increased spacing
                    Center(
                      child: SizedBox(
                        width: screenWidth * 0.6, // Responsive width
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              const Color(0xFF388E3C) // Dark green for Sign Up button
                                  .withOpacity(0.9),
                            ),
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.018)),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          onPressed: _signup, // Call the _signup function
                          child: Text(
                            "Sign Up", // Changed text to "Sign Up"
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.055, // Responsive font size
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(
                                  name:""
                                  ), // Pass an empty string or null for name
                            ),
                          );
                        },
                        child: Text(
                          "Already have an account? Login",
                          style: GoogleFonts.quicksand(
                            fontSize: screenWidth * 0.04,
                            color: Colors.black, // Darker color for visibility
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03), // Bottom padding
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