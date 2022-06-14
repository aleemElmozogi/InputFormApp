import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double we = MediaQuery.of(context).size.width;
    // double he = MediaQuery.of(context).size.height;

    return Scaffold(
        // backgroundColor: const Color(0x6F3023A9),
        body: Padding(
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0, bottom: 50.0, top: 50.0),
      child: Container(
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x298E8787),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'تسجيل الدخول',
                style: GoogleFonts.cairo(
                  fontSize: 30.0,
                  color: const Color(0xFF575252),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: 507.0,
                child: TextFormField(
                  onChanged: (value) {},
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال اسم المستخذم';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.account_circle_sharp),
                    // suffixIcon:
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'اسم المستخذم',
                    labelStyle: GoogleFonts.cairo(
                      fontSize: 15.0,
                      color: const Color(0xFF463939),
                    ),

                    focusedErrorBorder:
                        buildOutlineInputBorder(const Color(0xFF707070)),
                    focusedBorder:
                        buildOutlineInputBorder(const Color(0xFF707070)),
                    enabledBorder:
                        buildOutlineInputBorder(const Color(0xFF707070)),
                    disabledBorder:
                        buildOutlineInputBorder(const Color(0xFF707070)),
                    errorBorder:
                        buildOutlineInputBorder(const Color(0xF2EC1717)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 507,
                // height: 60,
                child: TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال اسم المستخذم';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedErrorBorder:
                        buildOutlineInputBorder(const Color(0xFF707070)),
                    focusedBorder:
                        buildOutlineInputBorder(const Color(0xFF707070)),
                    enabledBorder:
                        buildOutlineInputBorder(const Color(0xFF707070)),
                    disabledBorder:
                        buildOutlineInputBorder(const Color(0xFF707070)),
                    errorBorder:
                        buildOutlineInputBorder(const Color(0xF2EC1717)),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.0),
                      child: IconButton(
                        splashRadius: 20.0,
                        hoverColor: Colors.grey.withOpacity(0.3),
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'الرمز السري',
                    labelStyle: GoogleFonts.cairo(
                      fontSize: 15.0,
                      color: const Color(0xFF463939),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 507,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 1.0,
                    primary: const Color(0xff082028),
                    backgroundColor: const Color(0xff2290C1),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    if (kDebugMode) {
                      print('line 195');
                    }
                    if (kDebugMode) {
                      print(_usernameController.text);
                    }
                  },
                  child: Text(
                    'إدخال',
                    style: GoogleFonts.cairo(
                      fontSize: 20.0,
                      color: const Color(0xFFF9F9F9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  OutlineInputBorder buildOutlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
