import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/constants.dart';
import '../../../../utils/lottie/lottie.dart';
import '../../../../widgets/buttons.dart';
import '../../widgets/auth_widgets.dart';
import '../blocs/register_bloc.dart';
import '../widgets/register_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterBloc _registerBloc;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _registerBloc.close();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppStyle.HORIZONTAL_PADDING),
        child: SingleChildScrollView(
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

              if (state is RegisterErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Register Error'),
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
      ),
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return AuthWidget(
      imageWidget:
          LottieAnim.LoginOrRegister(context.screenHeight, context.screenWidth),
      titleWidget: context.translate!.register,
      formWidget: _buildFormWidget(),
      buttonWidget: _buildButtonWidget(context),
      contentWidgets: _buildContentWidgets(context),
    );
  }

  AppFilledButton _buildButtonWidget(BuildContext context) {
    return AppFilledButton(
      text: context.translate!.registerButton,
      onPressed: () {
        // _registerBloc.add();
      },
    );
  }

  RegisterForm _buildFormWidget() {
    return RegisterForm(
      emailController: _emailController,
      passwordController: _passwordController,
      confirmPasswordController: _confirmPasswordController,
      hidePassword: hidePassword,
      hideConfirmPassword: hideConfirmPassword,
      onPressedPasswordTrailingIcon: () {
        setState(() {
          hidePassword = !hidePassword;
        });
      },
      onPressedConfirmPasswordTrailingIcon: () {
        setState(() {
          hideConfirmPassword = !hideConfirmPassword;
        });
      },
    );
  }

  List<Widget> _buildContentWidgets(BuildContext context) {
    return <Widget>[
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
    ];
  }
}

Widget _buildLoadingState() {
  return Container();
}

Widget _buildErrorState() {
  return Container();
}
