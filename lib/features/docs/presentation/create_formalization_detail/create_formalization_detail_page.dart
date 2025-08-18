import "package:flutter/material.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";


class CreateFormalizationDetailPage extends StatefulWidget {
  const CreateFormalizationDetailPage({super.key, this.response});
  final CreateContractsResponse? response;
  @override
  State<CreateFormalizationDetailPage> createState() => _PageState();
}

class _PageState extends State<CreateFormalizationDetailPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        widget.response?.templateName ?? "",
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
      backgroundColor: AppColors.baseColor.withOpacity(0.08),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info_outlined),
        )
      ],
    ),
    body: Column(
      children: [
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.baseColor.withOpacity(0.08),
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))
          ),
        ),


      ],
    ),
    bottomNavigationBar: const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: CustomButton(
        width: double.infinity,
        label: Text('Оформление'),
      ),
    ),
  );
}
