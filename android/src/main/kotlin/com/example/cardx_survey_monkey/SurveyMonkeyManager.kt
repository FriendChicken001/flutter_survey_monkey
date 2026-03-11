package com.example.cardx_survey_monkey

import android.app.Activity
import com.surveymonkey.surveymonkeyandroidsdk.SurveyMonkey
import io.flutter.Log

class SurveyMonkeyManager {

    private val surveyMonkey = SurveyMonkey()

    companion object {
        const val REQUEST_CODE = 9901
    }

    fun startSurvey(activity: Activity?, surveyHash: String, appName: String?) {

        if (activity == null) return

        surveyMonkey.onStart(
            activity,
            appName,
            REQUEST_CODE,
            surveyHash
        )

        surveyMonkey.startSMFeedbackActivityForResult(
            activity,
            REQUEST_CODE,
            surveyHash
        )
    }
}