// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ErrorDetail {
  Object? get throwable => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? errorCode,
            String? message,
            String? traceId,
            DateTime? timestamp,
            Object? throwable,
            StackTrace? stackTrace)
        backend,
    required TResult Function(Object? throwable, StackTrace? stackTrace) fatal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorCode, String? message, String? traceId,
            DateTime? timestamp, Object? throwable, StackTrace? stackTrace)?
        backend,
    TResult? Function(Object? throwable, StackTrace? stackTrace)? fatal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorCode, String? message, String? traceId,
            DateTime? timestamp, Object? throwable, StackTrace? stackTrace)?
        backend,
    TResult Function(Object? throwable, StackTrace? stackTrace)? fatal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorDetailBackend value) backend,
    required TResult Function(ErrorDetailFatal value) fatal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorDetailBackend value)? backend,
    TResult? Function(ErrorDetailFatal value)? fatal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetailBackend value)? backend,
    TResult Function(ErrorDetailFatal value)? fatal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ErrorDetailCopyWith<ErrorDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDetailCopyWith<$Res> {
  factory $ErrorDetailCopyWith(
          ErrorDetail value, $Res Function(ErrorDetail) then) =
      _$ErrorDetailCopyWithImpl<$Res, ErrorDetail>;
  @useResult
  $Res call({Object? throwable, StackTrace? stackTrace});
}

/// @nodoc
class _$ErrorDetailCopyWithImpl<$Res, $Val extends ErrorDetail>
    implements $ErrorDetailCopyWith<$Res> {
  _$ErrorDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? throwable = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      throwable: freezed == throwable ? _value.throwable : throwable,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorDetailBackendImplCopyWith<$Res>
    implements $ErrorDetailCopyWith<$Res> {
  factory _$$ErrorDetailBackendImplCopyWith(_$ErrorDetailBackendImpl value,
          $Res Function(_$ErrorDetailBackendImpl) then) =
      __$$ErrorDetailBackendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorCode,
      String? message,
      String? traceId,
      DateTime? timestamp,
      Object? throwable,
      StackTrace? stackTrace});
}

/// @nodoc
class __$$ErrorDetailBackendImplCopyWithImpl<$Res>
    extends _$ErrorDetailCopyWithImpl<$Res, _$ErrorDetailBackendImpl>
    implements _$$ErrorDetailBackendImplCopyWith<$Res> {
  __$$ErrorDetailBackendImplCopyWithImpl(_$ErrorDetailBackendImpl _value,
      $Res Function(_$ErrorDetailBackendImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorCode = freezed,
    Object? message = freezed,
    Object? traceId = freezed,
    Object? timestamp = freezed,
    Object? throwable = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ErrorDetailBackendImpl(
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      traceId: freezed == traceId
          ? _value.traceId
          : traceId // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      throwable: freezed == throwable ? _value.throwable : throwable,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ErrorDetailBackendImpl implements ErrorDetailBackend {
  const _$ErrorDetailBackendImpl(
      {this.errorCode,
      this.message,
      this.traceId,
      this.timestamp,
      this.throwable,
      this.stackTrace});

  @override
  final String? errorCode;
  @override
  final String? message;
  @override
  final String? traceId;
  @override
  final DateTime? timestamp;
  @override
  final Object? throwable;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'ErrorDetail.backend(errorCode: $errorCode, message: $message, traceId: $traceId, timestamp: $timestamp, throwable: $throwable, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetailBackendImpl &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.traceId, traceId) || other.traceId == traceId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.throwable, throwable) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorCode, message, traceId,
      timestamp, const DeepCollectionEquality().hash(throwable), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailBackendImplCopyWith<_$ErrorDetailBackendImpl> get copyWith =>
      __$$ErrorDetailBackendImplCopyWithImpl<_$ErrorDetailBackendImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? errorCode,
            String? message,
            String? traceId,
            DateTime? timestamp,
            Object? throwable,
            StackTrace? stackTrace)
        backend,
    required TResult Function(Object? throwable, StackTrace? stackTrace) fatal,
  }) {
    return backend(
        errorCode, message, traceId, timestamp, throwable, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorCode, String? message, String? traceId,
            DateTime? timestamp, Object? throwable, StackTrace? stackTrace)?
        backend,
    TResult? Function(Object? throwable, StackTrace? stackTrace)? fatal,
  }) {
    return backend?.call(
        errorCode, message, traceId, timestamp, throwable, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorCode, String? message, String? traceId,
            DateTime? timestamp, Object? throwable, StackTrace? stackTrace)?
        backend,
    TResult Function(Object? throwable, StackTrace? stackTrace)? fatal,
    required TResult orElse(),
  }) {
    if (backend != null) {
      return backend(
          errorCode, message, traceId, timestamp, throwable, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorDetailBackend value) backend,
    required TResult Function(ErrorDetailFatal value) fatal,
  }) {
    return backend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorDetailBackend value)? backend,
    TResult? Function(ErrorDetailFatal value)? fatal,
  }) {
    return backend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetailBackend value)? backend,
    TResult Function(ErrorDetailFatal value)? fatal,
    required TResult orElse(),
  }) {
    if (backend != null) {
      return backend(this);
    }
    return orElse();
  }
}

