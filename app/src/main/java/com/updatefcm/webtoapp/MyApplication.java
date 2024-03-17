package com.updatefcm.webtoapp;

import android.app.Application;
import android.os.Build;

import com.onesignal.Continue;
import com.onesignal.OneSignal;
import com.onesignal.debug.LogLevel;

public class MyApplication extends Application {


    @Override
    public void onCreate() {
        super.onCreate();
        OneSignal.getDebug().setLogLevel(LogLevel.VERBOSE);
        OneSignal.initWithContext(this, webServerPage.ONESIGNAL_APP_ID);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            OneSignal.getNotifications().requestPermission(true, Continue.with(r -> {
                if (r.isSuccess()) {
                    if (r.getData()) {
                        // `requestPermission` completed successfully and the user has accepted permission
                    } else {
                        // `requestPermission` completed successfully but the user has rejected permission
                    }
                } else {
                    // `requestPermission` completed unsuccessfully, check `r.getThrowable()` for more info on the failure reason
                }
            }));
        }

    }
}