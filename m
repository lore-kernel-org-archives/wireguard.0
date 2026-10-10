Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6772B606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 19:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20251104 header.b=cvyfgMMs
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e6b67f8a;
	Mon, 26 Oct 2026 19:53:43 +0000 (UTC)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a6a779cb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Oct 2026 16:03:35 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6df93f00f4dso294261eaf.2
 for <wireguard@lists.zx2c4.com>; Sat, 10 Oct 2026 09:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791648214; x=1792253014; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=KT0WoKmHT6FpoYsCvrmq0O+IOVg0wqSjpqWtReBTVvU=;
 b=cvyfgMMsu9SY/D/NIJ6pBjNX0TBRtarowkQ50GgbILWEKG7MDMhaWpkMTBoTRG/MEj
 httCLY8m7f9oX7FEa5gR3X2YrneK1D58X/Xk2y3GBw9rPiZAnxKthX33QQOnM/JkB8le
 MHadgMOJDYlPdGNdJitb7gS+pceRh/eTkf7W0gjBl/gUvbzdLt4aGUkltKci6kPmzxBJ
 S/DjY6xbeQnb5NHtHMQI9GiEdsutesePo2k5NYysiYSWvpS6m1VHpI0Bauzakw3IF/6F
 nMknxBSui9bUrZKKwFDukG+k2GCChFKedYP3xdLEG7Yf5C//+A+giR1U4v38F4whQBaR
 hPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791648214; x=1792253014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=KT0WoKmHT6FpoYsCvrmq0O+IOVg0wqSjpqWtReBTVvU=;
 b=eLEOj/pLzfOr9K6RBMsl77GYeAk5lSe1ON6QCyTpbe0a77VWY/aDHGaI11VAhMcV2A
 M2yn2DR6RA3if/jFwvH683mGXckH+c4kUHyyQ7O9dfGuHNbjU4ZPnD3XxD2uD3RnwCr6
 R7A9xoC4pK/gbEGZFf8Au0XfZYanNrdgWSrRBslO/e/7xciaUzVM60rb8APULl9Pw8cZ
 ULbB5beIE/scV3PLkZqKMqejDD1prUiZXlzfl6pqwNzw+mH9lmWooYhUSwQ8FdF0ev1J
 +HABBg0CJEbkH0XGtxB/tuYaqC5h0G3t/W82fOTD2YMdcZcIaYewwSX/bnpOwG+QZhCe
 Icag==
X-Gm-Message-State: AFq9FYL+sNr0FGFnKh4UbZ2hKDp517hXFg33qmbOz5CwQlFm1uQeXfSL
 gGViMSk+3nD5V3hMcEM6DyV1Tq6HuRJyD5W82T9HBd/guwGJnDuZDkrEH7pN1w==
X-Gm-Gg: AYBFou3aPUzjrdhpyjqFeCnsHxJtnJK0f0ymb3jFGNV3tFFrFdDtKzJjOkO8SMKJDdR
 WW+6uoCPo8fgh8Tk1TqCs8J1DRj0Ntb9TGiOsp8QNEcBW0EFNh8A6tC3zrIisyba2r8e0lCqHFq
 p7Y0H/kWb3adPj+IjPqLYyxBF4BJMbjTDizrCspn9HgkAmMwj+G+ZuL8Tk1H5vAGSYT1O/R1wKf
 wR3kejny2XMrjN9QFDsmIHve1XfEV4AgJbP9YOvaMKK7cirHCgD293MpKsrcsUOiuJh3TwXWeZe
 eNLwDp7EKVYEHHxwQEKPb0HIx2LeA72rqDaEZ5sAQCYZDs85Zf8xlp6svRUQYgiCTul3lJWVloT
 OH7Lfh82/oKo5/oISntLs3kF5EG9c1KGhgO3s2w5ArgMnmYkYDT4T2HHuzmh7L24OsTxNIiBcsY
 h6d0WUEVhGy6HGk77rFTgyot19S7u6hvK6kvbfsIGA8P32tlU8jQBltE/YW3MGL29biBiPVdD18
 rmekJVLHOYm14Lvqa1PHnroJMWuvwVjarttap5ezzuVgtNK6TvEDO4uKu3mkAVEwnqI
X-Received: by 2002:a4a:edc4:0:b0:6de:d2c1:e980 with SMTP id
 006d021491bc7-6ef123ff0ddmr3256267eaf.71.1791648213377; 
 Sat, 10 Oct 2026 09:03:33 -0700 (PDT)
