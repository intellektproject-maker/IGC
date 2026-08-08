import 'package:flutter/material.dart';

import 'permission.dart';
import 'permission_service.dart';

class PermissionGuard extends StatelessWidget {
  final PermissionService permissionService;

  final Permission? permission;

  final List<Permission>? anyPermissions;

  final List<Permission>? allPermissions;

  final Widget child;

  final Widget? fallback;

  const PermissionGuard({
    super.key,
    required this.permissionService,
    required this.child,
    this.permission,
    this.anyPermissions,
    this.allPermissions,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    bool allowed = true;

    if (permission != null) {
      allowed = permissionService.hasPermission(permission!);
    }

    if (anyPermissions != null) {
      allowed = permissionService.hasAny(anyPermissions!);
    }

    if (allPermissions != null) {
      allowed = permissionService.hasAll(allPermissions!);
    }

    if (allowed) {
      return child;
    }

    return fallback ?? const SizedBox.shrink();
  }
}