import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app_windows/app/extensions.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleErrorDio(error);
    }
    if (error is FirebaseAuthException) {
      failure = _handleErrorFireAuth(error);
    } else {
      failure = ResponseMessage.DEFAULT.getFailure();
    }
  }
}

Failure _handleErrorDio(DioError error) {
  switch (error.type) {
    case DioErrorType.connectionTimeout:
      return ResponseMessage.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return ResponseMessage.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return ResponseMessage.RECIEVE_TIMEOUT.getFailure();
    case DioErrorType.badCertificate:
      return ResponseMessage.BAD_CERTIFICATE.getFailure();
    case DioErrorType.badResponse:
      return ResponseMessage.BAD_RESPONSE.getFailure();
    case DioErrorType.cancel:
      return ResponseMessage.CANCEL.getFailure();
    case DioErrorType.connectionError:
      return ResponseMessage.CONNECTION_ERROR.getFailure();
    case DioErrorType.unknown:
      return ResponseMessage.DEFAULT.getFailure();
    default:
      return ResponseMessage.DEFAULT.getFailure();
  }
}

Failure _handleErrorFireAuth(FirebaseAuthException error) {
  switch (error.code) {
    case ResponseMessage.WRANG_PASSOWRD:
      return ResponseMessage.WRANG_PASSOWRD.getFailure();
    case ResponseMessage.INVALID_EMAIL:
      return ResponseMessage.INVALID_EMAIL.getFailure();
    case ResponseMessage.USER_DISABLED:
      return ResponseMessage.USER_DISABLED.getFailure();
    case ResponseMessage.USER_NOT_FOUND:
      return ResponseMessage.USER_NOT_FOUND.getFailure();
    case ResponseMessage.EMAIL_ALREADY_IN_USE:
      return ResponseMessage.EMAIL_ALREADY_IN_USE.getFailure();
    case ResponseMessage.OPERATION_NOT_ALLOWED:
      return ResponseMessage.OPERATION_NOT_ALLOWED.getFailure();
    case ResponseMessage.WEAK_PASSWORD:
      return ResponseMessage.WEAK_PASSWORD.getFailure();
    case ResponseMessage.ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL:
      return ResponseMessage.ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL.getFailure();
    case ResponseMessage.INVALID_CREDENTIAL:
      return ResponseMessage.INVALID_CREDENTIAL.getFailure();
    case ResponseMessage.INVALID_VERIFICATION_CODE:
      return ResponseMessage.INVALID_VERIFICATION_CODE.getFailure();
    case ResponseMessage.INVALID_VERIFICATION_ID:
      return ResponseMessage.INVALID_VERIFICATION_ID.getFailure();
    case ResponseMessage.USER_MISMATCH:
      return ResponseMessage.USER_MISMATCH.getFailure();
    case ResponseMessage.EXPIRED_ACTION_CODE:
      return ResponseMessage.EXPIRED_ACTION_CODE.getFailure();
    case ResponseMessage.INVALID_PHONE_NUMBER:
      return ResponseMessage.INVALID_PHONE_NUMBER.getFailure();
    case ResponseMessage.CLAIMS_TOO_LARGE:
      return ResponseMessage.CLAIMS_TOO_LARGE.getFailure();
    case ResponseMessage.EMAIL_ALREADY_EXISTS:
      return ResponseMessage.EMAIL_ALREADY_EXISTS.getFailure();
    case ResponseMessage.ID_TOKEN_EXPIRED:
      return ResponseMessage.ID_TOKEN_EXPIRED.getFailure();
    case ResponseMessage.ID_TOKEN_REVOKED:
      return ResponseMessage.ID_TOKEN_REVOKED.getFailure();
    case ResponseMessage.INSUFFICIENT_PERMISSION:
      return ResponseMessage.INSUFFICIENT_PERMISSION.getFailure();
    case ResponseMessage.INTERNAL_ERROR:
      return ResponseMessage.INTERNAL_ERROR.getFailure();
    case ResponseMessage.INVALID_ARGUMENT:
      return ResponseMessage.INVALID_ARGUMENT.getFailure();
    case ResponseMessage.INVALID_CLAIMS:
      return ResponseMessage.INVALID_CLAIMS.getFailure();
    case ResponseMessage.INVALID_CONTINUE_URI:
      return ResponseMessage.INVALID_CONTINUE_URI.getFailure();
    case ResponseMessage.INVALID_CREATION_TIME:
      return ResponseMessage.INVALID_CREATION_TIME.getFailure();
    case ResponseMessage.INVALID_DISABLED_FIELD:
      return ResponseMessage.INVALID_DISABLED_FIELD.getFailure();
    case ResponseMessage.INVALID_DISPLAY_NAME:
      return ResponseMessage.INVALID_DISPLAY_NAME.getFailure();
    case ResponseMessage.INVALID_DYNAMIC_LINK_DOMAIN:
      return ResponseMessage.INVALID_DYNAMIC_LINK_DOMAIN.getFailure();
    case ResponseMessage.INVALID_EMAIL_VERIFIED:
      return ResponseMessage.INVALID_EMAIL_VERIFIED.getFailure();
    case ResponseMessage.INVALID_HASH_ALGORITHM:
      return ResponseMessage.INVALID_HASH_ALGORITHM.getFailure();
    case ResponseMessage.INVALID_HASH_BLOCK_SIZE:
      return ResponseMessage.INVALID_HASH_BLOCK_SIZE.getFailure();
    case ResponseMessage.INVALID_HASH_DERIVED_KEY_LENGTH:
      return ResponseMessage.INVALID_HASH_DERIVED_KEY_LENGTH.getFailure();
    case ResponseMessage.INVALID_HASH_KEY:
      return ResponseMessage.INVALID_HASH_KEY.getFailure();
    case ResponseMessage.INVALID_HASH_MEMORY_COST:
      return ResponseMessage.INVALID_HASH_MEMORY_COST.getFailure();
    case ResponseMessage.INVALID_HASH_PARALLELIZATION:
      return ResponseMessage.INVALID_HASH_PARALLELIZATION.getFailure();
    case ResponseMessage.INVALID_HASH_ROUNDS:
      return ResponseMessage.INVALID_HASH_ROUNDS.getFailure();
    case ResponseMessage.INVALID_HASH_SALT_SEPARATOR:
      return ResponseMessage.INVALID_HASH_SALT_SEPARATOR.getFailure();
    case ResponseMessage.INVALID_ID_TOKEN:
      return ResponseMessage.INVALID_ID_TOKEN.getFailure();
    case ResponseMessage.INVALID_LAST_SIGN_IN_TIME:
      return ResponseMessage.INVALID_LAST_SIGN_IN_TIME.getFailure();
    case ResponseMessage.INVALID_PAGE_TOKEN:
      return ResponseMessage.INVALID_PAGE_TOKEN.getFailure();
    case ResponseMessage.INVALID_PASSWORD:
      return ResponseMessage.INVALID_PASSWORD.getFailure();
    case ResponseMessage.INVALID_PASSWORD_HASH:
      return ResponseMessage.INVALID_PASSWORD_HASH.getFailure();
    case ResponseMessage.INVALID_PASSWORD_SALT:
      return ResponseMessage.INVALID_PASSWORD_SALT.getFailure();
    case ResponseMessage.INVALID_PHOTO_URL:
      return ResponseMessage.INVALID_PHOTO_URL.getFailure();
    case ResponseMessage.INVALID_PROVIDER_DATA:
      return ResponseMessage.INVALID_PROVIDER_DATA.getFailure();
    case ResponseMessage.INVALID_PROVIDER_ID:
      return ResponseMessage.INVALID_PROVIDER_ID.getFailure();
    case ResponseMessage.INVALID_OAUTH_RESPONSETYPE:
      return ResponseMessage.INVALID_OAUTH_RESPONSETYPE.getFailure();
    case ResponseMessage.INVALID_SESSION_COOKIE_DURATION:
      return ResponseMessage.INVALID_SESSION_COOKIE_DURATION.getFailure();
    case ResponseMessage.INVALID_UID:
      return ResponseMessage.INVALID_UID.getFailure();
    case ResponseMessage.INVALID_USER_IMPORT:
      return ResponseMessage.INVALID_USER_IMPORT.getFailure();
    case ResponseMessage.MAXIMUM_USER_COUNT_EXCEEDED:
      return ResponseMessage.MAXIMUM_USER_COUNT_EXCEEDED.getFailure();
    case ResponseMessage.MISSING_ANDROID_PKG_NAME:
      return ResponseMessage.MISSING_ANDROID_PKG_NAME.getFailure();
    case ResponseMessage.MISSING_CONTINUE_URI:
      return ResponseMessage.MISSING_CONTINUE_URI.getFailure();
    case ResponseMessage.MISSING_HASH_ALGORITHM:
      return ResponseMessage.MISSING_HASH_ALGORITHM.getFailure();
    case ResponseMessage.MISSING_IOS_BUNDLE_ID:
      return ResponseMessage.MISSING_IOS_BUNDLE_ID.getFailure();
    case ResponseMessage.MISSING_UID:
      return ResponseMessage.MISSING_UID.getFailure();
    case ResponseMessage.MISSING_OAUTH_CLIENT_SECRET:
      return ResponseMessage.MISSING_OAUTH_CLIENT_SECRET.getFailure();
    case ResponseMessage.PHONE_NUMBER_ALREADY_EXISTS:
      return ResponseMessage.PHONE_NUMBER_ALREADY_EXISTS.getFailure();
    case ResponseMessage.PROJECT_NOT_FOUND:
      return ResponseMessage.PROJECT_NOT_FOUND.getFailure();
    case ResponseMessage.RESERVED_CLAIMS:
      return ResponseMessage.RESERVED_CLAIMS.getFailure();
    case ResponseMessage.SESSION_COOKIE_EXPIRED:
      return ResponseMessage.SESSION_COOKIE_EXPIRED.getFailure();
    case ResponseMessage.SESSION_COOKIE_REVOKED:
      return ResponseMessage.SESSION_COOKIE_REVOKED.getFailure();
    case ResponseMessage.TOO_MANY_REQUESTS:
      return ResponseMessage.TOO_MANY_REQUESTS.getFailure();
    case ResponseMessage.UID_ALREADY_EXISTS:
      return ResponseMessage.UID_ALREADY_EXISTS.getFailure();
    case ResponseMessage.UNAUTHORIZED_CONTINUE_URI:
      return ResponseMessage.UNAUTHORIZED_CONTINUE_URI.getFailure();
    case ResponseMessage.SESSION_EXPIRED:
      return ResponseMessage.SESSION_EXPIRED.getFailure();
    default:
      return ResponseMessage.DEFAULT.getFailure();
  }
}
class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTORISED = 401;
  static const int FORBIDDEN = 403;
  static const int INTERNAL_SERVER_ERROR = 500;

  // LOCAL STATUS CODE
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
  static const int CONNECTION_ERROR = -9;
  static const int BAD_CERTIFICATE = -10;
  static const int BAD_RESPONSE = -11;

  //? Firebase Auth Exception
  // signInWithEmailAndPassword
  static const int WRANG_PASSOWRD = -12;
  static const int INVALID_EMAIL = -13;
  static const int USER_DISABLED = -14;
  static const int USER_NOT_FOUND = -15;

  // createUserWithEmailAndPassword
  static const int EMAIL_ALREADY_IN_USE = -16;
  static const int OPERATION_NOT_ALLOWED = -17;
  static const int WEAK_PASSWORD = -18;

  // signInWithCredential
  static const int ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL = -19;
  static const int INVALID_CREDENTIAL = -20;
  static const int INVALID_VERIFICATION_CODE = -21;
  static const int INVALID_VERIFICATION_ID = -22;

  // reauthenticateWithCredential
  static const int USER_MISMATCH = -23;

  // signInWithEmailLink
  static const int EXPIRED_ACTION_CODE = -24;

  static const int INVALID_PHONE_NUMBER = -25;
}