Received: from fruitbat.pteropodidae.net
 ([2600:8802:7f60:800:f5af:3c13:a013:e022])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-83039076d67sm5184385a34.13.2026.10.10.09.03.31
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Oct 2026 09:03:32 -0700 (PDT)
From: Loren McQuade <loren.mcquade@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/2] iOS: adopt the UIScene lifecycle
Date: Sat, 10 Oct 2026 09:03:03 -0700
Message-ID: <20261010160303.2853-3-loren.mcquade@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010160303.2853-1-loren.mcquade@gmail.com>
References: <20261010160303.2853-1-loren.mcquade@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Oct 2026 19:53:36 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Apps built with the iOS 27 SDK that have no scene manifest are killed at
launch, with EXC_BREAKPOINT in
UIApplicationEvaluateRuntimeIssueForNoSceneLifecycleAdoption.

Move the window and main view controller out of the app delegate into a
SceneDelegate, and handle URL opens and quick actions there. The
UIApplicationSceneManifest in Info.plist names the delegate.

The app delegate's state restoration, which brought back the tunnel detail
screen after a relaunch, is not called once the app uses scenes, and a
scene's restoration activity is not handed back after the user force-quits
the app (checked on a device: session.stateRestorationActivity is nil on the
next launch although the scene saved one). So remember the open tunnel in
UserDefaults when the scene resigns active, and reopen it at launch unless
the app was launched for a URL or a quick action.

Signed-off-by: Loren McQuade <loren.mcquade@gmail.com>
---
 Sources/WireGuardApp/UI/iOS/AppDelegate.swift | 100 +++++++++---------
 Sources/WireGuardApp/UI/iOS/Info.plist        |  17 +++
 .../ViewController/MainViewController.swift   |  13 +++
 3 files changed, 79 insertions(+), 51 deletions(-)

diff --git a/Sources/WireGuardApp/UI/iOS/AppDelegate.swift b/Sources/WireGuardApp/UI/iOS/AppDelegate.swift
index fbb09c7..24c7cd8 100644
--- a/Sources/WireGuardApp/UI/iOS/AppDelegate.swift
+++ b/Sources/WireGuardApp/UI/iOS/AppDelegate.swift
@@ -7,78 +7,76 @@ import os.log
 @UIApplicationMain
 class AppDelegate: UIResponder, UIApplicationDelegate {
 
-    var window: UIWindow?
     var mainVC: MainViewController?
-    var isLaunchedForSpecificAction = false
 
     func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         Logger.configureGlobal(tagged: "APP", withFilePath: FileManager.logFileURL?.path)
 
-        if let launchOptions = launchOptions {
-            if launchOptions[.url] != nil || launchOptions[.shortcutItem] != nil {
-                isLaunchedForSpecificAction = true
-            }
-        }
+        return true
+    }
+}
 
-        let window = UIWindow(frame: UIScreen.main.bounds)
-        self.window = window
+/// Owns the window and main view controller. iOS 27 requires apps built with its SDK to adopt the
+/// UIScene lifecycle; the app-delegate-owned window used to be enough.
+class SceneDelegate: UIResponder, UIWindowSceneDelegate {
+    private static let lastDisplayedTunnelKey = "lastDisplayedTunnelName"
+
+    var window: UIWindow?
+
+    private var appDelegate: AppDelegate? {
+        return UIApplication.shared.delegate as? AppDelegate
+    }
+
+    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
+        guard let windowScene = scene as? UIWindowScene else { return }
 
         let mainVC = MainViewController()
+        let window = UIWindow(windowScene: windowScene)
         window.rootViewController = mainVC
         window.makeKeyAndVisible()
+        self.window = window
+        appDelegate?.mainVC = mainVC
 
-        self.mainVC = mainVC
-
-        return true
-    }
-
-    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
-        mainVC?.importFromDisposableFile(url: url)
-        return true
+        if !connectionOptions.urlContexts.isEmpty || connectionOptions.shortcutItem != nil {
+            if let url = connectionOptions.urlContexts.first?.url {
+                mainVC.importFromDisposableFile(url: url)
+            }
+            if let shortcutItem = connectionOptions.shortcutItem {
+                handle(shortcutItem: shortcutItem)
+            }
+        } else if let tunnelName = UserDefaults.standard.string(forKey: Self.lastDisplayedTunnelKey) {
+            mainVC.showTunnelDetailForTunnel(named: tunnelName, animated: false, shouldToggleStatus: false)
+        }
     }
 
-    func applicationDidBecomeActive(_ application: UIApplication) {
-        mainVC?.refreshTunnelConnectionStatuses()
+    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
+        guard let url = URLContexts.first?.url else { return }
+        appDelegate?.mainVC?.importFromDisposableFile(url: url)
     }
 
