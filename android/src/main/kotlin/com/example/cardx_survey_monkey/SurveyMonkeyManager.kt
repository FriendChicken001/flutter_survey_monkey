package com.example.cardx_survey_monkey

import android.app.Activity
import com.surveymonkey.surveymonkeyandroidsdk.SurveyMonkey

class SurveyMonkeyManager {
    private val surveyMonkey = SurveyMonkey()

    companion object {
        const val REQUEST_CODE = 999
    }

    fun startSurvey(activity: Activity?, surveyHash: String?) {
        activity ?: return
        surveyHash ?: return

        surveyMonkey.startSMFeedbackActivityForResult(
            activity,
            REQUEST_CODE,
            surveyHash
        )
    }
}