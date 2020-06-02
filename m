Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113A4C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:47:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3B7208D5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:47:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSRv2OMh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3B7208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4319ba47;
	Wed, 17 Jun 2020 07:26:45 +0000 (UTC)
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [2607:f8b0:4864:20::931])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e8b34655
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jun 2020 18:02:03 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id a10so1567300uan.8
 for <wireguard@lists.zx2c4.com>; Tue, 02 Jun 2020 11:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FXiGqVb5c7ded05KpOf0gtf53reoH7H7BxcbJxLbDQM=;
 b=gSRv2OMhuMEvM2XhSdP8mOrsqYQ8q67uSok4vhjJGf2FctgSOTw4r+VaeVnuBzz/d3
 ojPs2vQOeDEndtSJ2T7fqkHNwaNR1LET6fWkEarkHwjQ1Gn2nyEotHlq0NOaBsVDrC2m
 F4iNR/nr0y+N1SdrC7zSiDrYKRV9j+T9ejMLtzUEe/lAhJ1eCMHc5QwQw72JKvQp56tf
 Zxq/req4npjXgeSzZIlSIP0gPJIZ4sEDhVOaQ3O4rq4qJwgHAV69d0PJTjaq93cXPbaB
 DwP2grMg8M1H5vCNshTv9QJfRjp+nRLbdsfdot6II1vWeY3kiOInPf4JQCdPhV108wW5
 RYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FXiGqVb5c7ded05KpOf0gtf53reoH7H7BxcbJxLbDQM=;
 b=hzcQ46BRMGg/0FhzVJ2U5lWWRAlGsKJzzxspUV5QKUJFWnPdpNWL5xBTyUKr28kIHB
 POtHMlzmrmjc/Ws7SmSXuKPDh+uwJ+sBPbbgf2C/8BAfw+48e8Gv7uPPHP5rAt4nC6PV
 aTDur9EOGya5lo6E4VLwS7jY1xD/jFbtHvOChzYtXNz8ihSbreIBFLd7TDd0mRw8vLuz
 OjU/cg+RqGCO1JN4RKzg4GS0X/BqseCUW6KmUHF/ufqvVuKSUwVSI23afCzV+uPq/iDT
 +FIXcHw7mPKtRX8yo97+hWeYCFumyTqyY2vUaa0SxTO8TG6Fe2rYRVHspNHzYdrsJmj8
 fg9g==
X-Gm-Message-State: AOAM532S/VcarK7ZAKaAiydGq//b97TeKD/IJul1IjMAg7654TVfTT1S
 p6NdK2fCrxvIat88KjsjheiTayvFjF8Bjgu39ZPMXlw0HqE=
X-Google-Smtp-Source: ABdhPJzrExBR9ITx4ArPlkI8hUY/5VN5JK/D3q2ut7w798FtDP0AQARzDaL8dAYsS5BvuDAfwXi/r0yOPQjEm6/Mex4=
X-Received: by 2002:ab0:4066:: with SMTP id h93mr18671945uad.143.1591121894197; 
 Tue, 02 Jun 2020 11:18:14 -0700 (PDT)
MIME-Version: 1.0
From: Archit Pandey <architpandeynitk@gmail.com>
Date: Tue, 2 Jun 2020 23:48:03 +0530
Message-ID: <CANtWViMbVFtdz7VbH3+NWxRdkMUui5uHrbCOCw51bZYa__Qx9A@mail.gmail.com>
Subject: Wireguard with Network Namespaces
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:26:35 +0200
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

Hello all,

I'm trying to set-up a wireguard peer-to-peer test using namespaces as
the diagram below.

|--------------|            |----------|            |--------------|
| wg0, ns1 |----------| lo, ns0 |----------| wg1, ns2 |
|--------------|            |----------|            |--------------|

I'm unable to make ping work between the the two peers and get the
following error:

PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.
From 192.168.241.2 icmp_seq=1 Destination Host Unreachable
ping: sendmsg: Destination address required
From 192.168.241.2 icmp_seq=2 Destination Host Unreachable
ping: sendmsg: Destination address required

Any ideas on what could be causing this?

The script I'm using to setup the test can be found here -
https://gist.github.com/archit-p/ad01f715c81f128b271400653d05e09f.

My configs are as follows:

--> client.conf
[Interface]
ListenPort = 1
PrivateKey = kJ0P5RK1/ihw9CKwwVBUzG1SzzBiu3jEuT50c14don4=

[Peer]
PublicKey = MsILnsNuioXMS9qSMn66eDgPEagABYKIQBHpUO+NED8=
AllowedIPs = 0.0.0.0/0,::/0
PreSharedKey = Du3JReQWNFjZJhhUHJzPXfARVNox2UNoVbf2ls4neco=

--> server.conf
[Interface]
ListenPort = 2
PrivateKey = mB6r7QG1zefLRJeYAVUrAa+uDJX/N2tkPqZYg1PRYFM=

[Peer]
PublicKey = 2iyuOB1Q0Yd9hPY4eK57LcejHeslx8LrR8vjmyem+nc=
AllowedIPs = 0.0.0.0/0,::/0
PreSharedKey = Du3JReQWNFjZJhhUHJzPXfARVNox2UNoVbf2ls4neco=

Thank you for help debugging the issue!

Archit.
