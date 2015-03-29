package org.qtproject.qt5.android.addons.qtactivityapp;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;

import dalvik.system.DexClassLoader;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;
import android.os.Process;
import android.widget.Toast;

import android.net.Uri;
import android.media.RingtoneManager;

public class QtService extends Service
{
    public static final String EXTRA_MESSAGE = "EXTRA_MESSAGE";

    private boolean isRunning = false;
    private ComponentName myService;
    private Class m_class = QtServiceActivity.class;

    private static ServiceInfo m_serviceInfo = null;
    private static NotificationManager m_notificationManager;
    private static Notification.Builder m_builder;
    private static QtService m_instance;
    private static String m_lib_name;
    private static PendingIntent pi;

    //private static Builder messageNotification;

    /* Event handling */

    public void onCreate (){

        Log.w(getClass().getName(), "Service created ...");

        m_instance = this;

        try{
            ComponentName myService = new ComponentName(this, this.getClass());
            m_serviceInfo = getPackageManager().getServiceInfo(myService, PackageManager.GET_META_DATA);
            m_lib_name = splitCamelCase (m_serviceInfo.metaData.getString("android.app.lib_name"));
        }
        catch (Exception e) {

            e.printStackTrace();
        }
    }

    public IBinder onBind(Intent intent){

        return(null);
    }

    public int onStartCommand(Intent intent, int flags, int startId){

        /* Notification */

        Notification note = new Notification(m_serviceInfo.metaData.getInt("android.app.notificon")
            ,"" , System.currentTimeMillis());

        Intent i = new Intent(m_instance, m_class);
        i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP|Intent.FLAG_ACTIVITY_SINGLE_TOP);

        pi = PendingIntent.getActivity(this, 0, i, 0);

        note.setLatestEventInfo(this, "Whisperr"/*m_lib_name*/,
            "Running",
            pi);
        note.flags |= Notification.FLAG_NO_CLEAR;

        startForeground(1337, note);

        /* Return */

        return(START_STICKY);
    }

    public void onDestroy(){

        Log.w(getClass().getName(), "Service destroyed ...");

        Process.killProcess(Process.myPid());
    }

    /* Activity class */

    public void setActivityClass(Class cl){

        m_class = cl;
    }

    /* Notification methods */

    public static void notify(String s){

        if (m_notificationManager == null) {

            m_notificationManager = (NotificationManager)m_instance.getSystemService(Context.NOTIFICATION_SERVICE);
            m_builder = new Notification.Builder(m_instance);
            m_builder.setSmallIcon(m_serviceInfo.metaData.getInt("android.app.notificon"));
            m_builder.setContentTitle("Whisperr"/*m_lib_name*/);
            m_builder.setContentIntent(pi);
        }

        m_builder.setContentText(s);
        Notification note = m_builder.build();
        note.flags |= Notification.FLAG_NO_CLEAR;
        m_notificationManager.notify(1337, note);
    }

    public static void notifyIM(String s1, String s2)
    {

        if (m_notificationManager == null) {
            m_notificationManager = (NotificationManager)m_instance.getSystemService(Context.NOTIFICATION_SERVICE);
        }
        /*
            m_builder = new Notification.Builder(m_instance);
            m_builder.setSmallIcon(m_serviceInfo.metaData.getInt("android.app.notificon"));
            m_builder.setContentTitle("IM from:" + s1);
            m_builder.setContentIntent(pi);
        }
        */

        Notification.Builder mbuilder = new Notification.Builder(m_instance);
        mbuilder.setSmallIcon(m_serviceInfo.metaData.getInt("android.app.notificon"));
        mbuilder.setContentTitle("IM from: " + s1);
        mbuilder.setContentIntent(pi);
        mbuilder.setContentText(s2);
        mbuilder.setAutoCancel(true);


        Notification note = mbuilder.build();
        //note.putExtra(, s1);
        //note.flags |= Notification.FLAG_NO_CLEAR;
        long[] vibrate = new long[] { 1000, 1000, 1000, 1000, 1000 };
        note.vibrate = vibrate;
        m_notificationManager.notify(1, note);

        /*
        NotificationCompat.Builder mBuilder =
                new NotificationCompat.Builder(this)
                .setSmallIcon(m_serviceInfo.metaData.getInt("android.app.notificon"));
                .setContentTitle("From: " + s1)
                .setContentText(s2);
        // Creates an explicit intent for an Activity in your app
        Intent resultIntent = new Intent(m_instance, m_class);

        // The stack builder object will contain an artificial back stack for the
        // started Activity.
        // This ensures that navigating backward from the Activity leads out of
        // your application to the Home screen.
        TaskStackBuilder stackBuilder = TaskStackBuilder.create(m_instance);
        // Adds the back stack for the Intent (but not the Intent itself)
        stackBuilder.addParentStack(m_class);
        // Adds the Intent that starts the Activity to the top of the stack
        stackBuilder.addNextIntent(resultIntent);
        PendingIntent resultPendingIntent =
                stackBuilder.getPendingIntent(0, PendingIntent.FLAG_UPDATE_CURRENT);
        mBuilder.setContentIntent(resultPendingIntent);
        NotificationManager mNotificationManager =
            (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        // mId allows you to update the notification later on.
        mNotificationManager.notify(mId, mBuilder.build());
        */
    }

    public static void notifyIncomming(String s1)
    {
        if (m_notificationManager == null) {
            m_notificationManager = (NotificationManager)m_instance.getSystemService(Context.NOTIFICATION_SERVICE);
        }

        Notification.Builder mbuilder = new Notification.Builder(m_instance);
        mbuilder.setSmallIcon(m_serviceInfo.metaData.getInt("android.app.notificon"));
        mbuilder.setContentTitle("incomming call");
        mbuilder.setContentIntent(pi);
        mbuilder.setContentText(s1);
        mbuilder.setAutoCancel(true);


        Notification note = mbuilder.build();
        long[] vibrate = new long[] { 1000, 1000, 1000, 1000, 1000 };
        note.vibrate = vibrate;
        m_notificationManager.notify(2, note);
    }

