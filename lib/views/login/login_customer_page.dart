import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/controllers/api/apps/login_controller.dart';
import 'package:kharisma_sales_app/controllers/components/network/controllers/network_controller.dart';
import 'package:kharisma_sales_app/routes/routes_name.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCustomerPage extends StatelessWidget {
  LoginCustomerPage({super.key});


  final GlobalKey<FormState> _formKey = new GlobalKey();
  final NetworkController networkController = Get.put(NetworkController());
  var isHidePassword = true.obs;

  @override
  Widget build(BuildContext context) {
   // lazy put
    Get.lazyPut(() => LoginController());
    final loginController = Get.find<LoginController>();
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
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      top: 25,
                      right: MediaQuery.of(context).size.width * 0.1),
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
                          controller: loginController.emailCustomerController,
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
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: 20),
                        Obx(
                          () => TextFormField(
                            controller: loginController.passwordController,
                            obscureText: isHidePassword.value, // field password
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password can't be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isHidePassword.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  isHidePassword.value = !isHidePassword.value;
                                },
                              ),
                            ),
                            // lainnya properti TextFormField
                          ),
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
                                        Get.toNamed(RoutesName.forgotPassword);
                                      }),
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Obx(() => loginController.isLoading.value
                              ? ElevatedButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppsColors.loginColorPrimary),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                     if (_formKey.currentState!.validate()) {}
                                    Get.lazyPut(() => NetworkController());
                                    final prefs = await SharedPreferences.getInstance();
                                    loginController.loginCustomer().then((value) async => {
                                              await prefs.setString('role', 'customer')
                                            });

                                  },
                                  child: Text('Login'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppsColors.loginColorPrimary),
                                  ),
                                )),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Obx(() => loginController.isLoading.value
                              ? ElevatedButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text("Login as Guest") ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppsColors.loginFontColorSecondary),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                    Get.toNamed(RoutesName.home);
                                  },
                                  child: Text('Login as Guest'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppsColors.loginFontColorSecondary),
                                  ),
                                )),
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
                              Get.offNamed(RoutesName.loginSales);
                            },
                            child: Text('Login as Sales'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppsColors.loginColorPrimary),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
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
