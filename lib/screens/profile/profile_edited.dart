import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_bottom_nav.dart';
import '../../core/widgets/thread_card.dart';
import '../../data/dummy_data.dart';
import '../achievement/achievement_screen.dart';
import '../forum/forum_landing_screen.dart';
import '../home/home_screen.dart';

class ProfileEdited extends StatefulWidget {
const ProfileEdited({super.key});

@override
  State<ProfileEdited> createState() => _ProfileEditedState();
}
class _ProfileEditedState extends State<ProfileEdited> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  void dispose(){
   _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
         title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontSize: 20),    
         ),  
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Form Input (TextField)
        TextField(
          controller: _nameController,
        decoration: InputDecoration(
          labelText: "Nama Lengkap",
          hintText: "Masukkan nama Anda",
          border: OutlineInputBorder(), // Memberi bingkai pada input
        ),
      ),
     const  SizedBox(height: 10),

        TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Masukkan Email Anda",
          border: OutlineInputBorder(), // Memberi bingkai pada input
        ),
      ),
      const  SizedBox(height: 10),

       TextField(
        controller: _phoneController,
        decoration: InputDecoration(
          labelText: "Nomor Hp",
          hintText: "Masukkan Nomor Hp Anda",
          border: OutlineInputBorder(), // Memberi bingkai pada input
        ),
      ),
      const SizedBox(height: 20,),
     ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            ),
            child: const Text(
              "Save", 
              style: TextStyle(color:Colors.white ),
            ),
             onPressed:(){
             final profileData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
             };
             Navigator.pop(context, profileData);
             }  
        ),
          ],
        ),
      ),
    );
    
  }
}