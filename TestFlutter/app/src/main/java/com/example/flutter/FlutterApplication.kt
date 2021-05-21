package com.example.flutter

import android.annotation.SuppressLint
import android.app.Application
import android.util.Log
import com.idlefish.flutterboost.FlutterBoost
import com.idlefish.flutterboost.FlutterBoostDelegate
import io.flutter.app.FlutterApplication
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant


/**
 *  author : ChenWei
 *  date : 2019-10-08 16:30
 *  description :
 */

class MyApplication : FlutterApplication() {
    private var app: Application? = null

    companion object {
        @SuppressLint("StaticFieldLeak")
        lateinit var mEngine: FlutterEngine

        /**
         * 获取flutter引擎
         */
        fun getFlutterEngine(): FlutterEngine? {
            return mEngine
        }
    }

    override fun onCreate() {
        super.onCreate()
        app = this
        init()
    }

    private fun init() {
        app?.let {
            FlutterBoost.instance().setup(it, object : FlutterBoostDelegate {
                override fun pushFlutterRoute(
                    pageName: String?,
                    uniqueId: String?,
                    arguments: MutableMap<String, Any>?
                ) {
                    Log.e("pushFlutterRoute", "13134355235346346456")
                }

                override fun pushNativeRoute(
                    pageName: String?,
                    arguments: MutableMap<String, Any>?
                ) {
                    Log.e("pushNativeRoute", "13134355235346346456")
                }
            }) { engine ->
                engine?.let { eng ->
                    mEngine = eng
                    eng.plugins
                    GeneratedPluginRegistrant.registerWith(eng)
                }
            }
        }
    }
}