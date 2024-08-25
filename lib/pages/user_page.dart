import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/userprovider.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle image selection
                  // For now, let's assume it's a dummy path
                  userProvider.setImagePath('assets/dummy_image.png');
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: userProvider.imagePath != null
                      ? AssetImage(userProvider.imagePath!)
                      : null,
                  child: userProvider.imagePath == null
                      ? const Icon(Icons.add_a_photo, size: 50)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: userProvider.firstName,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Enter your first name',
                ),
                onChanged: (value) {
                  userProvider.setFirstName(value);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: userProvider.lastName,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                ),
                onChanged: (value) {
                  userProvider.setLastName(value);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: userProvider.email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                onChanged: (value) {
                  userProvider.setEmail(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
