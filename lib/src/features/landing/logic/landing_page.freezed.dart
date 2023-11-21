// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'landing_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LandingPage {
  String get title => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String name, String workingPosition)
        opening,
    required TResult Function(String title, String body) aboutMe,
    required TResult Function(String title, List<ContactItem> contacts)
        contacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String name, String workingPosition)?
        opening,
    TResult? Function(String title, String body)? aboutMe,
    TResult? Function(String title, List<ContactItem> contacts)? contacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String name, String workingPosition)?
        opening,
    TResult Function(String title, String body)? aboutMe,
    TResult Function(String title, List<ContactItem> contacts)? contacts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OpeningLandingPage value) opening,
    required TResult Function(AboutMeLandingPage value) aboutMe,
    required TResult Function(ContactsLandingPage value) contacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OpeningLandingPage value)? opening,
    TResult? Function(AboutMeLandingPage value)? aboutMe,
    TResult? Function(ContactsLandingPage value)? contacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpeningLandingPage value)? opening,
    TResult Function(AboutMeLandingPage value)? aboutMe,
    TResult Function(ContactsLandingPage value)? contacts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LandingPageCopyWith<LandingPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LandingPageCopyWith<$Res> {
  factory $LandingPageCopyWith(
          LandingPage value, $Res Function(LandingPage) then) =
      _$LandingPageCopyWithImpl<$Res, LandingPage>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$LandingPageCopyWithImpl<$Res, $Val extends LandingPage>
    implements $LandingPageCopyWith<$Res> {
  _$LandingPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpeningLandingPageImplCopyWith<$Res>
    implements $LandingPageCopyWith<$Res> {
  factory _$$OpeningLandingPageImplCopyWith(_$OpeningLandingPageImpl value,
          $Res Function(_$OpeningLandingPageImpl) then) =
      __$$OpeningLandingPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String name, String workingPosition});
}

/// @nodoc
class __$$OpeningLandingPageImplCopyWithImpl<$Res>
    extends _$LandingPageCopyWithImpl<$Res, _$OpeningLandingPageImpl>
    implements _$$OpeningLandingPageImplCopyWith<$Res> {
  __$$OpeningLandingPageImplCopyWithImpl(_$OpeningLandingPageImpl _value,
      $Res Function(_$OpeningLandingPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? name = null,
    Object? workingPosition = null,
  }) {
    return _then(_$OpeningLandingPageImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workingPosition: null == workingPosition
          ? _value.workingPosition
          : workingPosition // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OpeningLandingPageImpl implements OpeningLandingPage {
  const _$OpeningLandingPageImpl(
      {required this.title, required this.name, required this.workingPosition});

  @override
  final String title;
  @override
  final String name;
  @override
  final String workingPosition;

  @override
  String toString() {
    return 'LandingPage.opening(title: $title, name: $name, workingPosition: $workingPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpeningLandingPageImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.workingPosition, workingPosition) ||
                other.workingPosition == workingPosition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, name, workingPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpeningLandingPageImplCopyWith<_$OpeningLandingPageImpl> get copyWith =>
      __$$OpeningLandingPageImplCopyWithImpl<_$OpeningLandingPageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String name, String workingPosition)
        opening,
    required TResult Function(String title, String body) aboutMe,
    required TResult Function(String title, List<ContactItem> contacts)
        contacts,
  }) {
    return opening(title, name, workingPosition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String name, String workingPosition)?
        opening,
    TResult? Function(String title, String body)? aboutMe,
    TResult? Function(String title, List<ContactItem> contacts)? contacts,
  }) {
    return opening?.call(title, name, workingPosition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String name, String workingPosition)?
        opening,
    TResult Function(String title, String body)? aboutMe,
    TResult Function(String title, List<ContactItem> contacts)? contacts,
    required TResult orElse(),
  }) {
    if (opening != null) {
      return opening(title, name, workingPosition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OpeningLandingPage value) opening,
    required TResult Function(AboutMeLandingPage value) aboutMe,
    required TResult Function(ContactsLandingPage value) contacts,
  }) {
    return opening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OpeningLandingPage value)? opening,
    TResult? Function(AboutMeLandingPage value)? aboutMe,
    TResult? Function(ContactsLandingPage value)? contacts,
  }) {
    return opening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpeningLandingPage value)? opening,
    TResult Function(AboutMeLandingPage value)? aboutMe,
    TResult Function(ContactsLandingPage value)? contacts,
    required TResult orElse(),
  }) {
    if (opening != null) {
      return opening(this);
    }
    return orElse();
  }
}

abstract class OpeningLandingPage implements LandingPage {
  const factory OpeningLandingPage(
      {required final String title,
      required final String name,
      required final String workingPosition}) = _$OpeningLandingPageImpl;

  @override
  String get title;
  String get name;
  String get workingPosition;
  @override
  @JsonKey(ignore: true)
  _$$OpeningLandingPageImplCopyWith<_$OpeningLandingPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AboutMeLandingPageImplCopyWith<$Res>
    implements $LandingPageCopyWith<$Res> {
  factory _$$AboutMeLandingPageImplCopyWith(_$AboutMeLandingPageImpl value,
          $Res Function(_$AboutMeLandingPageImpl) then) =
      __$$AboutMeLandingPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String body});
}

