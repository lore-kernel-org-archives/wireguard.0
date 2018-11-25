Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MIME_HTML_MOSTLY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33C8C65BAF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64B1720989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64B1720989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pianetapex.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be5923e5;
	Thu, 6 Dec 2018 23:05:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d047a8bf
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Nov 2018 18:28:01 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59ac760a
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Nov 2018 18:28:00 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id m19so12189483ioh.3
 for <wireguard@lists.zx2c4.com>; Sun, 25 Nov 2018 10:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZXBurzIBaqlTi88E+QacpwOdJEfwkZTRTWm8mMd0KhY=;
 b=gvbuclQsREcBvCQOXgavezjeJ0Strhz1DmVp34eeH/NZPsdHHoBYyLM++OhwpuxV0D
 oIhBis0eCx17hNgFTZeEhiWFT5uTnoFGCInca5EVYXbyHp/qZt6GTwFeYuYvuTWyH1CX
 QaA1CyY0MzvD3kDP3klfc+q+iuug7A9Lpmj3p0lPhOGylVQK6B+KUApPoAYitPAlhbpx
 e8i45ZRT0RSXW4ps9UgTsZG+aMcQ5pzkcvFBtzaIOlzLqbDxESjkOxf8+OqRuf6+ZXMG
 mIm85UiwEAbE8iYCRVaPF4M1TjXFb49XW3Ir6u/hP+NH5fEjHKknWdZWGa2Gt+CVjDBw
 KDrA==
X-Gm-Message-State: AA+aEWYpJa7i10hnYz2ztBzpC/v1SgKDVjVKWJLhbJK9KlYXynb2O4gc
 FoYcdFjxMD04IUO2/kgq9hj60HTd4T7OWuueeh0cYsLZ
X-Google-Smtp-Source: AFSGD/VUvBL8HFt94PXRjT00wLYHa/vbtQTje1yX3i2QZkgaaGxn33/PcYbQKg0w16oxCbW72D9Tszout7PqGTnNeoc=
X-Received: by 2002:a6b:ea05:: with SMTP id m5mr16428870ioc.97.1543170887191; 
 Sun, 25 Nov 2018 10:34:47 -0800 (PST)
MIME-Version: 1.0
From: Andrea <andre@pianetapex.it>
Date: Sun, 25 Nov 2018 19:34:34 +0100
Message-ID: <CAB7V4qPuiLvwpOB=F2WZaam9Vhv7TziFpAX9VUPkb2nobL99Rw@mail.gmail.com>
Subject: Android client doesn't connect
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:05:17 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8534104999207836889=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8534104999207836889==
Content-Type: multipart/alternative; boundary="0000000000008f115b057b81787a"

--0000000000008f115b057b81787a
Content-Type: text/plain; charset="UTF-8"

 This is the conf file on Android:
[Interface]
Address = 192.168.2.1/32
PrivateKey = xxxxxxxxxxxxxxxxxxxxxxxxx

[Peer]
Endpoint = my_public_ip:443
PublicKey = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

When I enable the client, on the server there are no connections (I can see
the firewall logs and nothing is happening).
Down here there is the client log.
Thanks!
Andrea


