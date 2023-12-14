import 'package:flutter/material.dart';
import 'package:flutter_registration_app/screen_login.dart';
import 'package:flutter_registration_app/widgets/WidgetTextFormFeild.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ScreenRegistration extends StatelessWidget {
  const ScreenRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final mobilenoCntroller = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPwdController = TextEditingController();
    var passwordVisible = false.obs;
    var confirmpwdVisible = false.obs;
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                "Create Your Account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height:30),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    WidgetTextFormFeild(
                        controller: nameController,
                        hintText: 'Enter Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                        obscureText: false),
                    const SizedBox(height: 16),
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
                    WidgetTextFormFeild(
                        controller: mobilenoCntroller,
                        hintText: 'Enter Mobile no.',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Mobile no.';
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
                    const SizedBox(height: 16),
                    Obx(
                      () => WidgetTextFormFeild(
                          controller: confirmPwdController,
                          hintText: 'Enter Confirm Password',
                          validator: (value) {
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          suffixIcon: InkWell(
                              onTap: () => confirmpwdVisible.toggle(),
                              child: Icon(
                                confirmpwdVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              )),
                          obscureText: confirmpwdVisible.value ? false : true),
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
                        'Register',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      height: 45,
                      minWidth: Get.width,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //  color: Colors.white,
                      onPressed: () => Get.to(() => const ScreenLogin()),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
