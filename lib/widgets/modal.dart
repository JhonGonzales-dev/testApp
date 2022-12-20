import 'package:flutter/material.dart';

import 'buttoms.dart';
import 'inputs.dart';

class FormShowModal extends StatefulWidget {
  const FormShowModal({Key? key}) : super(key: key);

  @override
  State<FormShowModal> createState() => _FormShowModalState();
}

class _FormShowModalState extends State<FormShowModal> {
  String diaslaboras = '';
  String horas = '';
  String descuento = '';

  final _isEmpty = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 40,
            right: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Calcular Monto pagar',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: CustomInputs.loginInputDecoration(
                  borderRadius: 15,
                  hint: 'Dias laboradas',
                  fillcolor: Colors.grey.withOpacity(0.1),
                  icon: Icons.calendar_month,
                ),
                onChanged: (value) {
                  _isEmpty.value = false;
                  diaslaboras = value;
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: CustomInputs.loginInputDecoration(
                  borderRadius: 15,
                  hint: 'Costo por hora',
                  fillcolor: Colors.grey.withOpacity(0.1),
                  icon: Icons.monetization_on_outlined,
                ),
                onChanged: (value) {
                  _isEmpty.value = false;
                  horas = value;
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: CustomInputs.loginInputDecoration(
                    borderRadius: 15,
                    hint: 'Descuento',
                    fillcolor: Colors.grey.withOpacity(0.1),
                    icon: Icons.money_off),
                onChanged: (value) {
                  _isEmpty.value = false;
                  descuento = value;
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButtom(
                      borderRadius: 30,
                      colorButtom: const Color(0xFFFD3C2E),
                      paddingHorizontal: 10,
                      paddingVertical: 10,
                      text: 'Cancelar',
                      isEmpty: false,
                      onpress: () => Navigator.pop(context)),
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: ValueListenableBuilder(
                        valueListenable: _isEmpty,
                        builder: (_, bool value, __) {
                          return CustomButtom(
                            borderRadius: 30,
                            colorButtom: const Color(0XFF52D0A1),
                            paddingHorizontal: 10,
                            paddingVertical: 10,
                            text: 'Calcular',
                            isEmpty: value,
                            onpress: () async {
                              calculate(context);
                              Navigator.pop(context);
                            },
                          );
                        })),
              ],
            )
          ],
        ));
  }

  void calculate(BuildContext context) async {
    int a = int.tryParse(diaslaboras)!;
    int b = int.tryParse(horas)!;
    int c = int.tryParse(descuento) ?? 0;
    int resultado = ((a * 9) * b) - c;

    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('El monto a pagar es: $resultado soles'),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
