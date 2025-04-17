import 'package:flutter/material.dart';

class UserDetailsForm extends StatefulWidget {
  const UserDetailsForm({super.key});

  @override
  _UserDetailsFormState createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController currentPositionController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController experience1Controller = TextEditingController();
  final TextEditingController experience2Controller = TextEditingController();
  final TextEditingController experience3Controller = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController backgroundImageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(fullNameController, "Full Name"),
            _buildTextField(currentPositionController, "Current Position"),
            _buildTextField(streetController, "Street"),
            _buildTextField(addressController, "Address"),
            _buildTextField(countryController, "Country"),
            _buildTextField(emailController, "Email"),
            _buildTextField(phoneNumberController, "Phone Number"),
            _buildTextField(bioController, "Bio", maxLines: 5),
            _buildTextField(experience1Controller, "Experience 1 (Description)", maxLines: 5),
            _buildTextField(experience2Controller, "Experience 2 (Description)", maxLines: 5),
            _buildTextField(experience3Controller, "Experience 3 (Description)", maxLines: 5),
            _buildTextField(educationController, "Education (Separate by commas)"),
            _buildTextField(languagesController, "Languages (e.g., English:5, French:4)"),
            _buildTextField(hobbiesController, "Hobbies (Separate by commas)"),
            _buildTextField(imageUrlController, "Profile Image URL"),
            _buildTextField(backgroundImageUrlController, "Background Image URL"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitDetails,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String label, {
        int maxLines = 1,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void _submitDetails() {
    // Collect all the details entered by the user
    final fullName = fullNameController.text;
    final currentPosition = currentPositionController.text;
    final street = streetController.text;
    final address = addressController.text;
    final country = countryController.text;
    final email = emailController.text;
    final phoneNumber = phoneNumberController.text;
    final bio = bioController.text;
    final experience1 = experience1Controller.text;
    final experience2 = experience2Controller.text;
    final experience3 = experience3Controller.text;
    final education = educationController.text.split(',');
    final languages = languagesController.text.split(',').map((e) {
      final parts = e.split(':');
      return {'language': parts[0].trim(), 'level': int.parse(parts[1])};
    }).toList();
    final hobbies = hobbiesController.text.split(',');
    final imageUrl = imageUrlController.text;
    final backgroundImageUrl = backgroundImageUrlController.text;

    // Display or process the collected data
    print({
      'fullName': fullName,
      'currentPosition': currentPosition,
      'street': street,
      'address': address,
      'country': country,
      'email': email,
      'phoneNumber': phoneNumber,
      'bio': bio,
      'experience': [experience1, experience2, experience3],
      'education': education,
      'languages': languages,
      'hobbies': hobbies,
      'imageUrl': imageUrl,
      'backgroundImageUrl': backgroundImageUrl,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Details Submitted!')),
    );
  }
}