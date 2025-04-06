import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../shared/color_manger.dart';
import '../shared/my_button.dart';
import '../shared/utils.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _loginController = Get.put(LoginController(), tag: 'login_controller');
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _latController=TextEditingController();
  final _longController=TextEditingController();
  final List<String> roles=['User','Pharmacy Owner'];
  String ?selectedRole;
  bool isObsecure=true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding:const EdgeInsetsDirectional.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                 const Text(
                  'Register',
                  style:TextStyle(
                      color: ColorManger.kPrimary,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Enter Your Data to Register .. ',
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
                    controller: _usernameController,
                    decoration:const InputDecoration(
                        labelText: 'User Name',
                        prefixIcon: Icon(Icons.drive_file_rename_outline,color: ColorManger.kPrimary
                          ,),
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
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    decoration:const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone,color: ColorManger.kPrimary,),
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
                const SizedBox(height: 20 / 2,),

                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     const Text(
                //       'Selected Role',
                //       style: const TextStyle(
                //           fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
                //     ),
                //     const SizedBox(
                //       height: 20 / 2,
                //     ),
                //
                //     Container(
                //       width: double.infinity,
                //       padding:const EdgeInsets.symmetric(horizontal: 16.0),
                //       decoration: BoxDecoration(
                //         color: Colors.grey[200],
                //         borderRadius: BorderRadius.circular(8.0),
                //       ),
                //       child: DropdownButtonFormField<String>(
                //         padding: EdgeInsetsDirectional.zero,
                //         isExpanded: true, // Expands to fill the width
                //         decoration:const InputDecoration(
                //           border: InputBorder.none,
                //
                //         ),
                //         value: selectedRole,
                //         hint:const Text('Enter your Role'),
                //         items: roles.map((String role) {
                //           return DropdownMenuItem<String>(
                //             value: role,
                //             child: Text(role),
                //           );
                //         }).toList(),
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             selectedRole = newValue;
                //           });
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // const  SizedBox(
                //   height: 10,
                // ),
                if(selectedRole=='User')
                  const SizedBox(
                    height:10 ,
                  ),

                if(selectedRole=='Pharmacy Owner')...[
                  Row(
                    children: [
                      Expanded(
                        child: Container(

                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadiusDirectional.circular(20)
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: TextFormField(
                            controller: _latController,

                            keyboardType: TextInputType.number,
                            decoration:const InputDecoration(
                                labelText: 'Latitude',
                                prefixIcon: Icon(Icons.location_on_outlined,color: ColorManger.kPrimary,),

                                border:InputBorder.none
                            ),

                          ),
                        ),
                      ),
                      const  SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(

                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadiusDirectional.circular(20)
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: TextFormField(
                            controller: _longController,
                            keyboardType: TextInputType.number,
                            decoration:const InputDecoration(
                                labelText: 'Longitude',
                                prefixIcon: Icon(Icons.location_on_outlined,color: ColorManger.kPrimary,),
                                border:InputBorder.none
                            ),

                          ),
                        ),
                      ),



                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],


                const SizedBox(height: 20 / 2,),

                Obx(()=>ConditionalBuilder(
                    condition: _loginController.isLoading,
                    builder: (context)=>const Center(child: CircularProgressIndicator(color: ColorManger.kPrimary,)),
                    fallback: (context)=>MyCustomButton(
                      onPressed: ()async {
                        if(selectedRole=='Pharmacy Owner'){
                          if(_emailController.text.isNotEmpty&&_usernameController.text.isNotEmpty&&_phoneController.text.isNotEmpty&&_passwordController.text.isNotEmpty&&_latController.text.isNotEmpty&&_longController.text.isNotEmpty)
                          {
                            await  _loginController.register(email: _emailController.text, password: _passwordController.text, name: _usernameController.text, phone: _phoneController.text,latitude: _latController.text,longitude: _longController.text,status: 1);

                          }else{


                            Utils.showCustomToast(msg: 'All Fileds are Requierd');

                          }
                        }else
                        {
                          if(_emailController.text.isNotEmpty&&_usernameController.text.isNotEmpty&&_phoneController.text.isNotEmpty&&_passwordController.text.isNotEmpty)
                          {
                            await _loginController.register(email: _emailController.text, password: _passwordController.text, name: _usernameController.text, phone: _phoneController.text,status: 0  );

                          }
                          else{


                            Utils.showCustomToast(msg: 'All Fileds are Requierd');

                          }

                        }


                      },
                      text: 'Register'.tr,
                      fontSize: 30,
                      height: 80,
                      radius: 20 * 3,
                      backgroundColor: ColorManger.kPrimary,
                    ))),
                const SizedBox(height: 20 * 2.5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an account '.tr,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      textAlign: TextAlign.center,),
                    const SizedBox(width: 20 / 2,),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: Text('login'.tr,
                        style:const  TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorManger.kPrimary),
                        textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}