import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/constants.dart';
import '../../../../utils/lottie/lottie.dart';
import '../../../../widgets/buttons.dart';
import '../blocs/register_bloc.dart';
import '../widgets/register_widgets.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final RegisterBloc _registerBloc = RegisterBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppStyle.HORIZONTAL_PADDING),
        child: BlocConsumer<RegisterBloc, RegisterState>(
          bloc: _registerBloc,
          listener: (BuildContext context, RegisterState state) {
            if (state is RegisterSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Register Success'),
                ),
              );
            }

            if (state is RegisterNavigateLoginActionState) {
              GoRouter.of(context).goNamed(AppRoute.LOGIN.name);
            }
          },
          builder: (BuildContext context, RegisterState state) {
            if (state is RegisterInitialState) {
              return _buildInitialState(context);
            } else if (state is RegisterLoadingState) {
              return _buildLoadingState();
            } else if (state is RegisterErrorState) {
              return _buildErrorState();
            } else {
              return _buildInitialState(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LottieAnim.LoginOrRegister(context.screenHeight, context.screenWidth),
          Text(context.translate!.register),
          RegisterForm(
            emailController: _emailController,
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
            onPressedTrailingIcon: () {
              // _registerBloc.add(RegisterShowPasswordButtonPressedEvent());
            },
          ),
          AppFilledButton(
            text: context.translate!.registerButton,
            onPressed: () {
              // _registerBloc.add();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                context.translate!.registerAlreadyHaveAnAccount,
              ),
              AppTextButton(
                onPressed: () {
                  _registerBloc.add(RegisterNavigateLoginEvent());
                },
                text: context.translate!.login,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildLoadingState() {
  return Container();
}

Widget _buildErrorState() {
  return Container();
}
