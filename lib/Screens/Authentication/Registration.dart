import 'package:natural_hair_therapist/imports.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});
  static const String id = "registration";

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  String email = "";
  String name = "";
  String password = "";
  String country = "";
  String birthDate = "";
  String errorMessage = "";
  bool isError = false;
  bool isLoading = false;

  final FirebaseMethods firebaseMethods = FirebaseMethods();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController countryTextController = TextEditingController();
  final TextEditingController dateOfBirthTextController =
      TextEditingController();

  Future<void> postgre(String named, String emaild, String response) async {
    DatabaseService postgre = DatabaseService();
    await postgre.ensureConnected();
    await postgre.insertUser(named, emaild, response);
    postgre.closeConnection();
  }

  @override
  Widget build(BuildContext context) {
    final selection = Provider.of<ProviderClass>(context);
    birthDate = selection.getDateOfBirth();
    country = selection.getCountry();

    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: kPrimaryColor),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SecondaryNavigation(title: "Registration"),

                        if (isError)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              errorMessage,
                              style: const TextStyle(
                                color: Colors.red,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                        // ✅ Name Input
                        TextFieldMethod(
                          autoFocus: false,
                          hintText: 'Enter Your Name',
                          label: 'Name',
                          suffixIcon:
                              const Icon(Icons.person, color: kPrimaryColor),
                          onchanges: (String newName) {
                            setState(() {
                              name = newName;
                            });
                          },
                          keyboardType: TextInputType.text,
                          textController: nameTextController,
                        ),

                        const SizedBox(height: 10),

                        // ✅ Email Input
                        TextFieldMethod(
                          autoFocus: false,
                          hintText: "Enter Your Email",
                          label: "E-mail",
                          suffixIcon:
                              const Icon(Icons.email, color: kPrimaryColor),
                          onchanges: (newEmail) {
                            setState(() {
                              email = newEmail;
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                          textController: emailTextController,
                        ),

                        const SizedBox(height: 10),

                        // ✅ Password Input
                        TextFieldMethod(
                          autoFocus: false,
                          hintText: "Enter Secret Password",
                          label: "Password",
                          suffixIcon: const Icon(Icons.password_sharp,
                              color: kPrimaryColor),
                          onchanges: (String newPassword) {
                            setState(() {
                              password = newPassword;
                            });
                          },
                          keyboardType: TextInputType.text,
                          textController: passwordTextController,
                          obsecure: true,
                        ),

                        const SizedBox(height: 10),

                        // ✅ Country Selection
                        AutoCompleteCountries(),

                        const SizedBox(height: 10),

                        // ✅ Date of Birth Selection
                        const DateOfBirthScreen(),

                        const SizedBox(height: 10),

                        // ✅ Register Button
                        Align(
                          alignment: Alignment.centerRight,
                          child: FilledButtonWID(
                            text: const Text("Register"),
                            onpressed: () async {
                              setState(() {
                                isLoading = true;
                                isError = false;
                                errorMessage = "";
                              });

                              // ✅ Prevent Empty Fields
                              if (name.isEmpty ||
                                  email.isEmpty ||
                                  password.isEmpty ||
                                  birthDate.isEmpty ||
                                  country.isEmpty) {
                                setState(() {
                                  isLoading = false;
                                  isError = true;
                                  errorMessage = "All fields are required.";
                                });
                                return;
                              }

                              try {
                                await firebaseMethods.register(
                                  name,
                                  email,
                                  password,
                                  country,
                                  birthDate,
                                );

                                if (firebaseMethods
                                    .getErrorMessage()
                                    .isNotEmpty) {
                                  setState(() {
                                    isLoading = false;
                                    isError = true;
                                    errorMessage =
                                        firebaseMethods.getErrorMessage();
                                  });
                                } else {
                                  postgre(name, email, "");
                                  Navigator.pushReplacementNamed(
                                      context, Dashboard.id);
                                }
                              } catch (e) {
                                setState(() {
                                  isLoading = false;
                                  isError = true;
                                  errorMessage =
                                      "Registration failed. Please try again.";
                                });
                              }
                            },
                          ),
                        ),

                        const SizedBox(height: 10),

                        // ✅ Sign-in Option
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("I already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Login.id);
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20), // Extra spacing
                      ],
                    ),
            ),
          ),
        ),
        bottomNavigationBar: BottomWidget(),
      ),
    );
  }
}