abstract class ErrorDetailBackend implements ErrorDetail {
  const factory ErrorDetailBackend(
      {final String? errorCode,
      final String? message,
      final String? traceId,
      final DateTime? timestamp,
      final Object? throwable,
      final StackTrace? stackTrace}) = _$ErrorDetailBackendImpl;

  String? get errorCode;
  String? get message;
  String? get traceId;
  DateTime? get timestamp;
  @override
  Object? get throwable;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$ErrorDetailBackendImplCopyWith<_$ErrorDetailBackendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorDetailFatalImplCopyWith<$Res>
    implements $ErrorDetailCopyWith<$Res> {
  factory _$$ErrorDetailFatalImplCopyWith(_$ErrorDetailFatalImpl value,
          $Res Function(_$ErrorDetailFatalImpl) then) =
      __$$ErrorDetailFatalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? throwable, StackTrace? stackTrace});
}

/// @nodoc
class __$$ErrorDetailFatalImplCopyWithImpl<$Res>
    extends _$ErrorDetailCopyWithImpl<$Res, _$ErrorDetailFatalImpl>
    implements _$$ErrorDetailFatalImplCopyWith<$Res> {
  __$$ErrorDetailFatalImplCopyWithImpl(_$ErrorDetailFatalImpl _value,
      $Res Function(_$ErrorDetailFatalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? throwable = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ErrorDetailFatalImpl(
      throwable: freezed == throwable ? _value.throwable : throwable,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ErrorDetailFatalImpl implements ErrorDetailFatal {
  const _$ErrorDetailFatalImpl({this.throwable, this.stackTrace});

  @override
  final Object? throwable;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'ErrorDetail.fatal(throwable: $throwable, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetailFatalImpl &&
            const DeepCollectionEquality().equals(other.throwable, throwable) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(throwable), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailFatalImplCopyWith<_$ErrorDetailFatalImpl> get copyWith =>
      __$$ErrorDetailFatalImplCopyWithImpl<_$ErrorDetailFatalImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? errorCode,
            String? message,
            String? traceId,
            DateTime? timestamp,
            Object? throwable,
            StackTrace? stackTrace)
        backend,
    required TResult Function(Object? throwable, StackTrace? stackTrace) fatal,
  }) {
    return fatal(throwable, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorCode, String? message, String? traceId,
            DateTime? timestamp, Object? throwable, StackTrace? stackTrace)?
        backend,
    TResult? Function(Object? throwable, StackTrace? stackTrace)? fatal,
  }) {
    return fatal?.call(throwable, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorCode, String? message, String? traceId,
            DateTime? timestamp, Object? throwable, StackTrace? stackTrace)?
        backend,
    TResult Function(Object? throwable, StackTrace? stackTrace)? fatal,
    required TResult orElse(),
  }) {
    if (fatal != null) {
      return fatal(throwable, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorDetailBackend value) backend,
    required TResult Function(ErrorDetailFatal value) fatal,
  }) {
    return fatal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorDetailBackend value)? backend,
    TResult? Function(ErrorDetailFatal value)? fatal,
  }) {
    return fatal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorDetailBackend value)? backend,
    TResult Function(ErrorDetailFatal value)? fatal,
    required TResult orElse(),
  }) {
    if (fatal != null) {
      return fatal(this);
    }
    return orElse();
  }
}

abstract class ErrorDetailFatal implements ErrorDetail {
  const factory ErrorDetailFatal(
      {final Object? throwable,
      final StackTrace? stackTrace}) = _$ErrorDetailFatalImpl;

  @override
  Object? get throwable;
  @override
  StackTrace? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$ErrorDetailFatalImplCopyWith<_$ErrorDetailFatalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
