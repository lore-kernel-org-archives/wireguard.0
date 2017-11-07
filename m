Return-Path: aurelien@chabot.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45a4fc8f
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:21 +0000 (UTC)
Received: from 8.mo6.mail-out.ovh.net (8.mo6.mail-out.ovh.net [178.33.42.204])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2973548
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:19 +0000 (UTC)
Received: from player696.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id A5A7211D453
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 05:39:29 +0100 (CET)
From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 3/4] Add support of wireguard-go as an Android Vpn Service
Date: Tue,  7 Nov 2017 15:38:14 +1100
Message-Id: <20171107043817.9050-4-aurelien@chabot.fr>
In-Reply-To: <20171107043817.9050-1-aurelien@chabot.fr>
References: <20171107043817.9050-1-aurelien@chabot.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Signed-off-by: Aurélien Chabot <aurelien@chabot.fr>
---
 .gitignore                                         |   5 +
 app/build.gradle                                   |   1 +
 app/src/main/AndroidManifest.xml                   |  17 +-
 .../java/com/wireguard/android/AddActivity.java    |   5 +-
 .../com/wireguard/android/AndroidVpnService.java   | 147 +++++++
 .../com/wireguard/android/BaseConfigActivity.java  |  55 ++-
 .../com/wireguard/android/BaseConfigFragment.java  |   2 +-
 .../wireguard/android/BootCompletedReceiver.java   |   2 +-
 .../java/com/wireguard/android/ConfigActivity.java |   4 +-
 .../com/wireguard/android/ConfigEditFragment.java  |   6 +-
 .../com/wireguard/android/ConfigListFragment.java  |   4 +-
 .../wireguard/android/ConfigListPreference.java    |   2 +-
 .../java/com/wireguard/android/ConfigManager.java  | 412 +++++++++++++++++++
 .../com/wireguard/android/KernelVpnService.java    | 115 ++++++
 .../com/wireguard/android/QuickTileService.java    |  30 +-
 .../java/com/wireguard/android/VpnService.java     | 446 +++------------------
 app/src/main/java/com/wireguard/config/Config.java |  12 +-
 .../main/java/com/wireguard/config/Interface.java  |  12 +-
 .../java/com/wireguard/config/IpcAttribute.java    |  55 +++
 .../java/com/wireguard/config/IpcSerializable.java |   9 +
 app/src/main/java/com/wireguard/config/Peer.java   |  21 +-
 .../java/com/wireguard/crypto/KeyEncoding.java     |  12 +
 .../main/java/com/wireguard/crypto/Keypair.java    |   6 +
 app/src/main/res/layout/config_list_item.xml       |   4 +-
 app/src/main/res/values/strings.xml                |   2 +
 app/src/main/res/xml/preferences.xml               |   5 +
 settings.gradle                                    |   2 +-
 wireguardbinding/build.gradle                      |   2 +
 wireguardbinding/src/wireguard                     |   1 +
 .../src/wireguardbinding/tun_android.go            |  61 +++
 wireguardbinding/src/wireguardbinding/wireguard.go |  49 +++
 31 files changed, 1053 insertions(+), 453 deletions(-)
 create mode 100644 app/src/main/java/com/wireguard/android/AndroidVpnService.java
 create mode 100644 app/src/main/java/com/wireguard/android/ConfigManager.java
 create mode 100644 app/src/main/java/com/wireguard/android/KernelVpnService.java
 create mode 100644 app/src/main/java/com/wireguard/config/IpcAttribute.java
 create mode 100644 app/src/main/java/com/wireguard/config/IpcSerializable.java
 create mode 100644 wireguardbinding/build.gradle
 create mode 120000 wireguardbinding/src/wireguard
 create mode 100644 wireguardbinding/src/wireguardbinding/tun_android.go
 create mode 100644 wireguardbinding/src/wireguardbinding/wireguard.go

diff --git a/.gitignore b/.gitignore
index 32babdb..b9e505b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -5,7 +5,12 @@
 .DS_Store
 Thumbs.db
 build/
+*.swp
 *.apk
 *.class
 *.dex
 *.iml
