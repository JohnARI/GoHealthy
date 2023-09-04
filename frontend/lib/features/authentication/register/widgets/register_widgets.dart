import 'package:flutter/material.dart';
import 'package:go_healthy/shared/constants.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';
import 'package:go_healthy/widgets/inputs.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool hidePassword;
  final bool hideConfirmPassword;
  final Function() onPressedPasswordTrailingIcon;
  final Function() onPressedConfirmPasswordTrailingIcon;

  const RegisterForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.hidePassword,
    required this.hideConfirmPassword,
    required this.onPressedPasswordTrailingIcon,
    required this.onPressedConfirmPasswordTrailingIcon,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppStyle.VERTICAL_PADDING),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppStyle.CARD_RADIUS),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(AppStyle.CARD_PADDING),
        child: Column(
          children: <Widget>[
            InputWithLeadingIcon(
              controller: emailController,
              icon: SvgAssets.buildSvg(
                path: SvgAssets.email,
                colorFilter: const ColorFilter.mode(
                  AppColor.BLACK6,
                  BlendMode.srcIn,
                ),
                height: context.screenHeight * 0.03,
              ),
              hintText: context.translate!.email,
            ),
            InputWithLeadingAndTrailingIcon(
              controller: passwordController,
              icon: SvgAssets.buildSvg(
                path: SvgAssets.password,
                colorFilter: const ColorFilter.mode(
                  AppColor.BLACK6,
                  BlendMode.srcIn,
                ),
                height: context.screenHeight * 0.03,
              ),
              suffixIcon: _buildSuffixIcon(hidePassword),
              onPressedTrailingIcon: onPressedPasswordTrailingIcon,
              obscureText: hidePassword,
              hintText: context.translate!.password,
            ),
            InputWithLeadingAndTrailingIcon(
              controller: confirmPasswordController,
              icon: SvgAssets.buildSvg(
                path: SvgAssets.password,
                colorFilter: const ColorFilter.mode(
                  AppColor.BLACK6,
                  BlendMode.srcIn,
                ),
                height: context.screenHeight * 0.03,
              ),
              suffixIcon: _buildSuffixIcon(hideConfirmPassword),
              onPressedTrailingIcon: onPressedConfirmPasswordTrailingIcon,
              obscureText: hideConfirmPassword,
              hintText: context.translate!.registerConfirmPassword,
            ),
          ],
        ),
      ),
    );
  }

  _buildSuffixIcon(bool obscureText) {
    if (obscureText) {
      return SvgAssets.buildSvg(
        path: SvgAssets.passwordVisible,
        colorFilter: const ColorFilter.mode(
          AppColor.BLACK1,
          BlendMode.srcIn,
        ),
      );
    }
    return SvgAssets.buildSvg(
      path: SvgAssets.passwordNotVisible,
      colorFilter: const ColorFilter.mode(
        AppColor.BLACK1,
        BlendMode.srcIn,
      ),
    );
  }
}
