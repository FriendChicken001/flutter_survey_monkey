package com.example.cardx_survey_monkey

import android.app.Activity
import android.content.Intent

import io.flutter.embedding.engine.plugins.FlutterPlugin

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

class CardxSurveyMonkeyPlugin: FlutterPlugin,
    MethodChannel.MethodCallHandler,
    PluginRegistry.ActivityResultListener {

    private lateinit var channel: MethodChannel
    private var activity: Activity? = null
    private val surveyManager = SurveyMonkeyManager()

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "cardx_survey_monkey")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "startSurveyMonkey") {
            val hash = call.argument<String>("hash")
            surveyManager.startSurvey(activity, hash)
            result.success("opened survey with hash: $hash")
        } else {
            result.notImplemented()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
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

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