11-25 19:22:10.256 16216 16216 I am_on_paused_called:
[0,com.wireguard.android.activity.MainActivity,performPause]
11-25 19:22:10.281 16216 16216 I auditd  : type=1400 audit(0.0:252499):
avc: denied { read } for comm="RenderThread"
name="u:object_r:vendor_default_prop:s0" dev="tmpfs" ino=23691
scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:10.281 16216 16216 W RenderThread: type=1400 audit(0.0:252499):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:10.287 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:10.289 16216 16216 I am_on_stop_called:
[0,com.wireguard.android.activity.MainActivity,STOP_ACTIVITY_ITEM]
11-25 19:22:19.151 16216 16216 I am_on_restart_called:
[0,com.wireguard.android.activity.MainActivity,performRestartActivity]
11-25 19:22:19.153 16216 16216 I am_on_start_called:
[0,com.wireguard.android.activity.MainActivity,handleStartActivity]
11-25 19:22:19.154 16216 16216 I am_on_resume_called:
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]
11-25 19:22:19.174 16216 16303 D DecorView:
onWindowFocusChangedFromViewRoot hasFocus: true, DecorView@38eb1b4
[MainActivity]
11-25 19:22:19.161 16216 16216 I auditd  : type=1400 audit(0.0:252505):
avc: denied { read } for comm="RenderThread"
name="u:object_r:vendor_default_prop:s0" dev="tmpfs" ino=23691
scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:19.161 16216 16216 W RenderThread: type=1400 audit(0.0:252505):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:19.175 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.changepixelformat"
11-25 19:22:19.182 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:19.171 16216 16216 W RenderThread: type=1400 audit(0.0:252506):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:19.171 16216 16216 I auditd  : type=1400 audit(0.0:252506):
avc: denied { read } for comm="RenderThread"
name="u:object_r:vendor_default_prop:s0" dev="tmpfs" ino=23691
scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:20.791 16216 16216 I auditd  : type=1400 audit(0.0:252507):
avc: denied { read } for comm="RenderThread"
name="u:object_r:vendor_default_prop:s0" dev="tmpfs" ino=23691
scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:20.791 16216 16216 W RenderThread: type=1400 audit(0.0:252507):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:20.800 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:20.813 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:20.801 16216 16216 W RenderThread: type=1400 audit(0.0:252508):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:20.811 16216 16216 W RenderThread: type=1400 audit(0.0:252509):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:20.819 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:20.821 16216 16216 W RenderThread: type=1400 audit(0.0:252510):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:20.833 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:20.851 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:20.841 16216 16216 W RenderThread: type=1400 audit(0.0:252511):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:20.851 16216 16216 W RenderThread: type=1400 audit(0.0:252512):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:20.865 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:20.871 16216 16216 W RenderThread: type=1400 audit(0.0:252513):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:20.883 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.037 16216 16295 I chatty  : uid=10158(com.wireguard.android)
RenderThread identical 9 lines
11-25 19:22:21.052 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:20.851 16216 16216 I chatty  : uid=10158(com.wireguard.android)
identical 5 lines
11-25 19:22:20.871 16216 16216 I auditd  : type=1400 audit(0.0:252513):
avc: denied { read } for comm="RenderThread"
name="u:object_r:vendor_default_prop:s0" dev="tmpfs" ino=23691
scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:21.699 16216 16216 I menu_item_selected: [0,Settings]
11-25 19:22:21.700 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.718 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.733 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.739 16216 16216 I am_on_paused_called:
[0,com.wireguard.android.activity.MainActivity,performPause]
11-25 19:22:21.747 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.750 16216 16216 W ActivityThread: handleWindowVisibility: no
activity for token android.os.BinderProxy@d3bad7b
11-25 19:22:21.753 16216 16216 I am_on_create_called:
[0,com.wireguard.android.activity.SettingsActivity,performCreate]
11-25 19:22:21.761 16216 16216 I am_on_start_called:
[0,com.wireguard.android.activity.SettingsActivity,handleStartActivity]
11-25 19:22:21.761 16216 16216 I am_on_resume_called:
[0,com.wireguard.android.activity.SettingsActivity,RESUME_ACTIVITY]
11-25 19:22:21.763 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.772 16216 16303 D DecorView:
onWindowFocusChangedFromViewRoot hasFocus: true, DecorView@9b22e86
[SettingsActivity]
11-25 19:22:21.777 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.changepixelformat"
11-25 19:22:21.780 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.796 16216 16295 I chatty  : uid=10158(com.wireguard.android)
RenderThread identical 2 lines
11-25 19:22:21.797 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.815 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.821 16216 16216 I auditd  : type=1400 audit(0.0:252535):
avc: denied { read } for comm="RenderThread"
name="u:object_r:vendor_default_prop:s0" dev="tmpfs" ino=23691
scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:21.821 16216 16216 W RenderThread: type=1400 audit(0.0:252535):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:21.833 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.841 16216 16216 W RenderThread: type=1400 audit(0.0:252536):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:21.849 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.865 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.851 16216 16216 W RenderThread: type=1400 audit(0.0:252537):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:21.871 16216 16216 W RenderThread: type=1400 audit(0.0:252538):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:21.882 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.899 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.891 16216 16216 W RenderThread: type=1400 audit(0.0:252539):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:21.915 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:22.066 16216 16295 I chatty  : uid=10158(com.wireguard.android)
RenderThread identical 9 lines
11-25 19:22:22.083 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:21.871 16216 16216 I chatty  : uid=10158(com.wireguard.android)
identical 3 lines
11-25 19:22:21.891 16216 16216 I auditd  : type=1400 audit(0.0:252539):
avc: denied { read } for comm="RenderThread"
name="u:object_r:vendor_default_prop:s0" dev="tmpfs" ino=23691
scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:22.216 16216 16216 I am_on_stop_called:
[0,com.wireguard.android.activity.MainActivity,STOP_ACTIVITY_ITEM]
11-25 19:22:24.291 16216 16216 I auditd  : type=1400 audit(0.0:252551):
avc: denied { read } for comm="RenderThread"
name="u:object_r:vendor_default_prop:s0" dev="tmpfs" ino=23691
scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:24.291 16216 16216 W RenderThread: type=1400 audit(0.0:252551):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:24.306 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:24.320 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:24.311 16216 16216 W RenderThread: type=1400 audit(0.0:252552):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:24.332 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:24.321 16216 16216 W RenderThread: type=1400 audit(0.0:252553):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:24.347 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:24.341 16216 16216 W RenderThread: type=1400 audit(0.0:252554):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:24.363 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:24.351 16216 16216 W RenderThread: type=1400 audit(0.0:252555):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:24.379 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:25.265 16216 16295 I chatty  : uid=10158(com.wireguard.android)
RenderThread identical 21 lines
11-25 19:22:25.279 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:25.301 16216 16216 W RenderThread: type=1400 audit(0.0:252580):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:25.296 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:25.313 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:25.321 16216 16216 W RenderThread: type=1400 audit(0.0:252581):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:25.329 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:25.346 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:25.331 16216 16216 W RenderThread: type=1400 audit(0.0:252582):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:25.362 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"
11-25 19:22:25.351 16216 16216 W RenderThread: type=1400 audit(0.0:252583):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:25.371 16216 16216 W RenderThread: type=1400 audit(0.0:252584):
avc: denied { read } for name="u:object_r:vendor_default_prop:s0"
dev="tmpfs" ino=23691 scontext=u:r:untrusted_app:s0:c158,c256,c512,c768
tcontext=u:object_r:vendor_default_prop:s0 tclass=file permissive=0
11-25 19:22:25.380 16216 16295 E libc    : Access denied finding property
"vendor.debug.egl.swapinterval"

