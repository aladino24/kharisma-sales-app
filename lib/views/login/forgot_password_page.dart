import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/apps/forgot_password_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/Password_Monochromatic.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 45, top: 25, right: 45),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Forgot",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Please enter the address associated with your account.",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppsColors.loginFontColorSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: forgotPasswordController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email can't be empty";
                          } else if (!GetUtils.isEmail(value)) {
                            return 'Email tidak valid';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email yang terdaftar',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child:
                              Obx(() => forgotPasswordController.isLoading.value
                                  ? ElevatedButton(
                                      onPressed: () {},
                                      child: CircularProgressIndicator(
                                        color: AppsColors.loginFontColorSecondary,
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppsColors.loginColorPrimary),
                                      ),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        forgotPasswordController.forgotPassword();
                                      },
                                      child: Text('Submit'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppsColors.loginColorPrimary),
                                      ),
                                    ))),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
