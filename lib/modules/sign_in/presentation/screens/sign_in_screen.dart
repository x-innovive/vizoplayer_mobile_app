import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vizoplayer/infrastructure/navigation/app_nav.dart';
import 'package:vizoplayer/infrastructure/navigation/route_names.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/buttons/red_button.dart';
import '../../../../core/widgets/texts/app_text_field.dart';
import '../providers/sign_in_providers.dart';

import '../../../../core/widgets/texts/note_text.dart';
import '../widgets/signin_screen_background.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SignInScreenBackground(
        title: "Sign In",
        padding: AppValues.paddingNormal,
        onBackPress: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppValues.paddingNormal,
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const AppTextField(
                  hint: 'Source Name',
                  maxLines: 1,
                ),
                const SizedBox(height: 12),
                const AppTextField(
                  hint: 'Server IP',
                  maxLines: 1,
                ),
                const SizedBox(height: 12),
                const AppTextField(
                  hint: 'Username',
                  maxLines: 1,
                ),
                const SizedBox(height: 12),
                Consumer(
                  builder: (context, ref, _) {
                    final passWordVisible = ref.watch(passwordVisibleProvider);

                    return AppTextField(
                      hint: 'Password',
                      maxLines: 1,
                      obscureText: !passWordVisible,
                      suffixIcon: InkResponse(
                        onTap: () {
                          ref.read(passwordVisibleProvider.notifier).state = !passWordVisible;
                        },
                        child: Image.asset(
                          passWordVisible == true ? 'assets/icons/basic_icons/eye_close.png': 'assets/icons/basic_icons/eye.png',
                          height: 18,
                          width: 18,
                        ),
                      ),
                    );
                  }
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: RedButton(
                    title: 'Sign In',
                    onTap: () {
                      AppNav.goRouter.push(RouteNames.serverListScreen);
                    },
                  ),
                ),
                const SizedBox(height: AppValues.paddingLarge),
                const NoteText(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
