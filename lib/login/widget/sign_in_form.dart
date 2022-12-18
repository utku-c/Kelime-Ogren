import 'package:flutter/material.dart';

import '../../project/constant/constant.dart';
import 'kullanici_sozlesmesi.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _fromKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  bool isActive = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(
        children: [
          newMethodEmailFromField(),
          const SizedBox(height: 30),
          newMethodPasswordFromField(),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                  activeColor: kMyPrimaryColor,
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              const Text(
                "Oturumu Açık Tut",
                style: TextStyle(
                  fontSize: kMyFontSizeSoLow,
                ),
              ),
              const Spacer(),
              GestureDetector(
                // onTap: (() => Navigator.pushNamed(
                //       context,
                //       ForgotPasswordScreen.routeName,
                //     )),
                child: const Text(
                  "Şifremi Unuttum",
                  style: TextStyle(
                    fontSize: kMyFontSizelow,
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                  ),
                ),
              )
            ],
          ),
          const KullaniciSozlesmesi(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  TextFormField newMethodPasswordFromField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      cursorColor: kMyPrimaryTextColor,
      style: const TextStyle(
        color: kMyPrimaryColor,
      ),
      onSaved: (newValue) => password = newValue,
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 6 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }

        return;
      },
      validator: (value) {
        if (value != null &&
            value.isEmpty &&
            !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value != null &&
            value.length < 6 &&
            !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: "Şifrenizi Girin",
        labelText: "Şİfre",
        suffixIcon: IconButton(
          // icon: const Icon(
          //   Icons.remove_red_eye_outlined,
          //   color: kMyPrimaryColor,
          // ),
          onPressed: () {
            setState(() {
              isActive = !isActive;
            });
          },
          icon: Icon(
            Icons.remove_red_eye_outlined,
            color: isActive == false ? Colors.red : Colors.green.shade700,
          ),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.password_outlined,
            color: kMyPrimaryColor,
          ),
          //   child: CustomSuffixIcon(
          //     size: 36,
          //     svgIcon: "assets/icons/password.svg",
          //   ),
          // ),
        ),
      ),
    );
  }

  TextFormField newMethodEmailFromField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      cursorColor: kMyPrimaryTextColor,
      cursorWidth: 2,
      style: const TextStyle(
        color: kMyPrimaryColor,
      ),
      onSaved: (newValue) => email = newValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if (value != null &&
            value.isEmpty &&
            !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value ?? "") &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "E-posta Adresinizi Girin",
        labelText: "E-posta",
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 12.0, right: 6),
          child: Icon(
            Icons.mail_outline,
            color: kMyPrimaryColor,
          ),
        ),
      ),
    );
  }
}
