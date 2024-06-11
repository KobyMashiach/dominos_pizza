import 'package:dominos_pizza/core/colors.dart';
import 'package:dominos_pizza/core/text_styles.dart';
import 'package:dominos_pizza/core/translates/get_tran.dart';
import 'package:dominos_pizza/screens/home/home_page.dart';
import 'package:dominos_pizza/screens/login/bloc/login_bloc.dart';
import 'package:dominos_pizza/widgets/design/buttons/app_button.dart';
import 'package:dominos_pizza/widgets/design/fields/app_textfields.dart';
import 'package:dominos_pizza/widgets/general/appbar.dart';
import 'package:dominos_pizza/widgets/general/circular_progress_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/widgets/navigate_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;

  @override
  void initState() {
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return MultiRepositoryProvider(
    //   providers: [
    //     // RepositoryProvider(
    //     //   create: (context) => LoginPageRepo(),
    //     // ),
    //     // RepositoryProvider(
    //     //   create: (context) => GroupDataSource(),
    //     // ),
    //   ],
    return BlocProvider(
      create: (context) => LoginBloc(
          // repo: context.read<LoginPageRepo>(),
          // localDb: context.read<GroupDataSource>()
          )
        ..add(LoginEventInitialize()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          final bloc = context.read<LoginBloc>();
          switch (state.runtimeType) {}
        },
        builder: (context, state) {
          final bloc = context.read<LoginBloc>();
          return Scaffold(
            appBar: appAppBar(title: appTranslate("login_title")),
            body: state is LoginStateLoading
                ? const Center(child: CircularProgressImage())
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            titleAndIcon(),
                            textFields(state, bloc),
                            if (MediaQuery.of(context).viewInsets.bottom == 0)
                              AppButton(
                                onTap: () {
                                  KheasydevNavigatePage()
                                      .push(context, HomePage());
                                },
                                text: appTranslate("login"),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Column titleAndIcon() {
    return Column(
      children: [
        Icon(
          Icons.lock,
          size: 60,
          color: AppColor.primaryColor,
        ),
        const SizedBox(height: 16),
        Text(
          "התחברות",
          style: AppTextStyle().title.copyWith(fontSize: 40),
        ),
      ],
    );
  }

  Column textFields(LoginState state, LoginBloc bloc) {
    return Column(
      children: [
        AppTextField(
          controller: passwordController,
          hintText: appTranslate("phone_number"),
          checkIfPassword: true,
        ),
        const SizedBox(height: 12),
        AppTextField(
          controller: passwordController,
          hintText: appTranslate("password"),
          checkIfPassword: true,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navigateRegisterPage(context, bloc),
              navigateResetPassword(context, bloc),
            ],
          ),
        ),
      ],
    );
  }

  Widget navigateResetPassword(BuildContext context, LoginBloc bloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            child: Text(
              appTranslate("forget_password"),
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget navigateRegisterPage(BuildContext context, LoginBloc bloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            child: Text(
              appTranslate("no_account"),
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            onPressed: () {}),
      ],
    );
  }
}
