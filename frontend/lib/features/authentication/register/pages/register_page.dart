import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/routes.dart';
import '../blocs/register_bloc.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

    final RegisterBloc _registerBloc = RegisterBloc();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: BlocConsumer<RegisterBloc, RegisterState>(
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
            GoRouter.of(context).goNamed(AppRoute.LOGIN_ROUTE_NAME);
          }
        },
        builder: (BuildContext context, RegisterState state) {
          if (state is RegisterInitialState) {
            return _buildInitialState();
          } else if (state is RegisterLoadingState) {
            return _buildLoadingState();
          } else if (state is RegisterErrorState) {
            return _buildErrorState();
          } else {
            return _buildInitialState();
          }
        },
      ),
    );
  }
  
  Widget _buildInitialState() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Register Page'),
            ElevatedButton(
              onPressed: () {
                _registerBloc.add(const RegisterButtonPressedEvent('email', 'name', 'password'));
              },
              child: const Text('Register'),
            ),
            ElevatedButton(
              onPressed: () {
                _registerBloc.add(RegisterNavigateLoginEvent());
              },
              child: const Text('Navigate to Login'),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildLoadingState() {
    return Container();
  }
  
  Widget _buildErrorState() {
    return Container();
  }
}
