import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile & Store'),
        backgroundColor: AppsColors.loginColorPrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}
