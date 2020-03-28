// File created by
// Lung Razvan <long1eu>
// on 28/03/2020

part of auth_actions;

abstract class Bootstrap //
    implements
        Built<Bootstrap, BootstrapBuilder>,
        AuthAction //
{
  factory Bootstrap([void Function(BootstrapBuilder b) updates]) = _$Bootstrap;

  Bootstrap._();
}

abstract class BootstrapSuccessful //
    implements
        Built<BootstrapSuccessful, BootstrapSuccessfulBuilder>,
        UserAction,
        AuthAction //
{
  factory BootstrapSuccessful(User user) {
    return _$BootstrapSuccessful((BootstrapSuccessfulBuilder b) {
      b.user = user?.toBuilder();
    });
  }

  BootstrapSuccessful._();

  @override
  @nullable
  User get user;
}

abstract class BootstrapError //
    implements
        Built<BootstrapError, BootstrapErrorBuilder>,
        AuthAction,
        ErrorAction //
{
  factory BootstrapError(Object error) {
    return _$BootstrapError((BootstrapErrorBuilder b) => b.error = error);
  }

  BootstrapError._();

  @override
  Object get error;
}
