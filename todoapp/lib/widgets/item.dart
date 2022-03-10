import 'package:flutter/material.dart';
import 'package:todoapp/styles/colors.dart';
import 'package:todoapp/styles/rounded_button.dart';
import 'package:todoapp/styles/text_style.dart';

// ignore: must_be_immutable
class Item extends StatefulWidget {
  Item(
      {Key? key,
      required this.title,
      required this.status,
      required this.onDoneClicked,
      required this.onDeleteClicked,
      required this.onEditClicked})
      : super(key: key);

  final String title;
  late bool status;
  VoidCallback onDoneClicked;
  VoidCallback onDeleteClicked;
  VoidCallback onEditClicked;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 62,
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: widget.onDoneClicked,
                child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: widget.status ? AppColors.blackColor : null,
                      border: Border.all(color: AppColors.blackColor, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: widget.status
                        ? const Center(
                            child: Icon(
                              Icons.done,
                              color: AppColors.primaryColor,
                              size: 14,
                            ),
                          )
                        : Container()),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.title,
                style: AppTextStyle.itemTextStyle.copyWith(
                    decoration: widget.status
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: widget.status
                        ? AppColors.lightGreyColor
                        : AppColors.blackColor),
              )
            ],
          ),
          Row(
            children: [
              RoundedButton(
                icon: Icons.edit,
                onClick: widget.onEditClicked,
              ),
              const SizedBox(
                width: 5,
              ),
              RoundedButton(
                icon: Icons.delete,
                onClick: widget.onDeleteClicked,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
