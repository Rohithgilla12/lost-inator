// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

part of auth_actions;

abstract class SignUp //
    implements
        Built<SignUp, SignUpBuilder>,
        AuthAction //
{
  factory SignUp({
    @required String name,
    @required String email,
    @required String password,
    @required ActionResponse response,
  }) {
    return _$SignUp((SignUpBuilder b) {
      b
        ..name = name
        ..email = email
        ..password = password
        ..response = response;
    });
  }

  SignUp._();

  String get name;

  String get email;

  String get password;

  @BuiltValueField(compare: false)
  ActionResponse get response;
}

abstract class SignUpSuccessful //
    implements
        Built<SignUpSuccessful, SignUpSuccessfulBuilder>,
        UserAction,
        AuthAction //
{
  factory SignUpSuccessful(User user) {
    return _$SignUpSuccessful((SignUpSuccessfulBuilder b) {
      b.user = user.toBuilder();
    });
  }

  SignUpSuccessful._();

  @override
  User get user;
}

abstract class SignUpError //
    implements
        Built<SignUpError, SignUpErrorBuilder>,
        AuthAction,
        ErrorAction //
{
  factory SignUpError(Object error) {
    return _$SignUpError((SignUpErrorBuilder b) => b.error = error);
  }

  SignUpError._();

  @override
  Object get error;
}
