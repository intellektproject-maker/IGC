import 'permission.dart';
import 'permission_service.dart';
import 'role.dart';

extension StudentRolePermissionExtension on StudentRole {
  PermissionService get permissions =>
      PermissionService(this);

  bool can(Permission permission) {
    return permissions.hasPermission(permission);
  }

  bool canAny(List<Permission> permissionsList) {
    return permissions.hasAny(permissionsList);
  }

  bool canAll(List<Permission> permissionsList) {
    return permissions.hasAll(permissionsList);
  }
}