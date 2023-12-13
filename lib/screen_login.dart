import 'package:flutter/material.dart';
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
      key: formKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
              child: Column(
            children: [
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
          )),
        ),
      ),
    );
  }
}
