import 'package:apk_mobile/view/log/sign_in.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.lightBlue,
        title: Text(
          "Profile Saya",
          style: CustomText.title.copyWith(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              const SizedBox(
                height: 10,
              ),

              // Account information
              _buildProfileSection(
                title: 'Account Information',
                items: [
                  _buildProfileItem(
                    icon: Icons.person,
                    title: 'Personal Details',
                    onTap: () {
                      // jika diklik kehalaman personal details
                    },
                  ),
                  _buildProfileItem(
                    icon: Icons.lock,
                    title: 'Change Password',
                    onTap: () {
                      // jika diklik kehalaman ubah password
                    },
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // My Shopping
              _buildProfileSection(
                title: 'My Shopping',
                items: [
                  _buildProfileItem(
                    icon: Icons.shopping_bag,
                    title: 'My Orders',
                    onTap: () {
                      // jika diklik kehalaman orders
                    },
                  ),
                  _buildProfileItem(
                    icon: Icons.favorite,
                    title: 'Wishlist',
                    onTap: () {
                      // jika diklik kehalaman favorite
                    },
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // Support
              _buildProfileSection(
                title: 'Support',
                items: [
                  _buildProfileItem(
                    icon: Icons.help,
                    title: 'Help Center',
                    onTap: () {
                      // jika diklik kehalaman Help Center
                    },
                  ),
                  _buildProfileItem(
                    icon: Icons.feedback,
                    title: 'Send Feedback',
                    onTap: () {
                      // jika diklik kehalaman feedback
                    },
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              // Item Logout
              _buildProfileSection(
                title: 'Logout',
                items: [
                  _buildProfileItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      // Jika diklik kehalaman sign in
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignInScreen()),
                                    (route) => false);
                              },
                              child: const Text('Logout'),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// method ini dipanggil didalam method screen
// method Profile bagian header
  Widget _buildProfileHeader() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: AppColors.darkGrey,
                offset: Offset(0, 3))
          ]),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                'assets/images/mentahan-profile.jpg',
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wahyu Arliansyah',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileSection({
    required String title,
    required List<Widget> items,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: AppColors.darkGrey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
