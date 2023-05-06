import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/models/user_model.dart';

class EditProfilePage extends StatelessWidget {
  final LoginController userController = Get.find<LoginController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController storeAddressController = TextEditingController();
  final TextEditingController kelurahanController = TextEditingController();
  final TextEditingController kecamatanController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile & Store'),
        backgroundColor: AppsColors.loginColorPrimary,
      ),
      body: SafeArea(
        child: FutureBuilder(
        future: userController.getUserModel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
          }
          final UserModel user = snapshot.data!;
            nameController.text = user.nama!;
            emailController.text = user.email!;
            phoneController.text = user.telepon!;
            addressController.text = user.alamat!;
            storeNameController.text = user.nama_toko!;
            storeAddressController.text = user.alamat_toko!;
            kelurahanController.text = user.kelurahan!;
            kecamatanController.text = user.kecamatan!;
            kotaController.text = user.kota!;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Personal Information',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle:
                          TextStyle(color: AppsColors.loginFontColorSecondary),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppsColors.loginColorPrimary,
                              width: 1.0))),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: AppsColors.loginFontColorSecondary),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppsColors.loginColorPrimary,
                              width: 1.0))),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      labelStyle:
                          TextStyle(color: AppsColors.loginFontColorSecondary),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppsColors.loginColorPrimary,
                              width: 1.0))),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: addressController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: 'Alamat',
                      labelStyle:
                          TextStyle(color: AppsColors.loginFontColorSecondary),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppsColors.loginColorPrimary,
                              width: 1.0))),
                ),
                SizedBox(height: 32.0),
                Divider(height: 1.0),
                SizedBox(height: 32.0),
                Text(
                  'Store Information',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: storeNameController,
                  decoration: InputDecoration(
                      labelText: 'Store Name',
                      labelStyle:
                          TextStyle(color: AppsColors.loginFontColorSecondary),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppsColors.loginColorPrimary,
                              width: 1.0))),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: storeAddressController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: 'Store Address',
                      labelStyle:
                          TextStyle(color: AppsColors.loginFontColorSecondary),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppsColors.loginColorPrimary,
                              width: 1.0))),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: kelurahanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Kelurahan',
                      labelStyle:
                          TextStyle(color: AppsColors.loginFontColorSecondary),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppsColors.loginColorPrimary,
                              width: 1.0))),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: kecamatanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Kecamatan',
                      labelStyle:
                          TextStyle(color: AppsColors.loginFontColorSecondary),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppsColors.loginColorPrimary,
                              width: 1.0))),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: kotaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Kota',
                      labelStyle:
                          TextStyle(color: AppsColors.loginFontColorSecondary),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppsColors.loginColorPrimary,
                              width: 1.0))),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppsColors.loginColorPrimary),
                  onPressed: () {},
                  child: Text('Edit'),
                ),
              ],
            ),
          ),
        );
      })),
    );
  }
}
