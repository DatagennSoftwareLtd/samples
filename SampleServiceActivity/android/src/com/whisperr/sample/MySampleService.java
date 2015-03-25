package com.whisperr.sample;
import org.qtproject.qt5.android.addons.qtactivityapp.QtService;
import android.util.Log;
public class MySampleService extends QtService
{
    public void onCreate()
    {
        Log.w(getClass().getName(), "Starting whisperr service");
        super.setActivityClass(MySampleActivity.class);
        super.onCreate();
    }
}
