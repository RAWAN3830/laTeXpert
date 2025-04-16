    // import 'package:flutter/material.dart';
    // import 'package:flutter_resume_template/flutter_resume_template.dart';
    // import 'package:latexpert/presentation/flutter_resume_screen/resume_previrew_screen.dart';
    //
    // class DynamicResumeForm extends StatefulWidget {
    //   const DynamicResumeForm({super.key});
    //
    //   @override
    //   _DynamicResumeFormState createState() => _DynamicResumeFormState();
    // }
    //
    // class _DynamicResumeFormState extends State<DynamicResumeForm> {
    //   // Controllers for basic info
    //   final TextEditingController fullNameController = TextEditingController();
    //   final TextEditingController currentPositionController = TextEditingController();
    //   final TextEditingController streetController = TextEditingController();
    //   final TextEditingController addressController = TextEditingController();
    //   final TextEditingController countryController = TextEditingController();
    //   final TextEditingController emailController = TextEditingController();
    //   final TextEditingController phoneNumberController = TextEditingController();
    //   final TextEditingController bioController = TextEditingController();
    //
    //   // Lists for dynamic fields
    //   List<Map<String, dynamic>> experiences = [];
    //   List<String> education = [];
    //   List<Map<String, dynamic>> languages = [];
    //   List<String> hobbies = [];
    //
    //   // Image URLs
    //   final TextEditingController imageController = TextEditingController();
    //   final TextEditingController backgroundImageController = TextEditingController();
    //
    //   @override
    //   Widget build(BuildContext context) {
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: const Text('Dynamic Resume Form'),
    //       ),
    //       body: SingleChildScrollView(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Column(
    //           children: [
    //             // Basic details
    //             _buildTextField(fullNameController, 'Full Name'),
    //             _buildTextField(currentPositionController, 'Current Position'),
    //             _buildTextField(streetController, 'Street'),
    //             _buildTextField(addressController, 'Address'),
    //             _buildTextField(countryController, 'Country'),
    //             _buildTextField(emailController, 'Email'),
    //             _buildTextField(phoneNumberController, 'Phone Number'),
    //             _buildTextField(bioController, 'Bio', maxLines: 5),
    //
    //             // Experiences Section
    //             _buildDynamicSection(
    //               title: 'Experiences',
    //               onAdd: _addExperience,
    //               onRemove: _removeExperience,
    //               itemBuilder: (context, index) => _buildExperienceField(index),
    //               itemCount: experiences.length,
    //             ),
    //
    //             // Education Section
    //             _buildDynamicSection(
    //               title: 'Education',
    //               onAdd: _addEducation,
    //               onRemove: _removeEducation,
    //               itemBuilder: (context, index) => _buildEducationField(index),
    //               itemCount: education.length,
    //             ),
    //
    //             // Languages Section
    //             _buildDynamicSection(
    //               title: 'Languages',
    //               onAdd: _addLanguage,
    //               onRemove: _removeLanguage,
    //               itemBuilder: (context, index) => _buildLanguageField(index),
    //               itemCount: languages.length,
    //             ),
    //
    //             // Hobbies Section
    //             _buildDynamicSection(
    //               title: 'Hobbies',
    //               onAdd: _addHobby,
    //               onRemove: _removeHobby,
    //               itemBuilder: (context, index) => _buildHobbyField(index),
    //               itemCount: hobbies.length,
    //             ),
    //
    //             // Images
    //             _buildTextField(imageController, 'Profile Image URL'),
    //             _buildTextField(backgroundImageController, 'Background Image URL'),
    //
    //             // Submit Button
    //             const SizedBox(height: 20),
    //             ElevatedButton(
    //               onPressed: _submitForm,
    //               child: const Text('Submit'),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   }
    //
    //   Widget _buildTextField(TextEditingController controller, String label,
    //       {int maxLines = 1}) {
    //     return Padding(
    //       padding: const EdgeInsets.only(bottom: 16.0),
    //       child: TextField(
    //         controller: controller,
    //         maxLines: maxLines,
    //         decoration: InputDecoration(
    //           labelText: label,
    //           border: const OutlineInputBorder(),
    //         ),
    //       ),
    //     );
    //   }
    //
    //   // Dynamic Section Builder
    //   Widget _buildDynamicSection({
    //     required String title,
    //     required VoidCallback onAdd,
    //     required Function(int) onRemove,
    //     required Widget Function(BuildContext context, int index) itemBuilder,
    //     required int itemCount,
    //   }) {
    //     return Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           title,
    //           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //         ),
    //         ListView.builder(
    //           shrinkWrap: true,
    //           physics: const NeverScrollableScrollPhysics(),
    //           itemCount: itemCount,
    //           itemBuilder: (BuildContext context, int index) {
    //             return Row(
    //               children: [
    //                 Expanded(child: itemBuilder(context, index)),
    //                 IconButton(
    //                   icon: const Icon(Icons.delete),
    //                   onPressed: () => onRemove(index),
    //                 ),
    //               ],
    //             );
    //           },
    //         ),
    //         ElevatedButton.icon(
    //           onPressed: onAdd,
    //           icon: const Icon(Icons.add),
    //           label: Text('Add $title'),
    //         ),
    //         const SizedBox(height: 16),
    //       ],
    //     );
    //   }
    //
    //   // Experience Field
    //   Widget _buildExperienceField(int index) {
    //     final experience = experiences[index];
    //     return Column(
    //       children: [
    //         _buildTextField(TextEditingController(text: experience['title'] ?? ''), 'Title'),
    //         _buildTextField(TextEditingController(text: experience['description'] ?? ''),
    //             'Description', maxLines: 3),
    //       ],
    //     );
    //   }
    //
    //   // Education Field
    //   Widget _buildEducationField(int index) {
    //     return _buildTextField(
    //       TextEditingController(text: education[index]),
    //       'Education',
    //     );
    //   }
    //
    //   // Language Field
    //   Widget _buildLanguageField(int index) {
    //     final language = languages[index];
    //     return Row(
    //       children: [
    //         Expanded(
    //           child: _buildTextField(
    //             TextEditingController(text: language['name']),
    //             'Language',
    //           ),
    //         ),
    //         Expanded(
    //           child: TextField(
    //             controller: TextEditingController(text: language['level']),
    //             keyboardType: TextInputType.number,
    //             decoration: const InputDecoration(
    //               labelText: 'Level',
    //               border: OutlineInputBorder(),
    //             ),
    //             onChanged: (value) {
    //               // Validate numeric input
    //               if (int.tryParse(value) == null) {
    //                 ScaffoldMessenger.of(context).showSnackBar(
    //                   const SnackBar(content: Text('Please enter a valid number')),
    //                 );
    //               } else {
    //                 languages[index]['level'] = value;
    //               }
    //             },
    //           ),
    //         ),
    //       ],
    //     );
    //   }
    //
    //   // Hobby Field
    //   Widget _buildHobbyField(int index) {
    //     return _buildTextField(
    //       TextEditingController(text: hobbies[index]),
    //       'Hobby',
    //     );
    //   }
    //
    //   // Dynamic Add/Remove Functions
    //   void _addExperience() {
    //     setState(() {
    //       experiences.add({'title': '', 'description': ''});
    //     });
    //   }
    //
    //   void _removeExperience(int index) {
    //     setState(() {
    //       experiences.removeAt(index);
    //     });
    //   }
    //
    //   void _addEducation() {
    //     setState(() {
    //       education.add('');
    //     });
    //   }
    //
    //   void _removeEducation(int index) {
    //     setState(() {
    //       education.removeAt(index);
    //     });
    //   }
    //
    //   void _addLanguage() {
    //     setState(() {
    //       languages.add({'name': '', 'level': ''});
    //     });
    //   }
    //
    //   void _removeLanguage(int index) {
    //     setState(() {
    //       languages.removeAt(index);
    //     });
    //   }
    //
    //   void _addHobby() {
    //     setState(() {
    //       hobbies.add('');
    //     });
    //   }
    //
    //   void _removeHobby(int index) {
    //     setState(() {
    //       hobbies.removeAt(index);
    //     });
    //   }
    //
    //   // Submit Function
    //   void _submitForm() {
    //     try {
    //       TemplateData data = TemplateData(
    //         fullName: fullNameController.text,
    //         currentPosition: currentPositionController.text,
    //         street: streetController.text,
    //         address: addressController.text,
    //         country: countryController.text,
    //         email: emailController.text,
    //         phoneNumber: phoneNumberController.text,
    //         bio: bioController.text,
    //         experience: experiences.map((e) {
    //           return ExperienceData(
    //             experienceTitle: e['title'] ?? '',
    //             experienceDescription: e['description'] ?? '',
    //             experienceLocation: 'Location', // Add dynamically if needed
    //             experiencePeriod: 'Period', // Add dynamically if needed
    //             experiencePlace: 'Place', // Add dynamically if needed
    //           );
    //         }).toList(),
    //         educationDetails: education.map((e) => Education(e, 'University')).toList(),
    //         languages: languages.map((l) {
    //           // Add error handling for level parsing
    //           int level = 0;
    //           try {
    //             level = int.parse(l['level'] ?? '0');
    //           } catch (e) {
    //             print('Invalid language level: ${l['level']}, defaulting to 0');
    //           }
    //           return Language(l['name'] ?? '', level);
    //         }).toList(),
    //         hobbies: hobbies,
    //         image: imageController.text,
    //         backgroundImage: backgroundImageController.text,
    //       );
    //
    //       // Navigate to the resume preview screen
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => ResumePreviewScreen(data: data),
    //         ),
    //       );
    //     } catch (e) {
    //       // Show error message to the user
    //       print('Error while submitting form: $e');
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text('An error occurred while submitting the form')),
    //       );
    //     }
    //   }
    // }

    import 'package:flutter/material.dart';
    import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:latexpert/presentation/flutter_resume_screen/resume_previrew_screen.dart';

    class DynamicResumeForm extends StatefulWidget {
      const DynamicResumeForm({super.key});

      @override
      _DynamicResumeFormState createState() => _DynamicResumeFormState();
    }

    class _DynamicResumeFormState extends State<DynamicResumeForm> {
      // Controllers for personal info
      final TextEditingController fullNameController = TextEditingController();
      final TextEditingController currentPositionController = TextEditingController();
      final TextEditingController streetController = TextEditingController();
      final TextEditingController addressController = TextEditingController();
      final TextEditingController countryController = TextEditingController();
      final TextEditingController emailController = TextEditingController();
      final TextEditingController phoneNumberController = TextEditingController();
      final TextEditingController bioController = TextEditingController();

      // Image URLs
      final TextEditingController imageController = TextEditingController();
      final TextEditingController backgroundImageController = TextEditingController();

      // Dynamic sections
      List<Map<String, dynamic>> experiences = [];
      List<String> education = [];
      List<Map<String, dynamic>> languages = [];
      List<String> hobbies = [];

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Build Your Resume')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildSectionCard('Personal Info', [
                  _buildTextField(fullNameController, 'Full Name'),
                  _buildTextField(currentPositionController, 'Current Position'),
                  _buildTextField(streetController, 'Street'),
                  _buildTextField(addressController, 'Address'),
                  _buildTextField(countryController, 'Country'),
                  _buildTextField(emailController, 'Email'),
                  _buildTextField(phoneNumberController, 'Phone Number'),
                  _buildTextField(bioController, 'Bio', maxLines: 4),
                ]),
                _buildDynamicCard('Experiences', experiences.length, _addExperience, _removeExperience, _buildExperienceField),
                _buildDynamicCard('Education', education.length, _addEducation, _removeEducation, _buildEducationField),
                _buildDynamicCard('Languages', languages.length, _addLanguage, _removeLanguage, _buildLanguageField),
                _buildDynamicCard('Hobbies', hobbies.length, _addHobby, _removeHobby, _buildHobbyField),
                _buildSectionCard('Images', [
                  _buildTextField(imageController, 'Profile Image URL'),
                  _buildTextField(backgroundImageController, 'Background Image URL'),
                ]),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Preview Resume'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      // Section card UI
      Widget _buildSectionCard(String title, List<Widget> fields) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                ...fields,
              ],
            ),
          ),
        );
      }

      // Text field builder
      Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
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

      // Dynamic card builder
      Widget _buildDynamicCard(
          String title,
          int count,
          VoidCallback onAdd,
          Function(int) onRemove,
          Widget Function(int) builder,
          ) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: count,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: builder(index)),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => onRemove(index),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: onAdd,
                    icon: const Icon(Icons.add),
                    label: Text('Add $title'),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      // Dynamic field builders
      Widget _buildExperienceField(int index) {
        final item = experiences[index];
        return Column(
          children: [
            _buildTextField(TextEditingController(text: item['title'] ?? ''), 'Title'),
            _buildTextField(TextEditingController(text: item['description'] ?? ''), 'Description', maxLines: 2),
          ],
        );
      }

      Widget _buildEducationField(int index) {
        return _buildTextField(TextEditingController(text: education[index]), 'Degree or Education Info');
      }

      Widget _buildLanguageField(int index) {
        final lang = languages[index];
        return Row(
          children: [
            Expanded(child: _buildTextField(TextEditingController(text: lang['name']), 'Language')),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: TextEditingController(text: lang['level']),
                decoration: const InputDecoration(labelText: 'Level (0-100)', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  if (int.tryParse(val) != null) {
                    languages[index]['level'] = val;
                  }
                },
              ),
            ),
          ],
        );
      }

      Widget _buildHobbyField(int index) {
        return _buildTextField(TextEditingController(text: hobbies[index]), 'Hobby');
      }

      // Add/remove handlers
      void _addExperience() => setState(() => experiences.add({'title': '', 'description': ''}));
      void _removeExperience(int index) => setState(() => experiences.removeAt(index));
      void _addEducation() => setState(() => education.add(''));
      void _removeEducation(int index) => setState(() => education.removeAt(index));
      void _addLanguage() => setState(() => languages.add({'name': '', 'level': ''}));
      void _removeLanguage(int index) => setState(() => languages.removeAt(index));
      void _addHobby() => setState(() => hobbies.add(''));
      void _removeHobby(int index) => setState(() => hobbies.removeAt(index));

      // Submit and navigate to preview
      void _submitForm() {
        try {
          final data = TemplateData(
            fullName: fullNameController.text,
            currentPosition: currentPositionController.text,
            street: streetController.text,
            address: addressController.text,
            country: countryController.text,
            email: emailController.text,
            phoneNumber: phoneNumberController.text,
            bio: bioController.text,
            experience: experiences.map((e) {
              return ExperienceData(
                experienceTitle: e['title'] ?? '',
                experienceDescription: e['description'] ?? '',
                experienceLocation: 'Location',
                experiencePeriod: 'Period',
                experiencePlace: 'Place',
              );
            }).toList(),
            educationDetails: education.map((e) => Education(e, 'University')).toList(),
            languages: languages.map((l) {
              int level = int.tryParse(l['level'] ?? '0') ?? 0;
              return Language(l['name'] ?? '', level);
            }).toList(),
            hobbies: hobbies,
            image: imageController.text,
            backgroundImage: backgroundImageController.text,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResumePreviewScreen(data: data),
            ),
          );
        } catch (e) {
          print('Submit Error: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong! Please check your inputs.')),
          );
        }
      }
    }
