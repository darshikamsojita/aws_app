import 'package:flutter/material.dart';
import 'package:flutter_registration_app/screen_registration.dart';
import 'package:flutter_registration_app/widgets/WidgetTextFormFeild.dart';
import 'package:get/get.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    var passwordVisible = false.obs;
    return Scaffold(
      backgroundColor: Colors.black26,
      key: formKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's sign you in",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: Column(
                children: [
                  WidgetTextFormFeild(
                      controller: emailController,
                      hintText: 'Enter Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Email';
                        }
                        return null;
                      },
                      obscureText: false),
                  const SizedBox(height: 16),
                  Obx(
                    () => WidgetTextFormFeild(
                        controller: passwordController,
                        hintText: 'Enter Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        suffixIcon: InkWell(
                            onTap: () => passwordVisible.toggle(),
                            child: Icon(
                              passwordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            )),
                        obscureText: passwordVisible.value ? false : true),
                  ),
                  const SizedBox(height: 26),
                  MaterialButton(
                    height: 45,
                    minWidth: Get.width,
                    shape: RoundedRectangleBorder(
                      //  side: BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    onPressed: () {},
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                          child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )),
                      Flexible(
                          child: InkWell(
                        onTap: () => Get.to(() => const ScreenRegistration()),
                        child: const Text(
                          " REGISTER",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