--0000000000008f115b057b81787a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<div>This is the conf file on Android:</div><div>[Interface]<br>Address =3D=
 <a href=3D"http://192.168.2.1/32" target=3D"_blank">192.168.2.1/32</a><br>=
PrivateKey =3D xxxxxxxxxxxxxxxxxxxxxxxxx<br><br>[Peer]<br>Endpoint =3D my_p=
ublic_ip:443<br>PublicKey =3D xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</div><d=
iv><br></div><div>When I enable the client, on the server there are no conn=
ections (I can see the firewall logs and nothing is happening).</div><div>D=
own here there is the client log.</div><div>Thanks!<br></div><div>Andrea</d=
iv><div><br></div><div><br></div><div>11-25 19:22:10.256 16216 16216 I am_o=
n_paused_called: [0,com.wireguard.android.activity.MainActivity,performPaus=
e]<br>11-25
 19:22:10.281 16216 16216 I auditd=C2=A0 : type=3D1400 audit(0.0:252499): a=
vc:=20
denied { read } for comm=3D&quot;RenderThread&quot; name=3D&quot;u:object_r=
:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=
=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_de=
fault_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22:10.281 16216 1621=
6 W RenderThread: type=3D1400 audit(0.0:252499): avc: denied { read } for n=
ame=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot;=
 ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=
