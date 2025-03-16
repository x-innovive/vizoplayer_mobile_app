import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/app_values.dart';
import '../../../../core/widgets/buttons/red_button.dart';
import '../../../../core/widgets/dialogs/dialogs.dart';
import '../../../../core/widgets/texts/note_text.dart';
import '../../../../infrastructure/navigation/app_nav.dart';
import '../../../../infrastructure/navigation/route_names.dart';
import '../../../sign_in/presentation/widgets/signin_screen_background.dart';
import '../../business/entity/server.dart';
import '../widgets/server_tile.dart';

class ServerListScreen extends ConsumerStatefulWidget {
  const ServerListScreen({super.key});

  @override
  ConsumerState createState() => _ServerListScreenState();
}

class _ServerListScreenState extends ConsumerState<ServerListScreen> {
  @override
  Widget build(BuildContext context) {
    final servers = [
      Server(name: 'NovaCore', ip: '11.343.0.22', userName: 'shaiful01', password: '123456'),
      Server(name: 'Asgard', ip: '11.343.0.22', userName: 'shaiful01', password: '123456'),
      Server(name: 'Atlantis', ip: '11.343.0.22', userName: 'shaiful01', password: '123456'),
      Server(name: 'Lestrygon', ip: '11.343.0.22', userName: 'shaiful01', password: '123456'),
    ];

    return Scaffold(
      body: SignInScreenBackground(
        title: "Server List",
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
                ListView.builder(
                  itemCount: servers.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ServerTile(
                      server: servers[index],
                      onEdit: (server) {
                        AppNav.goRouter.push(RouteNames.editServerScreen, extra: server);
                      },
                      onDelete: (server) async {
                        final confirmed = await showConfirmationDialog(
                          context: context,
                          message: 'Delete your ${server.name} server askjrf shrgfjvdsf dsjghvkds gvdslghvds vdsjbij',
                        );
                        log(confirmed.toString());
                      },
                      onView: (server) {},
                    );
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: RedButton(
                    title: 'Add New Server',
                    onTap: () {
                      AppNav.goRouter.push(RouteNames.addServerScreen);
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
