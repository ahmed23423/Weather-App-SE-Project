import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../data/network/error_handler.dart';
import '../data/network/failure.dart';

extension NonNullString on String? {
  String handelNull() => this == null ? '' : this!;
}

extension NonNullInt on int? {
  int handelNull() => this == null ? 0 : this!;
}

extension ResponseHandler on String {
  Failure getFailure() {
    switch (this) {
      case ResponseMessage.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);

      case ResponseMessage.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);

      case ResponseMessage.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);

      case ResponseMessage.UNAUTORISED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);

      case ResponseMessage.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);

      case ResponseMessage.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR, ResponseMessage.INTERNAL_SERVER_ERROR);

      case ResponseMessage.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);

      case ResponseMessage.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);

      case ResponseMessage.RECIEVE_TIMEOUT:
        return Failure(ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);

      case ResponseMessage.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);

      case ResponseMessage.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);

      case ResponseMessage.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION);

      case ResponseMessage.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);

      case ResponseMessage.BAD_CERTIFICATE:
        return Failure(ResponseCode.BAD_CERTIFICATE, ResponseMessage.BAD_CERTIFICATE);

      case ResponseMessage.CONNECTION_ERROR:
        return Failure(ResponseCode.CONNECTION_ERROR, ResponseMessage.CONNECTION_ERROR);

      case ResponseMessage.BAD_RESPONSE:
        return Failure(ResponseCode.BAD_RESPONSE, ResponseMessage.BAD_RESPONSE);

        /// Firebase Error
      case ResponseMessage.WRANG_PASSOWRD:
        return Failure(ResponseCode.WRANG_PASSOWRD, ResponseMessage.WRANG_PASSOWRD);
      case ResponseMessage.INVALID_EMAIL:
        return Failure(ResponseCode.INVALID_EMAIL, ResponseMessage.INVALID_EMAIL);
      case ResponseMessage.USER_DISABLED:
        return Failure(ResponseCode.USER_DISABLED, ResponseMessage.USER_DISABLED);
      case ResponseMessage.USER_NOT_FOUND:
        return Failure(ResponseCode.USER_NOT_FOUND, ResponseMessage.USER_NOT_FOUND);
      case ResponseMessage.EMAIL_ALREADY_IN_USE:
        return Failure(ResponseCode.EMAIL_ALREADY_IN_USE, ResponseMessage.EMAIL_ALREADY_IN_USE);
      case ResponseMessage.OPERATION_NOT_ALLOWED:
        return Failure(ResponseCode.OPERATION_NOT_ALLOWED, ResponseMessage.OPERATION_NOT_ALLOWED);
      case ResponseMessage.ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL:
        return Failure(ResponseCode.ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL, ResponseMessage.ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL);
      case ResponseMessage.INVALID_CREDENTIAL:
        return Failure(ResponseCode.INVALID_CREDENTIAL, ResponseMessage.INVALID_CREDENTIAL);
      case ResponseMessage.INVALID_VERIFICATION_CODE:
        return Failure(ResponseCode.INVALID_VERIFICATION_CODE, ResponseMessage.INVALID_VERIFICATION_CODE);
      case ResponseMessage.INVALID_VERIFICATION_ID:
        return Failure(ResponseCode.INVALID_VERIFICATION_ID, ResponseMessage.INVALID_VERIFICATION_ID);
      case ResponseMessage.USER_MISMATCH:
       return Failure(ResponseCode.USER_MISMATCH, ResponseMessage.USER_MISMATCH);
      case ResponseMessage.EXPIRED_ACTION_CODE:
        return Failure(ResponseCode.EXPIRED_ACTION_CODE, ResponseMessage.EXPIRED_ACTION_CODE);
      case ResponseMessage.INVALID_PHONE_NUMBER:
        return Failure(ResponseCode.INVALID_PHONE_NUMBER, ResponseMessage.INVALID_PHONE_NUMBER);
      case ResponseMessage.CLAIMS_TOO_LARGE:
        return Failure(-100, ResponseMessage.CLAIMS_TOO_LARGE);
      case ResponseMessage.EMAIL_ALREADY_EXISTS:
        return Failure(-100, ResponseMessage.EMAIL_ALREADY_EXISTS);
      case ResponseMessage.ID_TOKEN_EXPIRED:
        return Failure(-100, ResponseMessage.ID_TOKEN_EXPIRED);
      case ResponseMessage.ID_TOKEN_REVOKED:
        return Failure(-100, ResponseMessage.ID_TOKEN_REVOKED);
      case ResponseMessage.INSUFFICIENT_PERMISSION:
        return Failure(-100, ResponseMessage.INSUFFICIENT_PERMISSION);
      case ResponseMessage.INTERNAL_ERROR:
        return Failure(-100, ResponseMessage.INTERNAL_ERROR);
      case ResponseMessage.INVALID_ARGUMENT:
        return Failure(-100, ResponseMessage.INVALID_ARGUMENT);
      case ResponseMessage.INVALID_CLAIMS:
        return Failure(-100, ResponseMessage.INVALID_CLAIMS);
      case ResponseMessage.INVALID_CONTINUE_URI:
        return Failure(-100, ResponseMessage.INVALID_CONTINUE_URI);
      case ResponseMessage.INVALID_CREATION_TIME:
        return Failure(-100, ResponseMessage.INVALID_CREATION_TIME);
      case ResponseMessage.INVALID_DISABLED_FIELD:
        return Failure(-100, ResponseMessage.INVALID_DISABLED_FIELD);
      case ResponseMessage.INVALID_DISPLAY_NAME:
        return Failure(-100, ResponseMessage.INVALID_DISPLAY_NAME);
      case ResponseMessage.INVALID_DYNAMIC_LINK_DOMAIN:
        return Failure(-100, ResponseMessage.INVALID_DYNAMIC_LINK_DOMAIN);
      case ResponseMessage.INVALID_EMAIL_VERIFIED:
        return Failure(-100, ResponseMessage.INVALID_EMAIL_VERIFIED);
      case ResponseMessage.INVALID_HASH_ALGORITHM:
        return Failure(-100, ResponseMessage.INVALID_HASH_ALGORITHM);
      case ResponseMessage.INVALID_HASH_BLOCK_SIZE:
        return Failure(-100, ResponseMessage.CLAIMS_TOO_LARGE);
      case ResponseMessage.INVALID_HASH_DERIVED_KEY_LENGTH:
        return Failure(-100, ResponseMessage.INVALID_HASH_DERIVED_KEY_LENGTH);
      case ResponseMessage.INVALID_HASH_KEY:
        return Failure(-100, ResponseMessage.INVALID_HASH_KEY);
      case ResponseMessage.INVALID_HASH_MEMORY_COST:
        return Failure(-100, ResponseMessage.INVALID_HASH_MEMORY_COST);
      case ResponseMessage.INVALID_HASH_PARALLELIZATION:
        return Failure(-100, ResponseMessage.INVALID_HASH_PARALLELIZATION);
      case ResponseMessage.INVALID_HASH_ROUNDS:
        return Failure(-100, ResponseMessage.INVALID_HASH_ROUNDS);
      case ResponseMessage.INVALID_HASH_SALT_SEPARATOR:
        return Failure(-100, ResponseMessage.INVALID_HASH_SALT_SEPARATOR);
      case ResponseMessage.INVALID_ID_TOKEN:
        return Failure(-100, ResponseMessage.INVALID_ID_TOKEN);
      case ResponseMessage.INVALID_LAST_SIGN_IN_TIME:
        return Failure(-100, ResponseMessage.INVALID_LAST_SIGN_IN_TIME);
      case ResponseMessage.INVALID_PAGE_TOKEN:
        return Failure(-100, ResponseMessage.INVALID_PAGE_TOKEN);
      case ResponseMessage.INVALID_PASSWORD:
        return Failure(-100, ResponseMessage.INVALID_PASSWORD);
      case ResponseMessage.INVALID_PASSWORD_HASH:
        return Failure(-100, ResponseMessage.INVALID_PASSWORD_HASH);
      case ResponseMessage.INVALID_PASSWORD_SALT:
        return Failure(-100, ResponseMessage.INVALID_PASSWORD_SALT);
      case ResponseMessage.INVALID_PHOTO_URL:
        return Failure(-100, ResponseMessage.INVALID_PHOTO_URL);
      case ResponseMessage.INVALID_PROVIDER_DATA:
        return Failure(-100, ResponseMessage.INVALID_PROVIDER_DATA);
      case ResponseMessage.INVALID_PROVIDER_ID:
        return Failure(-100, ResponseMessage.INVALID_PROVIDER_ID);
      case ResponseMessage.INVALID_OAUTH_RESPONSETYPE:
        return Failure(-100, ResponseMessage.INVALID_OAUTH_RESPONSETYPE);
      case ResponseMessage.INVALID_SESSION_COOKIE_DURATION:
        return Failure(-100, ResponseMessage.INVALID_SESSION_COOKIE_DURATION);
      case ResponseMessage.INVALID_UID:
        return Failure(-100, ResponseMessage.INVALID_UID);
      case ResponseMessage.INVALID_USER_IMPORT:
        return Failure(-100, ResponseMessage.INVALID_USER_IMPORT);
      case ResponseMessage.MAXIMUM_USER_COUNT_EXCEEDED:
        return Failure(-100, ResponseMessage.MAXIMUM_USER_COUNT_EXCEEDED);
      case ResponseMessage.MISSING_ANDROID_PKG_NAME:
        return Failure(-100, ResponseMessage.MISSING_ANDROID_PKG_NAME);
      case ResponseMessage.MISSING_CONTINUE_URI:
        return Failure(-100, ResponseMessage.MISSING_CONTINUE_URI);
      case ResponseMessage.MISSING_HASH_ALGORITHM:
        return Failure(-100, ResponseMessage.MISSING_HASH_ALGORITHM);
      case ResponseMessage.MISSING_IOS_BUNDLE_ID:
        return Failure(-100, ResponseMessage.MISSING_IOS_BUNDLE_ID);
      case ResponseMessage.MISSING_UID:
        return Failure(-100, ResponseMessage.MISSING_UID);
      case ResponseMessage.MISSING_OAUTH_CLIENT_SECRET:
        return Failure(-100, ResponseMessage.MISSING_OAUTH_CLIENT_SECRET);
      case ResponseMessage.PHONE_NUMBER_ALREADY_EXISTS:
        return Failure(-100, ResponseMessage.PHONE_NUMBER_ALREADY_EXISTS);
      case ResponseMessage.PROJECT_NOT_FOUND:
        return Failure(-100, ResponseMessage.PROJECT_NOT_FOUND);
      case ResponseMessage.RESERVED_CLAIMS:
        return Failure(-100, ResponseMessage.RESERVED_CLAIMS);
      case ResponseMessage.SESSION_COOKIE_EXPIRED:
        return Failure(-100, ResponseMessage.SESSION_COOKIE_EXPIRED);
      case ResponseMessage.SESSION_COOKIE_REVOKED:
        return Failure(-100, ResponseMessage.SESSION_COOKIE_REVOKED);
      case ResponseMessage.TOO_MANY_REQUESTS:
        return Failure(-100, ResponseMessage.TOO_MANY_REQUESTS);
      case ResponseMessage.UID_ALREADY_EXISTS:
        return Failure(-100, ResponseMessage.UID_ALREADY_EXISTS);
      case ResponseMessage.UNAUTHORIZED_CONTINUE_URI:
        return Failure(-100, ResponseMessage.UNAUTHORIZED_CONTINUE_URI);
      case ResponseMessage.SESSION_EXPIRED:
        return Failure(-100, ResponseMessage.SESSION_EXPIRED);
      default:
        return Failure(-1, 'None');
    }
  }
}

