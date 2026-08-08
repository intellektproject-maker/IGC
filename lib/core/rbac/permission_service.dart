import 'permission.dart';
import 'role.dart';
import 'role_permissions.dart';

class PermissionService {
  final StudentRole role;

  PermissionService(this.role);

  /// Returns all permissions of the current role
  Set<Permission> get permissions =>
      RolePermissions.getPermissions(role);

  /// Check a single permission
  bool hasPermission(Permission permission) {
    return permissions.contains(permission);
  }

  /// Check if the user has ALL permissions
  bool hasAll(List<Permission> requiredPermissions) {
    return requiredPermissions.every(
      permissions.contains,
    );
  }

  /// Check if the user has ANY permission
  bool hasAny(List<Permission> requiredPermissions) {
    return requiredPermissions.any(
      permissions.contains,
    );
  }

  /// Total number of permissions
  int get permissionCount => permissions.length;

  /// Permission list
  List<Permission> get permissionList =>
      permissions.toList();
}