+*.a
+*.aar
+wireguardbinding/pkg
+wireguardbinding/src/golang.org
diff --git a/app/build.gradle b/app/build.gradle
index 5caf20b..384c09f 100644
--- a/app/build.gradle
+++ b/app/build.gradle
@@ -23,4 +23,5 @@ android {
 
 dependencies {
     compile fileTree(dir: 'libs', include: ['*.jar'])
+    compile project(':wireguardbinding')
 }
diff --git a/app/src/main/AndroidManifest.xml b/app/src/main/AndroidManifest.xml
index 1563d31..7685dc8 100644
--- a/app/src/main/AndroidManifest.xml
+++ b/app/src/main/AndroidManifest.xml
@@ -4,6 +4,7 @@
     android:installLocation="internalOnly">
 
     <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
+    <uses-permission android:name="android.permission.INTERNET" />
 
     <application
         android:allowBackup="false"
@@ -48,9 +49,23 @@
                 android:name="android.service.quicksettings.ACTIVE_TILE"
                 android:value="true" />
         </service>
+
+        <service android:name=".ConfigManager" />
+
         <service
-            android:name=".VpnService"
+            android:name=".KernelVpnService"
             android:exported="false" />
+
+        <service
+             android:name=".AndroidVpnService"
+             android:permission="android.permission.BIND_VPN_SERVICE" >
+             <intent-filter>
+                 <action android:name="android.net.VpnService" />
+             </intent-filter>
+         </service>
+
+
+
     </application>
 
 </manifest>
diff --git a/app/src/main/java/com/wireguard/android/AddActivity.java b/app/src/main/java/com/wireguard/android/AddActivity.java
index 080eeca..2cb729d 100644
--- a/app/src/main/java/com/wireguard/android/AddActivity.java
+++ b/app/src/main/java/com/wireguard/android/AddActivity.java
@@ -30,8 +30,9 @@ public class AddActivity extends BaseConfigActivity {
     }
 
     @Override
-    protected void onServiceAvailable() {
-        super.onServiceAvailable();
+    protected void onConfigManagerAvailable() {
+        super.onConfigManagerAvailable();
+
         final FragmentManager fm = getFragmentManager();
         ConfigEditFragment fragment = (ConfigEditFragment) fm.findFragmentById(R.id.master_fragment);
         if (fragment == null) {
diff --git a/app/src/main/java/com/wireguard/android/AndroidVpnService.java b/app/src/main/java/com/wireguard/android/AndroidVpnService.java
new file mode 100644
index 0000000..2a83827
--- /dev/null
+++ b/app/src/main/java/com/wireguard/android/AndroidVpnService.java
@@ -0,0 +1,147 @@
+package com.wireguard.android;
+
+import android.content.Intent;
+import android.os.AsyncTask;
+import android.os.Binder;
+import android.os.IBinder;
+import android.os.ParcelFileDescriptor;
+import android.util.Log;
+
+import com.wireguard.config.Config;
+
+import wireguardbinding.Wireguardbinding;
+
+public class AndroidVpnService extends android.net.VpnService
+        implements com.wireguard.android.VpnService {
+    private static final String TAG = "AndroidVpnService";
+
+    private static AndroidVpnService instance;
+    public static AndroidVpnService getInstance() {
+        return instance;
+    }
+
+    private final IBinder binder = new Binder();
+    private String enabledConfig;
+
+    @Override
+    public void disable(final String name) {
+        final Config config = ConfigManager.getInstance().get(name);
+        if (config == null || !config.isEnabled())
+            return;
+        new ConfigDisabler(config).execute();
+    }
+
+    @Override
+    public void enable(final String name) {
+        if (enabledConfig != null) // One config at a time
+            return;
+
+        final Config config = ConfigManager.getInstance().get(name);
+        if (config == null || config.isEnabled())
+            return;
+
+        new ConfigEnabler(config).execute();
+    }
+
+    @Override
+    public IBinder onBind(final Intent intent) {
+        instance = this;
+        return binder;
+    }
+
+    @Override
+    public void onRevoke() {
+        if (enabledConfig != null)
+            disable(enabledConfig);
+        stopSelf();
+    }
+
+    @Override
+    public void onCreate() {
+        super.onCreate();
+        // Ensure the service sticks around after being unbound. This only needs to happen once.
+        startService(new Intent(this, getClass()));
+    }
+
+    @Override
+    public int onStartCommand(final Intent intent, final int flags, final int startId) {
+        instance = this;
+        return START_STICKY;
+    }
+
+    private class ConfigDisabler extends AsyncTask<Void, Void, Boolean> {
+        private final Config config;
+
+        private ConfigDisabler(final Config config) {
+            this.config = config;
+        }
+
+        @Override
+        protected Boolean doInBackground(final Void... voids) {
+            Wireguardbinding.stop();
+            return true;
+        }
+
+        @Override
+        protected void onPostExecute(final Boolean result) {
+            if (!result)
+                return;
+            ConfigManager.getInstance().setIsEnable(config.getName(), false);
+            enabledConfig = null;
+        }
+    }
+
+    private class ConfigEnabler extends AsyncTask<Void, Void, Boolean> {
+        private final Config config;
+
+        private ConfigEnabler(final Config config) {
+            this.config = config;
+        }
+
+        @Override
+        protected Boolean doInBackground(final Void... voids) {
+            // Vpn service need to be already ready
+            if(prepare(getBaseContext()) != null)
+                return false;
+
+            Builder builder = new Builder();
+
+            builder.setSession(config.getName());
+            builder.addAddress(config.getInterface().getAddress(), 32);
+            if (config.getInterface().getDns() != null)
+                builder.addDnsServer(config.getInterface().getDns());
+            builder.addRoute("0.0.0.0", 0);
+            builder.setBlocking(true);
+            ParcelFileDescriptor tun = builder.establish();
+            if (tun == null) {
+                Log.d(TAG, "Unable to create tun device");
+                return false;
+            }
+
+            Wireguardbinding.start(tun.detachFd(), config.getName());
+            long socket = 0;
+            while((socket = Wireguardbinding.socket()) == 0) {
+                Log.d(TAG, "Wait for socket");
+                try {
+                    Thread.sleep(1000);
+                } catch (InterruptedException e) {
+                    e.printStackTrace();
+                }
+            }
+
+            protect((int) socket);
+
+            Wireguardbinding.setConf(config.toIpcString());
+
+            return true;
+        }
+
+        @Override
+        protected void onPostExecute(final Boolean result) {
+            if (!result)
+                return;
+            ConfigManager.getInstance().setIsEnable(config.getName(), true);
+            enabledConfig = config.getName();
+        }
+    }
+}
diff --git a/app/src/main/java/com/wireguard/android/BaseConfigActivity.java b/app/src/main/java/com/wireguard/android/BaseConfigActivity.java
index 17ca3b6..4417063 100644
--- a/app/src/main/java/com/wireguard/android/BaseConfigActivity.java
+++ b/app/src/main/java/com/wireguard/android/BaseConfigActivity.java
@@ -4,7 +4,6 @@ import android.app.Activity;
 import android.content.ComponentName;
 import android.content.Context;
 import android.content.Intent;
-import android.content.ServiceConnection;
 import android.os.Bundle;
 import android.os.IBinder;
 
@@ -43,12 +42,19 @@ abstract class BaseConfigActivity extends Activity {
             initialConfig = intent.getStringExtra(KEY_CURRENT_CONFIG);
             wasEditing = intent.getBooleanExtra(KEY_IS_EDITING, false);
         }
-        // Trigger starting the service as early as possible
-        if (VpnService.getInstance() != null)
-            onServiceAvailable();
+
+        // Trigger starting the services as early as possible
+        if (ConfigManager.getInstance() != null)
+            onConfigManagerAvailable();
         else
-            bindService(new Intent(this, VpnService.class), new ServiceConnectionCallbacks(),
-                    Context.BIND_AUTO_CREATE);
+            new ConfigManagerConnectionCallbacks(this);
+
+        Intent intent = AndroidVpnService.prepare(this);
+        if (intent != null) {
+            startActivityForResult(intent, 0);
+        } else {
+            onActivityResult(0, RESULT_OK, null);
+        }
     }
 
     protected abstract void onCurrentConfigChanged(Config config);
@@ -63,13 +69,25 @@ abstract class BaseConfigActivity extends Activity {
         outState.putBoolean(KEY_IS_EDITING, isEditing);
     }
 
-    protected void onServiceAvailable() {
+    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
+        if (resultCode == RESULT_OK) {
+            if (VpnService.Singleton.getInstance() != null)
+                onVpnServiceAvailable();
+            else
+                new VpnServiceConnectionCallbacks(this);
+        }
+    }
+
+    protected void onConfigManagerAvailable() {
         // Make sure the subclass activity is initialized before setting its config.
         if (initialConfig != null && currentConfig == null)
-            setCurrentConfig(VpnService.getInstance().get(initialConfig));
+            setCurrentConfig(ConfigManager.getInstance().get(initialConfig));
         setIsEditing(wasEditing);
     }
 
+    protected void onVpnServiceAvailable() {
+    }
+
     public void setCurrentConfig(final Config config) {
         if (currentConfig == config)
             return;
@@ -84,18 +102,25 @@ abstract class BaseConfigActivity extends Activity {
         onEditingStateChanged(isEditing);
     }
 
-    private class ServiceConnectionCallbacks implements ServiceConnection {
+    private class VpnServiceConnectionCallbacks extends VpnService.Singleton.VpnServiceConnection {
+        public VpnServiceConnectionCallbacks(Context ctx) {
+            super(ctx);
+        }
+
         @Override
         public void onServiceConnected(final ComponentName component, final IBinder binder) {
-            // We don't actually need a binding, only notification that the service is started.
-            unbindService(this);
-            onServiceAvailable();
+            onVpnServiceAvailable();
+        }
+    }
+
+    private class ConfigManagerConnectionCallbacks extends ConfigManager.ConfigManagerConnection {
+        public ConfigManagerConnectionCallbacks(Context ctx) {
+            super(ctx);
         }
 
         @Override
-        public void onServiceDisconnected(final ComponentName component) {
-            // This can never happen; the service runs in the same thread as the activity.
-            throw new IllegalStateException();
+        public void onServiceConnected(final ComponentName component, final IBinder binder) {
+            onConfigManagerAvailable();
         }
     }
 }
diff --git a/app/src/main/java/com/wireguard/android/BaseConfigFragment.java b/app/src/main/java/com/wireguard/android/BaseConfigFragment.java
index 4291264..19a45e6 100644
--- a/app/src/main/java/com/wireguard/android/BaseConfigFragment.java
+++ b/app/src/main/java/com/wireguard/android/BaseConfigFragment.java
@@ -30,7 +30,7 @@ abstract class BaseConfigFragment extends Fragment {
         else if (getArguments() != null)
             initialConfig = getArguments().getString(KEY_CURRENT_CONFIG);
         if (initialConfig != null && currentConfig == null)
-            setCurrentConfig(VpnService.getInstance().get(initialConfig));
+            setCurrentConfig(ConfigManager.getInstance().get(initialConfig));
     }
 
     @Override
diff --git a/app/src/main/java/com/wireguard/android/BootCompletedReceiver.java b/app/src/main/java/com/wireguard/android/BootCompletedReceiver.java
index 68cb5f1..49f6530 100644
--- a/app/src/main/java/com/wireguard/android/BootCompletedReceiver.java
+++ b/app/src/main/java/com/wireguard/android/BootCompletedReceiver.java
@@ -10,6 +10,6 @@ public class BootCompletedReceiver extends BroadcastReceiver {
     public void onReceive(final Context context, final Intent intent) {
         if (!intent.getAction().equals(Intent.ACTION_BOOT_COMPLETED))
             return;
-        context.startService(new Intent(context, VpnService.class));
+        context.startService(new Intent(context, ConfigManager.class));
     }
 }
diff --git a/app/src/main/java/com/wireguard/android/ConfigActivity.java b/app/src/main/java/com/wireguard/android/ConfigActivity.java
index 61ccbc1..61f79ce 100644
--- a/app/src/main/java/com/wireguard/android/ConfigActivity.java
+++ b/app/src/main/java/com/wireguard/android/ConfigActivity.java
@@ -222,8 +222,8 @@ public class ConfigActivity extends BaseConfigActivity {
     }
 
     @Override
-    protected void onServiceAvailable() {
-        super.onServiceAvailable();
+    protected void onConfigManagerAvailable() {
+        super.onConfigManagerAvailable();
         // Allow creating fragments.
         isServiceAvailable = true;
         moveToState(getCurrentConfig(), isEditing());
diff --git a/app/src/main/java/com/wireguard/android/ConfigEditFragment.java b/app/src/main/java/com/wireguard/android/ConfigEditFragment.java
index 1edae9c..60d2720 100644
--- a/app/src/main/java/com/wireguard/android/ConfigEditFragment.java
+++ b/app/src/main/java/com/wireguard/android/ConfigEditFragment.java
@@ -113,12 +113,12 @@ public class ConfigEditFragment extends BaseConfigFragment {
     }
 
     private void saveConfig() {
-        final VpnService service = VpnService.getInstance();
+        final ConfigManager configManager = ConfigManager.getInstance();
         try {
             if (getCurrentConfig() != null)
-                service.update(getCurrentConfig().getName(), localConfig);
+                configManager.update(getCurrentConfig().getName(), localConfig);
             else
-                service.add(localConfig);
+                configManager.add(localConfig);
         } catch (final IllegalArgumentException | IllegalStateException e) {
             Toast.makeText(getActivity(), e.getMessage(), Toast.LENGTH_SHORT).show();
             return;
diff --git a/app/src/main/java/com/wireguard/android/ConfigListFragment.java b/app/src/main/java/com/wireguard/android/ConfigListFragment.java
index 8586a74..c5af9a4 100644
--- a/app/src/main/java/com/wireguard/android/ConfigListFragment.java
+++ b/app/src/main/java/com/wireguard/android/ConfigListFragment.java
@@ -42,7 +42,7 @@ public class ConfigListFragment extends BaseConfigFragment {
                              final Bundle savedInstanceState) {
         final ConfigListFragmentBinding binding =
                 ConfigListFragmentBinding.inflate(inflater, parent, false);
-        binding.setConfigs(VpnService.getInstance().getConfigs());
+        binding.setConfigs(ConfigManager.getInstance().getConfigs());
         listView = binding.configList;
         listView.setMultiChoiceModeListener(new ConfigListModeListener());
         listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
@@ -109,7 +109,7 @@ public class ConfigListFragment extends BaseConfigFragment {
                     if (configsToRemove.contains(getCurrentConfig()))
                         setCurrentConfig(null);
                     for (final Config config : configsToRemove)
-                        VpnService.getInstance().remove(config.getName());
+                        ConfigManager.getInstance().remove(config.getName());
                     configsToRemove.clear();
                     mode.finish();
                     return true;
diff --git a/app/src/main/java/com/wireguard/android/ConfigListPreference.java b/app/src/main/java/com/wireguard/android/ConfigListPreference.java
index 3842161..3e0194c 100644
--- a/app/src/main/java/com/wireguard/android/ConfigListPreference.java
+++ b/app/src/main/java/com/wireguard/android/ConfigListPreference.java
@@ -14,7 +14,7 @@ public class ConfigListPreference extends ListPreference {
     public ConfigListPreference(final Context context, final AttributeSet attrs,
                                 final int defStyleAttr, final int defStyleRes) {
         super(context, attrs, defStyleAttr, defStyleRes);
-        final Set<String> entrySet = VpnService.getInstance().getConfigs().keySet();
+        final Set<String> entrySet = ConfigManager.getInstance().getConfigs().keySet();
         final CharSequence[] entries = entrySet.toArray(new CharSequence[entrySet.size()]);
         setEntries(entries);
         setEntryValues(entries);
diff --git a/app/src/main/java/com/wireguard/android/ConfigManager.java b/app/src/main/java/com/wireguard/android/ConfigManager.java
new file mode 100644
index 0000000..04d666f
--- /dev/null
+++ b/app/src/main/java/com/wireguard/android/ConfigManager.java
@@ -0,0 +1,412 @@
+package com.wireguard.android;
+
+import android.app.Service;
+import android.content.ComponentName;
+import android.content.Context;
+import android.content.Intent;
+import android.content.ServiceConnection;
+import android.content.SharedPreferences;
+import android.os.AsyncTask;
+import android.os.Binder;
+import android.os.Build;
+import android.os.IBinder;
+import android.preference.PreferenceManager;
+import android.service.quicksettings.TileService;
+import android.support.annotation.Nullable;
+import android.util.Log;
+
+import com.wireguard.config.Config;
+import com.wireguard.config.Peer;
+
+import java.io.File;
+import java.io.FileOutputStream;
+import java.io.FilenameFilter;
+import java.io.IOException;
+import java.nio.charset.StandardCharsets;
+import java.util.HashSet;
+import java.util.LinkedList;
+import java.util.List;
+import java.util.Set;
+
+public class ConfigManager extends Service
+    implements SharedPreferences.OnSharedPreferenceChangeListener {
+
+    private static final String TAG = "ConfigManager";
+    public static final String KEY_ENABLED_CONFIGS = "enabled_configs";
+    public static final String KEY_PRIMARY_CONFIG = "primary_config";
+    public static final String KEY_RESTORE_ON_BOOT = "restore_on_boot";
+
+    private final IBinder binder = new Binder();
+    private final Set<String> enabledConfigs = new HashSet<>();
+    private String primaryName;
+    private SharedPreferences preferences;
+
+    private final ObservableTreeMap<String, Config> configurations = new ObservableTreeMap<>();
+
+    private static ConfigManager instance;
+    public static ConfigManager getInstance() {
+        return instance;
+    }
+
+    public static class ConfigManagerConnection implements ServiceConnection {
+
+        private Context ctx;
+
+        public ConfigManagerConnection(Context ctx) {
+            this.ctx = ctx;
+            ctx.bindService(new Intent(ctx, ConfigManager.class), this,
+                Context.BIND_AUTO_CREATE);
+        }
+
+        @Override
+        public void onServiceConnected(final ComponentName component, final IBinder binder) {
+            // We don't actually need a binding, only notification that the service is started.
+            ctx.unbindService(this);
+        }
+
+        @Override
+        public void onServiceDisconnected(final ComponentName component) {
+            // This can never happen; the service runs in the same thread as the activity.
+            throw new IllegalStateException();
+        }
+    }
+
+    @Nullable
+    @Override
+    public IBinder onBind(Intent intent) {
+        instance = this;
+        return binder;
+    }
+
+    @Override
+    public void onCreate() {
+        // Ensure the service sticks around after being unbound. This only needs to happen once.
+        startService(new Intent(this, getClass()));
+        preferences = PreferenceManager.getDefaultSharedPreferences(this);
+        preferences.registerOnSharedPreferenceChangeListener(this);
+
+        onSharedPreferenceChanged(preferences, VpnService.KEY_USE_KERNEL_MODULE);
+
+        new ConfigLoader().execute(getFilesDir().listFiles(new FilenameFilter() {
+            @Override
+            public boolean accept(final File dir, final String name) {
+                return name.endsWith(".conf");
+            }
+        }));
+    }
+
+    @Override
+    public void onDestroy() {
+        preferences.unregisterOnSharedPreferenceChangeListener(this);
+    }
+
+    @Override
+    public void onSharedPreferenceChanged(final SharedPreferences preferences,
+                                          final String key) {
+        switch (key) {
+            case VpnService.KEY_USE_KERNEL_MODULE: {
+                Log.d(TAG, "Update impl config");
+                if (preferences.getBoolean(VpnService.KEY_USE_KERNEL_MODULE, false))
+                    VpnService.Singleton.setImplementation(VpnService.Singleton.VpnImplementation.KERNEL);
+                else
+                    VpnService.Singleton.setImplementation(VpnService.Singleton.VpnImplementation.ANDROID);
+
+                new VpnService.Singleton.VpnServiceConnection(ConfigManager.this);
+            } break;
+            case KEY_PRIMARY_CONFIG: {
+                boolean changed = false;
+                final String newName = preferences.getString(key, null);
+                if (primaryName != null && !primaryName.equals(newName)) {
+                    final Config oldConfig = get(primaryName);
+                    if (oldConfig != null)
+                        oldConfig.setIsPrimary(false);
+                    changed = true;
+                }
+                if (newName != null && !newName.equals(primaryName)) {
+                    final Config newConfig = get(newName);
+                    if (newConfig != null)
+                        newConfig.setIsPrimary(true);
+                    else
+                        preferences.edit().remove(KEY_PRIMARY_CONFIG).apply();
+                    changed = true;
+                }
+                primaryName = newName;
+                if (changed)
+                    updateTile();
+            } break;
+        }
+    }
+
+    @Override
+    public int onStartCommand(final Intent intent, final int flags, final int startId) {
+        instance = this;
+        return START_STICKY;
+    }
+
+    private void updateTile() {
+        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N)
+            return;
+        Log.v(TAG, "Requesting quick tile update");
+        TileService.requestListeningState(this, new ComponentName(this, QuickTileService.class));
+    }
+
+    /**
+     * Add a new configuration to the set of known configurations. The configuration will initially
+     * be disabled. The configuration's name must be unique within the set of known configurations.
+     *
+     * @param config The configuration to add.
+     */
+    public void add(final Config config) {
+        new ConfigUpdater(null, config).execute();
+    }
+
+    /**
+     * Remove a configuration from being managed by the service.
+     * If successful, the configuration will be removed from persistent storage.
+     * If the configuration is not known to the service, no changes will be made.
+     *
+     * @param name The name of the configuration (in the set of known configurations) to remove.
+     */
+    public void remove(final String name) {
+        final Config config = configurations.get(name);
+        if (config == null)
+            return;
+
+        configurations.remove(name);
+        new ConfigRemover(config).execute();
+    }
+
+    /**
+     * Update the attributes of the named configuration.
+     *
+     * @param name   The name of an existing configuration to update.
+     * @param config A copy of the configuration, with updated attributes.
+     */
+    public void update(final String name, final Config config) {
+        if (name == null)
+            return;
+
+        if (configurations.containsValue(config))
+            throw new IllegalArgumentException("Config " + config.getName() + " modified directly");
+
+        final Config oldConfig = configurations.get(name);
+        if (oldConfig == null)
+            return;
+
+        new ConfigUpdater(oldConfig, config).execute();
+    }
+
+    public void setIsEnable(final String name, final boolean isEnabled) {
+        if (name == null)
+            return;
+
+        Config config = get(name);
+        if (config == null)
+            return;
+        config.setIsEnabled(isEnabled);
+
+        if (isEnabled) {
+            enabledConfigs.add(name);
+            preferences.edit().putStringSet(KEY_ENABLED_CONFIGS, enabledConfigs).apply();
+        } else {
+            enabledConfigs.remove(name);
+            preferences.edit().putStringSet(KEY_ENABLED_CONFIGS, enabledConfigs).apply();
+        }
+
+        if (name.equals(primaryName))
+            updateTile();
+    }
+
+    /**
+     * Retrieve a configuration known and managed by this service. The returned object must not be
+     * modified directly.
+     *
+     * @param name The name of the configuration (in the set of known configurations) to retrieve.
+     * @return An object representing the configuration. This object must not be modified.
+     */
+    public Config get(final String name) {
+        return configurations.get(name);
+    }
+
+    /**
+     * Retrieve the set of configurations known and managed by the service. Configurations in this
+     * set must not be modified directly. If a configuration is to be updated, first create a copy
+     * of it by calling getCopy().
+     *
+     * @return The set of known configurations.
+     */
+    public ObservableSortedMap<String, Config> getConfigs() {
+        return configurations;
+    }
+
+    private class ConfigLoader extends AsyncTask<File, Void, List<Config>> {
+
+        @Override
+        protected List<Config> doInBackground(final File... files) {
+            final List<Config> configs = new LinkedList<>();
+            final List<String> interfaces = new LinkedList<>();
+            for (final File file : files) {
+                if (isCancelled())
+                    return null;
+                final String fileName = file.getName();
+                final String configName = fileName.substring(0, fileName.length() - 5);
+                Log.v(TAG, "Attempting to load config " + configName);
+                try {
+                    final Config config = new Config();
+                    config.parseFrom(openFileInput(fileName));
+                    config.setIsEnabled(interfaces.contains(configName));
+                    config.setName(configName);
+                    configs.add(config);
+                } catch (IllegalArgumentException | IOException e) {
+                    Log.w(TAG, "Failed to load config from " + fileName, e);
+                }
+            }
+            return configs;
+        }
+
+        @Override
+        protected void onPostExecute(final List<Config> configs) {
+            if (configs == null)
+                return;
+            for (final Config config : configs)
+                configurations.put(config.getName(), config);
+
+            // Run the handler to avoid duplicating the code here.
+            onSharedPreferenceChanged(preferences, KEY_PRIMARY_CONFIG);
+
+            if (VpnService.Singleton.getInstance() != null)
+                onVpnServiceAvailable();
+            else
+                new VpnServiceConnectionCallbacks(ConfigManager.this);
+        }
+    }
+
+    protected void onVpnServiceAvailable() {
+        if (preferences.getBoolean(KEY_RESTORE_ON_BOOT, false)) {
+            final Set<String> configsToEnable =
+                preferences.getStringSet(KEY_ENABLED_CONFIGS, null);
+            if (configsToEnable != null) {
+                for (final String name : configsToEnable) {
+                    final Config config = configurations.get(name);
+                    if (config != null && !config.isEnabled())
+                        VpnService.Singleton.getInstance().enable(name);
+                }
+            }
+        }
+    }
+
+    private class VpnServiceConnectionCallbacks extends VpnService.Singleton.VpnServiceConnection {
+        public VpnServiceConnectionCallbacks(Context ctx) {
+            super(ctx);
+        }
+
+        @Override
+        public void onServiceConnected(final ComponentName component, final IBinder binder) {
+            onVpnServiceAvailable();
+        }
+    }
+
+
+    private class ConfigRemover extends AsyncTask<Void, Void, Boolean> {
+        private final Config config;
+
+        private ConfigRemover(final Config config) {
+            this.config = config;
+        }
+
+        @Override
+        protected Boolean doInBackground(final Void... voids) {
+            Log.i(TAG, "Removing config " + config.getName());
+            final File configFile = new File(getFilesDir(), config.getName() + ".conf");
+            if (configFile.delete()) {
+                return true;
+            } else {
+                Log.e(TAG, "Could not delete configuration for config " + config.getName());
+                return false;
+            }
+        }
+
+        @Override
+        protected void onPostExecute(final Boolean result) {
+            if (!result)
+                return;
+            configurations.remove(config.getName());
+            if (config.getName().equals(primaryName)) {
+                // This will get picked up by the preference change listener.
+                preferences.edit().remove(KEY_PRIMARY_CONFIG).apply();
+            }
+        }
+    }
+
+    private class ConfigUpdater extends AsyncTask<Void, Void, Boolean> {
+        private Config knownConfig;
+        private final Config newConfig;
+        private final String newName;
+        private final String oldName;
+
+        private ConfigUpdater(final Config knownConfig, final Config newConfig) {
+            this.knownConfig = knownConfig;
+            this.newConfig = newConfig.copy();
+            this.newConfig.setIsEnabled(this.knownConfig.isEnabled());
+            newName = newConfig.getName();
+            // When adding a config, "old file" and "new file" are the same thing.
+            oldName = knownConfig != null ? knownConfig.getName() : newName;
+            if (newName == null || !Config.isNameValid(newName))
+                throw new IllegalArgumentException("This configuration does not have a valid name");
+            if (isAddOrRename() && configurations.containsKey(newName))
+                throw new IllegalStateException("Configuration " + newName + " already exists");
+            if (newConfig.getInterface().getPublicKey() == null)
+                throw new IllegalArgumentException("This configuration must have a valid keypair");
+            for (final Peer peer : newConfig.getPeers())
+                if (peer.getPublicKey() == null || peer.getPublicKey().isEmpty())
+                    throw new IllegalArgumentException("Each peer must have a valid public key");
+        }
+
+        @Override
+        protected Boolean doInBackground(final Void... voids) {
+            Log.i(TAG, (knownConfig == null ? "Adding" : "Updating") + " config " + newName);
+            final File newFile = new File(getFilesDir(), newName + ".conf");
+            final File oldFile = new File(getFilesDir(), oldName + ".conf");
+            if (isAddOrRename() && newFile.exists()) {
+                Log.w(TAG, "Refusing to overwrite existing config configuration");
+                return false;
+            }
+            try {
+                final FileOutputStream stream = openFileOutput(oldFile.getName(), MODE_PRIVATE);
+                stream.write(newConfig.toString().getBytes(StandardCharsets.UTF_8));
+                stream.close();
+            } catch (final IOException e) {
+                Log.e(TAG, "Could not save configuration for config " + oldName, e);
+                return false;
+            }
+            if (isRename() && !oldFile.renameTo(newFile)) {
+                Log.e(TAG, "Could not rename " + oldFile.getName() + " to " + newFile.getName());
+                return false;
+            }
+            return true;
+        }
+
+        private boolean isAddOrRename() {
+            return knownConfig == null || !newName.equals(oldName);
+        }
+
+        private boolean isRename() {
+            return knownConfig != null && !newName.equals(oldName);
+        }
+
+        @Override
+        protected void onPostExecute(final Boolean result) {
+            if (!result)
+                return;
+            if (knownConfig != null)
+                configurations.remove(oldName);
+            if (knownConfig == null)
+                knownConfig = new Config();
+            knownConfig.copyFrom(newConfig);
+            knownConfig.setIsPrimary(oldName != null && oldName.equals(primaryName));
+            configurations.put(newName, knownConfig);
+            if (isRename() && oldName != null && oldName.equals(primaryName))
+                preferences.edit().putString(KEY_PRIMARY_CONFIG, newName).apply();
+        }
+    }
+}
diff --git a/app/src/main/java/com/wireguard/android/KernelVpnService.java b/app/src/main/java/com/wireguard/android/KernelVpnService.java
new file mode 100644
index 0000000..66fe607
--- /dev/null
+++ b/app/src/main/java/com/wireguard/android/KernelVpnService.java
@@ -0,0 +1,115 @@
+package com.wireguard.android;
+
+import android.app.Service;
+import android.content.Intent;
+import android.os.AsyncTask;
+import android.os.Binder;
+import android.os.IBinder;
+import android.util.Log;
+
+import com.wireguard.config.Config;
+
+import java.io.File;
+
+/**
+ * Service that handles config state coordination and all background processing for the application.
+ */
+
+public class KernelVpnService extends Service implements com.wireguard.android.VpnService {
+    private static final String TAG = "KernelVpnService";
+
+    private static KernelVpnService instance;
+    public static KernelVpnService getInstance() {
+        return instance;
+    }
+
+    private final IBinder binder = new Binder();
+    private RootShell rootShell;
+
+    @Override
+    public void disable(final String name) {
+        final Config config = ConfigManager.getInstance().get(name);
+        if (config == null || !config.isEnabled())
+            return;
+
+        new ConfigDisabler(config).execute();
+    }
+
+    @Override
+    public void enable(final String name) {
+        final Config config = ConfigManager.getInstance().get(name);
+        if (config == null || config.isEnabled())
+            return;
+
+        new ConfigEnabler(config).execute();
+    }
+
+    @Override
+    public IBinder onBind(final Intent intent) {
+        instance = this;
+        return binder;
+    }
+
+    @Override
+    public void onCreate() {
+        // Ensure the service sticks around after being unbound. This only needs to happen once.
+        startService(new Intent(this, getClass()));
+        rootShell = new RootShell(this);
+    }
+
+    @Override
+    public void onDestroy() {
+    }
+
+    @Override
+    public int onStartCommand(final Intent intent, final int flags, final int startId) {
+        instance = this;
+        return START_STICKY;
+    }
+
+    private class ConfigDisabler extends AsyncTask<Void, Void, Boolean> {
+        private final Config config;
+
+        private ConfigDisabler(final Config config) {
+            this.config = config;
+        }
+
+        @Override
+        protected Boolean doInBackground(final Void... voids) {
+            Log.i(TAG, "Running wg-quick down for " + config.getName());
+            final File configFile = new File(getFilesDir(), config.getName() + ".conf");
+            return rootShell.run(null, "wg-quick down '" + configFile.getPath() + "'") == 0;
+        }
+
+        @Override
+        protected void onPostExecute(final Boolean result) {
+            if (!result)
+                return;
+
+            ConfigManager.getInstance().setIsEnable(config.getName(), false);
+        }
+    }
+
+    private class ConfigEnabler extends AsyncTask<Void, Void, Boolean> {
+        private final Config config;
+
+        private ConfigEnabler(final Config config) {
+            this.config = config;
+        }
+
+        @Override
+        protected Boolean doInBackground(final Void... voids) {
+            Log.i(TAG, "Running wg-quick up for " + config.getName());
+            final File configFile = new File(getFilesDir(), config.getName() + ".conf");
+            return rootShell.run(null, "wg-quick up '" + configFile.getPath() + "'") == 0;
+        }
+
+        @Override
+        protected void onPostExecute(final Boolean result) {
+            if (!result)
+                return;
+
+            ConfigManager.getInstance().setIsEnable(config.getName(), true);
+        }
+    }
+}
diff --git a/app/src/main/java/com/wireguard/android/QuickTileService.java b/app/src/main/java/com/wireguard/android/QuickTileService.java
index ddadf29..c12a6df 100644
--- a/app/src/main/java/com/wireguard/android/QuickTileService.java
+++ b/app/src/main/java/com/wireguard/android/QuickTileService.java
@@ -3,8 +3,6 @@ package com.wireguard.android;
 import android.annotation.TargetApi;
 import android.content.ComponentName;
 import android.content.Context;
-import android.content.Intent;
-import android.content.ServiceConnection;
 import android.content.SharedPreferences;
 import android.graphics.drawable.Icon;
 import android.os.Build;
@@ -18,11 +16,12 @@ import com.wireguard.config.Config;
 @TargetApi(Build.VERSION_CODES.N)
 public class QuickTileService extends TileService {
     private Config config;
+    private ConfigManager configManager;
     private SharedPreferences preferences;
-    private VpnService service;
 
     @Override
     public void onClick() {
+        VpnService service = VpnService.Singleton.getInstance();
         if (service != null && config != null) {
             if (config.isEnabled())
                 service.disable(config.getName());
@@ -34,10 +33,9 @@ public class QuickTileService extends TileService {
     @Override
     public void onCreate() {
         preferences = PreferenceManager.getDefaultSharedPreferences(this);
-        service = VpnService.getInstance();
-        if (service == null)
-            bindService(new Intent(this, VpnService.class), new ServiceConnectionCallbacks(),
-                    Context.BIND_AUTO_CREATE);
+        configManager = ConfigManager.getInstance();
+        if (configManager == null)
+            new ConfigManagerCallbacks(this);
         TileService.requestListeningState(this, new ComponentName(this, getClass()));
     }
 
@@ -45,8 +43,8 @@ public class QuickTileService extends TileService {
     public void onStartListening() {
         // Since this is an active tile, this only gets called when we want to update the tile.
         final Tile tile = getQsTile();
-        final String configName = preferences.getString(VpnService.KEY_PRIMARY_CONFIG, null);
-        config = configName != null && service != null ? service.get(configName) : null;
+        final String configName = preferences.getString(ConfigManager.KEY_PRIMARY_CONFIG, null);
+        config = configName != null && configManager != null ? configManager.get(configName) : null;
         if (config != null) {
             tile.setLabel(config.getName());
             final int state = config.isEnabled() ? Tile.STATE_ACTIVE : Tile.STATE_INACTIVE;
@@ -65,18 +63,14 @@ public class QuickTileService extends TileService {
         tile.updateTile();
     }
 
-    private class ServiceConnectionCallbacks implements ServiceConnection {
-        @Override
-        public void onServiceConnected(final ComponentName component, final IBinder binder) {
-            // We don't actually need a binding, only notification that the service is started.
-            unbindService(this);
-            service = VpnService.getInstance();
+    private class ConfigManagerCallbacks extends ConfigManager.ConfigManagerConnection {
+        public ConfigManagerCallbacks(Context ctx) {
+            super(ctx);
         }
 
         @Override
-        public void onServiceDisconnected(final ComponentName component) {
-            // This can never happen; the service runs in the same thread as this service.
-            throw new IllegalStateException();
+        public void onServiceConnected(final ComponentName component, final IBinder binder) {
+            configManager = ConfigManager.getInstance();
         }
     }
 }
diff --git a/app/src/main/java/com/wireguard/android/VpnService.java b/app/src/main/java/com/wireguard/android/VpnService.java
index 0fd6713..f6e9651 100644
--- a/app/src/main/java/com/wireguard/android/VpnService.java
+++ b/app/src/main/java/com/wireguard/android/VpnService.java
@@ -1,65 +1,63 @@
 package com.wireguard.android;
 
-import android.app.Service;
 import android.content.ComponentName;
+import android.content.Context;
 import android.content.Intent;
-import android.content.SharedPreferences;
-import android.os.AsyncTask;
-import android.os.Binder;
-import android.os.Build;
+import android.content.ServiceConnection;
 import android.os.IBinder;
 import android.preference.PreferenceManager;
-import android.service.quicksettings.TileService;
-import android.util.Log;
 
-import com.wireguard.config.Config;
-import com.wireguard.config.Peer;
+public interface VpnService {
+    String KEY_USE_KERNEL_MODULE = "use_kernel_module";
 
-import java.io.File;
-import java.io.FileOutputStream;
-import java.io.FilenameFilter;
-import java.io.IOException;
-import java.nio.charset.StandardCharsets;
-import java.util.Collections;
-import java.util.HashSet;
-import java.util.LinkedList;
-import java.util.List;
-import java.util.Set;
+    class Singleton {
+        enum VpnImplementation { KERNEL, ANDROID, UNKNOWN};
+        private static VpnImplementation implementation = VpnImplementation.UNKNOWN;
 
-/**
- * Service that handles config state coordination and all background processing for the application.
- */
+        public synchronized static void setImplementation(VpnImplementation implementation) {
+            Singleton.implementation = implementation;
+        }
 
-public class VpnService extends Service
-        implements SharedPreferences.OnSharedPreferenceChangeListener {
-    public static final String KEY_ENABLED_CONFIGS = "enabled_configs";
-    public static final String KEY_PRIMARY_CONFIG = "primary_config";
-    public static final String KEY_RESTORE_ON_BOOT = "restore_on_boot";
-    private static final String TAG = "VpnService";
+        public synchronized static VpnService getInstance() {
+            switch (implementation) {
+                case ANDROID:
+                    return AndroidVpnService.getInstance();
+                case KERNEL:
+                    return KernelVpnService.getInstance();
+            }
+            return null;
+        }
 
-    private static VpnService instance;
+        public static class VpnServiceConnection implements ServiceConnection {
 
-    public static VpnService getInstance() {
-        return instance;
-    }
+            private Context ctx;
 
-    private final IBinder binder = new Binder();
-    private final ObservableTreeMap<String, Config> configurations = new ObservableTreeMap<>();
-    private final Set<String> enabledConfigs = new HashSet<>();
-    private SharedPreferences preferences;
-    private String primaryName;
-    private RootShell rootShell;
+            public VpnServiceConnection(Context ctx) {
+                this.ctx = ctx;
 
-    /**
-     * Add a new configuration to the set of known configurations. The configuration will initially
-     * be disabled. The configuration's name must be unique within the set of known configurations.
-     *
-     * @param config The configuration to add.
-     */
-    public void add(final Config config) {
-        new ConfigUpdater(null, config, false).execute();
+                if (PreferenceManager.getDefaultSharedPreferences(ctx).getBoolean(KEY_USE_KERNEL_MODULE, false))
+                    ctx.bindService(new Intent(ctx, KernelVpnService.class), this,
+                        Context.BIND_AUTO_CREATE);
+                else
+                    ctx.bindService(new Intent(ctx, AndroidVpnService.class), this,
+                        Context.BIND_AUTO_CREATE);
+            }
+
+            @Override
+            public void onServiceConnected(final ComponentName component, final IBinder binder) {
+                // We don't actually need a binding, only notification that the service is started.
+                ctx.unbindService(this);
+            }
+
+            @Override
+            public void onServiceDisconnected(final ComponentName component) {
+                // This can never happen; the service runs in the same thread as the activity.
+                throw new IllegalStateException();
+            }
+        }
     }
 
+
     /**
      * Attempt to disable and tear down an interface for this configuration. The configuration's
      * enabled state will be updated the operation is successful. If this configuration is already
@@ -67,12 +65,7 @@ public class VpnService extends Service
      *
      * @param name The name of the configuration (in the set of known configurations) to disable.
      */
-    public void disable(final String name) {
-        final Config config = configurations.get(name);
-        if (config == null || !config.isEnabled())
-            return;
-        new ConfigDisabler(config).execute();
-    }
+    void disable(final String name);
 
     /**
      * Attempt to set up and enable an interface for this configuration. The configuration's enabled
@@ -81,352 +74,5 @@ public class VpnService extends Service
      *
      * @param name The name of the configuration (in the set of known configurations) to enable.
      */
-    public void enable(final String name) {
-        final Config config = configurations.get(name);
-        if (config == null || config.isEnabled())
-            return;
-        new ConfigEnabler(config).execute();
-    }
-
-    /**
-     * Retrieve a configuration known and managed by this service. The returned object must not be
-     * modified directly.
-     *
-     * @param name The name of the configuration (in the set of known configurations) to retrieve.
-     * @return An object representing the configuration. This object must not be modified.
-     */
-    public Config get(final String name) {
-        return configurations.get(name);
-    }
-
-    /**
-     * Retrieve the set of configurations known and managed by the service. Configurations in this
-     * set must not be modified directly. If a configuration is to be updated, first create a copy
-     * of it by calling getCopy().
-     *
-     * @return The set of known configurations.
-     */
-    public ObservableSortedMap<String, Config> getConfigs() {
-        return configurations;
-    }
-
-    @Override
-    public IBinder onBind(final Intent intent) {
-        instance = this;
-        return binder;
-    }
-
-    @Override
-    public void onCreate() {
-        // Ensure the service sticks around after being unbound. This only needs to happen once.
-        startService(new Intent(this, getClass()));
-        rootShell = new RootShell(this);
-        new ConfigLoader().execute(getFilesDir().listFiles(new FilenameFilter() {
-            @Override
-            public boolean accept(final File dir, final String name) {
-                return name.endsWith(".conf");
-            }
-        }));
-        preferences = PreferenceManager.getDefaultSharedPreferences(this);
-        preferences.registerOnSharedPreferenceChangeListener(this);
-    }
-
-    @Override
-    public void onDestroy() {
-        preferences.unregisterOnSharedPreferenceChangeListener(this);
-    }
-
-    @Override
-    public void onSharedPreferenceChanged(final SharedPreferences preferences,
-                                          final String key) {
-        if (!KEY_PRIMARY_CONFIG.equals(key))
-            return;
-        boolean changed = false;
-        final String newName = preferences.getString(key, null);
-        if (primaryName != null && !primaryName.equals(newName)) {
-            final Config oldConfig = configurations.get(primaryName);
-            if (oldConfig != null)
-                oldConfig.setIsPrimary(false);
-            changed = true;
-        }
-        if (newName != null && !newName.equals(primaryName)) {
-            final Config newConfig = configurations.get(newName);
-            if (newConfig != null)
-                newConfig.setIsPrimary(true);
-            else
-                preferences.edit().remove(KEY_PRIMARY_CONFIG).apply();
-            changed = true;
-        }
-        primaryName = newName;
-        if (changed)
-            updateTile();
-    }
-
-    @Override
-    public int onStartCommand(final Intent intent, final int flags, final int startId) {
-        instance = this;
-        return START_STICKY;
-    }
-
-    /**
-     * Remove a configuration from being managed by the service. If it is currently enabled, the
-     * the configuration will be disabled before removal. If successful, the configuration will be
-     * removed from persistent storage. If the configuration is not known to the service, no changes
-     * will be made.
-     *
-     * @param name The name of the configuration (in the set of known configurations) to remove.
-     */
-    public void remove(final String name) {
-        final Config config = configurations.get(name);
-        if (config == null)
-            return;
-        if (config.isEnabled())
-            new ConfigDisabler(config).execute();
-        new ConfigRemover(config).execute();
-    }
-
-    /**
-     * Update the attributes of the named configuration. If the configuration is currently enabled,
-     * it will be disabled before the update, and the service will attempt to re-enable it
-     * afterward. If successful, the updated configuration will be saved to persistent storage.
-     *
-     * @param name   The name of an existing configuration to update.
-     * @param config A copy of the configuration, with updated attributes.
-     */
-    public void update(final String name, final Config config) {
-        if (name == null)
-            return;
-        if (configurations.containsValue(config))
-            throw new IllegalArgumentException("Config " + config.getName() + " modified directly");
-        final Config oldConfig = configurations.get(name);
-        if (oldConfig == null)
-            return;
-        final boolean wasEnabled = oldConfig.isEnabled();
-        if (wasEnabled)
-            new ConfigDisabler(oldConfig).execute();
-        new ConfigUpdater(oldConfig, config, wasEnabled).execute();
-    }
-
-    private void updateTile() {
-        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N)
-            return;
-        Log.v(TAG, "Requesting quick tile update");
-        TileService.requestListeningState(this, new ComponentName(this, QuickTileService.class));
-    }
-
-    private class ConfigDisabler extends AsyncTask<Void, Void, Boolean> {
-        private final Config config;
-
-        private ConfigDisabler(final Config config) {
-            this.config = config;
-        }
-
-        @Override
-        protected Boolean doInBackground(final Void... voids) {
-            Log.i(TAG, "Running wg-quick down for " + config.getName());
-            final File configFile = new File(getFilesDir(), config.getName() + ".conf");
-            return rootShell.run(null, "wg-quick down '" + configFile.getPath() + "'") == 0;
-        }
-
-        @Override
-        protected void onPostExecute(final Boolean result) {
-            if (!result)
-                return;
-            config.setIsEnabled(false);
-            enabledConfigs.remove(config.getName());
-            preferences.edit().putStringSet(KEY_ENABLED_CONFIGS, enabledConfigs).apply();
-            if (config.getName().equals(primaryName))
-                updateTile();
-        }
-    }
-
-    private class ConfigEnabler extends AsyncTask<Void, Void, Boolean> {
-        private final Config config;
-
-        private ConfigEnabler(final Config config) {
-            this.config = config;
-        }
-
-        @Override
-        protected Boolean doInBackground(final Void... voids) {
-            Log.i(TAG, "Running wg-quick up for " + config.getName());
-            final File configFile = new File(getFilesDir(), config.getName() + ".conf");
-            return rootShell.run(null, "wg-quick up '" + configFile.getPath() + "'") == 0;
-        }
-
-        @Override
-        protected void onPostExecute(final Boolean result) {
-            if (!result)
-                return;
-            config.setIsEnabled(true);
-            enabledConfigs.add(config.getName());
-            preferences.edit().putStringSet(KEY_ENABLED_CONFIGS, enabledConfigs).apply();
-            if (config.getName().equals(primaryName))
-                updateTile();
-        }
-    }
-
-    private class ConfigLoader extends AsyncTask<File, Void, List<Config>> {
-        @Override
-        protected List<Config> doInBackground(final File... files) {
-            final List<Config> configs = new LinkedList<>();
-            final List<String> interfaces = new LinkedList<>();
-            final String command = "wg show interfaces";
-            if (rootShell.run(interfaces, command) == 0 && interfaces.size() == 1) {
-                // wg puts all interface names on the same line. Split them into separate elements.
-                final String nameList = interfaces.get(0);
-                Collections.addAll(interfaces, nameList.split(" "));
-                interfaces.remove(0);
-            } else {
-                interfaces.clear();
-                Log.w(TAG, "No existing WireGuard interfaces found. Maybe they are all disabled?");
-            }
-            for (final File file : files) {
-                if (isCancelled())
-                    return null;
-                final String fileName = file.getName();
-                final String configName = fileName.substring(0, fileName.length() - 5);
-                Log.v(TAG, "Attempting to load config " + configName);
-                try {
-                    final Config config = new Config();
-                    config.parseFrom(openFileInput(fileName));
-                    config.setIsEnabled(interfaces.contains(configName));
-                    config.setName(configName);
-                    configs.add(config);
-                } catch (IllegalArgumentException | IOException e) {
-                    Log.w(TAG, "Failed to load config from " + fileName, e);
-                }
-            }
-            return configs;
-        }
-
-        @Override
-        protected void onPostExecute(final List<Config> configs) {
-            if (configs == null)
-                return;
-            for (final Config config : configs)
-                configurations.put(config.getName(), config);
-            // Run the handler to avoid duplicating the code here.
-            onSharedPreferenceChanged(preferences, KEY_PRIMARY_CONFIG);
-            if (preferences.getBoolean(KEY_RESTORE_ON_BOOT, false)) {
-                final Set<String> configsToEnable =
-                        preferences.getStringSet(KEY_ENABLED_CONFIGS, null);
-                if (configsToEnable != null) {
-                    for (final String name : configsToEnable) {
-                        final Config config = configurations.get(name);
-                        if (config != null && !config.isEnabled())
-                            new ConfigEnabler(config).execute();
-                    }
-                }
-            }
-        }
-    }
-
-    private class ConfigRemover extends AsyncTask<Void, Void, Boolean> {
-        private final Config config;
-
-        private ConfigRemover(final Config config) {
-            this.config = config;
-        }
-
-        @Override
-        protected Boolean doInBackground(final Void... voids) {
-            Log.i(TAG, "Removing config " + config.getName());
-            final File configFile = new File(getFilesDir(), config.getName() + ".conf");
-            if (configFile.delete()) {
-                return true;
-            } else {
-                Log.e(TAG, "Could not delete configuration for config " + config.getName());
-                return false;
-            }
-        }
-
-        @Override
-        protected void onPostExecute(final Boolean result) {
-            if (!result)
-                return;
-            configurations.remove(config.getName());
-            if (config.getName().equals(primaryName)) {
-                // This will get picked up by the preference change listener.
-                preferences.edit().remove(KEY_PRIMARY_CONFIG).apply();
-            }
-        }
-    }
-
-    private class ConfigUpdater extends AsyncTask<Void, Void, Boolean> {
-        private Config knownConfig;
-        private final Config newConfig;
-        private final String newName;
-        private final String oldName;
-        private final Boolean shouldConnect;
-
-        private ConfigUpdater(final Config knownConfig, final Config newConfig,
-                              final Boolean shouldConnect) {
-            this.knownConfig = knownConfig;
-            this.newConfig = newConfig.copy();
-            newName = newConfig.getName();
-            // When adding a config, "old file" and "new file" are the same thing.
-            oldName = knownConfig != null ? knownConfig.getName() : newName;
-            this.shouldConnect = shouldConnect;
-            if (newName == null || !Config.isNameValid(newName))
-                throw new IllegalArgumentException("This configuration does not have a valid name");
-            if (isAddOrRename() && configurations.containsKey(newName))
-                throw new IllegalStateException("Configuration " + newName + " already exists");
-            if (newConfig.getInterface().getPublicKey() == null)
-                throw new IllegalArgumentException("This configuration must have a valid keypair");
-            for (final Peer peer : newConfig.getPeers())
-                if (peer.getPublicKey() == null || peer.getPublicKey().isEmpty())
-                    throw new IllegalArgumentException("Each peer must have a valid public key");
-        }
-
-        @Override
-        protected Boolean doInBackground(final Void... voids) {
-            Log.i(TAG, (knownConfig == null ? "Adding" : "Updating") + " config " + newName);
-            final File newFile = new File(getFilesDir(), newName + ".conf");
-            final File oldFile = new File(getFilesDir(), oldName + ".conf");
-            if (isAddOrRename() && newFile.exists()) {
-                Log.w(TAG, "Refusing to overwrite existing config configuration");
-                return false;
-            }
-            try {
-                final FileOutputStream stream = openFileOutput(oldFile.getName(), MODE_PRIVATE);
-                stream.write(newConfig.toString().getBytes(StandardCharsets.UTF_8));
-                stream.close();
-            } catch (final IOException e) {
-                Log.e(TAG, "Could not save configuration for config " + oldName, e);
-                return false;
-            }
-            if (isRename() && !oldFile.renameTo(newFile)) {
-                Log.e(TAG, "Could not rename " + oldFile.getName() + " to " + newFile.getName());
-                return false;
-            }
-            return true;
-        }
-
-        private boolean isAddOrRename() {
-            return knownConfig == null || !newName.equals(oldName);
-        }
-
-        private boolean isRename() {
-            return knownConfig != null && !newName.equals(oldName);
-        }
-
-        @Override
-        protected void onPostExecute(final Boolean result) {
-            if (!result)
-                return;
-            if (knownConfig != null)
-                configurations.remove(oldName);
-            if (knownConfig == null)
-                knownConfig = new Config();
-            knownConfig.copyFrom(newConfig);
-            knownConfig.setIsEnabled(false);
-            knownConfig.setIsPrimary(oldName != null && oldName.equals(primaryName));
-            configurations.put(newName, knownConfig);
-            if (isRename() && oldName != null && oldName.equals(primaryName))
-                preferences.edit().putString(KEY_PRIMARY_CONFIG, newName).apply();
-            if (shouldConnect)
-                new ConfigEnabler(knownConfig).execute();
-        }
-    }
+    void enable(final String name);
 }
diff --git a/app/src/main/java/com/wireguard/config/Config.java b/app/src/main/java/com/wireguard/config/Config.java
index 2a282d0..c69b2f5 100644
--- a/app/src/main/java/com/wireguard/config/Config.java
+++ b/app/src/main/java/com/wireguard/config/Config.java
@@ -25,7 +25,7 @@ import java.util.regex.Pattern;
  */
 
 public class Config extends BaseObservable
-        implements Comparable<Config>, Copyable<Config>, Observable, Parcelable {
+        implements Comparable<Config>, Copyable<Config>, Observable, Parcelable, IpcSerializable {
     public static final Parcelable.Creator<Config> CREATOR = new Parcelable.Creator<Config>() {
         @Override
         public Config createFromParcel(final Parcel in) {
@@ -186,4 +186,14 @@ public class Config extends BaseObservable
         dest.writeString(name);
         dest.writeTypedList(peers);
     }
+
+    @Override
+    public String toIpcString() {
+        final StringBuilder sb = new StringBuilder();
+        sb.append(iface.toIpcString());
+        sb.append("replace_peers=true\n");
+        for (final Peer peer : peers)
+            sb.append(peer.toIpcString());
+        return sb.toString();
+    }
 }
diff --git a/app/src/main/java/com/wireguard/config/Interface.java b/app/src/main/java/com/wireguard/config/Interface.java
index b291844..0d8246c 100644
--- a/app/src/main/java/com/wireguard/config/Interface.java
+++ b/app/src/main/java/com/wireguard/config/Interface.java
@@ -15,7 +15,7 @@ import com.wireguard.crypto.Keypair;
  */
 
 public class Interface extends BaseObservable
-        implements Copyable<Interface>, Observable, Parcelable {
+        implements Copyable<Interface>, Observable, Parcelable, IpcSerializable {
     public static final Parcelable.Creator<Interface> CREATOR
             = new Parcelable.Creator<Interface>() {
         @Override
@@ -200,4 +200,14 @@ public class Interface extends BaseObservable
         dest.writeString(mtu);
         dest.writeString(privateKey);
     }
+
+    @Override
+    public String toIpcString() {
+        final StringBuilder sb = new StringBuilder();
+        if (listenPort != null)
+            sb.append(IpcAttribute.LISTEN_PORT.composeWith(listenPort));
+        if (privateKey != null)
+            sb.append(IpcAttribute.PRIVATE_KEY.composeWith(keypair.getPrivateKeyHex()));
+        return sb.toString();
+    }
 }
diff --git a/app/src/main/java/com/wireguard/config/IpcAttribute.java b/app/src/main/java/com/wireguard/config/IpcAttribute.java
new file mode 100644
index 0000000..a4a030a
--- /dev/null
+++ b/app/src/main/java/com/wireguard/config/IpcAttribute.java
@@ -0,0 +1,55 @@
+package com.wireguard.config;
+
+import java.util.HashMap;
+import java.util.Map;
+import java.util.regex.Matcher;
+import java.util.regex.Pattern;
+
+/**
+ * The set of valid attributes for an interface or peer over WireGuard IPC configuration channel.
+ */
+
+enum IpcAttribute {
+    ALLOWED_IPS("allowed_ip"),
+    ENDPOINT("endpoint"),
+    LISTEN_PORT("listen_port"),
+    PERSISTENT_KEEPALIVE("persistent_keepalive_interval"),
+    PRE_SHARED_KEY("preshared_key"),
+    PRIVATE_KEY("private_key"),
+    PUBLIC_KEY("public_key");
+
+    private static final Map<String, IpcAttribute> map;
+
+    static {
+        map = new HashMap<>(IpcAttribute.values().length);
+        for (final IpcAttribute key : IpcAttribute.values())
+            map.put(key.getToken(), key);
+    }
+
+    public static IpcAttribute match(final String line) {
+        return map.get(line.split("\\s|=")[0]);
+    }
+
+    private final String token;
+    private final Pattern pattern;
+
+    IpcAttribute(final String token) {
+        pattern = Pattern.compile(token + "\\s*=\\s*(\\S.*)");
+        this.token = token;
+    }
+
+    public String composeWith(final String value) {
+        return token + "=" + value + "\n";
+    }
+
+    public String getToken() {
+        return token;
+    }
+
+    public String parseFrom(final String line) {
+        final Matcher matcher = pattern.matcher(line);
+        if (matcher.matches())
+            return matcher.group(1);
+        return null;
+    }
+}
diff --git a/app/src/main/java/com/wireguard/config/IpcSerializable.java b/app/src/main/java/com/wireguard/config/IpcSerializable.java
new file mode 100644
index 0000000..46dfea0
--- /dev/null
+++ b/app/src/main/java/com/wireguard/config/IpcSerializable.java
@@ -0,0 +1,9 @@
+package com.wireguard.config;
+
+/**
+ * Interface for classes that can perform a serialization for the ipc link
+ */
+
+public interface IpcSerializable {
+    String toIpcString();
+}
diff --git a/app/src/main/java/com/wireguard/config/Peer.java b/app/src/main/java/com/wireguard/config/Peer.java
index 718a5c3..ce55bb2 100644
--- a/app/src/main/java/com/wireguard/config/Peer.java
+++ b/app/src/main/java/com/wireguard/config/Peer.java
@@ -7,12 +7,13 @@ import android.os.Parcel;
 import android.os.Parcelable;
 
 import com.android.databinding.library.baseAdapters.BR;
+import com.wireguard.crypto.KeyEncoding;
 
 /**
  * Represents the configuration for a WireGuard peer (a [Peer] block).
  */
 
-public class Peer extends BaseObservable implements Copyable<Peer>, Observable, Parcelable {
+public class Peer extends BaseObservable implements Copyable<Peer>, Observable, Parcelable, IpcSerializable {
     public static final Parcelable.Creator<Peer> CREATOR = new Parcelable.Creator<Peer>() {
         @Override
         public Peer createFromParcel(final Parcel in) {
@@ -175,4 +176,22 @@ public class Peer extends BaseObservable implements Copyable<Peer>, Observable,
         dest.writeString(preSharedKey);
         dest.writeString(publicKey);
     }
+
+    @Override
+    public String toIpcString() {
+        final StringBuilder sb = new StringBuilder();
+        if (publicKey != null)
+            sb.append(IpcAttribute.PUBLIC_KEY.composeWith(KeyEncoding.keyToHex(KeyEncoding.keyFromBase64(publicKey))));
+        if (endpoint != null)
+            sb.append(IpcAttribute.ENDPOINT.composeWith(endpoint));
+        if (persistentKeepalive != null)
+            sb.append(IpcAttribute.PERSISTENT_KEEPALIVE.composeWith(persistentKeepalive));
+        if (allowedIPs != null) {
+            sb.append("replace_allowed_ips=true\n");
+            sb.append(IpcAttribute.ALLOWED_IPS.composeWith(allowedIPs));
+        }
+        if (preSharedKey != null)
+            sb.append(IpcAttribute.PRE_SHARED_KEY.composeWith(preSharedKey));
+        return sb.toString();
+    }
 }
diff --git a/app/src/main/java/com/wireguard/crypto/KeyEncoding.java b/app/src/main/java/com/wireguard/crypto/KeyEncoding.java
index f83fd0b..2e48efd 100644
--- a/app/src/main/java/com/wireguard/crypto/KeyEncoding.java
+++ b/app/src/main/java/com/wireguard/crypto/KeyEncoding.java
@@ -88,4 +88,16 @@ public class KeyEncoding {
         output[KEY_LENGTH_BASE64 - 1] = '=';
         return new String(output);
     }
+
+    private final static char[] hexArray = "0123456789ABCDEF".toCharArray();
+
+    public static String keyToHex(final byte[] bytes) {
+        char[] hexChars = new char[bytes.length * 2];
+        for ( int j = 0; j < bytes.length; j++ ) {
+            int v = bytes[j] & 0xFF;
+            hexChars[j * 2] = hexArray[v >>> 4];
+            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
+        }
+        return new String(hexChars);
+    }
 }
diff --git a/app/src/main/java/com/wireguard/crypto/Keypair.java b/app/src/main/java/com/wireguard/crypto/Keypair.java
index e0d35d6..a8b1951 100644
--- a/app/src/main/java/com/wireguard/crypto/Keypair.java
+++ b/app/src/main/java/com/wireguard/crypto/Keypair.java
@@ -42,8 +42,14 @@ public class Keypair {
     public String getPrivateKey() {
         return KeyEncoding.keyToBase64(privateKey);
     }
+    public String getPrivateKeyHex() {
+        return KeyEncoding.keyToHex(privateKey);
+    }
 
     public String getPublicKey() {
         return KeyEncoding.keyToBase64(publicKey);
     }
+    public String getPublicKeyHex() {
+        return KeyEncoding.keyToHex(publicKey);
+    }
 }
diff --git a/app/src/main/res/layout/config_list_item.xml b/app/src/main/res/layout/config_list_item.xml
index d15d48d..dcc40ad 100644
--- a/app/src/main/res/layout/config_list_item.xml
+++ b/app/src/main/res/layout/config_list_item.xml
@@ -2,9 +2,7 @@
 <layout xmlns:android="http://schemas.android.com/apk/res/android">
 
     <data>
-
         <import type="android.graphics.Typeface" />
-
         <import type="com.wireguard.android.VpnService" />
 
         <variable
@@ -38,7 +36,7 @@
             android:layout_alignBaseline="@+id/config_name"
             android:layout_alignParentEnd="true"
             android:gravity="center_vertical"
-            android:onClick="@{() -> item.enabled ? VpnService.instance.disable(item.name) : VpnService.instance.enable(item.name)}"
+            android:onClick="@{() -> item.enabled ? VpnService.Singleton.getInstance().disable(item.name) : VpnService.Singleton.getInstance().enable(item.name)}"
             android:text="@string/toggle"
             android:textColor="@{item.enabled ? @android:color/holo_green_dark : @android:color/holo_red_dark}" />
     </RelativeLayout>
diff --git a/app/src/main/res/values/strings.xml b/app/src/main/res/values/strings.xml
index bc2ec7a..deb4eee 100644
--- a/app/src/main/res/values/strings.xml
+++ b/app/src/main/res/values/strings.xml
@@ -38,6 +38,8 @@
     <string name="public_key_description">WireGuard public key</string>
     <string name="restore_on_boot">Restore on boot</string>
     <string name="restore_on_boot_summary">Restore previously enabled configurations on boot</string>
+    <string name="use_kernel_module">Use the WireGuard kernel implementation</string>
+    <string name="use_kernel_module_summary">Require a kernel with WireGuard support and root right</string>
     <string name="save">Save</string>
     <string name="settings">Settings</string>
     <string name="status">Status</string>
diff --git a/app/src/main/res/xml/preferences.xml b/app/src/main/res/xml/preferences.xml
index 95683a1..3d9dc96 100644
--- a/app/src/main/res/xml/preferences.xml
+++ b/app/src/main/res/xml/preferences.xml
@@ -9,4 +9,9 @@
         android:key="restore_on_boot"
         android:summary="@string/restore_on_boot_summary"
         android:title="@string/restore_on_boot" />
+    <CheckBoxPreference
+        android:defaultValue="false"
+        android:key="use_kernel_module"
+        android:summary="@string/use_kernel_module_summary"
+        android:title="@string/use_kernel_module" />
 </PreferenceScreen>
diff --git a/settings.gradle b/settings.gradle
index e7b4def..9f20b46 100644
--- a/settings.gradle
+++ b/settings.gradle
@@ -1 +1 @@
-include ':app'
+include ':app', ':wireguardbinding'
diff --git a/wireguardbinding/build.gradle b/wireguardbinding/build.gradle
new file mode 100644
index 0000000..52b2613
--- /dev/null
+++ b/wireguardbinding/build.gradle
@@ -0,0 +1,2 @@
+configurations.maybeCreate("default")
+artifacts.add("default", file('wireguardbinding.aar'))
diff --git a/wireguardbinding/src/wireguard b/wireguardbinding/src/wireguard
new file mode 120000
index 0000000..0090783
--- /dev/null
+++ b/wireguardbinding/src/wireguard
@@ -0,0 +1 @@
+../../wireguard-go/src/wireguard
\ No newline at end of file
diff --git a/wireguardbinding/src/wireguardbinding/tun_android.go b/wireguardbinding/src/wireguardbinding/tun_android.go
new file mode 100644
index 0000000..853d6da
--- /dev/null
+++ b/wireguardbinding/src/wireguardbinding/tun_android.go
@@ -0,0 +1,61 @@
+package wireguardbinding
+
+/* Implementation of the TUN device interface for android
+ */
+
+import (
+	"os"
+	"wireguard"
+)
+
+type NativeTun struct {
+	fd   *os.File
+	name string
+	events chan wireguard.TUNEvent
+}
+
+func (tun *NativeTun) Name() string {
+	return tun.name
+}
+
+func (tun *NativeTun) setMTU(n int) error {
+	return nil
+}
+
+func (tun *NativeTun) MTU() (int, error) {
+	return wireguard.DefaultMTU, nil
+}
+
+func (tun *NativeTun) Write(d []byte) (int, error) {
+	return tun.fd.Write(d)
+}
+
+func (tun *NativeTun) Read(d []byte) (int, error) {
+	return tun.fd.Read(d)
+}
+
+func (tun *NativeTun) Events() chan wireguard.TUNEvent {
+	return tun.events
+}
+
+func (tun *NativeTun) Close() error {
+	return tun.fd.Close()
+}
+
+func CreateTUN(fdint int, name string) (wireguard.TUNDevice, error) {
+
+	fd := os.NewFile(uintptr(fdint), name)
+	if fd == nil {
+		return nil, nil
+	}
+
+	device := &NativeTun{
+		fd:   fd,
+		name: name,
+		events: make(chan wireguard.TUNEvent, 5),
+	}
+
+	device.events <- wireguard.TUNEventUp
+
+	return device, nil
+}
diff --git a/wireguardbinding/src/wireguardbinding/wireguard.go b/wireguardbinding/src/wireguardbinding/wireguard.go
new file mode 100644
index 0000000..3103674
--- /dev/null
+++ b/wireguardbinding/src/wireguardbinding/wireguard.go
@@ -0,0 +1,49 @@
+package wireguardbinding
+
+import (
+	"log"
+	"wireguard"
+	"bufio"
+	"strings"
+)
+
+var device *wireguard.Device
+
+func Start(fd int, name string) {
+	log.Println("Start")
+
+	tun, err := CreateTUN(fd, name)
+	if err != nil {
+		log.Println("Failed to create tun device: ", err)
+		return
+	}
+
+	log.Println("NAME ", tun.Name())
+
+	device = wireguard.NewDevice(tun, wireguard.LogLevelDebug)
+}
+
+func Socket() int {
+	log.Println("Socket")
+	fd, _ := wireguard.GetUDPConn(device)
+	return int(fd)
+}
+
+func Stop() {
+	log.Println("Stop")
+	device.Close()
+	device = nil
+}
+
+func SetConf(conf string) {
+	log.Println("SetConf")
+	scanner := bufio.NewScanner(strings.NewReader(conf))
+	wireguard.SetOperation(device, scanner)
+}
+
+func GetConf() []string {
+	log.Println("GetConf")
+	var conf []string
+	wireguard.GetOperation(device, conf)
+	return conf
+}
-- 
2.15.0
