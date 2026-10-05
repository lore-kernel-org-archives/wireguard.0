Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77AECA5FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 21:42:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fe316907;
	Mon, 5 Oct 2026 21:27:55 +0000 (UTC)
Received: from mailcow.ringerl.de (mailcow.ringerl.de [91.237.88.114])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e324a407
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Oct 2026 13:52:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id B9694164014
 for <wireguard@lists.zx2c4.com>; Mon, 05 Oct 2026 15:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kilian-ries.de;
 s=dkim; t=1791208324;
 h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=oDTBXIui2tUmYXlb+ikIgTeS10n7mHs8o1N+8qShmiM=;
 b=YTWYnRGLA21fys8p4W/985QqU3v7FU/NDXvWWlg+WVgBjYGP08JLPTNfVad8IQWG+toLK4
 Kxp2IctfxfwTW5+pzHhbLhEJxgb82CE6eSbd8Z1fKMcQeZ4nQq+zbU3olDIhhk/5OPI0aH
 /b6GP9vxAc05GgKLLm7/RJTTnrCDiWuGDuGe6DQDYKTHTa41sLT8bmkQ+xKLMEQ26pSKJi
 lRuXq8wI5Oe0YjMuM3HRwAtTNGwFEOj7SAFL5JZHVDT/FnNhDPbEFVxAhDts0vGO+dBRFV
 mRh554gGMSK8ee/yqtoEIl1yGTkfXYYYyxExBK5cWE8YdoDxEx7JQD/LuRdo9g==
From: "Kilian Ries" <mail@kilian-ries.de>
To: wireguard@lists.zx2c4.com
User-Agent: SOGoMail 5.12.11
MIME-Version: 1.0
Date: Mon, 05 Oct 2026 15:52:04 +0200
Subject: [PATCH wireguard-apple] =?utf-8?q?Keychain=3A?= use data protection 
 keychain on macOS
Message-ID: <e591acc2-e451-c000-7d85-25d99de77e2f@kilian-ries.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-Mailman-Approved-At: Mon, 05 Oct 2026 21:27:54 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On macOS, tunnel configurations are stored in the file-based login
keychain, with an access list that names the app and the network
extension. On a Mac enrolled through account-driven enrollment, apps
installed by MDM keep their data on a separate "Managed Data" volume.
There is no login keychain for those apps, so SecItemAdd tries to creat=
e
one, and the sandbox refuses:

  authd: Sandbox denied authorizing right 'system.keychain.create.login=
kc' by client '/Applications/WireGuard.app'
  WireGuard: Unable to add config to keychain: -60005
  WireGuard: Add: Saving configuration failed: Error Domain=3DNEVPNErro=
rDomain Code=3D1 "Missing protocol or protocol has invalid type"

In that state no tunnel can be added or imported.

Store new items in the data protection keychain instead, in the app
group that the app and the network extension already share, as on iOS.
The access list is not needed there, because the shared access group
grants the network extension access.

Items created by earlier versions stay in the file-based keychain.
Reading, verifying and deleting a reference try the data protection
keychain first and then the file-based one, so existing tunnels keep
working. An existing tunnel moves to the data protection keychain the
next time it is saved.

Signed-off-by: Kilian Ries <mail@kilian-ries.de>
---

Notes:
    Seen on macOS 27.0.1 with WireGuard 1.0.16 from the App Store, on a=
 Mac
    enrolled in Apple Business Manager through account-driven device
    enrollment. Apps installed there by MDM show a Personas entry in
    "pluginkit -mAvvv", and their containers live on the "Managed Data"
    APFS volume.
   =20
    Type-checked for macOS 12 and iOS 15. Not tested at runtime yet, si=
nce
    that needs a build signed for the app group.

 Sources/Shared/Keychain.swift | 96 +++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 45 deletions(-)

