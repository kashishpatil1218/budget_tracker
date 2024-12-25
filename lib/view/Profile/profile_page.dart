import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: CircleAvatar(
                  radius: 45,
                ),
              ),

          Padding(
            padding: const EdgeInsets.only(left: 10,top: 5),
            child: Text('Kashish patil',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          SizedBox(width: 60,),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TextButton(onPressed: () {
              Navigator.of(context).pushNamed('/editPro');
            }, child: Icon(Icons.edit)),
          )
            ],
          ),
          SizedBox(height: 30,),
          Icons_name(icon: Icons.email,name:'Email'),
          deatil(detail: 'kahsi573@gmail.com'),
          SizedBox(height: 30,),
          Icons_name(icon: Icons.phone,name:'Mobile Number'),
          deatil(detail: '745896512'),
          SizedBox(height: 30,),
          Icons_name(icon: Icons.person,name:'Age'),
          deatil(detail: '19'),
          SizedBox(height: 30,),
          Icons_name(icon: Icons.generating_tokens_outlined,name:'Gender'),
          deatil(detail: 'Female'),
        ],
      ),
    );
  }

  Align deatil({required String detail}) {
    return Align(
          alignment: Alignment.topLeft,
            child: Padding(
               padding: EdgeInsets.only(left: 15,top: 10),
              child: Text(detail,style: TextStyle(color: Colors.white),),
            ));
  }

  Widget Icons_name({required String name, required  IconData icon}) {
    return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: Icon(icon,color: Colors.grey,),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: Text(name,style: TextStyle(color: Colors.grey),),),



          ],
        );
  }
}
