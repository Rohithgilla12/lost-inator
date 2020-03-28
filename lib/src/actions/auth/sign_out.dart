// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

part of auth_actions;

abstract class SignOut //
    implements
        Built<SignOut, SignOutBuilder>,
        AuthAction //
{
  factory SignOut() = _$SignOut;

  SignOut._();
}

abstract class SignOutSuccessful //
    implements
        Built<SignOutSuccessful, SignOutSuccessfulBuilder>,
        AuthAction //
{
  factory SignOutSuccessful() = _$SignOutSuccessful;

  SignOutSuccessful._();
}

abstract class SignOutError //
    implements
        Built<SignOutError, SignOutErrorBuilder>,
        AuthAction,
        ErrorAction //
{
  factory SignOutError(Object error) {
    return _$SignOutError((SignOutErrorBuilder b) => b.error = error);
  }

  SignOutError._();

  @override
  Object get error;
}
