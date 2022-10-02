import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/pages/registrar_empresa/registrar_empresa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrarEmpresaPage extends StatelessWidget {
  const RegistrarEmpresaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrarEmpresaController>(
      init: RegistrarEmpresaController(),
      builder: (registrarEmpresaController) {
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
                      key: registrarEmpresaController.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(registrarEmpresaString),
                            TextFormField(
                              focusNode:
                                  registrarEmpresaController.rncNode,
                              controller:
                                  registrarEmpresaController.rncCtr,
                              decoration: const InputDecoration(
                                hintText: rncString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                registrarEmpresaController.nombreComercialNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  registrarEmpresaController.nombreComercialNode,
                              controller:
                                  registrarEmpresaController.nombreComercialCtr,
                              decoration: const InputDecoration(
                                hintText: nombreComercialString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                registrarEmpresaController.passNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  registrarEmpresaController.passNode,
                              controller:
                                  registrarEmpresaController.passCtr,
                                  obscureText: true,
                              decoration: const InputDecoration(
                                hintText: contrasenaString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                registrarEmpresaController.direccionNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  registrarEmpresaController.direccionNode,
                              controller:
                                  registrarEmpresaController.direccionCtr,
                              decoration: const InputDecoration(
                                hintText: direccionString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                registrarEmpresaController.telefonoNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  registrarEmpresaController.telefonoNode,
                              controller:
                                  registrarEmpresaController.telefonoCtr,
                              decoration: const InputDecoration(
                                hintText: telefonoString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                registrarEmpresaController.emailNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  registrarEmpresaController.emailNode,
                              controller:
                                  registrarEmpresaController.emailCtr,
                              decoration: const InputDecoration(
                                hintText: emailString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                registrarEmpresaController.webNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  registrarEmpresaController.webNode,
                              controller:
                                  registrarEmpresaController.webCtr,
                              decoration: const InputDecoration(
                              hintText: webString,
                              ),
                              onEditingComplete: () {
                                registrarEmpresaController.nombreContactoNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  registrarEmpresaController.nombreContactoNode,
                              controller:
                                  registrarEmpresaController.nombreContactoCtr,
                              decoration: const InputDecoration(
                                hintText: nombreContactoString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                registrarEmpresaController.emailContactoNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  registrarEmpresaController.emailContactoNode,
                              controller:
                                  registrarEmpresaController.emailContactoCtr,
                              decoration: const InputDecoration(
                                hintText: emailContactoString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                registrarEmpresaController.emailContactoNode
                                    .unfocus();
                              },
                            ),
                            OutlinedButton(onPressed: registrarEmpresaController.onSubmit, child: const Text(enviarString)),
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