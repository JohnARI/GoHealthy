import 'package:flutter/material.dart';
import 'package:go_healthy/shared/constants.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';
import 'package:go_healthy/widgets/buttons.dart';
import 'package:go_healthy/widgets/inputs.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscureText;
  final Function() onPressedTrailingIcon;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.obscureText,
    required this.onPressedTrailingIcon,
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
              keyboardType: TextInputType.emailAddress,
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
            const SizedBox(height: 10.0),
            InputWithLeadingAndTrailingIcon(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              icon: SvgAssets.buildSvg(
                path: SvgAssets.password,
                colorFilter: const ColorFilter.mode(
                  AppColor.BLACK6,
                  BlendMode.srcIn,
                ),
                height: context.screenHeight * 0.03,
              ),
              suffixIcon: obscureText
                  ? SvgAssets.buildSvg(
                      path: SvgAssets.passwordVisible,
                      colorFilter: const ColorFilter.mode(
                        AppColor.BLACK1,
                        BlendMode.srcIn,
                      ),
                    )
                  : SvgAssets.buildSvg(
                      path: SvgAssets.passwordNotVisible,
                      colorFilter: const ColorFilter.mode(
                        AppColor.BLACK1,
                        BlendMode.srcIn,
                      ),
                    ),
              onPressedTrailingIcon: onPressedTrailingIcon,
              obscureText: obscureText,
              hintText: context.translate!.password,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AppTextButton(
                  onPressed: () {},
                  text: context.translate!.loginForgotPassword,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