/*
    public static void showNotificationForMessage(String s1, String s2) {

        String from = s1;

        CharSequence tickerText = buildTickerMessage(context, from, s2);

        if (messageNotification == null) {
                messageNotification = new NotificationCompat.Builder(m_instance);
                messageNotification.setSmallIcon(m_serviceInfo.metaData.getInt("android.app.notificon")));
                messageNotification.setTicker(tickerText);
                messageNotification.setWhen(System.currentTimeMillis());
                messageNotification.setDefaults(Notification.DEFAULT_ALL);
                messageNotification.setAutoCancel(true);
                messageNotification.setOnlyAlertOnce(true);
        }

        Intent notificationIntent = new Intent(SipManager.ACTION_SIP_MESSAGES);
        notificationIntent.putExtra(SipMessage.FIELD_FROM, msg.getFrom());
        notificationIntent.putExtra(SipMessage.FIELD_BODY, msg.getBody());
        notificationIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        PendingIntent contentIntent = PendingIntent.getActivity(context, 0, notificationIntent, PendingIntent.FLAG_CANCEL_CURRENT);

        messageNotification.setContentTitle(from);
        messageNotification.setContentText(msg.getBody());
        messageNotification.setContentIntent(contentIntent);

        notificationManager.notify(MESSAGE_NOTIF_ID, messageNotification.build());

    }
*/
    /* Helper classes */

    static String splitCamelCase(String sp) {

        String s = Character.toUpperCase(sp.charAt(0)) + sp.substring(1);

        return s.replaceAll(
          String.format("%s|%s|%s",
             "(?<=[A-Z])(?=[A-Z][a-z])",
             "(?<=[^A-Z])(?=[A-Z])",
             "(?<=[A-Za-z])(?=[^A-Za-z])"
          ),
          " "
       );
    }
/*
    protected static CharSequence buildTickerMessage(Context context, String address, String body) {
        String displayAddress = address;

        StringBuilder buf = new StringBuilder(displayAddress == null ? "" : displayAddress.replace('\n', ' ').replace('\r', ' '));
        buf.append(':').append(' ');

        int offset = buf.length();

        if (!TextUtils.isEmpty(body)) {
            body = body.replace('\n', ' ').replace('\r', ' ');
            buf.append(body);
        }

        SpannableString spanText = new SpannableString(buf.toString());
        spanText.setSpan(new StyleSpan(Typeface.BOLD), 0, offset, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);

        return spanText;
    }
    */
}
