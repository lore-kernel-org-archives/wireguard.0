Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3376C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:24:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D7F204FD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=laro.se header.i=@laro.se header.b="dGUue0kp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51D7F204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=laro.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79ca30fc;
	Wed, 27 Nov 2019 09:22:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 959185ca
 for <wireguard@lists.zx2c4.com>; Wed, 6 Nov 2019 21:54:16 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e4e9993
 for <wireguard@lists.zx2c4.com>; Wed, 6 Nov 2019 21:54:16 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id q28so19303550lfa.5
 for <wireguard@lists.zx2c4.com>; Wed, 06 Nov 2019 13:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laro.se; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=L8EKYEQlB+B9gztmNGz149nqVWuMgPaxk0KXe8CmUNY=;
 b=dGUue0kpM2/175uA3HAyqSkjX8TBJuhBrzt882XrnFgmMvcsL0swQzUtgY1ZnPoADT
 1uh5lM5YWbPkMXuwUgirFrRdYlwqdbzJPxVmkSIcogTH6vXWfJhRXR3zLWQfBbItWPK3
 w1r2mjccEwIKxKGyM8iW/ezdanWiOrpy3iIW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=L8EKYEQlB+B9gztmNGz149nqVWuMgPaxk0KXe8CmUNY=;
 b=DRizjXjqWj2DfOz8lwq4xUdIt8ojerEjRWw9HTlK1vGbERMnP7VmXR8mV8FN19qzNG
 NxMuhX3braVUVdu4PNRb2E88O0MEkaL7BZ0EtZLidDzq7vmyneBXPdw6zJycxLYOVfPb
 q33G9AQ5fVE1Ae3YiaUQzkV6HRt6zVKA1pyCfXkRkUnVQPx6fjGi58UBtXFxRg0fgAyq
 yLPuY6TGjYBIn/V4VmIRS6ixhBT6QvpHWNJz+Lt4lPJjFMEJlUi3QNwQr+IWxdriOZCL
 0gp1VxbTv6HZ4cjxg/2yaHc4m8vQJzlGWeWz1ryp51qOoLEQQqJAwkDU3DKCEiIOx0OZ
 +n9g==
X-Gm-Message-State: APjAAAWwNlNnzt576ndO9oHTuFu7yG2OLl8cMKtMiT7vh7HlhS8EyXL8
 ZiqUrkGKTU9mCdf5nWe1RwGUPGs/KvR6zILuBRl8rOzz5luXcQ==
X-Google-Smtp-Source: APXvYqyi/jorvFEIccm98wb5+zEjpeP3ziXM2dMwWXBb8Z68wwO/eCth/eb8+QjPB7P5hHo2LwENAoHfjG9W9iZ4pvg=
X-Received: by 2002:ac2:5295:: with SMTP id q21mr25475246lfm.93.1573077255482; 
 Wed, 06 Nov 2019 13:54:15 -0800 (PST)
MIME-Version: 1.0
From: Simon <simon@laro.se>
Date: Wed, 6 Nov 2019 14:53:39 -0700
Message-ID: <CAOtBoV8UbsFzvsXN5k11mG0E37D+y9MRs3wMoWJL1oncq3Y6PA@mail.gmail.com>
Subject: Security of Android QuickSettings Tile
To: wireguard@lists.zx2c4.com
Content-Type: multipart/mixed; boundary="000000000000049d050596b4979e"
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:22:55 +0100
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--000000000000049d050596b4979e
Content-Type: multipart/alternative; boundary="000000000000049d030596b4979c"

--000000000000049d030596b4979c
Content-Type: text/plain; charset="UTF-8"

Hi all,

Has there been any discussion on forcing the Quick Settings tile for
Android to check if the device is unlocked prior to allowing interaction
with tunnels?

According to
https://developer.android.com/reference/android/service/quicksettings/TileService
-- isLocked() can be used to ensure the device is unlocked by an
authenticated user before initiating or terminating existing tunnels.

Attached is a crude patch which adds this functionality.

- Simon

--000000000000049d030596b4979c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div>Has there been any discus=
sion on forcing the Quick Settings tile for Android to check if the device =
is unlocked prior to allowing interaction with tunnels?<div><div><br></div>=
<div>According to=C2=A0<a href=3D"https://developer.android.com/reference/a=
ndroid/service/quicksettings/TileService" target=3D"_blank">https://develop=
er.android.com/reference/android/service/quicksettings/TileService</a> -- i=
sLocked() can be used to ensure the device is unlocked by an authenticated =
user before initiating or terminating existing tunnels.</div></div><div><br=
></div><div>Attached is a crude patch which adds this functionality.</div><=
div><br></div><div>- Simon</div></div>

--000000000000049d030596b4979c--

--000000000000049d050596b4979e
Content-Type: application/x-patch; name="Force_QuickToggle_Secure.patch"
Content-Disposition: attachment; filename="Force_QuickToggle_Secure.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k2ntdyxx0>
X-Attachment-Id: f_k2ntdyxx0

