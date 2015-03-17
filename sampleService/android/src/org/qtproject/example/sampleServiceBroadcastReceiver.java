package org.qtproject.example;

import org.qtproject.qt5.android.addons.qtserviceapp.QtServiceBroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
public class SampleServiceBroadcastReceiver extends QtServiceBroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        Log.w(getClass().getName(), "Broadcast received for Comservice");
        super.setActivityClass(SampleService.class);
        super.onReceive(context, intent);
    }
}

