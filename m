Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A1AC004C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 14:24:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71471292;
	Mon, 23 Oct 2023 14:07:34 +0000 (UTC)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ac32ab76
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Sep 2023 13:13:53 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-59c0d329a8bso38173557b3.1
 for <wireguard@lists.zx2c4.com>; Tue, 19 Sep 2023 06:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=euro-domenii-eu.20230601.gappssmtp.com; s=20230601; t=1695129231;
 x=1695734031; darn=lists.zx2c4.com; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fHBvpHYj1ZEgjvp4948TLCfECaJ1majhAjARcXUtywQ=;
 b=Lv7PAawMHtShSx9UYUrO4dm/b8knKcuVJy4E7T+EVsauzN3sIghWe8U169vHXhPj1u
 vw8EoWREt6CA2nWf+ixpIfaGpj0hdBSqJh14/foXDGFz4OHeLvLREKRsJM/EptSdforc
 fVPGXtYEXU+2uWmLNSiCBmA2ihLi88nlu6cW2WbtbguwQqGOfseAVIbVGgli4LGHeGax
 RQOiJKVUh+6BAaD/eFpqp4oLByCB7YW4EfJlCoVbPqH7MF3BWcG/Ffd/Wy9LBZnGUlWI
 06VLhXSFUSWIwJcBOW5NIc9c4GSLwOpkDcBX9R00YYJNEbJ8/OyvyVfGKtQ19f7WseLD
 IoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695129231; x=1695734031;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fHBvpHYj1ZEgjvp4948TLCfECaJ1majhAjARcXUtywQ=;
 b=MR8LOHpeqvYoyKDecW0iD92m+EAbCzTUCHQvuDWeoPgGjUA/kXOTA8+l+k4YxvKp/f
 Q+wi8QJjSrYxFIpFIoNCcxSz/zstzEcbWa0qiMqXOdRjRuYTepKjdPkgfqQeBE5gqQOG
 gjRqunkhGc7vITof9bnHNSaNkTOaUq19uM4CJbCiTnVzijBxWT+BTwjX3d/WaUAYePgw
 EaIskYLVamrfd525B7VM9Fo9WtCqHaTPerXyYLiwlYFQfa7KwVJmlINC+q7lUKGy74mq
 6qHN1oXhqF0loqWTuuO20sWKSNiM+4BtAdUqPaUXI6P1gI5UL07arW4PCtjG6oOoVX9e
 mD8A==
X-Gm-Message-State: AOJu0Yxi8PefbJIWU0hTtCoXV2TQrG9Ou+fEezHFLeXHBMOK71sNb4Dj
 q3vnjxtaHtSVkJ3b58d5dpFgCae7WM8JmbIYM4pa8U+6EwUk+vLk6To=
X-Google-Smtp-Source: AGHT+IHfWj3RpoN7wOZQjnOtq9VNrbely0SddiY0krkeM0COdzXUwUFdhIIkVCiwv/WxZ0nRgagGUW2BTZsCl3akSAs=
X-Received: by 2002:a25:187:0:b0:d81:65a9:ac6c with SMTP id
 129-20020a250187000000b00d8165a9ac6cmr11424460ybb.24.1695129231484; Tue, 19
 Sep 2023 06:13:51 -0700 (PDT)
MIME-Version: 1.0
From: "EuroDomenii .Eu .Ro Accredited Registrar" <info@euro-domenii.eu>
Date: Tue, 19 Sep 2023 16:13:40 +0300
Message-ID: <CADw2znBiKvc+1Budiuc=MCPAN=bOnkH6rjogjT2NyN2FHrvnAQ@mail.gmail.com>
Subject: WireGuard as Android Device Owner
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:07:27 +0000
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

Dear all,

I'm tryin to set up WireGuard as Android Device Owner, but it fails,
even though there's the very same code that worked with Shadowsocks
fork. Below the files samples and full error message.

Thanks!

*ui/src/main/AndroidManifest.xml
<pre>
        <receiver
            android:name=3D".WireGuardReceiver"
            android:description=3D"@string/app_name"
            android:label=3D"@string/app_name"
            android:permission=3D"android.permission.BIND_DEVICE_ADMIN"
            android:exported=3D"true">
                       <intent-filter>
                          <!-- This action is required -->
                           <action
android:name=3D"android.app.action.DEVICE_ADMIN_ENABLED" />
                           <action
android:name=3D"android.app.action.PROFILE_PROVISIONING_COMPLETE" />
                       </intent-filter>
            <meta-data
                android:name=3D"android.app.device_admin"
                android:resource=3D"@xml/device_owner_receiver" />
        </receiver>
</pre>

*ui/src/main/java/com/wireguard/android/WireGuardReceiver.kt
<pre>
/*
 * Copyright =C2=A9 2017-2023 WireGuard LLC. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */

package com.wireguard.android

import android.app.admin.DeviceAdminReceiver

/**
 * Trivial DeviceAdminReceiver used to identify this app's device administr=
ator.
 */
class WireGuardReceiver : DeviceAdminReceiver()
</pre>

ui/src/main/res/xml/device_owner_receiver.xml
<pre>
<?xml version=3D"1.0" encoding=3D"utf-8"?>
<!--
 Copyright 2015 The Android Open Source Project

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->
<device-admin>
    <uses-policies>
        <limit-password/>
        <watch-login/>
        <reset-password/>
        <force-lock/>
        <wipe-data/>
        <expire-password/>
        <encrypted-storage/>
        <disable-camera/>
    </uses-policies>
</device-admin>

</pre>

*Error
<pre>
root@androids ~/AndroidStudioProjects/wireguard-android # adb shell
emu64x:/ $ dpm set-device-owner com.wireguard.android/.WireGuardReceiver

Exception occurred while executing 'set-device-owner':
java.lang.IllegalArgumentException: Unknown admin:
ComponentInfo{com.wireguard.android/com.wireguard.android.WireGuardReceiver=
}
        at com.android.server.devicepolicy.DevicePolicyManagerService.findA=
dmin(DevicePolicyManagerService.java:2838)
        at com.android.server.devicepolicy.DevicePolicyManagerService.setAc=
tiveAdmin(DevicePolicyManagerService.java:3342)
        at com.android.server.devicepolicy.DevicePolicyManagerServiceShellC=
ommand.runSetDeviceOwner(DevicePolicyManagerServiceShellCommand.java:256)
        at com.android.server.devicepolicy.DevicePolicyManagerServiceShellC=
ommand.onCommand(DevicePolicyManagerServiceShellCommand.java:89)
        at com.android.modules.utils.BasicShellCommandHandler.exec(BasicShe=
llCommandHandler.java:97)
        at android.os.ShellCommand.exec(ShellCommand.java:38)
        at com.android.server.devicepolicy.DevicePolicyManagerService.onShe=
llCommand(DevicePolicyManagerService.java:9905)
        at android.os.Binder.shellCommand(Binder.java:1049)
        at android.os.Binder.onTransact(Binder.java:877)
        at android.app.admin.IDevicePolicyManager$Stub.onTransact(IDevicePo=
licyManager.java:6054)
        at android.os.Binder.execTransactInternal(Binder.java:1285)
        at android.os.Binder.execTransact(Binder.java:1244)

</pre>
