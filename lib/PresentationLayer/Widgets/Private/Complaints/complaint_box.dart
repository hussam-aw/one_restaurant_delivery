import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_restaurant_delivery/Constants/ui_colors.dart';
import 'package:one_restaurant_delivery/Constants/ui_styles.dart';
import 'package:one_restaurant_delivery/Constants/ui_text_styles.dart';
import 'package:one_restaurant_delivery/DataAccesslayer/Models/complaint.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:one_restaurant_delivery/PresentationLayer/Widgets/Public/spacer_width.dart';

class ComplaintBox extends StatelessWidget {
  const ComplaintBox({super.key, required this.complaint});

  final Complaint complaint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: UIColors.lightDeepBlue,
        borderRadius: raduis22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                FontAwesomeIcons.message,
                size: 22,
                color: UIColors.white.withOpacity(0.8),
              ),
              spacerWidth(width: 16),
              Expanded(
                child: Text(
                  complaint.description,
                  style: UITextStyle.small.copyWith(
                    color: UIColors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
          if (complaint.seen) ...[
            spacerHeight(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                spacerWidth(width: 8),
                Expanded(
                  child: Text(
                    complaint.replyMessage,
                    style: UITextStyle.small,
                  ),
                ),
              ],
            ),
          ],
          spacerHeight(),
          Align(
            alignment: Alignment.centerLeft,
            child: complaint.seen
                ? const Icon(
                    FontAwesomeIcons.checkDouble,
                    color: UIColors.red,
                  )
                : Icon(
                    FontAwesomeIcons.check,
                    color: UIColors.white.withOpacity(0.8),
                  ),
          )
        ],
      ),
    );
  }
}
