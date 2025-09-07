import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_expenses/core/ui/resources/app_colors.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showGreeting;
  final String userName;
  final String? avatarAsset;
  final int notifications;

  const TopBar({
    super.key,
    this.title,
    this.showGreeting = false,
    this.userName = '',
    this.avatarAsset,
    this.notifications = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = theme.colorScheme.onSurface;

    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      leading: GoRouter.of(context).canPop()
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: fg),
              onPressed: () => context.pop(),
            )
          : null,
      title: showGreeting
          ? Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor:
                      theme.colorScheme.primary.withValues(alpha: 0.1),
                  backgroundImage:
                      avatarAsset != null ? AssetImage(avatarAsset!) : null,
                  child: avatarAsset == null
                      ? Icon(Icons.person, color: fg)
                      : null,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Buenas noches,',
                          style: TextStyle(
                            color: fg.withValues(alpha: 0.8),
                            fontWeight: FontWeight.w400,
                          )),
                      Text(userName,
                          style: TextStyle(
                            color: fg,
                            fontWeight: FontWeight.w800,
                          )),
                    ],
                  ),
                ),
              ],
            )
          : (title != null
              ? Text(title!, style: TextStyle(color: fg))
              : null),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () => _showNotifications(context),
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.notifications_none_rounded, color: fg),
              if (notifications > 0)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      notifications.toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  void _showNotifications(BuildContext context) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        final hasItems = notifications > 0;
        if (!hasItems) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Notifications',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(height: 16),
                Icon(Icons.notifications_none_rounded,
                    size: 40, color: theme.colorScheme.onSurface.withAlpha(140)),
                const SizedBox(height: 8),
                Text('No new notifications',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withAlpha(180),
                    )),
                const SizedBox(height: 8),
              ],
            ),
          );
        }

        // Simple, minimal list when there are notifications
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Notifications',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: notifications,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: theme.dividerColor,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                    leading: Icon(Icons.notifications,
                        color: theme.colorScheme.primary),
                    title: Text('Notification ${index + 1}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                    subtitle: Text('Tap to view details',
                        style: theme.textTheme.bodySmall),
                    onTap: () => Navigator.of(context).maybePop(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
