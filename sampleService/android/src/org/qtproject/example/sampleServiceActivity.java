package org.qtproject.example;

import org.qtproject.example.R;
import org.qtproject.qt5.android.addons.qtserviceapp.QtServiceActivity;
import android.os.Bundle;
import android.util.Log;
public class SampleServiceActivity extends QtServiceActivity {
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        Log.w(getClass().getName(), "Starting datasync service activity");
        super.setActivityClass(SampleService.class);
        super.onCreate(savedInstanceState);
    }
}

