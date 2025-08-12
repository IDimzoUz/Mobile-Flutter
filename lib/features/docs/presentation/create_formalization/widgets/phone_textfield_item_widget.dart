import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/core/widgets/inputs/custom_phone_text_field.dart';
import 'package:imzo/core/widgets/inputs/custom_text_field.dart';
import 'package:imzo/features/docs/model/contract_templates_response.dart';
import 'package:intl/intl.dart';

class PhoneTextFieldItemWidget extends StatefulWidget {
  const PhoneTextFieldItemWidget({super.key, this.fields});
  final Fields? fields;
  @override
  State<PhoneTextFieldItemWidget> createState() => _PageState();
}

class _PageState extends State<PhoneTextFieldItemWidget> {


  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        children: [
          Flexible(
            child: Text(
              widget.fields?.name ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey2
              ),
            ),
          ),
          Text(
            "*",
            style: TextStyle(
                fontSize: 14,
                color: widget.fields?.required ?? false ? AppColors.red : AppColors.opacity,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
      AppUtils.kGap8,
      Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.baseColor)
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '+998',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.grey2
                ),
              ),
            ),
            Flexible(
              child: CustomPhoneTextField(
                hintText: "99 123 45 67",
                fillColor: AppColors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.opacity),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.opacity),
                ),
              ),
            ),
          ],
        ),
      ),
      AppUtils.kGap8,
    ],
  );
}