-    func applicationWillResignActive(_ application: UIApplication) {
-        guard let allTunnelNames = mainVC?.allTunnelNames() else { return }
-        application.shortcutItems = QuickActionItem.createItems(allTunnelNames: allTunnelNames)
+    func sceneDidBecomeActive(_ scene: UIScene) {
+        appDelegate?.mainVC?.refreshTunnelConnectionStatuses()
     }
 
-    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
-        guard shortcutItem.type == QuickActionItem.type else {
-            completionHandler(false)
-            return
+    func sceneWillResignActive(_ scene: UIScene) {
+        // iOS discards a scene's saved state when the user force-quits, so remember the open tunnel ourselves.
+        if let tunnelName = appDelegate?.mainVC?.displayedTunnelName {
+            UserDefaults.standard.set(tunnelName, forKey: Self.lastDisplayedTunnelKey)
+        } else {
+            UserDefaults.standard.removeObject(forKey: Self.lastDisplayedTunnelKey)
         }
-        let tunnelName = shortcutItem.localizedTitle
-        mainVC?.showTunnelDetailForTunnel(named: tunnelName, animated: false, shouldToggleStatus: true)
-        completionHandler(true)
-    }
-}
-
-extension AppDelegate {
-    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
-        return true
+        guard let allTunnelNames = appDelegate?.mainVC?.allTunnelNames() else { return }
+        UIApplication.shared.shortcutItems = QuickActionItem.createItems(allTunnelNames: allTunnelNames)
     }
 
-    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
-        return !self.isLaunchedForSpecificAction
+    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
+        completionHandler(handle(shortcutItem: shortcutItem))
     }
 
-    func application(_ application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
-        guard let vcIdentifier = identifierComponents.last else { return nil }
-        if vcIdentifier.hasPrefix("TunnelDetailVC:") {
-            let tunnelName = String(vcIdentifier.suffix(vcIdentifier.count - "TunnelDetailVC:".count))
-            if let tunnelsManager = mainVC?.tunnelsManager {
-                if let tunnel = tunnelsManager.tunnel(named: tunnelName) {
-                    return TunnelDetailTableViewController(tunnelsManager: tunnelsManager, tunnel: tunnel)
-                }
-            } else {
-                // Show it when tunnelsManager is available
-                mainVC?.showTunnelDetailForTunnel(named: tunnelName, animated: false, shouldToggleStatus: false)
-            }
-        }
-        return nil
+    @discardableResult
+    private func handle(shortcutItem: UIApplicationShortcutItem) -> Bool {
+        guard shortcutItem.type == QuickActionItem.type else { return false }
+        appDelegate?.mainVC?.showTunnelDetailForTunnel(named: shortcutItem.localizedTitle, animated: false, shouldToggleStatus: true)
+        return true
     }
 }
diff --git a/Sources/WireGuardApp/UI/iOS/Info.plist b/Sources/WireGuardApp/UI/iOS/Info.plist
index 7d91077..108b0d2 100644
--- a/Sources/WireGuardApp/UI/iOS/Info.plist
+++ b/Sources/WireGuardApp/UI/iOS/Info.plist
@@ -80,6 +80,23 @@
 	<false/>
 	<key>NSCameraUsageDescription</key>
 	<string>Localized</string>
+	<key>UIApplicationSceneManifest</key>
+	<dict>
+		<key>UIApplicationSupportsMultipleScenes</key>
+		<false/>
+		<key>UISceneConfigurations</key>
+		<dict>
+			<key>UIWindowSceneSessionRoleApplication</key>
+			<array>
+				<dict>
+					<key>UISceneConfigurationName</key>
+					<string>Default Configuration</string>
+					<key>UISceneDelegateClassName</key>
+					<string>$(PRODUCT_MODULE_NAME).SceneDelegate</string>
+				</dict>
+			</array>
+		</dict>
+	</dict>
 	<key>UILaunchStoryboardName</key>
 	<string>LaunchScreen</string>
 	<key>UIRequiredDeviceCapabilities</key>
diff --git a/Sources/WireGuardApp/UI/iOS/ViewController/MainViewController.swift b/Sources/WireGuardApp/UI/iOS/ViewController/MainViewController.swift
index 8542296..6c67033 100644
--- a/Sources/WireGuardApp/UI/iOS/ViewController/MainViewController.swift
+++ b/Sources/WireGuardApp/UI/iOS/ViewController/MainViewController.swift
@@ -88,6 +88,19 @@ extension MainViewController {
         }
     }
 
+    /// Name of the tunnel whose detail screen is currently in a navigation stack, if any.
+    var displayedTunnelName: String? {
+        func detail(in controllers: [UIViewController]) -> TunnelDetailTableViewController? {
+            for controller in controllers {
+                if let detail = controller as? TunnelDetailTableViewController { return detail }
+                if let navigationController = controller as? UINavigationController,
+                   let detail = detail(in: navigationController.viewControllers) { return detail }
+            }
+            return nil
+        }
+        return detail(in: viewControllers)?.tunnel.name
+    }
+
     func showTunnelDetailForTunnel(named tunnelName: String, animated: Bool, shouldToggleStatus: Bool) {
         let showTunnelDetailBlock: (TunnelsManager) -> Void = { [weak self] tunnelsManager in
             guard let self = self else { return }
-- 
2.54.0 (Apple Git-157)

