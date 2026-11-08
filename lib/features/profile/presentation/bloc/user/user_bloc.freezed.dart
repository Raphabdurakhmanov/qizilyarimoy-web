// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent()';
}


}

/// @nodoc
class $UserEventCopyWith<$Res>  {
$UserEventCopyWith(UserEvent _, $Res Function(UserEvent) __);
}


/// Adds pattern-matching-related methods to [UserEvent].
extension UserEventPatterns on UserEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChangePasswordEvent value)?  changePassword,TResult Function( _LogoutEvent value)?  logout,TResult Function( _UpdateProfileEvent value)?  updateProfile,TResult Function( _GetProfileEvent value)?  getProfile,TResult Function( _ChangedAvatarEvent value)?  changeAvatar,TResult Function( _DeleteAccountEvent value)?  deleteAccount,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangePasswordEvent() when changePassword != null:
return changePassword(_that);case _LogoutEvent() when logout != null:
return logout(_that);case _UpdateProfileEvent() when updateProfile != null:
return updateProfile(_that);case _GetProfileEvent() when getProfile != null:
return getProfile(_that);case _ChangedAvatarEvent() when changeAvatar != null:
return changeAvatar(_that);case _DeleteAccountEvent() when deleteAccount != null:
return deleteAccount(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChangePasswordEvent value)  changePassword,required TResult Function( _LogoutEvent value)  logout,required TResult Function( _UpdateProfileEvent value)  updateProfile,required TResult Function( _GetProfileEvent value)  getProfile,required TResult Function( _ChangedAvatarEvent value)  changeAvatar,required TResult Function( _DeleteAccountEvent value)  deleteAccount,}){
final _that = this;
switch (_that) {
case _ChangePasswordEvent():
return changePassword(_that);case _LogoutEvent():
return logout(_that);case _UpdateProfileEvent():
return updateProfile(_that);case _GetProfileEvent():
return getProfile(_that);case _ChangedAvatarEvent():
return changeAvatar(_that);case _DeleteAccountEvent():
return deleteAccount(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChangePasswordEvent value)?  changePassword,TResult? Function( _LogoutEvent value)?  logout,TResult? Function( _UpdateProfileEvent value)?  updateProfile,TResult? Function( _GetProfileEvent value)?  getProfile,TResult? Function( _ChangedAvatarEvent value)?  changeAvatar,TResult? Function( _DeleteAccountEvent value)?  deleteAccount,}){
final _that = this;
switch (_that) {
case _ChangePasswordEvent() when changePassword != null:
return changePassword(_that);case _LogoutEvent() when logout != null:
return logout(_that);case _UpdateProfileEvent() when updateProfile != null:
return updateProfile(_that);case _GetProfileEvent() when getProfile != null:
return getProfile(_that);case _ChangedAvatarEvent() when changeAvatar != null:
return changeAvatar(_that);case _DeleteAccountEvent() when deleteAccount != null:
return deleteAccount(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String oldPassword,  String newPassword)?  changePassword,TResult Function()?  logout,TResult Function( String? firstName,  String? lastName,  String? region)?  updateProfile,TResult Function()?  getProfile,TResult Function( String avatarPath)?  changeAvatar,TResult Function()?  deleteAccount,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangePasswordEvent() when changePassword != null:
return changePassword(_that.oldPassword,_that.newPassword);case _LogoutEvent() when logout != null:
return logout();case _UpdateProfileEvent() when updateProfile != null:
return updateProfile(_that.firstName,_that.lastName,_that.region);case _GetProfileEvent() when getProfile != null:
return getProfile();case _ChangedAvatarEvent() when changeAvatar != null:
return changeAvatar(_that.avatarPath);case _DeleteAccountEvent() when deleteAccount != null:
return deleteAccount();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String oldPassword,  String newPassword)  changePassword,required TResult Function()  logout,required TResult Function( String? firstName,  String? lastName,  String? region)  updateProfile,required TResult Function()  getProfile,required TResult Function( String avatarPath)  changeAvatar,required TResult Function()  deleteAccount,}) {final _that = this;
switch (_that) {
case _ChangePasswordEvent():
return changePassword(_that.oldPassword,_that.newPassword);case _LogoutEvent():
return logout();case _UpdateProfileEvent():
return updateProfile(_that.firstName,_that.lastName,_that.region);case _GetProfileEvent():
return getProfile();case _ChangedAvatarEvent():
return changeAvatar(_that.avatarPath);case _DeleteAccountEvent():
return deleteAccount();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String oldPassword,  String newPassword)?  changePassword,TResult? Function()?  logout,TResult? Function( String? firstName,  String? lastName,  String? region)?  updateProfile,TResult? Function()?  getProfile,TResult? Function( String avatarPath)?  changeAvatar,TResult? Function()?  deleteAccount,}) {final _that = this;
switch (_that) {
case _ChangePasswordEvent() when changePassword != null:
return changePassword(_that.oldPassword,_that.newPassword);case _LogoutEvent() when logout != null:
return logout();case _UpdateProfileEvent() when updateProfile != null:
return updateProfile(_that.firstName,_that.lastName,_that.region);case _GetProfileEvent() when getProfile != null:
return getProfile();case _ChangedAvatarEvent() when changeAvatar != null:
return changeAvatar(_that.avatarPath);case _DeleteAccountEvent() when deleteAccount != null:
return deleteAccount();case _:
  return null;

}
}

}

