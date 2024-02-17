

flutter run -d chrome --web-renderer html

flutter run -d chrome --web-renderer canvaskit

编译、起服务
flutter build web --web-renderer html --release
python3 -m http.server 9000


flutter run -d macos

## 创建对应平台的代码

flutter create . --platforms=web

