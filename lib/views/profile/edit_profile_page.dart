import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/controllers/api/profile/profile_controller.dart';
import 'package:kharisma_sales_app/models/user_model.dart';

class EditProfilePage extends StatelessWidget {
  // formkey
  final _formKey = GlobalKey<FormState>();
  final LoginController userController = Get.find<LoginController>();
  RxBool isLoading = false.obs;
  // lazyPut ProfileController
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile & Store'),
        backgroundColor: AppsColors.loginColorPrimary,
      ),
      body: SafeArea(
        child: Obx(()  {
           if (userController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          final UserModel user = userController.userModelData.value;
          final TextEditingController nameController = TextEditingController(text: user.nama);
          final TextEditingController emailController = TextEditingController(text: user.email);
          final TextEditingController phoneController = TextEditingController(text: user.telepon);
          final TextEditingController addressController = TextEditingController(text: user.alamat);
          final TextEditingController storeNameController = TextEditingController(text: user.nama_toko);
          final TextEditingController storeAddressController = TextEditingController(text: user.alamat_toko);
          final TextEditingController kelurahanController = TextEditingController(text: user.kelurahan);
          final TextEditingController kecamatanController = TextEditingController(text: user.kecamatan);
          final TextEditingController kotaController = TextEditingController(text: user.kota);
          final TextEditingController provinsiController = TextEditingController(text: user.provinsi);
          final TextEditingController zipController = TextEditingController(text: user.zip);

          return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Personal Information',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle:
                            TextStyle(color: AppsColors.loginFontColorSecondary),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppsColors.loginColorPrimary,
                                width: 1.0)
                           ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0
                              )
                            ),
                        ),
                          validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: AppsColors.loginFontColorSecondary),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppsColors.loginColorPrimary,
                                width: 1.0)),
                          filled: true,
                          fillColor: Colors.grey[200],
                      ),
                          validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
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
                      validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
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
                   SizedBox(height: 16.0),
                  TextFormField(
                    controller: kelurahanController,
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Kelurahan',
                        labelStyle:
                            TextStyle(color: AppsColors.loginFontColorSecondary),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppsColors.loginColorPrimary,
                                width: 1.0)),
                        filled: true,
                        fillColor: Colors.grey[200]  
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Kelurahan';
                        }
                        return null;
                      },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: kecamatanController,
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Kecamatan',
                        labelStyle:
                            TextStyle(color: AppsColors.loginFontColorSecondary),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppsColors.loginColorPrimary,
                                width: 1.0)),
                        filled: true,
                        fillColor: Colors.grey[200]  
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Kecamatan';
                        }
                        return null;
                      },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: kotaController,
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Kota',
                        labelStyle:
                            TextStyle(color: AppsColors.loginFontColorSecondary),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppsColors.loginColorPrimary,
                                width: 1.0)),
                        filled: true,
                        fillColor: Colors.grey[200]  
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Kota';
                        }
                        return null;
                      },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: provinsiController,
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Provinsi',
                        labelStyle:
                            TextStyle(color: AppsColors.loginFontColorSecondary),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppsColors.loginColorPrimary,
                                width: 1.0)),
                        filled: true,
                        fillColor: Colors.grey[200]                        
                    ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Provinsi';
                        }
                        return null;
                      },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: zipController,
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Zip',
                        labelStyle:
                            TextStyle(color: AppsColors.loginFontColorSecondary),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppsColors.loginColorPrimary,
                                width: 1.0)),
                        filled: true,
                        fillColor: Colors.grey[200]    
                        ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Kode Pos';
                        }
                        return null;
                      },
                  ),
                 
                  SizedBox(height: 32.0),
                  Divider(height: 1.0),
                  SizedBox(height: 32.0),
                  Text(
                    'Store Information',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
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
                                  
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Store Name';
                                  }
                                  return null;
                                },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                        return 'Please enter Store Address';
                      }
                      return null;
                      },
                  ),
                  SizedBox(height: 16.0),
                  
                  isLoading.value ? Center(child: CircularProgressIndicator()) : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppsColors.loginColorPrimary),
                    onPressed: () {
                      
                       if (_formKey.currentState!.validate()) {
                        isLoading.value = true;
                        Get.lazyPut(() => ProfileController());
                        Get.find<ProfileController>().editProfile(
                            nameController.text,
                            emailController.text,
                            phoneController.text,
                            addressController.text,
                            storeNameController.text,
                            storeAddressController.text,
                            kelurahanController.text,
                            kecamatanController.text,
                            kotaController.text,
                            provinsiController.text,
                            zipController.text,
                            user.lat!,
                            user.lng!,
                        ).then((value) => isLoading.value = false);
                       }
                    },
                    child: Text('Edit'),
                  )
                ],
              ),
            ),
          ),
        );
        }),
      ),
    );
  }
}
