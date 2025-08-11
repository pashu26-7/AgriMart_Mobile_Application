// import 'dart:async';
// import 'package:ecommers_app/controller/login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen> with TickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize animation controller
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3), // Duration of gradient swipe
//     )..repeat(reverse: false); // Repeat animation infinitely

//     Timer(
//       const Duration(seconds: 4), // Duration before navigating to the next screen
//       () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const LoginPage(name: "",), // Replace with your next screen
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose(); // Dispose controller to prevent memory leaks
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.black, // Background color
//         child: Center(
//           child: AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return ShaderMask(
//                 shaderCallback: (bounds) {
//                   return LinearGradient(
//                     colors:const  [
//                       Color.fromARGB(255, 54, 82, 244),
//                       Colors.white,
//                       Color.fromARGB(255, 237, 7, 26),
//                     ],
//                     stops: [
//                       _controller.value - 0.1, // Starting position of swipe
//                       _controller.value, // Mid-point of swipe
//                       _controller.value + 0.1 , // Ending position of swipe
//                     ],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     tileMode: TileMode.mirror, // Loop the gradient
//                   ).createShader(bounds);
//                 },
//                 child: child,
//               );
//             },
//             child: Text(
//               "Agri Mart",
//               style: GoogleFonts.sacramento(
//               // style: GoogleFonts.lobster(
//                 fontSize: 80,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 114, 239, 4), // Base color (will be masked by gradient)
//                 letterSpacing: 2.0,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// final code -20/7/25

// import 'dart:async';
// import 'package:ecommers_app/controller/login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     )..repeat(reverse: false);

//     Timer(
//       const Duration(seconds: 4),
//       () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const LoginPage(name: ""),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get screen width to adjust font size responsively
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF0f2027), // Dark blue-green
//               Color.fromARGB(255, 70, 143, 52), // Light teal-blue
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return ShaderMask(
//                 shaderCallback: (bounds) {
//                   return LinearGradient(
//                     colors: const [
//                       Color.fromARGB(255, 240, 236, 227),
//                       Colors.white,
//                       Color.fromARGB(255, 210, 210, 7),
//                     ],
//                     stops: [
//                       _controller.value - 0.1,
//                       _controller.value,
//                       _controller.value + 0.1,
//                     ],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     tileMode: TileMode.mirror,
//                   ).createShader(bounds);
//                 },
//                 child: child,
//               );
//             },
//             child: Text(
//               "Agri Mart",
//               style: GoogleFonts.bebasNeue(
//                 fontSize: screenWidth * 0.18,
//                 color: const Color.fromARGB(255, 244, 245, 243),
//                 letterSpacing: 3.0,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// final code 2 - 20/7/25

// import 'dart:async';
// import 'package:ecommers_app/controller/login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     )..repeat(reverse: false);

//     Timer(
//       const Duration(seconds: 4),
//       () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const LoginPage(name: ""),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF0f2027), // Dark blue-green
//               Color.fromARGB(255, 70, 143, 52), // Light green
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               /// Your original GOGREEN static title
//               // Text(
//               //   'GOGREEN',
//               //   style: GoogleFonts.poppins(
//               //     fontSize: width * 0.1,
//               //     color: Colors.white,
//               //     fontWeight: FontWeight.w500,
//               //   ),
//               // ),

//               const SizedBox(height: 20),

//               /// New animated Agri Mart gradient title
//               AnimatedBuilder(
//                 animation: _controller,
//                 builder: (context, child) {
//                   return ShaderMask(
//                     shaderCallback: (bounds) {
//                       return LinearGradient(
//                         colors: const [
//                           Color.fromARGB(255, 240, 236, 227),
//                           Colors.white,
//                           Color.fromARGB(255, 210, 210, 7),
//                         ],
//                         stops: [
//                           _controller.value - 0.1,
//                           _controller.value,
//                           _controller.value + 0.1,
//                         ],
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         tileMode: TileMode.mirror,
//                       ).createShader(bounds);
//                     },
//                     child: child,
//                   );
//                 },
//                 child: Text(
//                   "Agri Mart",
//                   style: GoogleFonts.bebasNeue(
//                     fontSize: width * 0.18,
//                     color: const Color.fromARGB(255, 244, 245, 243),
//                     letterSpacing: 3.0,
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

// final code 3 - 21/7/25
// import 'dart:async';
// import 'package:ecommers_app/controller/splashscreen2.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// //import 'agriculture_screen.dart'; // Make sure path is correct

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     )..repeat(reverse: false);

//     Timer(
//       const Duration(seconds: 4),
//       () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const AgricultureScreen(),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//              // faint light green
//               Color(0xFFFFFDE7), // faint creamy yellow
//                Color.fromARGB(255, 71, 117, 19), 
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               AnimatedBuilder(
//                 animation: _controller,
//                 builder: (context, child) {
//                   return ShaderMask(
//                     shaderCallback: (bounds) {
//                       return LinearGradient(
//                         colors: const [
//                           Color.fromARGB(255, 240, 236, 227),
//                           Colors.white,
//                           //Color.fromARGB(255, 210, 210, 7),
//                         ],
//                         stops: [
//                           _controller.value - 0.1,
//                           _controller.value,
//                           //_controller.value + 0.1,
//                         ],
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         tileMode: TileMode.mirror,
//                       ).createShader(bounds);
//                     },
//                     child: child,
//                   );
//                 },
//                 child: Text(
//                   "Agri Mart",
//                   style: GoogleFonts.bebasNeue(
//                     fontSize: width * 0.18,
//                     color: const Color.fromARGB(255, 244, 245, 243),
//                     letterSpacing: 3.0,
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

// final code 21
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/splashscreen2.dart'; // Replace with actual screen path

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: false);

    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AgricultureScreen(), // Replace if needed
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFDE7), // creamy yellow
              Color.fromARGB(255, 71, 117, 19), // green
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🖼️ Top image (basket of vegetables)
              Image.asset(
                'assets/images/agri_basket2.png', // path to your image
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: const [
                          Color.fromARGB(255, 240, 236, 227),
                          Colors.white,
                        ],
                        stops: [
                          _controller.value - 0.1,
                          _controller.value,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    child: child,
                  );
                },
                child: Text(
                  "Agri Mart",
                  style: GoogleFonts.bebasNeue(
                    fontSize: width * 0.18,
                    color: const Color.fromARGB(255, 244, 245, 243),
                    letterSpacing: 3.0,
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
