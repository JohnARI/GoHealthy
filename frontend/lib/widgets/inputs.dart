import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_healthy/helpers/widgets/input.dart';

import '../../../../shared/constants.dart';

class InputWithLeadingIcon extends StatelessWidget {
  final TextEditingController controller;
  final Widget icon;
  final String hintText;
  final TextInputType? keyboardType;

  const InputWithLeadingIcon({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        icon: icon,
        hintText: hintText,
        suffixIconColor: AppColor.BLACK1,
        iconColor: AppColor.BLACK6,
      ),
    );
  }
}

class InputWithLeadingAndTrailingIcon extends StatelessWidget {
  final TextEditingController controller;
  final Widget icon;
  final Widget suffixIcon;
  final String hintText;
  final Function() onPressedTrailingIcon;
  final bool obscureText;
  final TextInputType keyboardType;

  const InputWithLeadingAndTrailingIcon({
    super.key,
    required this.controller,
    required this.icon,
    required this.suffixIcon,
    required this.hintText,
    required this.onPressedTrailingIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: suffixIcon,
          onPressed: onPressedTrailingIcon,
        ),
        icon: icon,
        hintText: hintText,
        suffixIconColor: AppColor.BLACK1,
        iconColor: AppColor.BLACK6,
      ),
      keyboardType: keyboardType,
    );
  }
}

class InputText extends StatefulWidget {
  const InputText(
      {Key? key,
      required this.placeholder,
      this.label,
      this.obscure = false,
      required this.targetVariable,
      this.widthReduction,
      this.isCentered,
      this.isNumeric = false,
      this.maxLength})
      : super(key: key);
  final bool? isCentered;
  final bool isNumeric;
  final num? widthReduction;
  final int? maxLength;
  final String placeholder;
  final TextEditingController targetVariable;
  final String? label;
  final bool obscure;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - (widget.widthReduction ?? 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.label != null
              ? Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    widget.label!,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColor.BLACK1),
                  ),
                )
              : const SizedBox.shrink(),
          TextField(
            keyboardType:
                widget.isNumeric == true ? TextInputType.number : null,
            textAlign: widget.isCentered != null && widget.isCentered == true
                ? TextAlign.center
                : TextAlign.start,
            controller: widget.targetVariable,
            obscureText: widget.obscure,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColor.BLACK5),
            inputFormatters: widget.isNumeric == true
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    RangeTextInputFormatter(min: 0, max: widget.maxLength ?? 99)
                  ]
                : <TextInputFormatter>[],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.BLACK5, width: 2),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.BLACK5, width: 3),
              ),
              counterText: "",
              hintText: widget.placeholder,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColor.BLACK5),
            ),
          ),
        ],
      ),
    );
  }
}