class ResponseMessage {
  static const String SUCCESS = 'SUCCESS';
  static const String NO_CONTENT = 'NO_CONTENT';
  static const String BAD_REQUEST = 'BAD_REQUEST';
  static const String UNAUTORISED = 'UNAUTORISED';
  static const String FORBIDDEN = 'FORBIDDEN';
  static const String INTERNAL_SERVER_ERROR = 'INTERNAL_SERVER_ERROR';

  // LOCAL STATUS CODE
  static const String CONNECT_TIMEOUT = 'CONNECT_TIMEOUT';
  static const String CANCEL = 'CANCEL';
  static const String RECIEVE_TIMEOUT = 'RECIEVE_TIMEOUT';
  static const String SEND_TIMEOUT = 'SEND_TIMEOUT';
  static const String CACHE_ERROR = 'CACHE_ERROR';
  static const String NO_INTERNET_CONNECTION = 'NO_INTERNET_CONNECTION';
  static const String DEFAULT = 'DEFAULT';
  static const String CONNECTION_ERROR = 'CONNECTION_ERROR';
  static const String BAD_CERTIFICATE = 'BAD_CERTIFICATE';
  static const String BAD_RESPONSE = 'BAD_RESPONSE';

  /// Firebase Auth Exceptions
  static const String WRANG_PASSOWRD = 'wrong-password';
  static const String INVALID_EMAIL = 'invalid-email';
  static const String USER_DISABLED = 'user-disabled';
  static const String USER_NOT_FOUND = 'user-not-found';
  static const String EMAIL_ALREADY_IN_USE = 'email-already-in-use';
  static const String OPERATION_NOT_ALLOWED = 'operation-not-allowed';
  static const String WEAK_PASSWORD = 'weak-password';
  static const String ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL = 'account-exists-with-different-credential';
  static const String INVALID_CREDENTIAL = 'invalid-credential';
  static const String INVALID_VERIFICATION_CODE = 'invalid-verification-code';
  static const String INVALID_VERIFICATION_ID = 'invalid-verification-id';
  static const String USER_MISMATCH = 'user-mismatch';
  static const String EXPIRED_ACTION_CODE = 'expired-action-code';
  static const String INVALID_PHONE_NUMBER = 'invalid-phone-number';
  static const String CLAIMS_TOO_LARGE = 'claims-too-large';
  static const String EMAIL_ALREADY_EXISTS = 'email-already-exists';
  static const String ID_TOKEN_EXPIRED = 'id-token-expired';
  static const String ID_TOKEN_REVOKED = 'id-token-revoked';
  static const String INSUFFICIENT_PERMISSION = 'insufficient-permission';
  static const String INTERNAL_ERROR = 'internal-error';
  static const String INVALID_ARGUMENT = 'invalid-argument';
  static const String INVALID_CLAIMS = 'invalid-claims';
  static const String INVALID_CONTINUE_URI = 'invalid-continue-uri';
  static const String INVALID_CREATION_TIME = 'invalid-creation-time';
  static const String INVALID_DISABLED_FIELD = 'invalid-disabled-field';
  static const String INVALID_DISPLAY_NAME = 'invalid-display-name';
  static const String INVALID_DYNAMIC_LINK_DOMAIN = 'invalid-dynamic-link-domain';
  static const String INVALID_EMAIL_VERIFIED = 'invalid-email-verified';
  static const String INVALID_HASH_ALGORITHM = 'invalid-hash-algorithm';
  static const String INVALID_HASH_BLOCK_SIZE = 'invalid-hash-block-size';
  static const String INVALID_HASH_DERIVED_KEY_LENGTH = 'invalid-hash-derived-key-length';
  static const String INVALID_HASH_KEY = 'invalid-hash-key';
  static const String INVALID_HASH_MEMORY_COST = 'invalid-hash-memory-cost';
  static const String INVALID_HASH_PARALLELIZATION = 'invalid-hash-parallelization';
  static const String INVALID_HASH_ROUNDS = 'invalid-hash-rounds';
  static const String INVALID_HASH_SALT_SEPARATOR = 'invalid-hash-salt-separator';
  static const String INVALID_ID_TOKEN = 'invalid-id-token';
  static const String INVALID_LAST_SIGN_IN_TIME = 'invalid-last-sign-in-time';
  static const String INVALID_PAGE_TOKEN = 'invalid-page-token';
  static const String INVALID_PASSWORD = 'invalid-password';
  static const String INVALID_PASSWORD_HASH = 'invalid-password-hash';
  static const String INVALID_PASSWORD_SALT = 'invalid-password-salt';
  static const String INVALID_PHOTO_URL = 'invalid-photo-url';
  static const String INVALID_PROVIDER_DATA = 'invalid-provider-data';
  static const String INVALID_PROVIDER_ID = 'invalid-provider-id';
  static const String INVALID_OAUTH_RESPONSETYPE = 'invalid-oauth-responsetype';
  static const String INVALID_SESSION_COOKIE_DURATION = 'invalid-session-cookie-duration';
  static const String INVALID_UID = 'invalid-uid';
  static const String INVALID_USER_IMPORT = 'invalid-user-import';
  static const String MAXIMUM_USER_COUNT_EXCEEDED = 'maximum-user-count-exceeded';
  static const String MISSING_ANDROID_PKG_NAME = 'missing-android-pkg-name';
  static const String MISSING_CONTINUE_URI = 'missing-continue-uri';
  static const String MISSING_HASH_ALGORITHM = 'missing-hash-algorithm';
  static const String MISSING_IOS_BUNDLE_ID = 'missing-ios-bundle-id';
  static const String MISSING_UID = 'missing-uid';
  static const String MISSING_OAUTH_CLIENT_SECRET = 'missing-oauth-client-secret';
  static const String PHONE_NUMBER_ALREADY_EXISTS = 'phone-number-already-exists';
  static const String PROJECT_NOT_FOUND = 'project-not-found';
  static const String RESERVED_CLAIMS = 'reserved-claims';
  static const String SESSION_COOKIE_EXPIRED = 'session-cookie-expired';
  static const String SESSION_COOKIE_REVOKED = 'session-cookie-revoked';
  static const String SESSION_EXPIRED = 'session-expired'; // TODO : make message to user
  static const String TOO_MANY_REQUESTS = 'too-many-requests';
  static const String UID_ALREADY_EXISTS = 'uid-already-exists';
  static const String UNAUTHORIZED_CONTINUE_URI = 'unauthorized-continue-uri';
}


