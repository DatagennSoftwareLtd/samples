package com.whisperr.sample;
import org.qtproject.qt5.android.addons.qtactivityapp.QtServiceActivity;
import org.qtproject.qt5.android.addons.qtactivityapp.QtService;
import android.os.Bundle;
import android.content.Intent;
import android.content.ComponentName;
import android.util.Log;
public class MySampleActivity extends QtServiceActivity
{
    public void onCreate(Bundle savedInstanceState)
    {
        Log.w(getClass().getName(), "Starting whisperr");
        super.setServiceClass(MySampleService.class);
        super.onCreate(savedInstanceState);
    }

    public static void startService()
    {
        //Log.w("startService");
    }

    public static void stopService()
    {
        //Log.w("stopService");
    }
}
