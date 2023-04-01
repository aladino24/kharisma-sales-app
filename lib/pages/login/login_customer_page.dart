import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/pages/login/forgot_password_page.dart';
import 'package:kharisma_sales_app/pages/login/login_sales_page.dart';
import 'package:kharisma_sales_app/utils/apps_colors.dart';

class LoginCustomerPage extends StatelessWidget {
  const LoginCustomerPage({super.key});

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
                        image: AssetImage('assets/images/login.png'),
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
                        "Login",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Customer",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Before get started, you must login",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppsColors.loginFontColorSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true, // field password
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {},
                          ),
                        ),
                        // lainnya properti TextFormField
                      ),
                      SizedBox(height: 10),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: " Forgot Password?",
                                    style: TextStyle(
                                      color: AppsColors.loginColorPrimary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(() => ForgotPasswordPage());
                                      }),
                              ]),
                            ),
                          ],
                        ),
                      SizedBox(height: 20),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your login logic here
                          },
                          child: Text('Login'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppsColors.loginColorPrimary),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "OR",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppsColors.loginFontColorSecondary,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.off(() => LoginSalesPage());
                          },
                          child: Text('Login as Sales'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppsColors.loginFontColorSecondary),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
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
