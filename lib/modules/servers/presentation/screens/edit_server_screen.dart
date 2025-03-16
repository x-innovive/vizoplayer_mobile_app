import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/buttons/red_button.dart';
import '../../../../core/widgets/texts/app_text_field.dart';
import '../../../../core/widgets/texts/note_text.dart';
import '../../../sign_in/presentation/providers/sign_in_providers.dart';
import '../../../sign_in/presentation/widgets/signin_screen_background.dart';
import '../../business/entity/server.dart';

class EditServerScreen extends ConsumerStatefulWidget {
  final Server server;

  const EditServerScreen({super.key, required this.server});

  @override
  ConsumerState createState() => _EditServerScreenState();
}

class _EditServerScreenState extends ConsumerState<EditServerScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SignInScreenBackground(
        title: widget.server.name,
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
                AppTextField(
                  hint: 'Source Name',
                  maxLines: 1,
                  initialValue: widget.server.name,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  hint: 'Server IP',
                  maxLines: 1,
                  initialValue: widget.server.ip,
                ),
                const SizedBox(height: 12),
                AppTextField(
                  hint: 'Username',
                  maxLines: 1,
                  initialValue: widget.server.userName,
                ),
                const SizedBox(height: 12),
                Consumer(
                    builder: (context, ref, _) {
                      final passWordVisible = ref.watch(passwordVisibleProvider);

                      return AppTextField(
                        hint: 'Password',
                        maxLines: 1,
                        initialValue: widget.server.password,
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
                Row(
                  children: [
                    Expanded(
                      child: RedButton(
                        title: 'Cancel',
                        onTap: () {
                          // AppNav.goRouter.push(RouteNames.serverListScreen);
                          // AppNav.goRouter.pop();
                        },
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: RedButton(
                        title: 'Add Server',
                        onTap: () {
                          // AppNav.goRouter.push(RouteNames.serverListScreen);
                          // AppNav.goRouter.pop();
                        },
                      ),
                    ),
                  ],
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
