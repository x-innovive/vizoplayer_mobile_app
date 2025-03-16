import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_values.dart';
import '../../business/entity/server.dart';

class ServerTile extends StatelessWidget {
  final Server server;
  final Function(Server server)? onEdit;
  final Function(Server server)? onDelete;
  final Function(Server server)? onView;

  const ServerTile({
    super.key,
    required this.server,
    this.onEdit,
    this.onDelete,
    this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: AppValues.paddingNormal,
        vertical: AppValues.paddingNormal + 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.filledColor,
        borderRadius: BorderRadius.circular(AppValues.borderRadiusSmall),
        border: Border.all(
          width: 1,
          color: AppColors.borderColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  server.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: AppValues.fontLarge,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  server.ip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: AppValues.fontNormal,
                    color: AppColors.subtitleColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkResponse(
                onTap: () {
                  onEdit?.call(server);
                },
                child: Image.asset('assets/icons/basic_icons/edit.png'),
              ),
              const SizedBox(width: AppValues.paddingNormal),
              InkResponse(
                onTap: () {
                  onEdit?.call(server);
                },
                child: Image.asset('assets/icons/basic_icons/eye.png'),
              ),
              const SizedBox(width: AppValues.paddingNormal),
              InkResponse(
                onTap: () {
                  onEdit?.call(server);
                },
                child: Image.asset('assets/icons/basic_icons/trash.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