/// @nodoc
class __$$AboutMeLandingPageImplCopyWithImpl<$Res>
    extends _$LandingPageCopyWithImpl<$Res, _$AboutMeLandingPageImpl>
    implements _$$AboutMeLandingPageImplCopyWith<$Res> {
  __$$AboutMeLandingPageImplCopyWithImpl(_$AboutMeLandingPageImpl _value,
      $Res Function(_$AboutMeLandingPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_$AboutMeLandingPageImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AboutMeLandingPageImpl implements AboutMeLandingPage {
  const _$AboutMeLandingPageImpl({required this.title, required this.body});

  @override
  final String title;
  @override
  final String body;

  @override
  String toString() {
    return 'LandingPage.aboutMe(title: $title, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutMeLandingPageImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutMeLandingPageImplCopyWith<_$AboutMeLandingPageImpl> get copyWith =>
      __$$AboutMeLandingPageImplCopyWithImpl<_$AboutMeLandingPageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String name, String workingPosition)
        opening,
    required TResult Function(String title, String body) aboutMe,
    required TResult Function(String title, List<ContactItem> contacts)
        contacts,
  }) {
    return aboutMe(title, body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String name, String workingPosition)?
        opening,
    TResult? Function(String title, String body)? aboutMe,
    TResult? Function(String title, List<ContactItem> contacts)? contacts,
  }) {
    return aboutMe?.call(title, body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String name, String workingPosition)?
        opening,
    TResult Function(String title, String body)? aboutMe,
    TResult Function(String title, List<ContactItem> contacts)? contacts,
    required TResult orElse(),
  }) {
    if (aboutMe != null) {
      return aboutMe(title, body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OpeningLandingPage value) opening,
    required TResult Function(AboutMeLandingPage value) aboutMe,
    required TResult Function(ContactsLandingPage value) contacts,
  }) {
    return aboutMe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OpeningLandingPage value)? opening,
    TResult? Function(AboutMeLandingPage value)? aboutMe,
    TResult? Function(ContactsLandingPage value)? contacts,
  }) {
    return aboutMe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpeningLandingPage value)? opening,
    TResult Function(AboutMeLandingPage value)? aboutMe,
    TResult Function(ContactsLandingPage value)? contacts,
    required TResult orElse(),
  }) {
    if (aboutMe != null) {
      return aboutMe(this);
    }
    return orElse();
  }
}

abstract class AboutMeLandingPage implements LandingPage {
  const factory AboutMeLandingPage(
      {required final String title,
      required final String body}) = _$AboutMeLandingPageImpl;

  @override
  String get title;
  String get body;
  @override
  @JsonKey(ignore: true)
  _$$AboutMeLandingPageImplCopyWith<_$AboutMeLandingPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContactsLandingPageImplCopyWith<$Res>
    implements $LandingPageCopyWith<$Res> {
  factory _$$ContactsLandingPageImplCopyWith(_$ContactsLandingPageImpl value,
          $Res Function(_$ContactsLandingPageImpl) then) =
      __$$ContactsLandingPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<ContactItem> contacts});
}

/// @nodoc
class __$$ContactsLandingPageImplCopyWithImpl<$Res>
    extends _$LandingPageCopyWithImpl<$Res, _$ContactsLandingPageImpl>
    implements _$$ContactsLandingPageImplCopyWith<$Res> {
  __$$ContactsLandingPageImplCopyWithImpl(_$ContactsLandingPageImpl _value,
      $Res Function(_$ContactsLandingPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? contacts = null,
  }) {
    return _then(_$ContactsLandingPageImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ContactItem>,
    ));
  }
}

/// @nodoc

class _$ContactsLandingPageImpl implements ContactsLandingPage {
  const _$ContactsLandingPageImpl(
      {required this.title, required final List<ContactItem> contacts})
      : _contacts = contacts;

  @override
  final String title;
  final List<ContactItem> _contacts;
  @override
  List<ContactItem> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString() {
    return 'LandingPage.contacts(title: $title, contacts: $contacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactsLandingPageImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactsLandingPageImplCopyWith<_$ContactsLandingPageImpl> get copyWith =>
      __$$ContactsLandingPageImplCopyWithImpl<_$ContactsLandingPageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String name, String workingPosition)
        opening,
    required TResult Function(String title, String body) aboutMe,
    required TResult Function(String title, List<ContactItem> contacts)
        contacts,
  }) {
    return contacts(title, this.contacts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String name, String workingPosition)?
        opening,
    TResult? Function(String title, String body)? aboutMe,
    TResult? Function(String title, List<ContactItem> contacts)? contacts,
  }) {
    return contacts?.call(title, this.contacts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String name, String workingPosition)?
        opening,
    TResult Function(String title, String body)? aboutMe,
    TResult Function(String title, List<ContactItem> contacts)? contacts,
    required TResult orElse(),
  }) {
    if (contacts != null) {
      return contacts(title, this.contacts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OpeningLandingPage value) opening,
    required TResult Function(AboutMeLandingPage value) aboutMe,
    required TResult Function(ContactsLandingPage value) contacts,
  }) {
    return contacts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OpeningLandingPage value)? opening,
    TResult? Function(AboutMeLandingPage value)? aboutMe,
    TResult? Function(ContactsLandingPage value)? contacts,
  }) {
    return contacts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpeningLandingPage value)? opening,
    TResult Function(AboutMeLandingPage value)? aboutMe,
    TResult Function(ContactsLandingPage value)? contacts,
    required TResult orElse(),
  }) {
    if (contacts != null) {
      return contacts(this);
    }
    return orElse();
  }
}

abstract class ContactsLandingPage implements LandingPage {
  const factory ContactsLandingPage(
      {required final String title,
      required final List<ContactItem> contacts}) = _$ContactsLandingPageImpl;

  @override
  String get title;
  List<ContactItem> get contacts;
  @override
  @JsonKey(ignore: true)
  _$$ContactsLandingPageImplCopyWith<_$ContactsLandingPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
