import 'package:attendance_application/app/data/common_files/common_methods/common_methods.dart';
import 'package:attendance_application/app/data/common_files/common_widgets/common_widgets.dart';
import 'package:attendance_application/app/data/common_files/form_validation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Form(
              key: controller.key,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
                children: [
                  SizedBox(height: 50.px),
                  Text(
                    "LogIn",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 34.px,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.px),
                  CommonWidgets.myTextField(
                    labelText: 'Enter Name',
                    hintText: 'Enter Name',
                    iconVisible: true,
                    inputType: TextInputType.name,
                    validator: (value) => FormValidator.isNameValid(value: value),
                    controller: controller.nameController,
                  ),
                  SizedBox(height: 10.px),
                  CommonWidgets.myTextField(
                      labelText: 'Enter Email',
                      hintText: 'Enter Email',
                      iconVisible: true,
                      inputType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      validator: (value) =>
                          FormValidator.isEmailValid(value: value)),
                  SizedBox(height: 10.px),
                  CommonWidgets.myTextField(
                      labelText: 'Enter Mobile Number',
                      hintText: 'Enter Mobile Number',
                      iconVisible: true,
                      maxLength: 10,
                      inputType: TextInputType.number,
                      controller: controller.mobileNumberController,
                      validator: (value) =>
                          FormValidator.isNumberValid(value: value)),
                  SizedBox(height: 10.px),
                  CommonWidgets.myTextField(
                      labelText: 'Enter Password',
                      hintText: 'Enter Password',
                      iconVisible: true,
                      controller: controller.passwordController,
                      validator: (value) => FormValidator.isPasswordValid(value: value)),
                  SizedBox(height: 10.px),
                  CommonWidgets.myTextField(
                      labelText: 'Re-Enter Password',
                      hintText: 'Re-Enter Password',
                      iconVisible: true,
                      controller: controller.confirmPasswordController,
                      validator: (value) => FormValidator.isConfirmPasswordValid(
                          value: value,
                          password: controller.passwordController.text)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 24.px),
              child: CommonWidgets.myElevatedButton(
                text: 'LogIn',
                onPressed: () => controller.clickOnLogInButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}