/// @nodoc


class _ChangePasswordEvent implements UserEvent {
  const _ChangePasswordEvent({required this.oldPassword, required this.newPassword});
  

 final  String oldPassword;
 final  String newPassword;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordEventCopyWith<_ChangePasswordEvent> get copyWith => __$ChangePasswordEventCopyWithImpl<_ChangePasswordEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePasswordEvent&&(identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,oldPassword,newPassword);

@override
String toString() {
  return 'UserEvent.changePassword(oldPassword: $oldPassword, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordEventCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory _$ChangePasswordEventCopyWith(_ChangePasswordEvent value, $Res Function(_ChangePasswordEvent) _then) = __$ChangePasswordEventCopyWithImpl;
@useResult
$Res call({
 String oldPassword, String newPassword
});




}
/// @nodoc
class __$ChangePasswordEventCopyWithImpl<$Res>
    implements _$ChangePasswordEventCopyWith<$Res> {
  __$ChangePasswordEventCopyWithImpl(this._self, this._then);

  final _ChangePasswordEvent _self;
  final $Res Function(_ChangePasswordEvent) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oldPassword = null,Object? newPassword = null,}) {
  return _then(_ChangePasswordEvent(
oldPassword: null == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LogoutEvent implements UserEvent {
  const _LogoutEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent.logout()';
}


}




/// @nodoc


class _UpdateProfileEvent implements UserEvent {
  const _UpdateProfileEvent({this.firstName, this.lastName, this.region});
  

 final  String? firstName;
 final  String? lastName;
 final  String? region;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileEventCopyWith<_UpdateProfileEvent> get copyWith => __$UpdateProfileEventCopyWithImpl<_UpdateProfileEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileEvent&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.region, region) || other.region == region));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,region);

@override
String toString() {
  return 'UserEvent.updateProfile(firstName: $firstName, lastName: $lastName, region: $region)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileEventCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory _$UpdateProfileEventCopyWith(_UpdateProfileEvent value, $Res Function(_UpdateProfileEvent) _then) = __$UpdateProfileEventCopyWithImpl;
@useResult
$Res call({
 String? firstName, String? lastName, String? region
});




}
/// @nodoc
class __$UpdateProfileEventCopyWithImpl<$Res>
    implements _$UpdateProfileEventCopyWith<$Res> {
  __$UpdateProfileEventCopyWithImpl(this._self, this._then);

  final _UpdateProfileEvent _self;
  final $Res Function(_UpdateProfileEvent) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? region = freezed,}) {
  return _then(_UpdateProfileEvent(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _GetProfileEvent implements UserEvent {
  const _GetProfileEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent.getProfile()';
}


}




/// @nodoc


class _ChangedAvatarEvent implements UserEvent {
  const _ChangedAvatarEvent({required this.avatarPath});
  

 final  String avatarPath;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangedAvatarEventCopyWith<_ChangedAvatarEvent> get copyWith => __$ChangedAvatarEventCopyWithImpl<_ChangedAvatarEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangedAvatarEvent&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath));
}


@override
int get hashCode => Object.hash(runtimeType,avatarPath);

@override
String toString() {
  return 'UserEvent.changeAvatar(avatarPath: $avatarPath)';
}


}

