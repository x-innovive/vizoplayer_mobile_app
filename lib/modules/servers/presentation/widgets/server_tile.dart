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
      padding: const EdgeInsets.only(
        left: AppValues.paddingNormal,
        right: AppValues.paddingSmall,
        top: AppValues.paddingNormal,
        bottom: AppValues.paddingNormal,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  color: Colors.transparent,
                  child: InkResponse(
                    onTap: () {
                      onEdit?.call(server);
                    },
                    child: Image.asset('assets/icons/basic_icons/edit.png'),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkResponse(
                  onTap: () {
                    onView?.call(server);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppValues.paddingSmall),
                    child: Image.asset('assets/icons/basic_icons/eye.png'),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkResponse(
                  onTap: () {
                    onDelete?.call(server);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppValues.paddingSmall),
                    child: Image.asset('assets/icons/basic_icons/trash.png'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
