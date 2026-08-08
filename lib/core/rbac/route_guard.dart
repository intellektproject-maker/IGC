import 'package:flutter/material.dart';

import 'permission.dart';
import 'permission_service.dart';

class RouteGuard {
  RouteGuard._();

  static bool canAccess({
    required PermissionService permissionService,
    required Permission permission,
  }) {
    return permissionService.hasPermission(permission);
  }

  static Widget protect({
    required PermissionService permissionService,
    required Permission permission,
    required Widget page,
    Widget? accessDeniedPage,
  }) {
    if (permissionService.hasPermission(permission)) {
      return page;
    }

    return accessDeniedPage ??
        const Scaffold(
          body: Center(
            child: Text(
              "Access Denied",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
  }
}