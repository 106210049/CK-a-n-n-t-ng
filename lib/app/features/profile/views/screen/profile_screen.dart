library profile;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:market/app/features/dashboard/explore/views/screens/explore_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// binding
part '../../bindings/profile_binding.dart';
part '../../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[600], // Màu nền phần trên
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Xử lý nút giỏ hàng
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Phần thông tin cá nhân
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // URL ảnh đại diện
                ),
                SizedBox(height: 10),
                Text(
                  "Hoang Bao Long",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Classic Member",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Xử lý nút Start Selling
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.orangeAccent,
                      ),
                      child: Text("Start Selling"),
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "Follower 0",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Following 234",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Các danh mục bên dưới
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                _buildCategory(
                  context,
                  icon: Icons.shopping_bag,
                  title: "My Purchases",
                  subItems: ["To Pay", "To Ship", "To Receive"],
                ),
                _buildCategory(context,
                    icon: Icons.favorite, title: "Favorite", subItems: []),
                _buildCategory(context,
                    icon: Icons.history, title: "Recently Viewed", subItems: []),
                _buildCategory(context,
                    icon: Icons.loyalty, title: "Loyalty", subItems: []),
                _buildCategory(context,
                    icon: Icons.card_giftcard,
                    title: "Gift Vouchers",
                    subItems: []),
                _buildCategory(context,
                    icon: Icons.settings, title: "Account Setting", subItems: []),
                _buildCategory(context,
                    icon: Icons.help, title: "Help Centre", subItems: []),
                _buildCategory(context,
                    icon: Icons.chat, title: "Chat with Shopee", subItems: []),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context,
      {required IconData icon,
        required String title,
        required List<String> subItems}) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.orangeAccent),
        title: Text(title),
        children: subItems
            .map((subItem) => ListTile(
          title: Text(subItem),
        ))
            .toList(),
      ),
    );
  }
}
