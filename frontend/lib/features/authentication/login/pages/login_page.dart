import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/features/authentication/widgets/auth_widgets.dart';
import 'package:go_healthy/shared/constants.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';
import 'package:go_healthy/widgets/buttons.dart';

import '../../../../utils/lottie/lottie.dart';
import '../blocs/login_bloc.dart';
import '../widgets/login_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
    _loginBloc.add(LoginInitialEvent());
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _loginBloc.close();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppStyle.HORIZONTAL_PADDING),
        child: SingleChildScrollView(
          child: BlocConsumer<LoginBloc, LoginState>(
            bloc: _loginBloc,
            listener: (BuildContext context, LoginState state) {
              if (state is LoginSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login Success'),
                  ),
                );
                context.navigateNamedRoute(AppRoute.HOME.name);
              }

              if (state is LoginNavigateRegisterActionState) {
                context.navigateNamedRoute(AppRoute.REGISTER.name);
              }

              if (state is LoginShowPasswordActionState) {
                _loginBloc.add(LoginShowPasswordButtonPressedEvent(
                    obscureText: !state.obscureText));
              }
            },
            builder: (BuildContext context, LoginState state) {
              if (state is LoginInitialState) {
                return _buildInitialState();
              }
              if (state is LoginLoadingState) {
                return _buildLoadingState();
              }
              if (state is LoginErrorState) {
                return _buildErrorState();
              }
              return _buildInitialState();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return AuthWidget(
      imageWidget: LottieAnim.LoginOrRegister(
          context.screenHeight * 0.8, context.screenWidth * 0.8),
      titleWidget: context.translate!.login,
      formWidget: LoginForm(
        emailController: _emailController,
        passwordController: _passwordController,
        obscureText: obscureText,
        onPressedTrailingIcon: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
      buttonWidget: AppFilledButton(
        text: context.translate!.loginButton,
        onPressed: () {
          _loginBloc.add(
            LoginButtonPressedEvent(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
        },
      ),
      contentWidgets: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppStyle.VERTICAL_PADDING),
          child: Row(children: <Widget>[
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.0),
              child: Text("OR",
                  style: TextStyle(
                    color: AppColor.BLACK5,
                    fontSize: 16.0,
                  )),
            ),
            Expanded(child: Divider()),
          ]),
        ),
        AppOutlinedButton(
          icon: SvgAssets.buildSvg(
            path: SvgAssets.googleLogo,
            height: context.screenHeight * 0.03,
          ),
          text: context.translate!.loginWithGoogle,
          onPressed: () {
            _loginBloc.add(LoginGoogleButtonPressedEvent());
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(context.translate!.loginDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodySmall),
            AppTextButton(
              onPressed: () {
                _loginBloc.add(LoginNavigateRegisterEvent());
              },
              text: context.translate!.register,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState() {
    return const Center(
      child: Text('Error'),
    );
  }
}
