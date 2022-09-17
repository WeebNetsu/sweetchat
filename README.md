# Sweet Chat

Social Media platform for talking to your friends.

## Running

1. Get code on your system, `git clone ...`
1. Install all dependencies with `flutter pub get`
1. Run with `flutter run`

For easy no-code way of doing above, use VSCode with the Flutter extension.

## Project structure explaination

(from project root)

- `pubspec.yaml` - Dependencies and project configurations
- `I10n.yaml` - Multi-language support configuration
- `android` - Any native Android code goes here, same idea for `ios`, `linux`, `macos`, `windows` and `web`
- `assets` - All project assets
- `test` - Project tests
- `lib` - Project code
  - `I10n` - All project language identifiers
  - `pages` - App pages/views
    - `x/widgets` - Local widgets
    - `x/tabs` - If page has AppBar tabs, they go here
  - `providers` - Notifications and other services
  - `utils` - Extra functions that should be globally accessible
  - `widgets` - Global widgets (not scoped to specific page)
