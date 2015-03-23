package com.whisperr.samples;
import com.whisperr.samples.R;
import org.qtproject.qt5.android.addons.qtserviceapp.QtServiceActivity;
import android.os.Bundle;
import android.util.Log;
public class sampleServiceActivity extends QtServiceActivity {
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        Log.w(getClass().getName(), "Starting datasync service activity");
        super.setActivityClass(sampleService.class);
        super.onCreate(savedInstanceState);
    }
}

