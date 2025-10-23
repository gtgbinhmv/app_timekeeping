import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:flutter/material.dart';

class FormLoginScreen extends StatefulWidget {
  const FormLoginScreen({super.key});

  @override
  State<FormLoginScreen> createState() => _FormLoginScreenState();
}

//form login
class _FormLoginScreenState extends State<FormLoginScreen> {
  var _hidenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            label: Text("Số điện thoại"),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          obscureText: _hidenPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            label: Text("Mật khẩu"),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _hidenPassword = !_hidenPassword;
                });
              },
              icon: Icon(
                _hidenPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Quên mật khẩu?",
                style: TextStyle(color: AppColor.hexff0363af),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Trợ giúp?",
                style: TextStyle(color: AppColor.hexff0363af),
              ),
            ),
            
          ],
        ),
      ],
    );
  }
}
