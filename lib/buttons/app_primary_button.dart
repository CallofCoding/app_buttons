import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../core/button_settings.dart';
import '../core/button_theme_controller.dart';

class AppPrimaryButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Widget? child;
  final FutureOr<void> Function()? onTap;
  final ButtonSettings? settings;

  const AppPrimaryButton({
    super.key,
    this.label,
    this.icon,
    this.child,
    this.onTap,
    this.settings,
  });

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
                if (icon != null) const SizedBox(width: 8),
                Text(
                  label ?? '',
                  style: settings?.style?.copyWith(
                    color: onTap == null
                        ? mergedSettings.disableForegroundColor
                        : null,
                  ) ??
                      mergedSettings.style?.copyWith(
                        color: onTap == null
                            ? mergedSettings.disableForegroundColor
                            : mergedSettings.foregroundColor,
                      ),
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
                InkWell(
                  splashColor: mergedSettings.splashColor,
                  borderRadius: BorderRadius.circular(mergedSettings.borderRadius ?? 0),
                  onTap: onTap == null ? null : handleTap,
                  child: Ink(
                    padding: mergedSettings.contentPadding,
                    height: mergedSettings.takeFullSpace == true ? mergedSettings.height : null,
                    width: mergedSettings.takeFullSpace == true ? mergedSettings.width : null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(mergedSettings.borderRadius ?? 0),
                      color: onTap == null
                          ? mergedSettings.disableBackgroundColor
                          : mergedSettings.backgroundColor,
                      boxShadow: [
                        if ((mergedSettings.elevation ?? 0) > 0)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: mergedSettings.elevation ?? 4,
                            offset: Offset(0, (mergedSettings.elevation ?? 4) / 2),
                          ),
                      ],
                    ),
                    child: AnimatedOpacity(
                      opacity: isLoading ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: buttonContent,
                    )
                  ),
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