package com.example.battery_android

import android.content.Context
import android.content.Context.BATTERY_SERVICE
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build

class Battery {
    companion object {
        fun getBatteryPercentage(context: Context): Int {
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
    }
}