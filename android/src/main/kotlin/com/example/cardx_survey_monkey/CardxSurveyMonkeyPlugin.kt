package com.example.cardx_survey_monkey

import android.app.Activity
import android.content.Intent

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

class CardxSurveyMonkeyPlugin: FlutterPlugin,
    MethodChannel.MethodCallHandler,
    PluginRegistry.ActivityResultListener,
    ActivityAware {

    private lateinit var channel: MethodChannel
    private var activity: Activity? = null
    private val surveyManager = SurveyMonkeyManager()

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "cardx_survey_monkey")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "startSurveyMonkey") {
            try {
                val appName = call.argument<String>("appName")
                val hash = call.argument<String>("hash")

                if (hash.isNullOrEmpty()) {
                    result.error("INVALID_ARGUMENT", "Hash cannot be null or empty", null)
                    return
                }

                surveyManager.startSurvey(activity, hash, appName)
                result.success("opened with hash: $hash")
            } catch (e: java.net.UnknownHostException) {
                result.error("NETWORK_ERROR", "Cannot connect to SurveyMonkey", null)
            } catch (e: Exception) {
                result.error("SURVEY_ERROR", e.message, null)
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onActivityResult(
        requestCode: Int,
        resultCode: Int,
        data: Intent?
    ): Boolean {
        if (requestCode == SurveyMonkeyManager.REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                val res = data?.getStringExtra("smRespondent")
                channel.invokeMethod("surveyResult", res)
            } else {
                channel.invokeMethod("surveyResult", null)
            }
            return true
        }
        return false
    }
}