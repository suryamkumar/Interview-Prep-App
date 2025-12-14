import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/extensions/navigation.dart';
import 'package:quiz_app/core/utils/extensions/styles.dart';
import 'package:quiz_app/core/utils/widget/toast.dart';

import '../../../presentaion/auth/view/login_page.dart';
import '../helper/secure_storage_helper.dart';

PreferredSizeWidget homeAppBarWidget({
  required BuildContext context,
  String? title,
  bool? centerTitle,
  bool? automaticallyImplyLeading,
  List<Widget>? actions,
}) =>
    AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      centerTitle: centerTitle ?? false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/images/app_logo.png"),
        ),
      ),
      title: Text(
        "Welcome Back,\nSuryam Kumar",
        style: context.titleMedium.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
            onPressed: () => _showLogoutDialog(context),
        ),
        ...?actions, // keep any extra actions passed
      ],
    );


void _showLogoutDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: "Logout",
    barrierColor: Colors.black.withOpacity(0.4),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: double.infinity, // 👈 full width
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.red.withOpacity(0.1),
                    child: const Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Confirm Logout",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Are you sure you want to logout from this account?",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            await SecureStorageHelper.deleteAll();

                            Navigator.pop(context); // close dialog

                            showCustomSnackBar(
                              context,
                              message: "Logged out successfully.",
                            );

                            context.pushAndRemoveUntil(
                              page: LoginPage(),
                            );
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },

    // 👇 Bottom → Top animation
    transitionBuilder: (_, animation, __, child) {
      final tween = Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeOut));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


