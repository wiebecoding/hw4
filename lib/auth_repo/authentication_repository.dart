import '../../model/user.dart';

abstract class AuthenticationRepository {
  Future<User> signIn({required String email, required String password});
}

class FirebaseAuthenticationRepository extends AuthenticationRepository {
  Future<void> someFirebaseSpecificMethod() async {
    await Future.delayed(const Duration(seconds: 10), () {});
  }

  @override
  Future<User> signIn({required String email, required String password}) async {
    await someFirebaseSpecificMethod();
    return User.createMockUser();
  }
}