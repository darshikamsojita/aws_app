import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobilenoCntroller,
                  decoration: const InputDecoration(
                    hintText: 'Enter Mobile no.',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Mobile no.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      suffixIcon: Obx(() => InkWell(
                          onTap: () => passwordVisible.toggle(),
                          child: Icon(
                            passwordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  controller: confirmPwdController,
                  decoration: InputDecoration(
                      hintText: 'Enter Confirm Password',
                      suffixIcon: Obx(() => InkWell(
                          onTap: () => confirmpwdVisible.toggle(),
                          child: Icon(
                            confirmpwdVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )))),
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 26),
                MaterialButton(
                  color: Colors.deepPurple,
                  onPressed: () {},
                  child: const Text(
                    'Registration',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