/// @nodoc
abstract mixin class _$ChangedAvatarEventCopyWith<$Res> implements $UserEventCopyWith<$Res> {
  factory _$ChangedAvatarEventCopyWith(_ChangedAvatarEvent value, $Res Function(_ChangedAvatarEvent) _then) = __$ChangedAvatarEventCopyWithImpl;
@useResult
$Res call({
 String avatarPath
});




}
/// @nodoc
class __$ChangedAvatarEventCopyWithImpl<$Res>
    implements _$ChangedAvatarEventCopyWith<$Res> {
  __$ChangedAvatarEventCopyWithImpl(this._self, this._then);

  final _ChangedAvatarEvent _self;
  final $Res Function(_ChangedAvatarEvent) _then;

/// Create a copy of UserEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? avatarPath = null,}) {
  return _then(_ChangedAvatarEvent(
avatarPath: null == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteAccountEvent implements UserEvent {
  const _DeleteAccountEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteAccountEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserEvent.deleteAccount()';
}


}




/// @nodoc
mixin _$UserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState()';
}


}

/// @nodoc
class $UserStateCopyWith<$Res>  {
$UserStateCopyWith(UserState _, $Res Function(UserState) __);
}


/// Adds pattern-matching-related methods to [UserState].
extension UserStatePatterns on UserState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _ChangedPassword value)?  changedPassword,TResult Function( _GotProfile value)?  gotProfile,TResult Function( _Logout value)?  logout,TResult Function( _UpdatedProfile value)?  updatedProfile,TResult Function( _ErrorState value)?  error,TResult Function( _ChangedAvatar value)?  changedAvatar,TResult Function( _DeletedAccount value)?  deletedAccount,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _ChangedPassword() when changedPassword != null:
return changedPassword(_that);case _GotProfile() when gotProfile != null:
return gotProfile(_that);case _Logout() when logout != null:
return logout(_that);case _UpdatedProfile() when updatedProfile != null:
return updatedProfile(_that);case _ErrorState() when error != null:
return error(_that);case _ChangedAvatar() when changedAvatar != null:
return changedAvatar(_that);case _DeletedAccount() when deletedAccount != null:
return deletedAccount(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _ChangedPassword value)  changedPassword,required TResult Function( _GotProfile value)  gotProfile,required TResult Function( _Logout value)  logout,required TResult Function( _UpdatedProfile value)  updatedProfile,required TResult Function( _ErrorState value)  error,required TResult Function( _ChangedAvatar value)  changedAvatar,required TResult Function( _DeletedAccount value)  deletedAccount,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _ChangedPassword():
return changedPassword(_that);case _GotProfile():
return gotProfile(_that);case _Logout():
return logout(_that);case _UpdatedProfile():
return updatedProfile(_that);case _ErrorState():
return error(_that);case _ChangedAvatar():
return changedAvatar(_that);case _DeletedAccount():
return deletedAccount(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _ChangedPassword value)?  changedPassword,TResult? Function( _GotProfile value)?  gotProfile,TResult? Function( _Logout value)?  logout,TResult? Function( _UpdatedProfile value)?  updatedProfile,TResult? Function( _ErrorState value)?  error,TResult? Function( _ChangedAvatar value)?  changedAvatar,TResult? Function( _DeletedAccount value)?  deletedAccount,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _ChangedPassword() when changedPassword != null:
return changedPassword(_that);case _GotProfile() when gotProfile != null:
return gotProfile(_that);case _Logout() when logout != null:
return logout(_that);case _UpdatedProfile() when updatedProfile != null:
return updatedProfile(_that);case _ErrorState() when error != null:
return error(_that);case _ChangedAvatar() when changedAvatar != null:
return changedAvatar(_that);case _DeletedAccount() when deletedAccount != null:
return deletedAccount(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  changedPassword,TResult Function( ProfileEntity profile)?  gotProfile,TResult Function()?  logout,TResult Function()?  updatedProfile,TResult Function( Failure failure)?  error,TResult Function( String avatarLink)?  changedAvatar,TResult Function()?  deletedAccount,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _ChangedPassword() when changedPassword != null:
return changedPassword();case _GotProfile() when gotProfile != null:
return gotProfile(_that.profile);case _Logout() when logout != null:
return logout();case _UpdatedProfile() when updatedProfile != null:
return updatedProfile();case _ErrorState() when error != null:
return error(_that.failure);case _ChangedAvatar() when changedAvatar != null:
return changedAvatar(_that.avatarLink);case _DeletedAccount() when deletedAccount != null:
return deletedAccount();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  changedPassword,required TResult Function( ProfileEntity profile)  gotProfile,required TResult Function()  logout,required TResult Function()  updatedProfile,required TResult Function( Failure failure)  error,required TResult Function( String avatarLink)  changedAvatar,required TResult Function()  deletedAccount,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _ChangedPassword():
return changedPassword();case _GotProfile():
return gotProfile(_that.profile);case _Logout():
return logout();case _UpdatedProfile():
return updatedProfile();case _ErrorState():
return error(_that.failure);case _ChangedAvatar():
return changedAvatar(_that.avatarLink);case _DeletedAccount():
return deletedAccount();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  changedPassword,TResult? Function( ProfileEntity profile)?  gotProfile,TResult? Function()?  logout,TResult? Function()?  updatedProfile,TResult? Function( Failure failure)?  error,TResult? Function( String avatarLink)?  changedAvatar,TResult? Function()?  deletedAccount,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _ChangedPassword() when changedPassword != null:
return changedPassword();case _GotProfile() when gotProfile != null:
return gotProfile(_that.profile);case _Logout() when logout != null:
return logout();case _UpdatedProfile() when updatedProfile != null:
return updatedProfile();case _ErrorState() when error != null:
return error(_that.failure);case _ChangedAvatar() when changedAvatar != null:
return changedAvatar(_that.avatarLink);case _DeletedAccount() when deletedAccount != null:
return deletedAccount();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UserState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.initial()';
}


}




