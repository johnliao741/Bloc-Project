import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_project/domain/entitis/login_response.dart';
import 'package:my_bloc_project/presentation/dialogs/dialogs.dart';
import 'package:my_bloc_project/presentation/home/view.dart';
import 'bloc.dart';
import 'event.dart';
import '../common/state.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController accController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    accController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              bloc.add(LogoutAccountEvent());
            },
          )
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: accController,
                decoration: InputDecoration(
                  hintText: "account",
                ),
                validator: verifyAccount,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: passController,
                decoration: InputDecoration(hintText: "password"),
                validator: verifyPass,
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                  onPressed: () {
                    if ((_formKey.currentState as FormState).validate()) {
                      // context.read<LoginBloc>().add(LoginAccountEvent(
                      //     accController.value.text, passController.value.text));
                      bloc.add(LoginAccountEvent(
                          accController.value.text, passController.value.text));
                    }
                  },
                  child: Text("login")),
              BlocListener<LoginBloc, ResultState>(
                listener: (context, state) async {
                  if (state is LoadingState) {
                    Dialogs.showLoading(context);
                  } else {
                    Dialogs.hideLoading(context);
                  }
                  if (state is SuccessState<LoginResponse>) {
                    var isConfirm = await Dialogs.showConfirmMessage(
                        context, state.data?.message ?? "成功登入！！");
                    if (isConfirm) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  } else if (state is ErrorState) {
                    Dialogs.showMessage(context, state.errorMsg ?? "成功登入！！");
                  }
                },
                child: Container(

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("請輸入帳密"),
                      Text("admin"),
                      Text("password")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? verifyAccount(String? acc) {
    if (acc!.isEmpty) {
      return "account is empty";
    } else if (acc.length < 5) {
      return "account must than 5 number";
    }
    return null;
  }

  String? verifyPass(String? pass) {
    if (pass!.isEmpty) {
      return "password is empty";
    } else if (pass.length < 6) {
      return "password must than 6 number";
    }
    return null;
  }
}
