# FlutterSoftwareRenderer
A simple software 3D modeler written in Flutter and Dart as a [Desktop application](https://flutter.dev/multi-platform/desktop).

Flutter doesn't have a way of parking an SDL window within the application because Flutter **is** the window. Dart can because it doens't have a *window*.

Thus is app uses Canvas to draw pixels, however, the number of pixels is limited by the bus bandwidth between the CPU and GPU. Depending on how capable your GPU is you may only have about 10,000 to 40,000 pixels at 60fps = 16.7ms frame rates. This is a window of 100x100 to 200x200 which isn't very large. But it will do for the purposes of this application.

# Info
The application is built in various stages:
- "test_drive" A default desktop app
- "basic_line" A demo of a line on a Canvas

# Notes
## Custom paint widgets
- https://www.youtube.com/watch?v=pD38Yyz7N2E performance and points
- https://stackoverflow.com/questions/75838382/flutter-canvas-draw-raw-points-with-different-colors points
- https://codewithandrea.com/videos/flutter-custom-painting-do-not-fear-canvas/
- https://www.kodeco.com/26483389-flutter-canvas-api-getting-started
- https://api.flutter.dev/flutter/dart-ui/dart-ui-library.html
- https://getstream.io/blog/definitive-flutter-painting-guide/ in depth

# Create
```sh
flutter create desktop-app

or

flutter create --platform linux --template app basic_line
```

# Tutorials and examples
- https://blog.logrocket.com/building-flutter-desktop-app-tutorial-examples/

# Running the app
```sh
flutter run -d linux
```