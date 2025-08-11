// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ForgotPasswordPage extends StatefulWidget {
//   const ForgotPasswordPage({super.key});

//   @override
//   State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
// }

// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   final TextEditingController _emailController = TextEditingController();
//   String? _emailError;
//   bool _emailSent = false;

//   Future<void> _resetPassword() async {
//     final email = _emailController.text.trim();

//     setState(() {
//       _emailError = email.isEmpty ? "Email is required" : null;
//     });

//     if (_emailError == null) {
//       try {
//         await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//         setState(() {
//           _emailSent = true;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Password reset email sent to $email")),
//         );
//       } on FirebaseAuthException catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(e.message ?? "Failed to send reset email")),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Forgot Password", style: GoogleFonts.quicksand()),
//         backgroundColor: const Color.fromARGB(255, 42, 133, 225),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Enter your email to reset your password",
//                 style: GoogleFonts.quicksand(fontSize: 18)),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 hintText: "Email",
//                 filled: true,
//                 fillColor: Colors.grey.shade100,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 errorText: _emailError,
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               style: const ButtonStyle(
//                 backgroundColor: WidgetStatePropertyAll(
//                   Color.fromARGB(255, 42, 133, 225),
//                 ),
//               ),
//               onPressed: _resetPassword,
//               child: Text(
//                 "Send Reset Link",
//                 style: GoogleFonts.quicksand(
//                     fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             if (_emailSent)
//               const Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: Text(
//                   "Check your email for the password reset link.",
//                   style: TextStyle(color: Colors.green),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  String? _emailError;
  bool _emailSent = false;

  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();

    setState(() {
      _emailError = email.isEmpty ? "Email is required" : null;
    });

    if (_emailError == null) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        setState(() {
          _emailSent = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password reset email sent to $email"),
            backgroundColor: Colors.green, // Green for success
          ),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? "Failed to send reset email"),
            backgroundColor: Colors.red, // Red for error
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password",
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text on dark green app bar
            )),
        backgroundColor:
            const Color(0xFF388E3C), // A darker shade of green for the app bar
        iconTheme: const IconThemeData(color: Colors.white), // For back button
        elevation: 0, // Remove shadow
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch buttons
            children: [
              Text(
                "Enter your email address below to receive a password reset link.",
                style: GoogleFonts.quicksand(
                    fontSize: 18,
                    color: Colors.black87, // Slightly darker text
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30), // Increased spacing
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress, // Optimized for email input
                decoration: InputDecoration(
                  labelText: "Email Address", // Label for clarity
                  labelStyle: GoogleFonts.quicksand(color: Colors.black54),
                  hintText: "example@email.com",
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.9), // Slightly transparent white
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // More rounded corners
                    borderSide: BorderSide.none, // No border line when not focused
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Color(0xFF388E3C),
                        width: 2), // Green border when focused
                  ),
                  errorText: _emailError,
                  prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF388E3C)), // Email icon
                ),
              ),
              const SizedBox(height: 25), // Increased spacing
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF66BB6A), // A vibrant green for the button
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5, // Add a slight shadow
                ),
                onPressed: _resetPassword,
                child: Text(
                  "Send Reset Link",
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text for contrast
                  ),
                ),
              ),
              if (_emailSent)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "If an account exists for this email, a password reset link has been sent. Please check your inbox (and spam folder).",
                    style: GoogleFonts.quicksand(
                        color: Colors.green.shade800,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              const Spacer(), // Pushes the cancel button to the bottom
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: Color(0xFF388E3C),
                      width: 2), // Green border for cancel button
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context); // Navigates back to the previous screen
                },
                child: Text(
                  "Cancel",
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF388E3C), // Green text for cancel
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