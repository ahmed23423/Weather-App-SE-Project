import 'package:flutter/material.dart';
import 'package:weather_app_windows/presentation/resources/color_manager.dart';
import 'package:weather_app_windows/presentation/resources/values_manager.dart';

enum StateRendererType {
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,
  POPUP_MESSAGE_STATE,

  FULLSCREEN_LOADING_STATE,
  FULLSCREEN_ERROR_STATE,
  FULLSCREEN_EMPTY_STATE,

  CONTENT_STATE
}

class StateRender {
  static OverlayState? _overlay;
  static OverlayEntry? _theAlertLoading;
  static OverlayEntry? _theAlertBackground;
  static bool _dismissible = true;
  static ThemeData? _theme;
  // It Dose Not Return Widget In If PopUp Is True
  static Widget? message(
    BuildContext context, {
    required StateRendererType stateType,
    popup = true,
    dismissible = true,
    String? body,
    String? title,
    Widget? image,
    List<Widget>? actions,
    MainAxisAlignment actionsAlignment = MainAxisAlignment.center,
  }) {
    _theme = Theme.of(context);
    _dismissible = dismissible;
    if (popup) {
      // Show Dialog
      _theAlertBackground = _alertBackground();
      _overlay = Overlay.of(context);
      _overlay!.insert(_theAlertBackground!);

      switch (stateType) {
        case StateRendererType.POPUP_LOADING_STATE:
          _theAlertLoading = _alertLoading();
          _overlay!.insert(_theAlertLoading!);
          break;
        case StateRendererType.POPUP_ERROR_STATE:
          // TODO: Handle this case.
          break;
        case StateRendererType.POPUP_MESSAGE_STATE:
          // TODO: Handle this case.
          break;
        default:
          return null;
      }
    } else {
      // Return Widget
      switch (stateType) {
        case StateRendererType.FULLSCREEN_LOADING_STATE:
          // TODO: Handle this case.
          break;
        case StateRendererType.FULLSCREEN_ERROR_STATE:
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                image ?? const SizedBox(),
                SizedBox(
                  height: AppSize.dynamicSize(2),
                ),
                title != null
                    ? Padding(
                        padding: EdgeInsets.only(bottom: AppSize.dynamicSize(2)),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.labelMedium,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const SizedBox(),
                body != null
                    ? Padding(
                        padding: EdgeInsets.only(bottom: AppSize.dynamicSize(2)),
                        child: Text(body, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
                      )
                    : const SizedBox(),
                Row(
                  mainAxisAlignment: actionsAlignment,
                  children: actions ?? [],
                )
              ],
            ),
          );
        case StateRendererType.FULLSCREEN_EMPTY_STATE:
          // TODO: Handle this case.
          break;
        case StateRendererType.CONTENT_STATE:
          // TODO: Handle this case.
          break;
        case StateRendererType.POPUP_LOADING_STATE:
          // TODO: Handle this case.
          break;
        default:
          return null;
      }
    }
    return null;
  }

  static Widget handleErrorState({required bool thereError, required Widget online, required Widget offline}) => thereError ? offline : online;

  static void showSnackBar(BuildContext context, String message) {
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static OverlayEntry _alertLoading() => OverlayEntry(
      builder: (context) => Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.dynamicSize(10)),
                  height: AppSize.dynamicSize(18),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: ColorManager.black.withOpacity(.3))],
                      borderRadius: BorderRadius.circular(BorderRadiusSize.dynamicSize(5))),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ));

  static OverlayEntry _alertBackground() => OverlayEntry(
      builder: (context) => Container(
            color: Colors.white.withOpacity(.4),
            child: _dismissible
                ? Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => StateRender.closePopup(),
                    ))
                : const SizedBox(),
          ));

  static closePopup() {
    try {
      _theAlertLoading!.remove();
      _theAlertBackground!.remove();
    } catch (e) {
      _theAlertLoading = _theAlertBackground = _overlay = null;
    }
  }
}
