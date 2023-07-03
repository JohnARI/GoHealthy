import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_healthy/utils/build_context_extensions.dart';

import '../../../../shared/constants.dart';
import '../blocs/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
      appBar: AppBar(
        title: Text(context.translate!.login),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
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
          } else if (state is LoginLoadingState) {
            return _buildLoadingState();
          } else if (state is LoginErrorState) {
            return _buildErrorState();
          } else {
            return _buildInitialState();
          }
        },
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: context.translate!.email,
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: context.translate!.password,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _loginBloc.add(LoginButtonPressedEvent(
                email: _emailController.text,
                password: _passwordController.text,
              ));
            },
            child: Text(context.translate!.loginButton),
          ),
          ElevatedButton(
            onPressed: () {
              _loginBloc.add(LoginNavigateRegisterEvent());
            },
            child: Text(context.translate!.register),
          ),
          ElevatedButton(
            onPressed: () {
              _loginBloc.add(LoginNavigateForgotPasswordEvent());
            },
            child: Text(context.translate!.forgotPassword),
          ),
          ElevatedButton(
            onPressed: () {
              _loginBloc.add((LoginGoogleButtonPressedEvent()));
            },
            child: Text(context.translate!.loginWithGoogle),
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

  Widget _buildErrorState() {
    return const Center(
      child: Text('Error'),
    );
  }
}
