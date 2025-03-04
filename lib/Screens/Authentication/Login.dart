import 'package:natural_hair_therapist/imports.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const id = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseMethods firebases = FirebaseMethods();

  // ✅ Initialize as empty strings to prevent null errors
  String email = "";
  String password = "";
  String errorMessage = "";
  bool isLoading = false;
  bool isError = false;

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  )
                : Column(
                    children: [
                      SecondaryNavigation(title: 'Sign In'),

                      const SizedBox(height: 20),

                      const Hero(
                        tag: "logo",
                        child: Image(
                          width: 250,
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // ✅ Improved Error Message Display
                      if (isError)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),

                      Column(
                        children: [
                          // ✅ Email Input
                          TextFieldMethod(
                            autoFocus: false,
                            hintText: "Enter Your E-mail",
                            label: "E-mail",
                            suffixIcon: const Icon(
                              Icons.email,
                              color: kPrimaryColor,
                            ),
                            onchanges: (String newEmail) {
                              setState(() {
                                email = newEmail;
                              });
                            },
                            keyboardType: TextInputType.emailAddress,
                            textController: emailTextController,
                          ),

                          const SizedBox(height: 20),

                          // ✅ Password Input
                          TextFieldMethod(
                            obsecure: true,
                            autoFocus: false,
                            hintText: "Enter Your Password",
                            label: "Password",
                            suffixIcon: const Icon(
                              Icons.password,
                              color: kPrimaryColor,
                            ),
                            onchanges: (String newPassword) {
                              setState(() {
                                password = newPassword;
                              });
                            },
                            keyboardType: TextInputType.text,
                            textController: passwordTextController,
                          ),

                          const SizedBox(height: 20.0),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FilledButtonWID(
                                text: const Text("Sign in"),
                                onpressed: () async {
                                  setState(() {
                                    isLoading = true;
                                    isError = false;
                                    errorMessage = "";
                                  });

                                  // ✅ Prevent Empty Fields
                                  if (emailTextController.text.isEmpty ||
                                      passwordTextController.text.isEmpty) {
                                    setState(() {
                                      isLoading = false;
                                      isError = true;
                                      errorMessage =
                                          "Please fill in all fields.";
                                    });
                                    return;
                                  }

                                  try {
                                    await firebases.signing(
                                        emailTextController.text,
                                        passwordTextController.text);

                                    if (firebases
                                        .getErrorMessage()
                                        .isNotEmpty) {
                                      setState(() {
                                        isLoading = false;
                                        isError = true;
                                        errorMessage =
                                            firebases.getErrorMessage();
                                      });
                                    } else {
                                      Navigator.pushReplacementNamed(
                                          context, Dashboard.id);
                                    }
                                  } catch (e) {
                                    setState(() {
                                      isLoading = false;
                                      isError = true;
                                      errorMessage =
                                          "Login failed. Please try again.";
                                    });
                                  }

                                  emailTextController.clear();
                                  passwordTextController.clear();
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("I don't have an account yet? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, Registration.id);
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
        bottomNavigationBar: BottomWidget(),
      ),
    );
  }
}
