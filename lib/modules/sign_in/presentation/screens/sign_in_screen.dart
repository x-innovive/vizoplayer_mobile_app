import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vizoplayer/core/resources/app_values.dart';
import 'package:vizoplayer/core/widgets/buttons/red_button.dart';
import 'package:vizoplayer/core/widgets/texts/app_text_field.dart';
import 'package:vizoplayer/modules/sign_in/presentation/widgets/signin_screen_background.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/widgets/texts/note_text.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreenBackground(
        title: "Sign In",
        padding: AppValues.paddingNormal,
        onBackPress: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppValues.paddingNormal,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const AppTextField(hint: 'Source Name'),
                const SizedBox(height: 12),
                const AppTextField(hint: 'Server IP'),
                const SizedBox(height: 12),
                const AppTextField(hint: 'Username'),
                const SizedBox(height: 12),
                const AppTextField(hint: 'Password'),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: RedButton(
                    title: 'Sign In',
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: AppValues.paddingLarge),
                const NoteText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
