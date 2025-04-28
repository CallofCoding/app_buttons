
import 'package:flutter/material.dart';

class ButtonSettings{
  final double? height;
  final double? width;
  final bool? takeFullSpace; //if false, height width will be ignored
  final Color? splashColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disableBackgroundColor;
  final Color? disableForegroundColor;
  final Color? borderColor;
  final double borderWidth;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final TextStyle? style;
  final double? iconSize;
  final double? loaderWidth;
  final double? loaderSize;

  ButtonSettings(
      {this.height,
      this.width,
      this.splashColor,
      this.backgroundColor,
      this.foregroundColor,
      this.borderColor,
      this.borderWidth = 1,
      this.borderRadius,
      this.contentPadding,
      this.margin,
      this.elevation,
      this.style,
      this.takeFullSpace,
      this.disableBackgroundColor,
      this.disableForegroundColor,
      this.iconSize,
      this.loaderWidth,
      this.loaderSize});

  ButtonSettings merge(ButtonSettings? override) {
    if (override == null) return this;
    return ButtonSettings(
      height: override.height ?? height,
      width: override.width ?? width,
      takeFullSpace: override.takeFullSpace ?? takeFullSpace,
      splashColor: override.splashColor ?? splashColor,
      backgroundColor: override.backgroundColor ?? backgroundColor,
      foregroundColor: override.foregroundColor ?? foregroundColor,
      disableBackgroundColor: override.disableBackgroundColor ?? disableBackgroundColor,
      disableForegroundColor: override.disableForegroundColor ?? disableForegroundColor,
      borderColor: override.borderColor ?? borderColor,
      borderRadius: override.borderRadius ?? borderRadius,
      contentPadding: override.contentPadding ?? contentPadding,
      margin: override.margin ?? margin,
      elevation: override.elevation ?? elevation,
      style: override.style ?? style,
      iconSize: override.iconSize ?? iconSize,
      loaderWidth: override.loaderWidth ?? loaderWidth,
      borderWidth: override.borderWidth,
      loaderSize: override.loaderSize ?? loaderSize,
    );
  }

}