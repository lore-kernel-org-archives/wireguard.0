Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1255C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jan 2022 18:24:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 66b60595;
	Tue, 4 Jan 2022 18:20:40 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id da314740
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Dec 2021 07:52:08 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w16so20162930edc.11
 for <wireguard@lists.zx2c4.com>; Mon, 20 Dec 2021 23:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=/54WCL9q5ULHfCFppQba2YPtosV1GX8pCSR+S1aX0ek=;
 b=Jw3kbxT7z0lE9WfXaPho2MK0TC9vhRei2dCkIsgSsH/yYAzK3g6gsCupZs6/8i7rO7
 VswuUiBorGhn79ExfXcbaW1Q3bkPO/J3nX6YYq+GrTrkCtmWXDSaTQc/+bTHDRF1prlF
 CRlnrONfcfSpRQwLgj+u3ZcPafgwWUmTfrkNLyqCZxisbJopKclCWYliIUToEiHp7YqM
 zUXebWtvlmHmMH0KAW66KKnX527Umt7EKpQCL0l7q7NxUtF65cTMgmzfMUsyScOg2iuK
 9hEd4ou1evNKtbyeyJP0ZtNKFUfesMfJiPVGDRy8Rnabsn5r6uwssZ9CQ5NYku/LeYQs
 t64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/54WCL9q5ULHfCFppQba2YPtosV1GX8pCSR+S1aX0ek=;
 b=nLUYe5jEBc2iYYda6rQXq9XzlMxAiXavaACJ5Jh6CKdTfC8Oxg7uMNCYMbhX3LkWfO
 lXVcrLJpHYwuUGBLI8bHJAMU6+DJlc/JZZIOCBpAC8LYQnXbz8+ZkkVImF1KOWWD8+ts
 4NbgveptHYSNXJ5EfJ4eoNm0Mr33IzusxLCCSmGasRnmsN4qlyVHfBNB9rdQQcL7QzK/
 fN0DjMyC3TesJU0dhOoAYKSmQBG1m9Cp8Vw2HoAVVBaZVctf9vbxrKahHsJcIzT5JO8i
 bCuML8iVMSLrDM0N7QA62pinVR1IQOc0J3L+Jo4/uy3ECs6R/E/3+Rq18VHLdqzUbs/+
 iRuA==
X-Gm-Message-State: AOAM533Q/TXhE6+EdOS7B9l6YIkiViazYlZUzO/psjlU9EEp1rpUPcEc
 OGfIEj7ogSO+xzFTt/+NQSPWXzGyhvAfcQ4gVHXmCRUpYLO+vA==
X-Google-Smtp-Source: ABdhPJy8ULt+OVgOm9hr5U/4+RvL5fQiFyxR4ZBIvTzpuiY/Dfi3FBqRT/VeCDROc7mtk1eX6LdoMyfXIwRHI22K9lQ=
X-Received: by 2002:a17:907:9493:: with SMTP id
 dm19mr1722993ejc.161.1640073127676; 
 Mon, 20 Dec 2021 23:52:07 -0800 (PST)
MIME-Version: 1.0
From: Chris Francy <zoredache@gmail.com>
Date: Mon, 20 Dec 2021 23:51:55 -0800
Message-ID: <CAM8ZctXygkOUvzEpROjcfZeFC69epbc8ef=k5OF949XB6S1-BQ@mail.gmail.com>
Subject: Windows tunnel configured as only IPv6 gets an IPv4 APIPA address
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 04 Jan 2022 18:20:36 +0000
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

I really wish that the IPv4 binding would be completely disabled when an
interface has no IPv4 addresses.

Consider a simple configuration like this

    # wg_zoredache.conf
    [Interface]
    PrivateKey = ...
    Address = 2001:db8:0:0:24ae:ebff:fef0:97e6/128

When that tunnel is started on Windows you will get an 169.254.0.0/16
address. But I didn't really expect or want that.

I am sure some will tell me this doesn't really hurt much since a person
configuring an IPv6 only tunnel, would not have AllowedIPs set that would
allow this address to actually communicate with anything, so the tunnel
will not accept or transmit these packets. But it is still kinda annoying,
since having that IPv4 address will result in IPv4 broadcast traffic
happening on the interface. I noticed this when I was trying to do a
wireshark capture for something else, and was surprised how much IPv4
broadcasts I was seeing on an interface that I intended to be IPv6 only.

So next I am sure people will suggest adding a `PreUp' or 'PostUp` command
that runs a powershell command to disable the interface. I know with
powershell you can disable the IPv4 binding with a command like
`Disable-NetAdapterBinding -ifAlias wg_zoredache -ComponentID ms_tcpip`.
But PreUp/Postup is blocked by default on Windows. Also some security
software on block Powershell executing as a form of anti-malware
protection. Also, simply running the command once isn't useful, since the
Interface seems to get recreated each time the tunnel or computer restarts.

I have more output of what I currently get, and what I am hoping for
in this gist.

- https://gist.github.com/zoredache/995bb5bea01f6fd8dced0fda708c97c8

Anyway, I am just posting this as a bit of a wishlist request. Please
consider adjusting the client to disable the IPv4 binding on the interface
it creates if no IPv4 addresses are in the tunnel configuration. Or perhaps
provide some other method to have a true IPv6 only wireguard interface on
Windows.

Thanks,

Zoredache
