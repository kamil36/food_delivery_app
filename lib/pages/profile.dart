import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture & Info
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/img/profile.jpeg"),
                    ),
                    SizedBox(height: 10),
                    Text("Kamil Bombe",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("kamilbome@example.com",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Order History
              ListTile(
                leading: Icon(Icons.history, color: Colors.blue),
                title: Text("Order History"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to order history
                },
              ),
              Divider(),

              // Payment Methods
              ListTile(
                leading: Icon(Icons.payment, color: Colors.green),
                title: Text("Payment Methods"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              Divider(),

              // Settings
              ListTile(
                leading: Icon(Icons.settings, color: Colors.orange),
                title: Text("Settings"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to settings
                },
              ),
              Divider(),

              // Logout Button
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text("Logout"),
                onTap: () {
                  context.go('/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
