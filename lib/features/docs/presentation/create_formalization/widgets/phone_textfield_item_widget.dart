import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart';
import 'package:imzo/core/extension/custom_snackbar/top_snack_bar.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/core/widgets/inputs/custom_phone_text_field.dart';
import 'package:imzo/core/widgets/inputs/custom_text_field.dart';
import 'package:imzo/features/docs/model/contract_templates_response.dart';
import 'package:intl/intl.dart';

class PhoneTextFieldItemWidget extends StatefulWidget {
  const PhoneTextFieldItemWidget({super.key, this.fields, required this.data});
  final Fields? fields;
  final Function(String dataText) data;
  @override
  State<PhoneTextFieldItemWidget> createState() => PhoneTextFieldItemState();
}

class PhoneTextFieldItemState extends State<PhoneTextFieldItemWidget> {

  final TextEditingController _controller = TextEditingController();
  bool _isError = false;

  void validate() {
    if ((widget.fields?.required ?? false) && _controller.text.trim().isEmpty) {
      setState(() {
        _isError = true;
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            boxShadow: const [BoxShadow(color: AppColors.grey2, blurRadius: 2, offset: Offset(0, 0))],
            icon: const Icon(Icons.close, color: AppColors.red,),
            message: "${widget.fields?.name}ni kiritmadiz!",
          ),
        );
      });
    } else {
      setState(() => _isError = false);
      widget.data(_controller.text.isNotEmpty ? "+998${_controller.text.replaceAll(" ", "")}" : "");
    }
  }

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
            border: Border.all(color: _isError ? AppColors.red : AppColors.baseColor)
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
                controller: _controller,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.opacity),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.opacity),
                ),
                onChanged: (_) {
                  if (_isError) {
                    setState(() {
                      _isError = false;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
      AppUtils.kGap8,
    ],
  );
}