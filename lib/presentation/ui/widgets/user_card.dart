import 'package:flutter/material.dart';
import 'package:project_bringin/data/models/users_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.userModel,
    required this.name,
    required this.userName,
    required this.address,
    required this.email,
    required this.phone,
  });

  final UsersModel userModel;
  final String name;
  final String userName;
  final String address;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                userName,
                style: const TextStyle(fontSize: 17),
              ),
              Text(
                address,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                phone,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
