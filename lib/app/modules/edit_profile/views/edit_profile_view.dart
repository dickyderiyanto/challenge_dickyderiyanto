import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/user_profile.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  EditProfileView({super.key});

  // final EditProfileController controller = Get.put(EditProfileController());
  final UserProfile userProfile = UserProfile(
    name: '',
    email: '',
    gender: 'laki_laki', // Sesuaikan dengan default gender jika ada
    dateOfBirth: '',
    height: 0,
    weight: 0,
    profilePicture: null, // Bisa diatur berdasarkan kebutuhan
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) => userProfile.name = value,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => userProfile.email = value,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: userProfile.gender,
              onChanged: (value) => userProfile.gender = value!,
              items: ['laki_laki', 'perempuan']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Date of Birth'),
              onChanged: (value) => userProfile.dateOfBirth = value,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Height'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  userProfile.height = int.tryParse(value) ?? 0,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  userProfile.weight = int.tryParse(value) ?? 0,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (controller.validateInputs(userProfile)) {
                  controller.updateUserProfile(userProfile);
                }
              },
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
