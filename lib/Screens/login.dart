import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/Screens/bottonNavigationBar.dart';
import 'package:wallet_app/cubit/login_cubit.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';
import 'package:wallet_app/screen/welcom.dart';

class Log_In extends StatefulWidget {
  const Log_In({super.key});

  @override
  State<StatefulWidget> createState() {
    return Log_In_State();
  }
}

class Log_In_State extends State<Log_In> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            print(state.user.token);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Botton_Navigation_Bar()),
            );
          }
          else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Invalid Credentials Try again"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 9),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => Welcome()),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Color(0xFF294B29),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 19, right: 19, bottom: 19),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Center(
                                child: Text(
                                  'Log in ',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Times News Roman',
                                  ),
                                ),
                              ),
                            ),
                            Center(
                                child: Image.asset(
                              "images/login.png",
                              width: 140,
                            )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _emailTextEditingController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF294B29),
                                    ),
                                    borderRadius: BorderRadius.circular(11)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF294B29),
                                    ),
                                    borderRadius: BorderRadius.circular(11)),
                                labelText: 'Your Email',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email address';
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 27,
                            ),
                            TextFormField(
                              controller: _passwordTextEditingController,
                              keyboardType: TextInputType.text,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF294B29),
                                    ),
                                    borderRadius: BorderRadius.circular(11)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF294B29),
                                    ),
                                    borderRadius: BorderRadius.circular(11)),
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(_passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 2) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xFF294B29),
                              ),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                onPressed: () {


                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    loginCubit.login(
                                      email: _emailTextEditingController.text,
                                      password:
                                          _passwordTextEditingController.text,
                                    );
                                  }
                                },
                                padding:
                                    const EdgeInsets.only(right: 4, left: 4),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forget Password?',
                                    style: TextStyle(
                                        color: Color(0xFF294B29),
                                        fontSize: 17,
                                        decoration: TextDecoration.underline),
                                  )),
                            ),
                            const SizedBox(
                              height: 60,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
