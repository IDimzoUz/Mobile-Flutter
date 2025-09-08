import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart';
import 'package:imzo/core/extension/custom_snackbar/top_snack_bar.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/core/widgets/inputs/custom_text_field.dart';
import 'package:imzo/features/docs/model/contract_templates_response.dart';
import 'package:intl/intl.dart';

class DateTextFieldItemWidget extends StatefulWidget {
  const DateTextFieldItemWidget({super.key, this.fields, required this.data});
  final Fields? fields;
  final Function(String dataText) data;
  @override
  State<DateTextFieldItemWidget> createState() => DateTextFieldItemState();
}

class DateTextFieldItemState extends State<DateTextFieldItemWidget> {

  final TextEditingController _controller = TextEditingController();
  bool _isError = false;
  final int _maxLength = 10;


  @override
  void initState() {
    super.initState();
    _controller.addListener(_applyMask);
  }

  void _applyMask() {
    final text = _controller.text.replaceAll(RegExp(r'[^\d]'), '');
    String masked = '';

    for (int i = 0; i < text.length; i++) {
      if (i == 4) masked += '-';
      if (i == 6) masked += '-';
      if (i < 8) masked += text[i];
    }

    if (masked != _controller.text) {
      _controller.value = TextEditingValue(
        text: masked,
        selection: TextSelection.collapsed(offset: masked.length),
      );
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _controller.text = _formatDate(picked);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Muhim: Controller ni tozalash
  }

  void validate() {
    if ((widget.fields?.required ?? false) && _controller.text.trim().isEmpty) {
      setState(() {
        _isError = true;
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            boxShadow: const [ BoxShadow(color: AppColors.grey2, blurRadius: 2, offset: Offset(0, 0)) ],
            icon: const Icon(Icons.close, color: AppColors.red,),
            message: "${widget.fields?.name}ni kiritmadiz!",
          ),
        );
      });
    } else {
      setState(() => _isError = false);
      print(_controller.text);
      widget.data(_controller.text);
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
      CustomTextField(
        hintText: widget.fields?.placeholder ?? "",
        fillColor: AppColors.white,
        cursorColor: AppColors.baseColor,
        controller: _controller,
        textInputType: TextInputType.number,
        suffixIcon: GestureDetector(
          onTap: () => _selectDate(context),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(SvgIcons.icCalendarMini),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(8), // 8 ta raqam (YYYYMMDD)
        ],
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.baseColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _isError ? AppColors.red : AppColors.baseColor),
        ),
        onChanged: (_) {
          if (_isError) {
            setState(() {
              _isError = false;
            });
          }
        },
      ),
      AppUtils.kGap8,
    ],
  );
}