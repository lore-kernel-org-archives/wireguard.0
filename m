Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4066AC43217
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Apr 2022 20:12:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3295c079;
	Sun, 24 Apr 2022 20:09:57 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 980f1ed5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Apr 2022 09:20:02 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id a10so13980086oif.9
 for <wireguard@lists.zx2c4.com>; Sun, 24 Apr 2022 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=SCHMbSaYA6a4nVgUe57/3r8Gxv/yUrMOwc+qFG8cFn0=;
 b=czUtoS7xz33EkD3yMb8PtHLUi+eGf5YbnxhMTs/0poGTBKIt1vPqMUxFCDNdwQRIVg
 0dUge1WtQtdqaTVYhrwpN5g4Kn9IQARmiRQAyv17ZzFpWZaKiyIN7ek6QucfN9RM5RZU
 KN8aPxGiHlscSUlU+jzZREC0XqWEDakagAHBHbBlciA3mLxxHc/x/OskYQEAy5WfnsYb
 a19SDDVprnI7KH1HIxD9boBAqWjIXYn4EWpU9KepEmILgyLte/xRj/8gBlyLDKLovJoO
 6O04vIDm+AZAkwZ/oHo2bUj6/4uy2qBaeuDMqbvGWwrA3Nk62UlUvwNB8PLoqafc33+L
 WApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SCHMbSaYA6a4nVgUe57/3r8Gxv/yUrMOwc+qFG8cFn0=;
 b=q34qblBL090WDgPZvTMl48fhMPwhGBlNUzt6khCW451MJ8Ox7JlyjIbxHHXAx7BKap
 uHjWiHfE/o+4a3/1yej/zpnW6BMH0VC552WPTvBCTQUETT9dQLTFjgnJJYLef1o8fwGY
 mJsJ1MKEMVSmshb8I/xgIT94b6fAralh1MKjWYNHTTMjRqr4Sa5oOlxTTyx3OAvnscMN
 7PQ+Yo6jZ3FKON8FkQmWJO345SYo+3tHoEnB/MlmmI7fVtLtTGgv4UlC8Kqqi1ERoy+a
 v7PNtc6tAAoL9WuFhV2Ifr2FP0N1Gjt5qTvVkoL6DlDrKQNDKewCLVZlfu0nxpFQgJ5s
 2+UQ==
X-Gm-Message-State: AOAM533FqO+fIMudvDU0vV+8nQ/7LdvcyMXCH77+gffzASzgPkurVPrR
 BhKna0aG6hAQSWd7M7t0taOo4sZeBwCOslefoYfmr+YBzSB8HQ==
X-Google-Smtp-Source: ABdhPJwfHMoZHXKaCmRw1P5Z7BTNJPsMoV25mKAOkOk7dvCXaOp2Eg2NpAAdZeXlw4F5BPxVJPwZLU2YrXQHJy7nE6g=
X-Received: by 2002:a05:6808:1991:b0:322:cc19:3199 with SMTP id
 bj17-20020a056808199100b00322cc193199mr10198366oib.297.1650792001483; Sun, 24
 Apr 2022 02:20:01 -0700 (PDT)
MIME-Version: 1.0
From: roy azachi <royaza1998@gmail.com>
Date: Sun, 24 Apr 2022 12:19:50 +0300
Message-ID: <CAHskJYgbLezQMWkC=+LaZ0vhKMz2Qg1fSmigNGGsDj0yxRVHQA@mail.gmail.com>
Subject: [PATCH] Fix Wireguard-Apple Logger Memory Leak (Fix Wireguard-Apple
 Logger Memory Leak)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 24 Apr 2022 20:09:51 +0000
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

Using "Instruments" tool shows every log message from the
SystemExtension creates a persistent allocation. Although it seems
there is no retain cycle, the allocated resources are not freed, which
might be caused by the way the function is invoked using golang
instead of the usual swift invocation freeing allocations with zero
retain counter . Using the "autoreleasepool" seems to solve it.
the call tree not freed:
  12 WireGuardNetworkExtension     runtime.asmcgocall.abi0
  11 WireGuardNetworkExtension     _cgo_f1100e4bfc6f_Cfunc_callLogger
  10 WireGuardNetworkExtension     callLogger
   9 WireGuardNetworkExtension     @objc closure #1 in
WireGuardAdapter.setupLogHandler()
<reducted>/wireguard-apple/<compiler-generated>:0
   8 WireGuardNetworkExtension     closure #1 in
WireGuardAdapter.setupLogHandler()
<reducted>/wireguard-apple/Sources/WireGuardKit/WireGuardAdapter.swift:299
   7 libswiftCore.dylib      specialized static String._fromUTF8Repairing(_:)
   6 libswiftCore.dylib      specialized static
String._uncheckedFromUTF8(_:asciiPreScanResult:)
   5 libswiftCore.dylib      specialized static
__StringStorage.create(initializingFrom:isASCII:)
   4 libswiftCore.dylib      _allocateStringStorage(codeUnitCapacity:)
   3 libswiftCore.dylib      _swift_allocObject_
   2 libswiftCore.dylib      _swift_allocObject_
   1 libswiftCore.dylib      swift_slowAlloc
   0 libsystem_malloc.dylib      _malloc_zone_malloc

Signed-off-by: Roy Azachi <royaza1998@gmail.com>
---
 Sources/WireGuardKit/WireGuardAdapter.swift | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Sources/WireGuardKit/WireGuardAdapter.swift
b/Sources/WireGuardKit/WireGuardAdapter.swift
index 4cb2e2e..3828951 100644
--- a/Sources/WireGuardKit/WireGuardAdapter.swift
+++ b/Sources/WireGuardKit/WireGuardAdapter.swift
@@ -295,11 +295,12 @@ public class WireGuardAdapter {

             let unretainedSelf =
Unmanaged<WireGuardAdapter>.fromOpaque(context)
                 .takeUnretainedValue()
+            autoreleasepool {
+                let swiftString = String(cString:
message).trimmingCharacters(in: .newlines)
+                let tunnelLogLevel = WireGuardLogLevel(rawValue:
logLevel) ?? .verbose

-            let swiftString = String(cString:
message).trimmingCharacters(in: .newlines)
-            let tunnelLogLevel = WireGuardLogLevel(rawValue:
logLevel) ?? .verbose
-
-            unretainedSelf.logHandler(tunnelLogLevel, swiftString)
+                unretainedSelf.logHandler(tunnelLogLevel, swiftString)
+            }
         }
     }

--
2.30.1 (Apple Git-130)
