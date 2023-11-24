import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/app/utils/responsive_builder.dart';
import 'package:vendor_app/common/resources/colors.dart';
import 'package:vendor_app/common/resources/drawables.dart';

// ignore: must_be_immutable
class DropDownWidget<T> extends StatelessWidget {
  final Color hintColor;

  final bool isFilledColor;

  String suffixSearchIcon;

  bool enabled;

  DropDownWidget(
      {super.key,
      required this.onChanged,
      this.compareFn,
      this.enabled = true,
      this.hintText = '',
      this.label = '',
      this.suffixSearchIcon = '',
      required this.arryList,
      this.iconUrl = RGIcons.dropDownIcon,
      this.selectedItem,
      this.validator,
      this.borderEnable = false,
      this.iconColor = Colors.grey,
      this.iconSize = 14,
      this.borderSize = 0,
      this.itemAsString,
      this.dropDownSize = 16,
      this.labelFontSize = 14,
      this.weight = FontWeight.w300,
      this.contextpadding = 20,
      this.requiredField = false,
      this.maxHeight = 190,
      this.showSearchBox = false,
      this.prefixIcon,
      this.prefixIconColor,
      this.prefixIconSized = 10,
      this.fillColor,
      this.dropDownHeight,
      this.selectedItemHeight,
      this.hintColor = AppColors.grey,
      this.isFilledColor = false,
      this.borderColor = AppColors.grey,
      this.enableBorder = AppColors.grey,
      this.disableBorder = AppColors.grey,
      this.suffix,
      this.prefix,
      this.hintweight = FontWeight.w300,
      this.hintSize = 18});
  bool Function(T value1, T value2)? compareFn;
  final FontWeight weight;
  final Color borderColor;
  final Color enableBorder;
  final Color disableBorder;
  final FontWeight hintweight;
  final double hintSize;
  double borderSize;
  String? prefixIcon;
  Color? prefixIconColor;
  double? prefixIconSized = 10;
  double dropDownSize;
  Function(T? value)? onChanged;
  String? Function(T? value)? validator;
  String hintText;
  final String label;
  final double labelFontSize;
  double iconSize;
  List<T> arryList;
  T? selectedItem;
  String? iconUrl;
  Color? iconColor;
  double contextpadding;
  final bool borderEnable;
  final bool requiredField;
  String Function(T)? itemAsString;
  final bool showSearchBox;
  final double maxHeight;
  final Color? fillColor;
  final double? dropDownHeight;
  final double? selectedItemHeight;
  final Widget? suffix;
  final Widget? prefix;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: dropDownHeight ?? 60,
          child: DropdownSearch<T>(
            enabled: enabled,
            validator: validator,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            dropdownButtonProps: DropdownButtonProps(
              padding: const EdgeInsets.all(0),
              icon: ImageIcon(
                AssetImage(iconUrl!),
                size: iconSize,
                color: iconColor,
              ),
            ),
            popupProps: PopupProps.menu(
              showSearchBox: showSearchBox,
              constraints: BoxConstraints(maxHeight: maxHeight),
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  suffix: ImageIcon(
                    AssetImage(suffixSearchIcon),
                    color: prefixIconColor ?? AppColors.black,
                    size: prefixIconSized ?? 24.0,
                  ),
                  filled: true,
                  fillColor: AppColors.whiteGreyish,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderSize),
                    borderSide: borderEnable
                        ? const BorderSide(color: AppColors.grey, width: 2.0)
                        : BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderSize),
                    borderSide: borderEnable
                        ? const BorderSide(color: AppColors.grey, width: 2.0)
                        : BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderSize),
                    borderSide: borderEnable
                        ? const BorderSide(color: AppColors.grey, width: 2.0)
                        : BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderSize),
                      borderSide:
                          const BorderSide(color: AppColors.grey, width: 1.0)),
                  labelStyle: TextStyle(
                    fontSize: Responsive.isDesktop(context) ? 16 : 14,
                    color: AppColors.grey.withOpacity(0.6),
                  ),
                  hintText: "Search here..",
                  hintStyle: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 16 : 14,
                      fontFamily: "Roboto"),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: Responsive.isDesktop(context)
                          ? contextpadding
                          : 20.0),
                ),
              ),
              menuProps: MenuProps(
                elevation: 2,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            itemAsString: itemAsString,
            items: arryList.isNotEmpty ? arryList : [],
            compareFn: compareFn,
            selectedItem: selectedItem,
            onChanged: onChanged,
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle:
                  TextStyle(fontFamily: "Roboto", fontSize: selectedItemHeight),
              dropdownSearchDecoration: InputDecoration(
                fillColor: fillColor,
                filled: isFilledColor,
                hintText: hintText,
                prefixIcon: prefix,
                prefixIconConstraints: const BoxConstraints(maxHeight: 26),
                suffixIconConstraints: const BoxConstraints(maxHeight: 26),
                hintStyle: TextStyle(
                    color: hintColor.withOpacity(0.7),
                    fontFamily: "Roboto",
                    fontSize: hintSize,
                    fontWeight: hintweight),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppColors.white, width: 0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppColors.white, width: 0)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppColors.white, width: 0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppColors.white, width: 0)),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1)),
                alignLabelWithHint: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