extension userMessage on String {
  String getUserMessage(BuildContext context){
    switch(this){
      case ResponseMessage.SUCCESS:
        return AppLocalizations.of(context)!.success;

      case ResponseMessage.NO_CONTENT:
        return AppLocalizations.of(context)!.no_content;

      case ResponseMessage.BAD_REQUEST:
        return AppLocalizations.of(context)!.bad_request;

      case ResponseMessage.UNAUTORISED:
        return AppLocalizations.of(context)!.unauthorized;

      case ResponseMessage.FORBIDDEN:
        return AppLocalizations.of(context)!.forbidden;

      case ResponseMessage.INTERNAL_SERVER_ERROR:
        return AppLocalizations.of(context)!.internal_server_error;

      case ResponseMessage.CONNECT_TIMEOUT:
        return AppLocalizations.of(context)!.connect_timeout;

      case ResponseMessage.CANCEL:
        return AppLocalizations.of(context)!.cancel;

      case ResponseMessage.RECIEVE_TIMEOUT:
        return AppLocalizations.of(context)!.receive_timeout;

      case ResponseMessage.SEND_TIMEOUT:
        return AppLocalizations.of(context)!.send_timeout;

      case ResponseMessage.CACHE_ERROR:
        return AppLocalizations.of(context)!.cache_error;

      case ResponseMessage.NO_INTERNET_CONNECTION:
        return AppLocalizations.of(context)!.no_internet_connection;

      case ResponseMessage.DEFAULT:
        return AppLocalizations.of(context)!.defaultError;

      case ResponseMessage.BAD_CERTIFICATE:
        return AppLocalizations.of(context)!.bad_certificate;

      case ResponseMessage.CONNECTION_ERROR:
        return AppLocalizations.of(context)!.connection_error;

      case ResponseMessage.BAD_RESPONSE:
        return AppLocalizations.of(context)!.bad_response;

    /// Firebase Error
      case ResponseMessage.WRANG_PASSOWRD:
        return AppLocalizations.of(context)!.wrong_password;
      case ResponseMessage.INVALID_EMAIL:
        return AppLocalizations.of(context)!.invalid_email;
      case ResponseMessage.USER_DISABLED:
        return AppLocalizations.of(context)!.user_disabled;
      case ResponseMessage.USER_NOT_FOUND:
        return AppLocalizations.of(context)!.user_not_found;
      case ResponseMessage.EMAIL_ALREADY_IN_USE:
        return AppLocalizations.of(context)!.email_already_in_use;
      case ResponseMessage.OPERATION_NOT_ALLOWED:
        return AppLocalizations.of(context)!.operation_not_allowed;
      case ResponseMessage.ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL:
        return AppLocalizations.of(context)!.account_exists_with_different_credential;
      case ResponseMessage.INVALID_CREDENTIAL:
        return AppLocalizations.of(context)!.invalid_email;
      case ResponseMessage.INVALID_VERIFICATION_CODE:
        return AppLocalizations.of(context)!.invalid_verification_code;
      case ResponseMessage.INVALID_VERIFICATION_ID:
        return AppLocalizations.of(context)!.invalid_verification_id;
      case ResponseMessage.USER_MISMATCH:
        return AppLocalizations.of(context)!.user_mismatch;
      case ResponseMessage.EXPIRED_ACTION_CODE:
        return AppLocalizations.of(context)!.expired_action_code;
      case ResponseMessage.INVALID_PHONE_NUMBER:
        return AppLocalizations.of(context)!.invalid_phone_number;
      default:
        return AppLocalizations.of(context)!.default_error;
    }
  }
}


extension opacity on Widget{
  Widget withOpacity (double opacity){
    return Opacity(opacity: opacity,child: this,);
  }
}