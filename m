Return-Path: <SRS0=Udva=H5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61466C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Feb 2021 11:01:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF6464DFF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Feb 2021 11:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BF6464DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bcd8a178;
	Sat, 27 Feb 2021 11:01:18 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f01bf8ef
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 17:49:22 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id b8so6490777oti.7
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 09:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jVDzq8N7FImGDefhKyI47toLSWyvPd9amWvH41h8sms=;
 b=H6xcrYFOeUboBZT31782+KTblJZYcAB9MGTn+ywG79OyhuA4E5GTQIl+pbMjf+ekOQ
 FLUMcr0Mtb9cxxhLRivENHtNUe4ZAYhkNRgE3Mytcb9J+/TgjZEYQZGX31qh2L3CuTAI
 Dcau6TTLeALI0pZ9bxdX9VhgEFL3Jyc7W7aMO8MzBOPi3C16t8RAWJiqYEoLreIkAsff
 fWJ0OrNM9b+TvPU/jjW5QoV4VJihC7WdEnjNzHZU8nPsKxf2C3rMtOpCeGEh9h0GPPyF
 ZWDZ/K9tDDX8wg35GfiCIcyTcvH79QJHYzxb5UvFPaUykSqiW5J1alAPblbUvCbBshP5
 XK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jVDzq8N7FImGDefhKyI47toLSWyvPd9amWvH41h8sms=;
 b=P7RVFc2CWAFg9JqmqmLNX3TSm3Rib7gsNQNtl03AYknMd4Wggp0Y8RVFYx0xPEmrrv
 uTTUXotRYDIajKOErGP6iwGSwEXruC6NyZUH91Ysbz+XS9u99zp5/8LXQjkByYq0OJAT
 MDGva5ghuGVCZImN4LcK5teCcI8/mPxUh+sOUVT1Dww4e1TeOi7MJkMltQwtIFxl7UtQ
 pPs8b3iDL9PNEGs2ka+ejHk6N3OMP6X+GNj8G+YBqNru4LhVZXEL7LwlnyNGR9TyRcEp
 WkVhAjuUsEl0uW/R1q0xY+W2j7Yr45p/8FtyD6kA43jNHT3W2ixsVh8Bc9lqazQTCU8t
 zWWw==
X-Gm-Message-State: AOAM532qV7ossXiUUPeWn2xkijmPl+WvofkwtrZPvBYVLjWMKC4PHQ+G
 QmVU2KkFkZ8NT4xdeHUog9UXHxHl3IuuiyUVMoUCzdQYhM0=
X-Google-Smtp-Source: ABdhPJy87zVKUJLT34U1V4l3sDbxmbTcUZWF4hVYhIO+IhMSjK4M8Mzp8ksVkPMTQqgsN2CbpjvjHs1MUINRvqjJABc=
X-Received: by 2002:a9d:784b:: with SMTP id c11mr3275889otm.88.1614275361230; 
 Thu, 25 Feb 2021 09:49:21 -0800 (PST)
MIME-Version: 1.0
From: i iordanov <iiordanov@gmail.com>
Date: Thu, 25 Feb 2021 12:48:45 -0500
Message-ID: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
Subject: Nested Wireguard tunnels not working on Android and Windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 27 Feb 2021 11:01:16 +0000
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

Hello!

In order to allow traffic to assist devices that cannot reach each
other directly, I am setting up wireguard tunnels through a server
with a public IP (40.30.40.30 in the example below).

For reasons of privacy, I'd like for the server to not be able to
decrypt my traffic. As a result, I would like for one encapsulating
Wireguard tunnel (subnet 10.1.2.0/24) to be peered through the server,
while a second nested Wireguard tunnel (subnet 10.1.3.0/24) to be
established through the first tunnel, peered only at the two devices
(Android and Linux in this case) that need to communicate.

An attempt was made to use a single Wireguard interface. Doing it this
way works between two Linux machines and even between Linux and Mac OS
X, but does not work between a Pixel 3a XL running Android 11 with the
GoBackend Wireguard implementation and my Linux laptop. I also tried
the same config on Windows 10 to no avail.

The config on the Android device, obtained with toWgQuickString():
======================================
    [Interface]
    Address = 10.1.2.5/24, 10.1.3.5/24
    ListenPort = 46847
    MTU = 1200
    PrivateKey = PRIVATE_KEY

    [Peer]
    AllowedIPs = 10.1.2.0/24
    Endpoint = 40.30.40.30:10000
    PersistentKeepalive = 3600
    PublicKey = VF5dic+a+6MllssbV+ShVwEBRrX9gr4do2iNylWrPGs=

    [Peer]
    AllowedIPs = 10.1.3.1/32
    Endpoint = 10.1.2.1:51555
    PersistentKeepalive = 3600
    PublicKey = 0Awdb451Z4+3Gezm7UlbRquC1kcF52r68J9wG1x/zUE=
======================================

The 10.1.2.0/24 subnet is the one that is "visible" to the public
server. The 10.1.3.0/24 subnet is the one that is private to the two
devices.

The devices can actually reach each other with netcat over UDP at
10.1.2.5:46847 and 10.1.2.1:51555 respectively. So the "encapsulating"
tunnel is working, and iperf3 were used to test it over UDP and TCP
successfully.

The "nested" tunnel does not get established.

The following permutations of the above config have the commented problems:

# Only 10.1.2.0/24 works, 10.1.3.0/24 does not.
    Address = 10.1.2.1/24, 10.1.3.1/24

# Only 10.1.2.0/24 works, 10.1.3.0/24 (as expected) does not.
    Address = 10.1.2.1/24

# Neither network works
    Address = 10.1.3.1/24, 10.1.2.1/24

This looks like a bug that is triggered when multiple addresses are
assigned to the interface.

Any suggestions on what to try are welcome.

Thanks!
iordan


-- 
The conscious mind has only one thread of execution.
