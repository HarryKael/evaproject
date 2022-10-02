import 'package:evaproject/src/consts/chars.dart';
import 'package:evaproject/src/consts/consts.dart';
import 'package:evaproject/src/pages/agregar_egresado_infotep/agregar_egresado_infotep_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgregarEgresadoInfotepPage extends StatelessWidget {
  const AgregarEgresadoInfotepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(agregarEgresadoString),
      ),
      body: edgeInsetsSafeArea(
        GetBuilder<AgregarEgresadoInfotepController>(
            init: AgregarEgresadoInfotepController(),
            builder: (agregarEgresadoInfotepController) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: agregarEgresadoInfotepController.formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              focusNode: agregarEgresadoInfotepController
                                  .contrasenaNode,
                              controller: agregarEgresadoInfotepController
                                  .contrasenaCtr,
                              decoration: const InputDecoration(
                                hintText: contrasenaString,
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                agregarEgresadoInfotepController.cedulaNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  agregarEgresadoInfotepController.cedulaNode,
                              controller:
                                  agregarEgresadoInfotepController.cedulaCtr,
                              decoration: const InputDecoration(
                                hintText: cedulaString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                agregarEgresadoInfotepController.nombreNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  agregarEgresadoInfotepController.nombreNode,
                              controller:
                                  agregarEgresadoInfotepController.nombreCtr,
                              decoration: const InputDecoration(
                                hintText: nombresYApellidosString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                agregarEgresadoInfotepController.estaturaNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  agregarEgresadoInfotepController.estaturaNode,
                              controller:
                                  agregarEgresadoInfotepController.estaturaCtr,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: estaturaString,
                              ),
                              onEditingComplete: () {
                                agregarEgresadoInfotepController.edadNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  agregarEgresadoInfotepController.edadNode,
                              controller:
                                  agregarEgresadoInfotepController.edadCtr,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: edadString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                agregarEgresadoInfotepController.edadNode
                                    .unfocus();
                              },
                            ),
                            CheckboxListTile(
                              value: agregarEgresadoInfotepController.fechaNacimiento != null,
                              onChanged: (_) async {
                                dynamic d= await Get.dialog(
                                  DatePickerDialog(
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900, 1, 1),
                                    lastDate: DateTime.now(),
                                    currentDate: DateTime.now(),
                                  ),
                                );
                                if(d != null) {
                                  agregarEgresadoInfotepController.onChangedFecha(d.toString());
                                }
                              },
                              title: const Text(fechaDeNacimientoString),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(estadoCivilString),
                                DropdownButton<String>(
                                  onChanged: (value) {
                                    if (value != null) {
                                      agregarEgresadoInfotepController
                                          .onChangeEstadoCivil(value);
                                    }
                                  },
                                  value: agregarEgresadoInfotepController
                                      .estadoCivilValue,
                                  items: agregarEgresadoInfotepController
                                      .listEstadoCivil
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(sexoString),
                                DropdownButton<String>(
                                  onChanged: (value) {
                                    if (value != null) {
                                      agregarEgresadoInfotepController
                                          .onChangeSex(value);
                                    }
                                  },
                                  value:
                                      agregarEgresadoInfotepController.sexValue,
                                  items:
                                      agregarEgresadoInfotepController.listSex
                                          .map(
                                            (e) => DropdownMenuItem<String>(
                                              value: e,
                                              child: Text(e),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              focusNode:
                                  agregarEgresadoInfotepController.correoNode,
                              controller:
                                  agregarEgresadoInfotepController.correoCtr,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: correoString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                agregarEgresadoInfotepController.correoNode
                                    .unfocus();
                              },
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(nivelEducativoString),
                                DropdownButton<String>(
                                  onChanged: (value) {
                                    if (value != null) {
                                      agregarEgresadoInfotepController
                                          .onChangeNivelEducativo(value);
                                    }
                                  },
                                  value: agregarEgresadoInfotepController
                                      .nivelEducativoValue,
                                  items: agregarEgresadoInfotepController
                                      .listNivelEducativo
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            CheckboxListTile(
                              value: agregarEgresadoInfotepController
                                  .licenciaDeConducir.value,
                              onChanged: (value) {
                                if (value != null) {
                                  agregarEgresadoInfotepController
                                      .onChangeLicencia(value);
                                }
                              },
                              title: const Text(licenciaDeConducirString),
                            ),
                            CheckboxListTile(
                              value: agregarEgresadoInfotepController
                                  .vehiculoPropio.value,
                              onChanged: (value) {
                                if (value != null) {
                                  agregarEgresadoInfotepController
                                      .onChangeVehiculoPropio(value);
                                }
                              },
                              title: const Text(vehiculoPropioString),
                            ),
                            TextFormField(
                              focusNode: agregarEgresadoInfotepController
                                  .telefonoCelularNode,
                              controller: agregarEgresadoInfotepController
                                  .telefonoCelularCtr,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: telefonoCelularString,
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return esteCampoEsRequeridoString;
                                }
                              },
                              onEditingComplete: () {
                                agregarEgresadoInfotepController
                                    .telefonoResidenciaNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode: agregarEgresadoInfotepController
                                  .telefonoResidenciaNode,
                              controller: agregarEgresadoInfotepController
                                  .telefonoResidenciaCtr,
                              decoration: const InputDecoration(
                                hintText: telefonoResidenciaString,
                              ),
                              onEditingComplete: () {
                                agregarEgresadoInfotepController.otroNode
                                    .requestFocus();
                              },
                            ),
                            TextFormField(
                              focusNode:
                                  agregarEgresadoInfotepController.otroNode,
                              controller:
                                  agregarEgresadoInfotepController.otroCtr,
                              decoration: const InputDecoration(
                                hintText: otroString,
                              ),
                              onEditingComplete: () {
                                agregarEgresadoInfotepController.otroNode
                                    .unfocus();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                      onPressed: agregarEgresadoInfotepController.onSubmit,
                      child: const Text(enviarString)),
                ],
              );
            }),
      ),
    );
  }
}
