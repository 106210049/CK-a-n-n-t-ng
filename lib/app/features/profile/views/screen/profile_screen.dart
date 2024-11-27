library profile;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:market/app/utils/services/rest_api_services.dart';
import 'package:market/app/features/dashboard/explore/views/screens/explore_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../dashboard/index/views/screens/dashboard_screen.dart';
// binding
part '../../bindings/profile_binding.dart';
part '../../controllers/profile_controller.dart';
class ProfileScreen extends StatelessWidget {
  final UserService userService = UserService(); // Khởi tạo UserService

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin người dùng (ví dụ: ID = "fwg123")
    final user = userService.getUserByID("12345");

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
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
                  backgroundImage: user.profilImage, // Hiển thị ảnh đại diện
                ),
                SizedBox(height: 10),
                Text(
                  user.name, // Hiển thị tên người dùng
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${user.city}, ${user.country}", // Hiển thị thành phố và quốc gia
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
                    icon: FontAwesomeIcons.solidStar, title: "Favorite", subItems: []),
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
                    icon: FontAwesomeIcons.solidCommentAlt, title: "Chat with Shop", subItems: []),
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