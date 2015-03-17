package org.qtproject.example;

import org.qtproject.qt5.android.addons.qtserviceapp.QtService;
import android.util.Log;
public class SampleService extends QtService {
    public void onCreate()
    {
        Log.w(getClass().getName(), "Starting datasync service");
        super.setActivityClass(SampleServiceActivity.class);
        super.onCreate();
    }
}

