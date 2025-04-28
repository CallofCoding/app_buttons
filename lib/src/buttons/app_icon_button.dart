
import 'dart:async';
import 'dart:developer';

import 'package:app_buttons/src/core/button_settings.dart';
import 'package:app_buttons/src/core/button_theme_controller.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final IconData? icon;
  final Widget? child;
  final FutureOr<void> Function()? onTap;
  final ButtonSettings? settings;
  final bool enableBorder;
  final ShapeBorder? shape; // borderRadius will be handle from shape
  const AppIconButton({super.key, this.icon, this.child, this.settings, this.onTap, this.enableBorder = false, this.shape});

  @override
  Widget build(BuildContext context) {
    final mergedSettings = ButtonThemeController.defaultSettings.merge(settings);
    bool isLoading = false;
    Size? storedSize;

    final contentKey = GlobalKey();

    return StatefulBuilder(
      builder: (context, setState) {

        Future<void> handleTap() async {
          if (isLoading) return;
          final context = contentKey.currentContext;
          if (context != null) {
            storedSize = context.size;
          }
          setState(() => isLoading = true);
          try {
            await onTap?.call();
          } catch (e, stackTrace) {
            log("Exception Occur $e", stackTrace: stackTrace);
          } finally {
            setState(() => isLoading = false);
          }
        }

        Widget buttonContent = child ??
            Row(
              key: contentKey,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: mergedSettings.iconSize,
                    color: onTap == null
                        ? mergedSettings.disableForegroundColor
                        : mergedSettings.foregroundColor,
                  ),

              ],
            );

        return Material(
          color: Colors.transparent,
          child: Padding(
            padding: mergedSettings.margin ?? EdgeInsets.zero,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Card(
                  elevation: mergedSettings.elevation,
                    margin: EdgeInsets.zero,
                    shape: shape,
                    color: onTap == null
                        ? mergedSettings.disableBackgroundColor
                        : mergedSettings.backgroundColor,
                    child: InkWell(
                      customBorder: shape,
                      splashColor: mergedSettings.splashColor,
                      borderRadius: BorderRadius.circular(mergedSettings.borderRadius ?? 0),
                      onTap: onTap == null ? null : handleTap,
                      child: Padding(
                        padding: mergedSettings.contentPadding ?? EdgeInsets.zero,
                        child: AnimatedOpacity(
                          opacity: isLoading ? 0.0 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: buttonContent,
                        ),
                      ),
                    )
                ),
                if(isLoading)
                  SizedBox.square(
                    dimension: settings?.loaderSize ?? (storedSize == null ? 20 : storedSize!.height + ((mergedSettings.contentPadding?.vertical ?? 0) /2)),
                    child: CircularProgressIndicator(
                      strokeWidth: mergedSettings.loaderWidth ?? 2,
                      color: mergedSettings.foregroundColor,
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
