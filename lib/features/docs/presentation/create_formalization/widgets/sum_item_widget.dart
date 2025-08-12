import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/core/widgets/inputs/custom_text_field.dart';
import 'package:imzo/features/docs/model/contract_templates_response.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/date_textfield_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/description_textfield_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/document_id_textfield_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/integer_textfield_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/money_textfield_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/phone_textfield_item_widget.dart';
import 'package:intl/intl.dart';

class SumItemWidget extends StatefulWidget {
  const SumItemWidget({super.key, this.dataSections});
  final Sections? dataSections;
  @override
  State<SumItemWidget> createState() => SumItemWidgetState();
}

class SumItemWidgetState extends State<SumItemWidget> {

  final List<GlobalKey<MoneyTextFieldItemWidgetState>> moneyKeys = [];
  late bool animationContainer = false;
  late List<String> currency = ["UZS", "USD"];
  late String currencyData = "UZS";

  void validateAll() {
    for (var key in moneyKeys) {
      key.currentState?.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    moneyKeys.clear();
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppUtils.kBorderRadius12,
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(0.2), offset: Offset(0, 0), blurRadius: 5)
          ]
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 15),
      child: Column(
        children: [
          Container(
            height: 38,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.baseColor.withOpacity(0.08),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: Center(
              child: Text(
                widget.dataSections?.name ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            itemCount: widget.dataSections?.fields?.length ?? 0,
            itemBuilder: (_, index) {
              late List<Fields>? data = widget.dataSections?.fields;
              data?.sort((a, b) => a.orderIndex?.compareTo(b.orderIndex ?? 0) ?? 0);
              switch (widget.dataSections?.fields?[index].fieldType) {
                case "MONEY":
                // Pul miqdori uchun
                  final key = GlobalKey<MoneyTextFieldItemWidgetState>();
                  moneyKeys.add(key);
                  return MoneyTextFieldItemWidget(fields: data?[index], key: key);
                case "INTEGER":
                // Butun son
                  return IntegerTextFieldItemWidget(fields: data?[index]);
                case "DROPDOWN":
                // Tanlov ro'yxati
                  return SizedBox();
                case "CHECKBOX":
                // Ha/Yo'q
                  return SizedBox();
                case "DATE":
                // Sana
                  return DateTextFieldItemWidget(fields: data?[index]);
                case "DATE_SEPARATE":
                // Alohida yil, oy, kun
                  return DocumentIdTextFieldItemWidget(fields: data?[index]);
                case "TEXT":
                // Katta matn
                  return DescriptionTextFieldItemWidget(fields: data?[index]);
                case "PHONE":
                // Telefon raqam
                  return PhoneTextFieldItemWidget(fields: data?[index]);
                case "DOCUMENT_ID":
                // Pasport/JSHSHIR
                  return DocumentIdTextFieldItemWidget(fields: data?[index]);
                case "STRING":
                // Oddiy matn
                  return SizedBox();
                case "FILE":
                // File upload
                  return SizedBox();
                default: return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}