=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 =
19:22:10.287 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding p=
roperty &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:10.289 162=
16 16216 I am_on_stop_called: [0,com.wireguard.android.activity.MainActivit=
y,STOP_ACTIVITY_ITEM]<br>11-25 19:22:19.151 16216 16216 I am_on_restart_cal=
led: [0,com.wireguard.android.activity.MainActivity,performRestartActivity]=
<br>11-25 19:22:19.153 16216 16216 I am_on_start_called: [0,com.wireguard.a=
ndroid.activity.MainActivity,handleStartActivity]<br>11-25 19:22:19.154 162=
16 16216 I am_on_resume_called: [0,com.wireguard.android.activity.MainActiv=
ity,RESUME_ACTIVITY]<br>11-25 19:22:19.174 16216 16303 D DecorView: onWindo=
wFocusChangedFromViewRoot hasFocus: true, DecorView@38eb1b4[MainActivity]<b=
r>11-25
 19:22:19.161 16216 16216 I auditd=C2=A0 : type=3D1400 audit(0.0:252505): a=
vc:=20
denied { read } for comm=3D&quot;RenderThread&quot; name=3D&quot;u:object_r=
:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=
=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_de=
fault_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22:19.161 16216 1621=
6 W RenderThread: type=3D1400 audit(0.0:252505): avc: denied { read } for n=
ame=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot;=
 ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=
=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 =
19:22:19.175 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding p=
roperty &quot;vendor.debug.egl.changepixelformat&quot;<br>11-25 19:22:19.18=
2 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding property &qu=
ot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:19.171 16216 16216 W =
RenderThread: type=3D1400 audit(0.0:252506): avc: denied { read } for name=
=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; in=
o=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:=
object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25
 19:22:19.171 16216 16216 I auditd=C2=A0 : type=3D1400 audit(0.0:252506): a=
vc:=20
denied { read } for comm=3D&quot;RenderThread&quot; name=3D&quot;u:object_r=
:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=
=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_de=
fault_prop:s0 tclass=3Dfile permissive=3D0<br>11-25
 19:22:20.791 16216 16216 I auditd=C2=A0 : type=3D1400 audit(0.0:252507): a=
vc:=20
denied { read } for comm=3D&quot;RenderThread&quot; name=3D&quot;u:object_r=
:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=
=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_de=
fault_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22:20.791 16216 1621=
6 W RenderThread: type=3D1400 audit(0.0:252507): avc: denied { read } for n=
ame=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot;=
 ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=
=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 =
19:22:20.800 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding p=
roperty &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:20.813 162=
16 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding property &quot;ve=
ndor.debug.egl.swapinterval&quot;<br>11-25 19:22:20.801 16216 16216 W Rende=
rThread: type=3D1400 audit(0.0:252508): avc: denied { read } for name=3D&qu=
ot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23=
691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object=
_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22:20.81=
1 16216 16216 W RenderThread: type=3D1400 audit(0.0:252509): avc: denied { =
read } for name=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot=
;tmpfs&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c76=
8 tcontext=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0=
<br>11-25 19:22:20.819 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied=
 finding property &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:=
20.821 16216 16216 W RenderThread: type=3D1400 audit(0.0:252510): avc: deni=
ed { read } for name=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D=
&quot;tmpfs&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c51=
2,c768 tcontext=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissiv=
e=3D0<br>11-25 19:22:20.833 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access d=
enied finding property &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 1=
9:22:20.851 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding pr=
operty &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:20.841 1621=
6 16216 W RenderThread: type=3D1400 audit(0.0:252511): avc: denied { read }=
 for name=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs=
