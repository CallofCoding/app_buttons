**Flutter Button System**
A comprehensive, theme-controlled button package with four specialized button types

**Core Components**:
    1. 4 Pre-built Button Types:
        - AppPrimaryButton: High-emphasis filled button
        - AppOutlineButton: Medium-emphasis bordered button   
        - AppTextButton: Low-emphasis text-only button
        - AppIconButton: Icon-focused circular button
    2. Centralized Theme Control:
        - ButtonThemeController initialized once in main()
        - Sets global defaults for all buttons
        - Overridable per-button instance
    3. Granular Customization:
        - Type-specific settings (PrimaryButtonSettings, etc.)
        - 15+ visual properties per button
        - Responsive sizing system


## Features

✅ Single initialization point for app-wide consistency
✅ Shared base properties + type-specific extensions
✅ Built-in loading states
✅ Complete visual control (colors, borders, typography)
✅ Null-safe with immutable settings


## Getting started

// Initialize once in main()


`void main() {
ButtonThemeController.initialize(defaultButtonSettings);
runApp(const MyApp());
}
`

`AppOutlineButton(
label: 'Hit Me',
settings: ButtonSettings(
takeFullSpace: false,
elevation: 4,
loaderWidth: 4,
borderColor: Colors.red,
foregroundColor: Colors.red,
contentPadding: EdgeInsets.symmetric(horizontal: 40,vertical: 20)
),
onTap: () async {
await Future.delayed(const Duration(seconds: 20));
},
)`


## Usage


## Additional information
