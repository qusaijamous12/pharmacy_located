import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../shared/utils.dart';
import '../view/login_screen.dart';

class LoginController extends GetxController{

  final _isLoading = RxBool(false);
  final _userModel=Rx<UserModel>(UserModel());



  Future<void> login({required String email,required String password})async{
    _isLoading(true);
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password).then((value)async{
      if(value!=null){
        if(value.user?.uid!=null){
          await getUserData(uid: value.user!.uid);
          Utils.showCustomToast(msg: 'Login Success');
          if(_userModel.value.status==0){
            // Get.offAll(()=>const MainUserScreen());

          }else{
            // Get.offAll(()=>const OwnerMainScreen());

          }



        }
      }

    }).catchError((error){
      print('there is an error when user Login');
      Utils.showCustomToast(msg: 'Login Failed');
    });
    _isLoading(false);
  }

  Future<void> getUserData({required String uid})async{
    await FirebaseFirestore.instance.collection('users').doc(uid).get().then((value){
      if(value.data() != null){
        _userModel(UserModel.fromJson(value.data()!));

      }

    }).catchError((error){
      print('there is an error when get user data !!');
    });
  }

  Future<void> register({required String email,required String password,required String name,required String phone,String ?latitude,String ?longitude,required int status})async{
    print('latitude is ${latitude}');
    _isLoading(true);
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value)async{
      if(value.user?.uid!=null){
        await  FirebaseFirestore.instance.collection('users').doc(value.user?.uid).set({
          'email':email,
          'phone':phone,
          'status':status,  // 0 user 1 pharmacy owner
          'name':name,
          'latitude':latitude,
          'longitude':longitude,
          'uid':value.user?.uid,
          'profile_image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYP-KKtRJXm9qK7k2_PA1utxbxWdpzGIdulQ&s'
        }).then((value){
          Utils.showCustomToast(msg: 'Register Success');
          Get.offAll(()=>const LoginScreen());

        }).catchError((error){
          Utils.showCustomToast(msg: 'Register Failed');
        });

      }

    }).catchError((error){
      print('there is an error when register$error');
      Utils.showCustomToast(msg: 'Register Failed');
    });
    _isLoading(false);
  }

  Future<void> forgetPassword({required String email})async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){
      Utils.showCustomToast(msg: 'Please Check Your Email');
    }).catchError((error){
      Utils.showCustomToast(msg: 'Process Failed');
    });
  }




  bool get isLoading => _isLoading.value;
  UserModel get userModel=>_userModel.value;


}