// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

part of auth_actions;

abstract class Login //
    implements
        Built<Login, LoginBuilder>,
        AuthAction //
{
  factory Login({
    @required String email,
    @required String password,
    @required ActionResponse response,
  }) {
    return _$Login((LoginBuilder b) {
      b
        ..email = email
        ..password = password
        ..response = response;
    });
  }

  Login._();

  String get email;

  String get password;

  @BuiltValueField(compare: false)
  ActionResponse get response;
}

abstract class LoginSuccessful //
    implements
        Built<LoginSuccessful, LoginSuccessfulBuilder>,
        UserAction,
        AuthAction //
{
  factory LoginSuccessful(User user) {
    return _$LoginSuccessful((LoginSuccessfulBuilder b) => b.user = user.toBuilder());
  }

  LoginSuccessful._();

  @override
  User get user;
}

abstract class LoginError //
    implements
        Built<LoginError, LoginErrorBuilder>,
        AuthAction,
        ErrorAction //
{
  factory LoginError(Object error) {
    return _$LoginError((LoginErrorBuilder b) => b.error = error);
  }

  LoginError._();

  @override
  Object get error;
}
