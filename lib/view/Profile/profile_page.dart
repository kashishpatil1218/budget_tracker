import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Obx(
                  () => CircleAvatar(
                    backgroundImage: (usercontroller.isImage.value)
                        ? const NetworkImage(
                            'https://s3.amazonaws.com/37assets/svn/765-default-avatar.png',
                          )
                        : MemoryImage(usercontroller.image!),
                    radius: 45,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Obx(
                  () => Text(
                    usercontroller.userList[0].name!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/editPro');
                  },
                  child: const Icon(Icons.edit),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Icons_name(icon: Icons.email, name: 'Email'),
          Obx(() => deatil(detail: usercontroller.userList[0].email!)),
          SizedBox(
            height: 30,
          ),
          Icons_name(icon: Icons.phone, name: 'Mobile Number'),
          Obx(() => deatil(detail: usercontroller.userList[0].phone!)),
          SizedBox(
            height: 30,
          ),
          Icons_name(icon: Icons.person, name: 'Age'),
          Obx(() => deatil(detail: usercontroller.userList[0].age!)),
          SizedBox(
            height: 30,
          ),
          Icons_name(icon: Icons.generating_tokens_outlined, name: 'Gender'),
          deatil(detail: 'Female'),
        ],
      ),
    );
  }

  Align deatil({required String detail}) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 15, top: 10),
        child: Text(
          detail,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget Icons_name({required String name, required IconData icon}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Icon(
            icon,
            color: Colors.grey.shade900,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            name,
            style: TextStyle(color: Colors.grey.shade900,fontSize: 17),
          ),
        ),
      ],
    );
  }
}
