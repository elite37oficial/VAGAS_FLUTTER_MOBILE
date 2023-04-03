import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/helpers/size_extensions.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool valueCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          bottom: 0,
          child: SizedBox(
            // Aplicar de acordo com o context
            width: 300,
            height: 679,
            // width: context.percentWidth(300 / 430),
            // height: context.percentHeight(679 / 932),
            child: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Filtrar por',
                              style:
                                  context.textStyles.textInterRegular.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.close,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0,
                        color: AppColors.grey500,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 24.0,
                                bottom: 16,
                              ),
                              child: Text(
                                'Tipo de contrato',
                                style: context.textStyles.textInterRegular
                                    .copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 100,
                                    child: CheckboxListTile(
                                      contentPadding: EdgeInsets.zero,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text('CLT'),
                                      value: valueCheckBox,
                                      onChanged: (value) {
                                        valueCheckBox = value!;
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 100,
                                    child: CheckboxListTile(
                                      contentPadding: EdgeInsets.zero,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text('PJ (Pessoa Jurídica)'),
                                      value: valueCheckBox,
                                      onChanged: (value) {
                                        valueCheckBox = value!;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: AppColors.grey500,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 24.0,
                                bottom: 16,
                              ),
                              child: Text(
                                'Localização',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                                left: 20,
                                right: 20,
                              ),
                              // DropDownButton
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Busque uma localidade',
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.location_on_outlined,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 0,
                        color: AppColors.lightHover,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Botões'),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Botões'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
