import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/pages/login/login_controller.dart';
import 'package:evaproject/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const List<String> listLogins = [
  loginAdminString,
  loginEgresadoString,
  loginEmpresaString,
];

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (loginController) {
        final size = MediaQuery.of(context).size;
        return Scaffold(
          body: SafeArea(
            minimum: const EdgeInsets.symmetric(vertical: 40, horizontal: 40,),
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                    child: Form(
                      key: loginController.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                           const Text(iniciarSesionString,style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),
                           const SizedBox(height: 30),
                                      
                            DropdownButton<String>(
                              value: loginController.typeLogin,
                            onChanged: (value) {
                              if(value != null) {
                                loginController.changeTypeLogin(value);
                              }
                            },
                            items: listLogins.map((e) => DropdownMenuItem<String>
                            (value: e, child:  Text(e),),).toList(),
                           ),
                           const SizedBox(height: 10),
                           TextFormField(
                            controller: loginController.userController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: usuarioString,
                            ),
                            validator: (value) {
                              if(value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return esteCampoEsRequeridoString;
                              }
                            },
                           ),
                           const SizedBox(height: 5),
                           if(loginController.typeLogin == loginEmpresaString) 
                           TextButton(onPressed: (){
                            Get.toNamed(AppRoutes.registrarEmpresa);
                           }, child: const Text(registrarEmpresaString)),
                           const SizedBox(height: 10),
                           TextFormField(
                            controller: loginController.passController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: contrasenaString,
                            ),
                            validator: (value) {
                              if(value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return esteCampoEsRequeridoString;
                              }
                            },
                           ),
                           const SizedBox(height: 10),
                           TextButton(
                            onPressed: loginController.submit,
                            child: const Text(iniciarSesionString),
                           ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}