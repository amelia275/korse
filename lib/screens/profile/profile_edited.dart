import 'package:flutter/material.dart'; //profile edited


class ProfileEdited extends StatelessWidget {
const ProfileEdited({super.key});

  @override
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
       const TextField(
          decoration: InputDecoration(
          labelText: "Nama Lengkap",
          hintText: "Masukkan nama Anda",
          border: OutlineInputBorder(), // Memberi bingkai pada input
        ),
      ),
     const  SizedBox(height: 10),

        const TextField(
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Masukkan Email Anda",
          border: OutlineInputBorder(), // Memberi bingkai pada input
        ),
      ),
      const  SizedBox(height: 10),

      const  TextField(
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
           
             Navigator.pop(context);
             }  
        ),
          ],
        ),
      ),
    );
    
  }
}