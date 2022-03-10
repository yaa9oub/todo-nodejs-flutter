import 'package:flutter/material.dart';
import 'package:todoapp/styles/colors.dart';
import 'package:todoapp/styles/text_style.dart';

class ItemTextField extends StatelessWidget {
  const ItemTextField({
    Key? key,
    required this.textController,
    required this.onAddButtonClicked,
    required this.editing,
  }) : super(key: key);

  final TextEditingController textController;
  final VoidCallback onAddButtonClicked;
  final bool editing;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 62,
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "New item...",
                hintStyle: AppTextStyle.itemTextStyle,
              ),
              cursorColor: AppColors.secondaryColor,
            ),
          ),
          InkWell(
            onTap: onAddButtonClicked,
            child: Row(
              children: [
                Icon(
                  editing ? Icons.edit : Icons.add,
                  color: AppColors.lightGreyColor,
                  size: 15,
                ),
                Text(
                  editing ? "Edit" : "Add",
                  style: AppTextStyle.itemTextStyle,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
