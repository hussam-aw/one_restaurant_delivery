import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/place.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';

class PlaceBox extends StatelessWidget {
  const PlaceBox({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: raduis22,
        color: UIColors.lightDeepBlue,
      ),
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.locationDot,
            size: 30,
            color: UIColors.red,
          ),
          spacerWidth(width: 22),
          Expanded(
            child: Text(
              place.name,
              style: UITextStyle.body.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          spacerWidth(),
          InkWell(
            onTap: () {},
            child: const Icon(
              FontAwesomeIcons.minus,
              size: 35,
              color: UIColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
