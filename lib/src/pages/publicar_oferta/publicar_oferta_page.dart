import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/pages/publicar_oferta/publicar_oferta_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicarOfertaPage extends StatelessWidget {
  const PublicarOfertaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(publicarOfertaString),
      ),
      body: GetBuilder<PublicarOfertaController>(
          init: PublicarOfertaController(),
          builder: (publicarOfertaController) {
            return edgeInsetsSafeArea(
              SingleChildScrollView(
                child: Form(
                  key: publicarOfertaController.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        focusNode: publicarOfertaController.posicionNode,
                        controller: publicarOfertaController.posicionCtr,
                        decoration: const InputDecoration(
                          hintText: posicionString,
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          } else {
                            return esteCampoEsRequeridoString;
                          }
                        },
                        onEditingComplete: () {
                          publicarOfertaController.posicionNode.unfocus();
                        },
                      ),
                      CheckboxListTile(
                        value: publicarOfertaController.abre != null,
                        onChanged: (value) async {
                          final d = await Get.dialog(const TimePickerDialog(
                              initialTime: TimeOfDay(
                            hour: 12,
                            minute: 00,
                          )));
                          if (d != null) {
                            publicarOfertaController.onChangeAbre(d);
                          }
                        },
                        title: const Text(abreString),
                      ),
                      CheckboxListTile(
                        value: publicarOfertaController.cierra != null,
                        onChanged: (value) async {
                          final d = await Get.dialog(const TimePickerDialog(
                              initialTime: TimeOfDay(
                            hour: 12,
                            minute: 00,
                          )));
                          if (d != null) {
                            publicarOfertaController.onChangeCierra(d);
                          }
                        },
                        title: const Text(cierraString),
                      ),
                      TextFormField(
                        focusNode: publicarOfertaController.beneficiosNode,
                        controller: publicarOfertaController.beneficiosCtr,
                        decoration: const InputDecoration(
                          hintText: beneficiosString,
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          } else {
                            return esteCampoEsRequeridoString;
                          }
                        },
                        onEditingComplete: () {
                          publicarOfertaController.salarioNode.requestFocus();
                        },
                      ),
                      TextFormField(
                        focusNode: publicarOfertaController.salarioNode,
                        controller: publicarOfertaController.salarioCtr,
                        decoration: const InputDecoration(
                          hintText: salarioString,
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          } else {
                            return esteCampoEsRequeridoString;
                          }
                        },
                        onEditingComplete: () {
                          publicarOfertaController.ubicacionNode.requestFocus();
                        },
                      ),
                      TextFormField(
                        focusNode: publicarOfertaController.ubicacionNode,
                        controller: publicarOfertaController.ubicacionCtr,
                        decoration: const InputDecoration(
                          hintText: ubicacionString,
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return null;
                          } else {
                            return esteCampoEsRequeridoString;
                          }
                        },
                        onEditingComplete: () {
                          publicarOfertaController.ubicacionNode.unfocus();
                        },
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: publicarOfertaController.onSubmit,
                        child: const Text(enviarString),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
