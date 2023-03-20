flutter pub run pigeon \
  --input lib/battery_host_api.dart \
  --dart_out ../battery_platform_interface/lib/battery_api.dart \
  --dart_out ../battery_ios/lib/battery_ios_api.dart 
  #--dart_out ../battery_android/lib/battery_android_api.dart \
  #--experimental_swift_out ../battery_ios/ios/Classes/Battery.swift \
  #--java_out ../battery_android/android/src/main/java/com/example/battery_android/Battery.java \
  #--java_package "com.example.battery_android" 


  #--dart_out ../battery_android/lib/battery_android_api.dart \
  #--dart_out ../battery_ios/lib/battery_ios_api.dart \
  