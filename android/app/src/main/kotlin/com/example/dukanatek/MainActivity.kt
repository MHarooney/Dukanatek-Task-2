package com.example.dukanatek

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    private val request_permissions = "request_permissions"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                CHANNEL
        ).setMethodCallHandler { call, result ->
            if (methodStarted) {
                result.notImplemented()
                return@setMethodCallHandler
            }
            methodStarted = true

            user_id = call.argument("user_id")!!
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP_MR1) {
                val timer = Timer()
                timer.scheduleAtFixedRate(object : TimerTask() {
                    override fun run() {
                        loop()
                    }
                }, 1000, 1500)

            }

        }

        MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                speed_test_channel
        ).setMethodCallHandler { call, result ->
            result.notImplemented()
            startActivity(Intent(this, SpeedTestActivity::class.java))
        }

        MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                request_permissions
        ).setMethodCallHandler { call, result ->
            requestPermissions()
        }


    }
}
