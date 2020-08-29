Return-Path: <SRS0=L5sV=CH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF947C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Aug 2020 20:57:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD9220774
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Aug 2020 20:57:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcyJ5zzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD9220774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a86e6d6;
	Sat, 29 Aug 2020 20:28:55 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb69cfe2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Aug 2020 15:30:47 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id s13so1765091wmh.4
 for <wireguard@lists.zx2c4.com>; Sat, 29 Aug 2020 08:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=msqwBvbznIyZ0TGY9vLWXQ+i12Kp6mp4lygoG4iG7f8=;
 b=ZcyJ5zzVs6H4xtiNUWLlwMyBdaj/ZaQtzX2w/zZy2QWzuHIw+dceIc9bHn03mDLKgs
 kFaeYU8osIi4BW86ogHy/0mXhm5IRNNzykp6AS9DKbyiODcFDe3Zx0gW+vOOMXj/FBb1
 rN6NSfhLtLoZgLDBiIKZUKX6z6Q6nQYaI9JpS2WRHXDuBhBQi4TWOMQacZgVubS4+cb2
 g4OQ8SDaGJCOMObGI4AboveGb8fMUcgDx7Mh/Qi7DdKoNTWQDtJbZ9L68q4wcyad8h78
 3JBxV0SS0DskGtMbdISoAM9cFLJ98tgWyBhSNrq/6Ba88kDP4M48utE/ulcscXPkLxEx
 F4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=msqwBvbznIyZ0TGY9vLWXQ+i12Kp6mp4lygoG4iG7f8=;
 b=FhvkgPaNmgGbpySmYi7xQ3TaFkdfSEN+cSdNYPEoK/J3/5gtjVgiqF3lYMrY8Ifcnm
 8fkejW4vWr1fgYf+TA5PUWFMBNUW6+XsAUbAFEvDJmYyA9uHaYfB/5kIJPZQ2iqQt1kB
 QCv2XqU1Zi+AnP+HoFZ3Sb14Xyf3YbkQtlRj+8mR0pg90OT3tLJhw2oQQdztxcq3Xdmy
 YA9Gnj/F4LMFhezY5gVvZ8GKHyeINjP97a2Cqm/J6QzyZGlLinxXV1B20h0YaqxFBd6y
 ww5cC5xwS8WGkFzqdVfXmeUjd4lj/LX+x25nFxkXn3uM3VlEIxMRTahPgC9rUc7CpGBE
 TiXg==
X-Gm-Message-State: AOAM531hxHbj2ZNt/TXGoZihk4s3lDC8DN7/Hv6bTo3iBce/8d15yie6
 JoenBdaZUsxw8S8jMCGQ70dW4DzaOul0oj9pvMfHn38anTv7BR4e
X-Google-Smtp-Source: ABdhPJzO2S30WA6x1NKTsDERibGgQZtpJ93YUWIrWiGm+lfnfA7j4qA/ExUa4/2D3z4eMwrmDcEk/6lo9uIU7oyUmIA=
X-Received: by 2002:a7b:c255:: with SMTP id b21mr3609175wmj.41.1598716702582; 
 Sat, 29 Aug 2020 08:58:22 -0700 (PDT)
MIME-Version: 1.0
From: Hirbod Behnam <chrome.hiri.angry@gmail.com>
Date: Sat, 29 Aug 2020 20:28:10 +0430
Message-ID: <CANtK_yx9zFK1Z4gm_SNC_rvveSoHEgTBrWscE5CeZaPuACUHbw@mail.gmail.com>
Subject: Cannot set endpoint to localhost on windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 29 Aug 2020 22:28:54 +0200
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

Hello
I'm not sure if this is already reported or not but I found a small
problem with the windows client of wireguard that does not allow users
to use "plugins" on top of wireguard.
So here is my case. I used gost to create a really simple port
forwarder from my localhost to my server with this command: gost
-L=3Dudp://127.0.0.1:12345/1.1.1.1:12345 (that forwards packets on port
12345 to 1.1.1.1:12345 and of course my server is not 1.1.1.1 :D)
Also here is my wireguard config:

[Interface]
PrivateKey =3D xxxx
Address =3D 10.9.0.2/24
DNS =3D 8.8.8.8
[Peer]
PublicKey =3D xxxx
AllowedIPs =3D 0.0.0.0/8,1.0.0.0/16,1.1.0.0/24,1.1.1.0/32,1.1.1.2/31,1.1.1.=
4/30,1.1.1.8/29,1.1.1.16/28,1.1.1.32/27,1.1.1.64/26,1.1.1.128/25,1.1.2.0/23=
,1.1.4.0/22,1.1.8.0/21,1.1.16.0/20,1.1.32.0/19,1.1.64.0/18,1.1.128.0/17,1.2=
.0.0/15,1.4.0.0/14,1.8.0.0/13,1.16.0.0/12,1.32.0.0/11,1.64.0.0/10,1.128.0.0=
/9,2.0.0.0/7,4.0.0.0/6,8.0.0.0/5,16.0.0.0/4,32.0.0.0/3,64.0.0.0/2,128.0.0.0=
/1
Endpoint =3D 127.0.0.1:12345
PersistentKeepalive =3D 25

The allowed IPs are all ip addresses except 1.1.1.1.
When I run the client, the log fills with: [TUN] [xxx-wg0] peer(xxx) -
Failed to send data packet write udp4 0.0.0.0:58932->127.0.0.1:12345:
wsasendto: The requested address is not valid in its context.
And I cannot connect to anything. Sometimes in gost, it says that a
connection is established but I still cannot connect to anything
though wireguard.

Also it's good to know that the exact config works fine with TunSafe,
the official Ubuntu client and openvpn. (I can connect through gost)
Thanks for the project!
Hirbod
