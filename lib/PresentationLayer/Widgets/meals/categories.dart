import 'package:flutter/material.dart';

import '../../../Constants/ui_colors.dart';
import '../../../Constants/ui_text_styles.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: UIColors.darkDeepBlue,
                            border: Border.all(
                              color: UIColors.lightRed,
                              width: 1,
                            )),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Container(
                                width: 80,
                                child: Text(
                                  'بيتزا',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: UITextStyle.medium,
                                ),

                              )
                              )
                            ],
                          ),
                        ));
  }
}