// import 'package:flutter/material.dart';

// class EditProfileScreen extends StatelessWidget {
//   const EditProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: const TextButton(
//           onPressed: null,
//           child: Text('Cancel', style: TextStyle(color: Colors.blue)),
//         ),
//         title: const Text('Edit Profile', style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: const [
//           TextButton(
//             onPressed: null,
//             child: Text('Save', style: TextStyle(color: Colors.blue)),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             Stack(
//               alignment: Alignment.bottomRight,
//               children: const [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage('assets/sasha.jpg'), // Replace with your asset
//                 ),
//                 CircleAvatar(
//                   radius: 15,
//                   backgroundColor: Colors.grey,
//                   child: Icon(Icons.edit, size: 15, color: Colors.white),
//                 )
//               ],
//             ),
//             const SizedBox(height: 30),
//             const Padding(
//               padding: EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   EditTextField(label: 'YOUR EMAIL', hint: 'maysasha@gmail.com'),
//                   EditTextField(label: 'YOUR PASSWORD', hint: '********'),
//                   EditTextField(label: 'YOUR PHONE', hint: '+1.415.111.0000'),
//                   EditTextField(label: 'CITY, STATE', hint: 'San Francisco, CA'),
//                   EditTextField(label: 'COUNTRY', hint: 'USA'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class EditTextField extends StatelessWidget {
//   final String label;
//   final String hint;

//   const EditTextField({super.key, required this.label, required this.hint});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label,
//               style: const TextStyle(fontSize: 12, color: Colors.grey)),
//           TextField(
//             decoration: InputDecoration(
//               hintText: hint,
//               border: const UnderlineInputBorder(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? selectedCity = 'San Francisco, CA';
  String? selectedCountry = 'USA';

  final List<String> cityOptions = [
    'San Francisco, CA',
    'New York, NY',
    'Los Angeles, CA',
    'Chicago, IL',
    'Seattle, WA'
  ];

  final List<String> countryOptions = [
    'USA',
    'Canada',
    'India',
    'Australia',
    'UK'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
        ),
        title: const Text('Edit Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Save logic
              Navigator.pop(context);
            },
            child: const Text('Save', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Stack(
              alignment: Alignment.bottomRight,
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/aneet.png'),
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.edit, size: 15, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const EditTextField(label: 'YOUR NAME', hint: ' Aneet Padda'),
                  const EditTextField(label: 'YOUR EMAIL', hint: ' aneetpadda@gmail.com'),
                  const EditTextField(label: 'YOUR PASSWORD', hint: '********'),
                  const EditTextField(label: 'YOUR PHONE', hint: '+1.415.111.0000'),
                  DropdownField(
                    label: 'CITY, STATE',
                    value: selectedCity,
                    items: cityOptions,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                  ),
                  DropdownField(
                    label: 'COUNTRY',
                    value: selectedCountry,
                    items: countryOptions,
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditTextField extends StatelessWidget {
  final String label;
  final String hint;

  const EditTextField({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: const UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const DropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          DropdownButtonFormField<String>(
            value: value,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
            icon: const Icon(Icons.keyboard_arrow_down),
            isExpanded: true,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
