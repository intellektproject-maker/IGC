import '../../../core/enums/account_status.dart';
import '../../../core/enums/user_role.dart';
import '../../../shared/models/user_model.dart';

class MockUser {
  final UserModel user;
  final String password;

  const MockUser({
    required this.user,
    required this.password,
  });
}

class AuthMockData {
  AuthMockData._();

  static final List<MockUser> users = [
    MockUser(
      user: UserModel(
        id: '1',
        businessCode: 'STD-01',
        fullName: 'Arun Kumar',
        email: 'student@igc.com',
        phone: '9876543210',
        role: UserRole.student,
        accountStatus: AccountStatus.active,
        emailVerified: true,
        profileImage: null,
        createdAt: DateTime.now(),
      ),
      password: '123456',
    ),
    MockUser(
      user: UserModel(
        id: '2',
        businessCode: 'PRD-2026-000001',
        fullName: 'Dr. Meera Krishnan',
        email: 'prodigy@igc.com',
        phone: '9876543211',
        role: UserRole.prodigy,
        accountStatus: AccountStatus.active,
        emailVerified: true,
        profileImage: null,
        createdAt: DateTime.now(),
      ),
      password: '123456',
    ),
    MockUser(
      user: UserModel(
        id: '3',
        businessCode: 'IND-2026-000001',
        fullName: 'Rahul Sharma',
        email: 'industry@igc.com',
        phone: '9876543212',
        role: UserRole.industry,
        accountStatus: AccountStatus.active,
        emailVerified: true,
        profileImage: null,
        createdAt: DateTime.now(),
      ),
      password: '123456',
    ),
    MockUser(
      user: UserModel(
        id: '4',
        businessCode: 'COL-2026-000001',
        fullName: 'Anna University',
        email: 'college@igc.com',
        phone: '9876543213',
        role: UserRole.college,
        accountStatus: AccountStatus.active,
        emailVerified: true,
        profileImage: null,
        createdAt: DateTime.now(),
      ),
      password: '123456',
    ),
    MockUser(
      user: UserModel(
        id: '5',
        businessCode: 'ADM-2026-000001',
        fullName: 'Super Admin',
        email: 'admin@igc.com',
        phone: '9876543214',
        role: UserRole.admin,
        accountStatus: AccountStatus.active,
        emailVerified: true,
        profileImage: null,
        createdAt: DateTime.now(),
      ),
      password: '123456',
    ),
  ];
}