/// @nodoc


class _Loading implements UserState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.loading()';
}


}




/// @nodoc


class _ChangedPassword implements UserState {
  const _ChangedPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangedPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.changedPassword()';
}


}




/// @nodoc


class _GotProfile implements UserState {
  const _GotProfile(this.profile);
  

 final  ProfileEntity profile;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GotProfileCopyWith<_GotProfile> get copyWith => __$GotProfileCopyWithImpl<_GotProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GotProfile&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'UserState.gotProfile(profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$GotProfileCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$GotProfileCopyWith(_GotProfile value, $Res Function(_GotProfile) _then) = __$GotProfileCopyWithImpl;
@useResult
$Res call({
 ProfileEntity profile
});




}
/// @nodoc
class __$GotProfileCopyWithImpl<$Res>
    implements _$GotProfileCopyWith<$Res> {
  __$GotProfileCopyWithImpl(this._self, this._then);

  final _GotProfile _self;
  final $Res Function(_GotProfile) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(_GotProfile(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,
  ));
}


}

/// @nodoc


class _Logout implements UserState {
  const _Logout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.logout()';
}


}




/// @nodoc


class _UpdatedProfile implements UserState {
  const _UpdatedProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatedProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.updatedProfile()';
}


}




/// @nodoc


class _ErrorState implements UserState {
  const _ErrorState({required this.failure});
  

 final  Failure failure;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorStateCopyWith<_ErrorState> get copyWith => __$ErrorStateCopyWithImpl<_ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorState&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'UserState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$ErrorStateCopyWith(_ErrorState value, $Res Function(_ErrorState) _then) = __$ErrorStateCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$ErrorStateCopyWithImpl<$Res>
    implements _$ErrorStateCopyWith<$Res> {
  __$ErrorStateCopyWithImpl(this._self, this._then);

  final _ErrorState _self;
  final $Res Function(_ErrorState) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_ErrorState(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class _ChangedAvatar implements UserState {
  const _ChangedAvatar({required this.avatarLink});
  

 final  String avatarLink;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangedAvatarCopyWith<_ChangedAvatar> get copyWith => __$ChangedAvatarCopyWithImpl<_ChangedAvatar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangedAvatar&&(identical(other.avatarLink, avatarLink) || other.avatarLink == avatarLink));
}


@override
int get hashCode => Object.hash(runtimeType,avatarLink);

@override
String toString() {
  return 'UserState.changedAvatar(avatarLink: $avatarLink)';
}


}

/// @nodoc
abstract mixin class _$ChangedAvatarCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$ChangedAvatarCopyWith(_ChangedAvatar value, $Res Function(_ChangedAvatar) _then) = __$ChangedAvatarCopyWithImpl;
@useResult
$Res call({
 String avatarLink
});




}
/// @nodoc
class __$ChangedAvatarCopyWithImpl<$Res>
    implements _$ChangedAvatarCopyWith<$Res> {
  __$ChangedAvatarCopyWithImpl(this._self, this._then);

  final _ChangedAvatar _self;
  final $Res Function(_ChangedAvatar) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? avatarLink = null,}) {
  return _then(_ChangedAvatar(
avatarLink: null == avatarLink ? _self.avatarLink : avatarLink // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeletedAccount implements UserState {
  const _DeletedAccount();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletedAccount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.deletedAccount()';
}


}




// dart format on
