import 'package:app_timekeeping/ui/core/resources/appscale/app_scale.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_timekeeping/ui/core/resources/appcolors/app_color.dart';
import 'package:app_timekeeping/ui/features/login/widget/form_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = AppScale.of(context); // ✅ lấy hệ số scale 1 dòng duy nhất
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.hexE3F2FD, AppColor.hexBBDEFB],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: FadeTransition(
            opacity: _fadeIn,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24 * s,
                  vertical: 80 * s,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50 * s),
                    Image.asset("assets/images/logo/logo.png", width: 120 * s),
                    SizedBox(height: 20 * s),
                    Text(
                      "Đăng nhập",
                      style: TextStyle(
                        color: AppColor.hex1A1C1E,
                        fontSize: 32 * s,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8 * s),
                    Text(
                      "Nhập số điện thoại và mật khẩu để tiếp tục",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14 * s,
                      ),
                    ),
                    SizedBox(height: 40 * s),
                    //Card chứa form
                    Container(
                      padding: EdgeInsets.all(24 * s),
                      decoration: BoxDecoration(
                        color: AppColor.backgroud,
                        borderRadius: BorderRadius.circular(24 * s),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.hex7A8A98,
                            blurRadius: 10 * s,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const FormLoginScreen(),
                          SizedBox(height: 30 * s),
                          //Nút Login có hiệu ứng nhấn
                          GestureDetector(
                            onTapDown: (_) => setState(() => _isPressed = true),
                            onTapUp: (_) => setState(() => _isPressed = false),
                            onTapCancel:
                                () => setState(() => _isPressed = false),
                            onTap: () => context.go('/bottom'),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.easeInOut,
                              height: 55 * s,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16 * s),
                                gradient: LinearGradient(
                                  colors:
                                      _isPressed
                                          ? [
                                            Color(0xB20363AF),
                                            AppColor.hexff0363af,
                                          ]
                                          : [
                                            AppColor.hexff0363af,
                                            AppColor.hexff0363af,
                                          ],
                                ),
                                boxShadow:
                                    _isPressed
                                        ? []
                                        : [
                                          BoxShadow(
                                            color: Color(0x660363AF),
                                            blurRadius: 8 * s,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: AppColor.hex0xffEDF1F3,
                                    fontSize: 20 * s,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
