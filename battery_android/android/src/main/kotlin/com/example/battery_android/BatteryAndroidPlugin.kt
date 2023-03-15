package com.example.battery_android

import android.content.Context
import android.content.Context.BATTERY_SERVICE
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.NonNull
import com.example.battery_android.Battery.BatteryApi

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** BatteryAndroidPlugin */
class BatteryAndroidPlugin: FlutterPlugin, BatteryApi/*MethodCallHandler*/ {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  //private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    //channel = MethodChannel(flutterPluginBinding.binaryMessenger, "battery_android")
    //channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
    Battery.BatteryApi.setup(flutterPluginBinding.binaryMessenger, this, context)
  }

  override fun getBatteryPourcentage(context: Context): Long {
    val batteryLevel = getBatteryPercentage(context = context)
    return batteryLevel.toLong()
  }

  private fun getBatteryPercentage(context: Context): Int {
    return if (Build.VERSION.SDK_INT >= 21) {
      val bm = context.getSystemService(BATTERY_SERVICE) as BatteryManager
      bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)

    } else {
      val iFilter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
      val batteryStatus: Intent = context.registerReceiver(null, iFilter)!!
      val level = batteryStatus.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
      val scale = batteryStatus.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
      val batteryPct = scale.let { level.div(it.toDouble()) }
      (batteryPct.times(100)).toInt()
    }
  }

  /*override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getBatteryPourcentage") {
      val batteryPercentage = Battery.getBatteryPercentage(context)
      result.success(batteryPercentage)
    } else {
      result.notImplemented()
    }
  }*/

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    Battery.BatteryApi.setup(binding.binaryMessenger, null, null)

  }
}
