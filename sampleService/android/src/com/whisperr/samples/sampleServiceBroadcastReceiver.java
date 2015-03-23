package com.whisperr.samples;
import org.qtproject.qt5.android.addons.qtserviceapp.QtServiceBroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
public class sampleServiceBroadcastReceiver extends QtServiceBroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        Log.w(getClass().getName(), "Broadcast received for Comservice");
        super.setActivityClass(sampleService.class);
        super.onReceive(context, intent);
    }
}