&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcon=
text=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11=
-25 19:22:20.851 16216 16216 W RenderThread: type=3D1400 audit(0.0:252512):=
 avc: denied { read } for name=3D&quot;u:object_r:vendor_default_prop:s0&qu=
ot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c15=
8,c256,c512,c768 tcontext=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile=
 permissive=3D0<br>11-25 19:22:20.865 16216 16295 E libc=C2=A0=C2=A0=C2=A0 =
: Access denied finding property &quot;vendor.debug.egl.swapinterval&quot;<=
br>11-25 19:22:20.871 16216 16216 W RenderThread: type=3D1400 audit(0.0:252=
513): avc: denied { read } for name=3D&quot;u:object_r:vendor_default_prop:=
s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s=
0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_default_prop:s0 tclass=
=3Dfile permissive=3D0<br>11-25 19:22:20.883 16216 16295 E libc=C2=A0=C2=A0=
=C2=A0 : Access denied finding property &quot;vendor.debug.egl.swapinterval=
&quot;<br>11-25 19:22:21.037 16216 16295 I chatty=C2=A0 : uid=3D10158(com.w=
ireguard.android) RenderThread identical 9 lines<br>11-25 19:22:21.052 1621=
6 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding property &quot;ven=
dor.debug.egl.swapinterval&quot;<br>11-25 19:22:20.851 16216 16216 I chatty=
=C2=A0 : uid=3D10158(com.wireguard.android) identical 5 lines<br>11-25
 19:22:20.871 16216 16216 I auditd=C2=A0 : type=3D1400 audit(0.0:252513): a=
vc:=20
denied { read } for comm=3D&quot;RenderThread&quot; name=3D&quot;u:object_r=
:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=
=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_de=
fault_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22:21.699 16216 1621=
6 I menu_item_selected: [0,Settings]<br>11-25 19:22:21.700 16216 16295 E li=
bc=C2=A0=C2=A0=C2=A0 : Access denied finding property &quot;vendor.debug.eg=
l.swapinterval&quot;<br>11-25 19:22:21.718 16216 16295 E libc=C2=A0=C2=A0=
=C2=A0 : Access denied finding property &quot;vendor.debug.egl.swapinterval=
&quot;<br>11-25 19:22:21.733 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access =
denied finding property &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 =
19:22:21.739 16216 16216 I am_on_paused_called: [0,com.wireguard.android.ac=
tivity.MainActivity,performPause]<br>11-25 19:22:21.747 16216 16295 E libc=
=C2=A0=C2=A0=C2=A0 : Access denied finding property &quot;vendor.debug.egl.=
swapinterval&quot;<br>11-25 19:22:21.750 16216 16216 W ActivityThread: hand=
leWindowVisibility: no activity for token android.os.BinderProxy@d3bad7b<br=
>11-25 19:22:21.753 16216 16216 I am_on_create_called: [0,com.wireguard.and=
roid.activity.SettingsActivity,performCreate]<br>11-25 19:22:21.761 16216 1=
6216 I am_on_start_called: [0,com.wireguard.android.activity.SettingsActivi=
ty,handleStartActivity]<br>11-25 19:22:21.761 16216 16216 I am_on_resume_ca=
lled: [0,com.wireguard.android.activity.SettingsActivity,RESUME_ACTIVITY]<b=
r>11-25 19:22:21.763 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied f=
inding property &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:21=
.772 16216 16303 D DecorView: onWindowFocusChangedFromViewRoot hasFocus: tr=
ue, DecorView@9b22e86[SettingsActivity]<br>11-25 19:22:21.777 16216 16295 E=
 libc=C2=A0=C2=A0=C2=A0 : Access denied finding property &quot;vendor.debug=
