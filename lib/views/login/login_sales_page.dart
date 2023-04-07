import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';

class LoginSalesPage extends StatelessWidget {
  LoginSalesPage({super.key});

  var isHidePassword = true.obs;

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
                        "Login Sales",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
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
                      Obx(
                        () => TextFormField(
                          obscureText: isHidePassword.value, // field password
                          decoration: InputDecoration(
                            labelText: 'Insert Token',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(isHidePassword.value ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                isHidePassword.value = !isHidePassword.value;
                              },
                            ),
                          ),
                          // lainnya properti TextFormField
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
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
                            Get.offNamed(RoutesName.loginCustomer);
                          },
                          child: Text('Login as Customer'),
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
