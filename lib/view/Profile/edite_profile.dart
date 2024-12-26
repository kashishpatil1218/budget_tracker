import 'package:budget_tracker_app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/home_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final GenderController controller = Get.put(GenderController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: GestureDetector(
                  onTap: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? xFile =
                    await imagePicker.pickImage(source: ImageSource.camera);
                    usercontroller.image = await xFile!.readAsBytes();
                    usercontroller.isImage.value = false;
                  },
                  child: Obx(
                    () =>  CircleAvatar(
                      backgroundImage: (usercontroller.isImage.value)
                          ? NetworkImage(
                          'https://s3.amazonaws.com/37assets/svn/765-default-avatar.png')
                          : MemoryImage(usercontroller.image!),
                      radius: 45,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Icon(Icons.edit, color: Colors.purple),
            ),
            const SizedBox(height: 25),
            title(title: 'Name'),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: filedDetails(
                  icon: Icons.person,
                  hinttxt: 'Jhone smith',
                  controller: usercontroller.txtName),
            ),
            const SizedBox(height: 20),
            title(title: 'Email'),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: filedDetails(
                  icon: Icons.mail,
                  hinttxt: 'jhonsmith23@gmail.com',
                  controller: usercontroller.txtEmail),
            ),
            const SizedBox(height: 20),
            title(title: 'Phone'),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: filedDetails(
                  icon: Icons.phone,
                  hinttxt: '74582369',
                  controller: usercontroller.txtPhone),
            ),
            const SizedBox(height: 20),
            title(title: 'Age'),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: filedDetails(
                  icon: Icons.person,
                  hinttxt: '18',
                  controller: usercontroller.txtAge),
            ),
            const SizedBox(height: 20),
            title(title: 'Gender'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GetX<GenderController>(
                builder: (controller) {
                  return Column(
                    children: [
                      // Male radio button
                      ListTile(
                        title: const Text('Male',
                            style:
                            TextStyle(color: Colors.black, fontSize: 18)),
                        leading: Radio<String>(
                          value: 'Male',
                          groupValue: controller.selectedGender.value,
                          onChanged: (value) {
                            controller.setGender(value!);
                          },
                          activeColor: Colors.blue,
                        ),
                      ),
                      // Female radio button
                      ListTile(
                        title: const Text('Female',
                            style:
                            TextStyle(color: Colors.black, fontSize: 18)),
                        leading: Radio<String>(
                          value: 'Female',
                          groupValue: controller.selectedGender.value,
                          onChanged: (value) {
                            controller.setGender(value!);
                          },
                          activeColor: Colors.blue,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () async {
                final name = usercontroller.txtName.text;
                final email = usercontroller.txtEmail.text;
                final phone = usercontroller.txtPhone.text;
                final age = usercontroller.txtAge.text;
                await usercontroller.registerUser(name, email, phone, age);
                Navigator.of(context).pushNamed('/pro');
              },
              child: GestureDetector(
                onTap: () {
                  usercontroller.updateUser(name: usercontroller.txtName.text,
                      email: usercontroller.txtEmail.text,
                      phone: usercontroller.txtPhone.text,
                      age: usercontroller.txtAge.text,
                    img: usercontroller.image!,
                  );
                },
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget filedDetails(
      {required IconData icon, required String hinttxt, required controller}) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey.shade900),
        hintText: hinttxt,
        hintStyle: const TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
      ),
    );
  }

  Widget title({required String title}) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          title,
          style: TextStyle(color: Colors.grey.shade900, fontSize: 18),
        ),
      ),
    );
  }
}
