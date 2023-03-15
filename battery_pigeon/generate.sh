flutter pub run pigeon \
  --input lib/battery_host_api.dart \
  --dart_out ../battery_platform_interface/lib/battery_api.dart \
  --java_out ../battery_android/android/src/main/java/com/example/battery_android/Battery.java \
  --java_package "com.example.battery_android"