RnJvbSBmZjBmOGNlYjgzZGJkYmJmOWMyMTgwMzNiMDYxZjhjNTcxM2RkZTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaW1vbiA8c2ltb25AbGFyby5zZT4KU3ViamVjdDogW1BBVENI
XSBGb3JjZSBRdWlja1NldHRpbmdzIHRvZ2dsZSB0byBiZSAnc2VjdXJlJwoKLS0tCiAuLi4vd2ly
ZWd1YXJkL2FuZHJvaWQvUXVpY2tUaWxlU2VydmljZS5qYXZhICAgfCAyNCArKysrKysrKysrKyst
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcHAvc3JjL21haW4vamF2YS9jb20vd2lyZWd1YXJkL2FuZHJvaWQvUXVp
Y2tUaWxlU2VydmljZS5qYXZhIGIvYXBwL3NyYy9tYWluL2phdmEvY29tL3dpcmVndWFyZC9hbmRy
b2lkL1F1aWNrVGlsZVNlcnZpY2UuamF2YQppbmRleCA0MjU3MzhlLi41YWM3NzY1IDEwMDY0NAot
LS0gYS9hcHAvc3JjL21haW4vamF2YS9jb20vd2lyZWd1YXJkL2FuZHJvaWQvUXVpY2tUaWxlU2Vy
dmljZS5qYXZhCisrKyBiL2FwcC9zcmMvbWFpbi9qYXZhL2NvbS93aXJlZ3VhcmQvYW5kcm9pZC9R
dWlja1RpbGVTZXJ2aWNlLmphdmEKQEAgLTU5LDE4ICs1OSwyNCBAQCBwdWJsaWMgY2xhc3MgUXVp
Y2tUaWxlU2VydmljZSBleHRlbmRzIFRpbGVTZXJ2aWNlIHsKIAogICAgIEBPdmVycmlkZQogICAg
IHB1YmxpYyB2b2lkIG9uQ2xpY2soKSB7Ci0gICAgICAgIGlmICh0dW5uZWwgIT0gbnVsbCkgewot
ICAgICAgICAgICAgZmluYWwgVGlsZSB0aWxlID0gZ2V0UXNUaWxlKCk7Ci0gICAgICAgICAgICBp
ZiAodGlsZSAhPSBudWxsKSB7Ci0gICAgICAgICAgICAgICAgdGlsZS5zZXRJY29uKHRpbGUuZ2V0
SWNvbigpID09IGljb25PbiA/IGljb25PZmYgOiBpY29uT24pOwotICAgICAgICAgICAgICAgIHRp
bGUudXBkYXRlVGlsZSgpOwotICAgICAgICAgICAgfQotICAgICAgICAgICAgdHVubmVsLnNldFN0
YXRlKFN0YXRlLlRPR0dMRSkud2hlbkNvbXBsZXRlKHRoaXM6Om9uVG9nZ2xlRmluaXNoZWQpOwot
ICAgICAgICB9IGVsc2UgeworICAgICAgIGlmICghaXNMb2NrZWQoKSkgeworICAgICAgICAgICAg
ICAgaWYgKHR1bm5lbCAhPSBudWxsKSB7CisgICAgICAgICAgICAgICAgICAgZmluYWwgVGlsZSB0
aWxlID0gZ2V0UXNUaWxlKCk7CisgICAgICAgICAgICAgICAgICAgaWYgKHRpbGUgIT0gbnVsbCkg
eworICAgICAgICAgICAgICAgICAgICAgICB0aWxlLnNldEljb24odGlsZS5nZXRJY29uKCkgPT0g
aWNvbk9uID8gaWNvbk9mZiA6IGljb25Pbik7CisgICAgICAgICAgICAgICAgICAgICAgIHRpbGUu
dXBkYXRlVGlsZSgpOworICAgICAgICAgICAgICAgICAgIH0KKyAgICAgICAgICAgICAgICAgICB0
dW5uZWwuc2V0U3RhdGUoU3RhdGUuVE9HR0xFKS53aGVuQ29tcGxldGUodGhpczo6b25Ub2dnbGVG
aW5pc2hlZCk7CisgICAgICAgICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgICAgICAgIGZp
bmFsIEludGVudCBpbnRlbnQgPSBuZXcgSW50ZW50KHRoaXMsIE1haW5BY3Rpdml0eS5jbGFzcyk7
CisgICAgICAgICAgICAgICAgICAgaW50ZW50LmFkZEZsYWdzKEludGVudC5GTEFHX0FDVElWSVRZ
X05FV19UQVNLKTsKKyAgICAgICAgICAgICAgICAgICBzdGFydEFjdGl2aXR5QW5kQ29sbGFwc2Uo
aW50ZW50KTsKKyAgICAgICAgICAgICAgIH0KKyAgICAgICB9IGVsc2UgeyAvKiBUaGlzIGlzIGFs
cmVhZHkgYSAnc2VjdXJlJyBjYWxsIGZvciB1bmxvY2tBbmRSdW4gKi8KICAgICAgICAgICAgIGZp
bmFsIEludGVudCBpbnRlbnQgPSBuZXcgSW50ZW50KHRoaXMsIE1haW5BY3Rpdml0eS5jbGFzcyk7
CiAgICAgICAgICAgICBpbnRlbnQuYWRkRmxhZ3MoSW50ZW50LkZMQUdfQUNUSVZJVFlfTkVXX1RB
U0spOwogICAgICAgICAgICAgc3RhcnRBY3Rpdml0eUFuZENvbGxhcHNlKGludGVudCk7Ci0gICAg
ICAgIH0KKyAgICAgICB9CiAgICAgfQogCiAgICAgQE92ZXJyaWRlCi0tIAoyLjIxLjAKCgo=
--000000000000049d050596b4979e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--000000000000049d050596b4979e--