diff --git a/Sources/Shared/Keychain.swift b/Sources/Shared/Keychain.sw=
ift
index 2e0e7f0..c99ea85 100644
--- a/Sources/Shared/Keychain.swift
+++ b/Sources/Shared/Keychain.swift
@@ -7,9 +7,8 @@ import Security
 class Keychain {
     static func openReference(called ref: Data) -> String? {
         var result: CFTypeRef?
-        let ret =3D SecItemCopyMatching([kSecValuePersistentRef: ref,
-                                        kSecReturnData: true] as CFDic=
tionary,
-                                       &result)
+        let ret =3D firstSuccess([kSecValuePersistentRef: ref,
+                                kSecReturnData: true]) { SecItemCopyMa=
tching($0, &result) }
         if ret !=3D errSecSuccess || result =3D=3D nil {
             wg=5Flog(.error, message: "Unable to open config from keyc=
hain: \(ret)")
             return nil
@@ -19,7 +18,6 @@ class Keychain {
     }
=20
     static func makeReference(containing value: String, called name: S=
tring, previouslyReferencedBy oldRef: Data? =3D nil) -> Data? {
-        var ret: OSStatus
         guard var bundleIdentifier =3D Bundle.main.bundleIdentifier el=
se {
             wg=5Flog(.error, staticMessage: "Unable to determine bundl=
e identifier")
             return nil
@@ -40,38 +38,16 @@ class Keychain {
         items[kSecAttrAccessGroup] =3D FileManager.appGroupId
         items[kSecAttrAccessible] =3D kSecAttrAccessibleAfterFirstUnlo=
ck
         #elseif os(macOS)
+        items[kSecUseDataProtectionKeychain] =3D true
+        items[kSecAttrAccessGroup] =3D FileManager.appGroupId
         items[kSecAttrSynchronizable] =3D false
         items[kSecAttrAccessible] =3D kSecAttrAccessibleAfterFirstUnlo=
ckThisDeviceOnly
-
-        guard let extensionPath =3D Bundle.main.builtInPlugInsURL?.app=
endingPathComponent("WireGuardNetworkExtension.appex", isDirectory: tru=
e).path else {
-            wg=5Flog(.error, staticMessage: "Unable to determine app e=
xtension path")
-            return nil
-        }
-        var extensionApp: SecTrustedApplication?
-        var mainApp: SecTrustedApplication?
-        ret =3D SecTrustedApplicationCreateFromPath(extensionPath, &ex=
tensionApp)
-        if ret !=3D kOSReturnSuccess || extensionApp =3D=3D nil {
-            wg=5Flog(.error, message: "Unable to create keychain exten=
sion trusted application object: \(ret)")
-            return nil
-        }
-        ret =3D SecTrustedApplicationCreateFromPath(nil, &mainApp)
-        if ret !=3D errSecSuccess || mainApp =3D=3D nil {
-            wg=5Flog(.error, message: "Unable to create keychain local=
 trusted application object: \(ret)")
-            return nil
-        }
-        var access: SecAccess?
-        ret =3D SecAccessCreate(itemLabel as CFString, [extensionApp!,=
 mainApp!] as CFArray, &access)
-        if ret !=3D errSecSuccess || access =3D=3D nil {
-            wg=5Flog(.error, message: "Unable to create keychain ACL o=
bject: \(ret)")
-            return nil
-        }
-        items[kSecAttrAccess] =3D access!
         #else
         #error("Unimplemented")
         #endif
=20
         var ref: CFTypeRef?
-        ret =3D SecItemAdd(items as CFDictionary, &ref)
+        let ret =3D SecItemAdd(items as CFDictionary, &ref)
         if ret !=3D errSecSuccess || ref =3D=3D nil {
             wg=5Flog(.error, message: "Unable to add config to keychai=
n: \(ret)")
             return nil
@@ -83,32 +59,62 @@ class Keychain {
     }
=20
     static func deleteReference(called ref: Data) {
-        let ret =3D SecItemDelete([kSecValuePersistentRef: ref] as CFD=
ictionary)
+        let ret =3D firstSuccess([kSecValuePersistentRef: ref]) { SecI=
temDelete($0) }
         if ret !=3D errSecSuccess {
             wg=5Flog(.error, message: "Unable to delete config from ke=
ychain: \(ret)")
         }
     }
=20
     static func deleteReferences(except whitelist: Set<Data>) {
-        var result: CFTypeRef?
-        let ret =3D SecItemCopyMatching([kSecClass: kSecClassGenericPa=
ssword,
-                                       kSecAttrService: Bundle.main.bu=
ndleIdentifier as Any,
-                                       kSecMatchLimit: kSecMatchLimitA=
ll,
-                                       kSecReturnPersistentRef: true] =
as CFDictionary,
-                                      &result)
-        if ret !=3D errSecSuccess || result =3D=3D nil {
-            return
-        }
-        guard let items =3D result as? [Data] else { return }
-        for item in items {
-            if !whitelist.contains(item) {
-                deleteReference(called: item)
+        for query in keychainQueries([kSecClass: kSecClassGenericPassw=
ord,
+                                      kSecAttrService: Bundle.main.bun=
dleIdentifier as Any,
+                                      kSecMatchLimit: kSecMatchLimitAl=
l,
+                                      kSecReturnPersistentRef: true]) =
{
+            var result: CFTypeRef?
+            let ret =3D SecItemCopyMatching(query, &result)
+            if ret !=3D errSecSuccess || result =3D=3D nil {
+                continue
+            }
+            guard let items =3D result as? [Data] else { continue }
+            for item in items {
+                if !whitelist.contains(item) {
+                    deleteReference(called: item)
+                }
             }
         }
     }
=20
     static func verifyReference(called ref: Data) -> Bool {
-        return SecItemCopyMatching([kSecValuePersistentRef: ref] as CF=
Dictionary,
-                                   nil) !=3D errSecItemNotFound
+        return firstSuccess([kSecValuePersistentRef: ref]) { SecItemCo=
pyMatching($0, nil) } !=3D errSecItemNotFound
+    }
+
+    /* On macOS, new items go into the data protection keychain. Items=
 created by
+     * earlier versions live in the file-based login keychain, which d=
oes not exist
+     * for apps whose data the system keeps on a separate volume, such=
 as apps
+     * installed by MDM. So every lookup tries the data protection key=
chain first
+     * and then the file-based one.
+     */
+    private static func keychainQueries(=5F query: [CFString: Any]) ->=
 [CFDictionary] {
+        #if os(macOS)
+        var dataProtectionQuery =3D query
+        dataProtectionQuery[kSecUseDataProtectionKeychain] =3D true
+        return [dataProtectionQuery as CFDictionary, query as CFDictio=
nary]
+        #else
+        return [query as CFDictionary]
+        #endif
+    }
+
+    private static func firstSuccess(=5F query: [CFString: Any], =5F o=
peration: (CFDictionary) -> OSStatus) -> OSStatus {
+        var ret =3D errSecItemNotFound
+        for query in keychainQueries(query) {
+            let status =3D operation(query)
+            if status =3D=3D errSecSuccess {
+                return status
+            }
+            if status !=3D errSecItemNotFound && status !=3D errSecNoS=
uchKeychain {
+                ret =3D status
+            }
+        }
+        return ret
     }
 }
--=20
2.54.0 (Apple Git-157)

