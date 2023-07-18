import 'package:flutter/material.dart';
import 'package:go_healthy/shared/constants.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';
import 'package:go_healthy/widgets/inputs.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Function() onPressedTrailingIcon;

  const RegisterForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onPressedTrailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            hintStyle: const TextStyle(color: AppColor.BLACK6),
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
            hintStyle: const TextStyle(color: AppColor.BLACK6),
            suffixIcon: SvgAssets.buildSvg(
              path: SvgAssets.passwordVisible,
              colorFilter: const ColorFilter.mode(
                AppColor.BLACK1,
                BlendMode.srcIn,
              ),
              height: context.screenHeight * 0.03,
            ),
            onPressedTrailingIcon: onPressedTrailingIcon,
            obscureText: true,
            hintText: context.translate!.password,
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
            hintStyle: const TextStyle(color: AppColor.BLACK6),
            suffixIcon: SvgAssets.buildSvg(
              path: SvgAssets.passwordVisible,
              colorFilter: const ColorFilter.mode(
                AppColor.BLACK1,
                BlendMode.srcIn,
              ),
              height: context.screenHeight * 0.03,
            ),
            onPressedTrailingIcon: onPressedTrailingIcon,
            obscureText: true,
            hintText: context.translate!.password,
          ),
        ],
      ),
    );
  }
}
