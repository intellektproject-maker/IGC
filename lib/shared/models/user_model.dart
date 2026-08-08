import '../../core/enums/account_status.dart';
import '../../core/enums/user_role.dart';
import '../../core/rbac/role.dart';

class UserModel {
  final String id;
  final String businessCode;
  final String fullName;
  final String email;
  final String? phone;

  /// Main platform role
  final UserRole role;

  /// Student leadership role
  /// Ignored for Prodigy, Industry, College and Admin
  final StudentRole studentRole;

  final AccountStatus accountStatus;
  final bool emailVerified;
  final String? profileImage;
  final DateTime createdAt;
  final DateTime? lastLogin;

  const UserModel({
    required this.id,
    required this.businessCode,
    required this.fullName,
    required this.email,
    this.phone,
    required this.role,
    this.studentRole = StudentRole.student,
    required this.accountStatus,
    required this.emailVerified,
    this.profileImage,
    required this.createdAt,
    this.lastLogin,
  });

  UserModel copyWith({
    String? id,
    String? businessCode,
    String? fullName,
    String? email,
    String? phone,
    UserRole? role,
    StudentRole? studentRole,
    AccountStatus? accountStatus,
    bool? emailVerified,
    String? profileImage,
    DateTime? createdAt,
    DateTime? lastLogin,
  }) {
    return UserModel(
      id: id ?? this.id,
      businessCode: businessCode ?? this.businessCode,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      studentRole: studentRole ?? this.studentRole,
      accountStatus: accountStatus ?? this.accountStatus,
      emailVerified: emailVerified ?? this.emailVerified,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      businessCode: json['businessCode'],
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      role: UserRole.fromString(json['role']),
      studentRole: parseStudentRole(json['studentRole']),
      accountStatus: AccountStatus.fromString(json['accountStatus']),
      emailVerified: json['emailVerified'],
      profileImage: json['profileImage'],
      createdAt: DateTime.parse(json['createdAt']),
      lastLogin: json['lastLogin'] != null
          ? DateTime.parse(json['lastLogin'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessCode': businessCode,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'role': role.value,
      'studentRole': studentRole.apiValue,
      'accountStatus': accountStatus.value,
      'emailVerified': emailVerified,
      'profileImage': profileImage,
      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'UserModel('
        'businessCode: $businessCode, '
        'fullName: $fullName, '
        'role: ${role.value}, '
        'studentRole: ${studentRole.apiValue})';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}