.egl.changepixelformat&quot;<br>11-25 19:22:21.780 16216 16295 E libc=C2=A0=
=C2=A0=C2=A0 : Access denied finding property &quot;vendor.debug.egl.swapin=
terval&quot;<br>11-25 19:22:21.796 16216 16295 I chatty=C2=A0 : uid=3D10158=
(com.wireguard.android) RenderThread identical 2 lines<br>11-25 19:22:21.79=
7 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding property &qu=
ot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:21.815 16216 16295 E =
libc=C2=A0=C2=A0=C2=A0 : Access denied finding property &quot;vendor.debug.=
egl.swapinterval&quot;<br>11-25
 19:22:21.821 16216 16216 I auditd=C2=A0 : type=3D1400 audit(0.0:252535): a=
vc:=20
denied { read } for comm=3D&quot;RenderThread&quot; name=3D&quot;u:object_r=
:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=
=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_de=
fault_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22:21.821 16216 1621=
6 W RenderThread: type=3D1400 audit(0.0:252535): avc: denied { read } for n=
ame=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot;=
 ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=
=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 =
19:22:21.833 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding p=
roperty &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:21.841 162=
16 16216 W RenderThread: type=3D1400 audit(0.0:252536): avc: denied { read =
} for name=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpf=
s&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tco=
ntext=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>1=
1-25 19:22:21.849 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied find=
ing property &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:21.86=
5 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding property &qu=
ot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:21.851 16216 16216 W =
RenderThread: type=3D1400 audit(0.0:252537): avc: denied { read } for name=
=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; in=
o=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:=
object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22=
:21.871 16216 16216 W RenderThread: type=3D1400 audit(0.0:252538): avc: den=
ied { read } for name=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=
=3D&quot;tmpfs&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,=
c512,c768 tcontext=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permis=
sive=3D0<br>11-25 19:22:21.882 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Acces=
s denied finding property &quot;vendor.debug.egl.swapinterval&quot;<br>11-2=
5 19:22:21.899 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding=
 property &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:21.891 1=
6216 16216 W RenderThread: type=3D1400 audit(0.0:252539): avc: denied { rea=
d } for name=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tm=
pfs&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 t=
context=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br=
>11-25 19:22:21.915 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied fi=
nding property &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:22.=
066 16216 16295 I chatty=C2=A0 : uid=3D10158(com.wireguard.android) RenderT=
hread identical 9 lines<br>11-25 19:22:22.083 16216 16295 E libc=C2=A0=C2=
=A0=C2=A0 : Access denied finding property &quot;vendor.debug.egl.swapinter=
val&quot;<br>11-25 19:22:21.871 16216 16216 I chatty=C2=A0 : uid=3D10158(co=
m.wireguard.android) identical 3 lines<br>11-25
 19:22:21.891 16216 16216 I auditd=C2=A0 : type=3D1400 audit(0.0:252539): a=
vc:=20
denied { read } for comm=3D&quot;RenderThread&quot; name=3D&quot;u:object_r=
:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=
=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_de=
fault_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22:22.216 16216 1621=
6 I am_on_stop_called: [0,com.wireguard.android.activity.MainActivity,STOP_=
ACTIVITY_ITEM]<br>11-25
 19:22:24.291 16216 16216 I auditd=C2=A0 : type=3D1400 audit(0.0:252551): a=
vc:=20
denied { read } for comm=3D&quot;RenderThread&quot; name=3D&quot;u:object_r=
:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=
=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_de=
fault_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22:24.291 16216 1621=
6 W RenderThread: type=3D1400 audit(0.0:252551): avc: denied { read } for n=
ame=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot;=
 ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=
=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 =
19:22:24.306 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding p=
roperty &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:24.320 162=
16 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding property &quot;ve=
ndor.debug.egl.swapinterval&quot;<br>11-25 19:22:24.311 16216 16216 W Rende=
rThread: type=3D1400 audit(0.0:252552): avc: denied { read } for name=3D&qu=
ot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23=
691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object=
_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22:24.33=
2 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding property &qu=
ot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:24.321 16216 16216 W =
RenderThread: type=3D1400 audit(0.0:252553): avc: denied { read } for name=
=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; in=
o=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:=
object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22=
:24.347 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding proper=
ty &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:24.341 16216 16=
216 W RenderThread: type=3D1400 audit(0.0:252554): avc: denied { read } for=
 name=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpfs&quo=
t; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tcontext=
=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>11-25 =
19:22:24.363 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied finding p=
roperty &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:24.351 162=
16 16216 W RenderThread: type=3D1400 audit(0.0:252555): avc: denied { read =
} for name=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=3D&quot;tmpf=
s&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,c512,c768 tco=
ntext=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permissive=3D0<br>1=
1-25 19:22:24.379 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access denied find=
ing property &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:22:25.26=
5 16216 16295 I chatty=C2=A0 : uid=3D10158(com.wireguard.android) RenderThr=
ead identical 21 lines<br>11-25 19:22:25.279 16216 16295 E libc=C2=A0=C2=A0=
=C2=A0 : Access denied finding property &quot;vendor.debug.egl.swapinterval=
&quot;<br>11-25 19:22:25.301 16216 16216 W RenderThread: type=3D1400 audit(=
0.0:252580): avc: denied { read } for name=3D&quot;u:object_r:vendor_defaul=
t_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=3Du:r:untruste=
d_app:s0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_default_prop:s0 t=
class=3Dfile permissive=3D0<br>11-25 19:22:25.296 16216 16295 E libc=C2=A0=
=C2=A0=C2=A0 : Access denied finding property &quot;vendor.debug.egl.swapin=
terval&quot;<br>11-25 19:22:25.313 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : A=
ccess denied finding property &quot;vendor.debug.egl.swapinterval&quot;<br>=
11-25 19:22:25.321 16216 16216 W RenderThread: type=3D1400 audit(0.0:252581=
): avc: denied { read } for name=3D&quot;u:object_r:vendor_default_prop:s0&=
quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c=
158,c256,c512,c768 tcontext=3Du:object_r:vendor_default_prop:s0 tclass=3Dfi=
le permissive=3D0<br>11-25 19:22:25.329 16216 16295 E libc=C2=A0=C2=A0=C2=
=A0 : Access denied finding property &quot;vendor.debug.egl.swapinterval&qu=
ot;<br>11-25 19:22:25.346 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Access den=
ied finding property &quot;vendor.debug.egl.swapinterval&quot;<br>11-25 19:=
22:25.331 16216 16216 W RenderThread: type=3D1400 audit(0.0:252582): avc: d=
enied { read } for name=3D&quot;u:object_r:vendor_default_prop:s0&quot; dev=
=3D&quot;tmpfs&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,c256,=
c512,c768 tcontext=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile permis=
sive=3D0<br>11-25 19:22:25.362 16216 16295 E libc=C2=A0=C2=A0=C2=A0 : Acces=
s denied finding property &quot;vendor.debug.egl.swapinterval&quot;<br>11-2=
5 19:22:25.351 16216 16216 W RenderThread: type=3D1400 audit(0.0:252583): a=
vc: denied { read } for name=3D&quot;u:object_r:vendor_default_prop:s0&quot=
; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=3Du:r:untrusted_app:s0:c158,=
c256,c512,c768 tcontext=3Du:object_r:vendor_default_prop:s0 tclass=3Dfile p=
ermissive=3D0<br>11-25 19:22:25.371 16216 16216 W RenderThread: type=3D1400=
 audit(0.0:252584): avc: denied { read } for name=3D&quot;u:object_r:vendor=
_default_prop:s0&quot; dev=3D&quot;tmpfs&quot; ino=3D23691 scontext=3Du:r:u=
ntrusted_app:s0:c158,c256,c512,c768 tcontext=3Du:object_r:vendor_default_pr=
op:s0 tclass=3Dfile permissive=3D0<br>11-25 19:22:25.380 16216 16295 E libc=
=C2=A0=C2=A0=C2=A0 : Access denied finding property &quot;vendor.debug.egl.=
swapinterval&quot;<div class=3D"gmail-adL"><br></div></div>

</div>

--0000000000008f115b057b81787a--

--===============8534104999207836889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8534104999207836889==--
