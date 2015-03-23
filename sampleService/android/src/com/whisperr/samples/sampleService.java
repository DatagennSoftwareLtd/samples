package com.whisperr.samples;
import org.qtproject.qt5.android.addons.qtserviceapp.QtService;
import android.util.Log;
public class sampleService extends QtService {
    public void onCreate()
    {
        Log.w(getClass().getName(), "Starting datasync service");
        super.setActivityClass(sampleServiceActivity.class);
        super.onCreate();
    }
}

