import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/shared/constants.dart';
import 'package:go_healthy/shared/svg_assets.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';
import 'package:go_healthy/widgets/button.dart';

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppStyle.HORIZONTAL_PADDING),
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
          },
          builder: (BuildContext context, LoginState state) {
            if (state is LoginInitialState) {
              return _buildInitialState();
            }
            if (state is LoginLoadingState) {
              return _buildLoadingState();
            }
            if (state is LoginErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.toString()),
                ),
              );
            }
            return _buildInitialState();
          },
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LottieAnim.LoginOrRegister(context.screenHeight, context.screenWidth),
          Text(context.translate!.login),
          LoginForm(
            emailController: _emailController,
            passwordController: _passwordController,
            onPressedTrailingIcon: () {
              _loginBloc.add(LoginShowPasswordButtonPressedEvent());
            },
          ),
          AppFilledButton(
            text: context.translate!.loginButton,
            context: context,
            onPressed: () {
              _loginBloc.add(
                LoginButtonPressedEvent(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              );
            },
          ),
          const Row(children: <Widget>[
            Expanded(child: Divider()),
            Text("OR"),
            Expanded(child: Divider()),
          ]),
          AppOutlinedButton(
            icon: SvgAssets.buildSvg(
              path: SvgAssets.googleLogo,
              height: context.screenHeight * 0.03,
            ),
            text: context.translate!.loginWithGoogle,
            context: context,
            onPressed: () {
              _loginBloc.add(LoginGoogleButtonPressedEvent());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(context.translate!.loginDontHaveAnAccount),
              TextButton(
                onPressed: () {
                  _loginBloc.add(LoginNavigateRegisterEvent());
                },
                child: Text(context.translate!.register),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
