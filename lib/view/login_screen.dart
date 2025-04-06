import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../shared/color_manger.dart';
import '../shared/my_button.dart';
import '../shared/text_style.dart';
import '../shared/utils.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginController = Get.put(LoginController(),tag: 'login_controller');

  bool isObsecure=true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Utils.hideKeyboard();
      },
      onVerticalDragDown: (details){
        Utils.hideKeyboard();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding:const EdgeInsetsDirectional.all(20),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style:getMyBoldTextStyle(textColor: ColorManger.kPrimary,fontSize: 50),
                  ),
                  Text(
                    'Enter Your Data to Login .. ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400]

                    ),
                  ),

                  const SizedBox(height: 20 * 3.5,),
                  Container(

                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadiusDirectional.circular(20)
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration:const InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email,color: ColorManger.kPrimary,),
                          border:InputBorder.none
                      ),

                    ),
                  ),
                  const SizedBox(height: 20 / 2,),
                  Container(

                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadiusDirectional.circular(20)
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: TextFormField(
                      obscureText: isObsecure,
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon:const Icon(Icons.lock_outline,color: ColorManger.kPrimary,),
                          suffixIcon: GestureDetector
                            (
                              onTap: (){
                                isObsecure=!isObsecure;
                                setState(() {

                                });
                              },
                              child: Icon(isObsecure?Icons.visibility_off_outlined:Icons.visibility_outlined,color: ColorManger.kPrimary,)),
                          border:InputBorder.none
                      ),

                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  GestureDetector(
                    onTap: (){
                      if(_emailController.text.isNotEmpty){
                        _loginController.forgetPassword(email: _emailController.text);
                      }else{
                        Utils.showCustomToast(msg: 'Please Enter Email');
                      }

                    },
                    child: Text(
                      'Forget Password ?',
                      style: getMyRegularTextStyle(textColor: ColorManger.kPrimary),
                    ),
                  ),

                  const SizedBox(height: 20 ,),
                  Obx(()=> ConditionalBuilder(
                      condition: _loginController.isLoading,
                      builder: (context)=>const Center(child: CircularProgressIndicator(color: ColorManger.kPrimary,)),
                      fallback: (context)=>MyCustomButton(
                        onPressed: ()async {
                          if(_emailController.text.isNotEmpty&&_emailController.text.isNotEmpty){
                            await  _loginController.login(
                                email: _emailController.text,
                                password: _passwordController.text);
                          }
                          else{
                            Utils.showCustomToast(msg: 'Please Enter Email And Password');
                          }

                        },
                        text: 'login'.tr,
                        fontSize: 30,
                        height: 80,
                        radius: 20 * 3,
                        backgroundColor: ColorManger.kPrimary,))),
                  const SizedBox(height: 2 * 5 ,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account ?'.tr,
                        style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),
                        textAlign: TextAlign.center,),
                      const SizedBox(width: 20 / 2,),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const RegisterScreen());
                        },
                        child: Text('signup'.tr,
                          style:const  TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:ColorManger.kPrimary),
                          textAlign: TextAlign.center,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}