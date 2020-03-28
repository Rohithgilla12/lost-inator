// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_actions;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Bootstrap extends Bootstrap {
  factory _$Bootstrap([void Function(BootstrapBuilder) updates]) =>
      (new BootstrapBuilder()..update(updates)).build();

  _$Bootstrap._() : super._();

  @override
  Bootstrap rebuild(void Function(BootstrapBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BootstrapBuilder toBuilder() => new BootstrapBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bootstrap;
  }

  @override
  int get hashCode {
    return 459520341;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Bootstrap').toString();
  }
}

class BootstrapBuilder implements Builder<Bootstrap, BootstrapBuilder> {
  _$Bootstrap _$v;

  BootstrapBuilder();

  @override
  void replace(Bootstrap other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Bootstrap;
  }

  @override
  void update(void Function(BootstrapBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Bootstrap build() {
    final _$result = _$v ?? new _$Bootstrap._();
    replace(_$result);
    return _$result;
  }
}

class _$BootstrapSuccessful extends BootstrapSuccessful {
  @override
  final User user;

  factory _$BootstrapSuccessful(
          [void Function(BootstrapSuccessfulBuilder) updates]) =>
      (new BootstrapSuccessfulBuilder()..update(updates)).build();

  _$BootstrapSuccessful._({this.user}) : super._();

  @override
  BootstrapSuccessful rebuild(
          void Function(BootstrapSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BootstrapSuccessfulBuilder toBuilder() =>
      new BootstrapSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BootstrapSuccessful && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BootstrapSuccessful')
          ..add('user', user))
        .toString();
  }
}

class BootstrapSuccessfulBuilder
    implements Builder<BootstrapSuccessful, BootstrapSuccessfulBuilder> {
  _$BootstrapSuccessful _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  BootstrapSuccessfulBuilder();

  BootstrapSuccessfulBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BootstrapSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BootstrapSuccessful;
  }

  @override
  void update(void Function(BootstrapSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BootstrapSuccessful build() {
    _$BootstrapSuccessful _$result;
    try {
      _$result = _$v ?? new _$BootstrapSuccessful._(user: _user?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BootstrapSuccessful', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$BootstrapError extends BootstrapError {
  @override
  final Object error;

  factory _$BootstrapError([void Function(BootstrapErrorBuilder) updates]) =>
      (new BootstrapErrorBuilder()..update(updates)).build();

  _$BootstrapError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('BootstrapError', 'error');
    }
  }

  @override
  BootstrapError rebuild(void Function(BootstrapErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BootstrapErrorBuilder toBuilder() =>
      new BootstrapErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BootstrapError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BootstrapError')..add('error', error))
        .toString();
  }
}

class BootstrapErrorBuilder
    implements Builder<BootstrapError, BootstrapErrorBuilder> {
  _$BootstrapError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  BootstrapErrorBuilder();

  BootstrapErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BootstrapError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BootstrapError;
  }

  @override
  void update(void Function(BootstrapErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BootstrapError build() {
    final _$result = _$v ?? new _$BootstrapError._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$Login extends Login {
  @override
  final String email;
  @override
  final String password;
  @override
  final ActionResponse response;

  factory _$Login([void Function(LoginBuilder) updates]) =>
      (new LoginBuilder()..update(updates)).build();

  _$Login._({this.email, this.password, this.response}) : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('Login', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('Login', 'password');
    }
    if (response == null) {
      throw new BuiltValueNullFieldError('Login', 'response');
    }
  }

  @override
  Login rebuild(void Function(LoginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginBuilder toBuilder() => new LoginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Login && email == other.email && password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Login')
          ..add('email', email)
          ..add('password', password)
          ..add('response', response))
        .toString();
  }
}

class LoginBuilder implements Builder<Login, LoginBuilder> {
  _$Login _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  ActionResponse _response;
  ActionResponse get response => _$this._response;
  set response(ActionResponse response) => _$this._response = response;

  LoginBuilder();

  LoginBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _password = _$v.password;
      _response = _$v.response;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Login other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Login;
  }

  @override
  void update(void Function(LoginBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Login build() {
    final _$result = _$v ??
        new _$Login._(email: email, password: password, response: response);
    replace(_$result);
    return _$result;
  }
}

class _$LoginSuccessful extends LoginSuccessful {
  @override
  final User user;

  factory _$LoginSuccessful([void Function(LoginSuccessfulBuilder) updates]) =>
      (new LoginSuccessfulBuilder()..update(updates)).build();

  _$LoginSuccessful._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('LoginSuccessful', 'user');
    }
  }

  @override
  LoginSuccessful rebuild(void Function(LoginSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginSuccessfulBuilder toBuilder() =>
      new LoginSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginSuccessful && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginSuccessful')..add('user', user))
        .toString();
  }
}

class LoginSuccessfulBuilder
    implements Builder<LoginSuccessful, LoginSuccessfulBuilder> {
  _$LoginSuccessful _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  LoginSuccessfulBuilder();

  LoginSuccessfulBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginSuccessful;
  }

  @override
  void update(void Function(LoginSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginSuccessful build() {
    _$LoginSuccessful _$result;
    try {
      _$result = _$v ?? new _$LoginSuccessful._(user: user.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoginSuccessful', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LoginError extends LoginError {
  @override
  final Object error;

  factory _$LoginError([void Function(LoginErrorBuilder) updates]) =>
      (new LoginErrorBuilder()..update(updates)).build();

  _$LoginError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('LoginError', 'error');
    }
  }

  @override
  LoginError rebuild(void Function(LoginErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginErrorBuilder toBuilder() => new LoginErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginError')..add('error', error))
        .toString();
  }
}

class LoginErrorBuilder implements Builder<LoginError, LoginErrorBuilder> {
  _$LoginError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  LoginErrorBuilder();

  LoginErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginError;
  }

  @override
  void update(void Function(LoginErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginError build() {
    final _$result = _$v ?? new _$LoginError._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$SignOut extends SignOut {
  factory _$SignOut([void Function(SignOutBuilder) updates]) =>
      (new SignOutBuilder()..update(updates)).build();

  _$SignOut._() : super._();

  @override
  SignOut rebuild(void Function(SignOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignOutBuilder toBuilder() => new SignOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignOut;
  }

  @override
  int get hashCode {
    return 957153408;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SignOut').toString();
  }
}

class SignOutBuilder implements Builder<SignOut, SignOutBuilder> {
  _$SignOut _$v;

  SignOutBuilder();

  @override
  void replace(SignOut other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignOut;
  }

  @override
  void update(void Function(SignOutBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignOut build() {
    final _$result = _$v ?? new _$SignOut._();
    replace(_$result);
    return _$result;
  }
}

class _$SignOutSuccessful extends SignOutSuccessful {
  factory _$SignOutSuccessful(
          [void Function(SignOutSuccessfulBuilder) updates]) =>
      (new SignOutSuccessfulBuilder()..update(updates)).build();

  _$SignOutSuccessful._() : super._();

  @override
  SignOutSuccessful rebuild(void Function(SignOutSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignOutSuccessfulBuilder toBuilder() =>
      new SignOutSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignOutSuccessful;
  }

  @override
  int get hashCode {
    return 132189442;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SignOutSuccessful').toString();
  }
}

class SignOutSuccessfulBuilder
    implements Builder<SignOutSuccessful, SignOutSuccessfulBuilder> {
  _$SignOutSuccessful _$v;

  SignOutSuccessfulBuilder();

  @override
  void replace(SignOutSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignOutSuccessful;
  }

  @override
  void update(void Function(SignOutSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignOutSuccessful build() {
    final _$result = _$v ?? new _$SignOutSuccessful._();
    replace(_$result);
    return _$result;
  }
}

class _$SignOutError extends SignOutError {
  @override
  final Object error;

  factory _$SignOutError([void Function(SignOutErrorBuilder) updates]) =>
      (new SignOutErrorBuilder()..update(updates)).build();

  _$SignOutError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('SignOutError', 'error');
    }
  }

  @override
  SignOutError rebuild(void Function(SignOutErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignOutErrorBuilder toBuilder() => new SignOutErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignOutError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignOutError')..add('error', error))
        .toString();
  }
}

class SignOutErrorBuilder
    implements Builder<SignOutError, SignOutErrorBuilder> {
  _$SignOutError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  SignOutErrorBuilder();

  SignOutErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignOutError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignOutError;
  }

  @override
  void update(void Function(SignOutErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignOutError build() {
    final _$result = _$v ?? new _$SignOutError._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$SignUp extends SignUp {
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final ActionResponse response;

  factory _$SignUp([void Function(SignUpBuilder) updates]) =>
      (new SignUpBuilder()..update(updates)).build();

  _$SignUp._({this.name, this.email, this.password, this.response})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('SignUp', 'name');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('SignUp', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('SignUp', 'password');
    }
    if (response == null) {
      throw new BuiltValueNullFieldError('SignUp', 'response');
    }
  }

  @override
  SignUp rebuild(void Function(SignUpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpBuilder toBuilder() => new SignUpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUp &&
        name == other.name &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignUp')
          ..add('name', name)
          ..add('email', email)
          ..add('password', password)
          ..add('response', response))
        .toString();
  }
}

class SignUpBuilder implements Builder<SignUp, SignUpBuilder> {
  _$SignUp _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  ActionResponse _response;
  ActionResponse get response => _$this._response;
  set response(ActionResponse response) => _$this._response = response;

  SignUpBuilder();

  SignUpBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _email = _$v.email;
      _password = _$v.password;
      _response = _$v.response;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUp other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignUp;
  }

  @override
  void update(void Function(SignUpBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignUp build() {
    final _$result = _$v ??
        new _$SignUp._(
            name: name, email: email, password: password, response: response);
    replace(_$result);
    return _$result;
  }
}

class _$SignUpSuccessful extends SignUpSuccessful {
  @override
  final User user;

  factory _$SignUpSuccessful(
          [void Function(SignUpSuccessfulBuilder) updates]) =>
      (new SignUpSuccessfulBuilder()..update(updates)).build();

  _$SignUpSuccessful._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('SignUpSuccessful', 'user');
    }
  }

  @override
  SignUpSuccessful rebuild(void Function(SignUpSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpSuccessfulBuilder toBuilder() =>
      new SignUpSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpSuccessful && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignUpSuccessful')..add('user', user))
        .toString();
  }
}

class SignUpSuccessfulBuilder
    implements Builder<SignUpSuccessful, SignUpSuccessfulBuilder> {
  _$SignUpSuccessful _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  SignUpSuccessfulBuilder();

  SignUpSuccessfulBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignUpSuccessful;
  }

  @override
  void update(void Function(SignUpSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignUpSuccessful build() {
    _$SignUpSuccessful _$result;
    try {
      _$result = _$v ?? new _$SignUpSuccessful._(user: user.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SignUpSuccessful', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SignUpError extends SignUpError {
  @override
  final Object error;

  factory _$SignUpError([void Function(SignUpErrorBuilder) updates]) =>
      (new SignUpErrorBuilder()..update(updates)).build();

  _$SignUpError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('SignUpError', 'error');
    }
  }

  @override
  SignUpError rebuild(void Function(SignUpErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpErrorBuilder toBuilder() => new SignUpErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUpError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignUpError')..add('error', error))
        .toString();
  }
}

class SignUpErrorBuilder implements Builder<SignUpError, SignUpErrorBuilder> {
  _$SignUpError _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  SignUpErrorBuilder();

  SignUpErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUpError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignUpError;
  }

  @override
  void update(void Function(SignUpErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignUpError build() {
    final _$result = _$v ?? new _$SignUpError._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
