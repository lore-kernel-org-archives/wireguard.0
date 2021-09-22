Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71F3C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 13:29:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29C596112F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 13:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29C596112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7c840db;
	Wed, 22 Sep 2021 13:27:20 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5e348a42
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 08:59:23 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id e15so8968473lfr.10
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad.net; s=july2021;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3ZicXd694seHZ5hdBcLYtM3pUckF8eJMq6qQKQDTezA=;
 b=J3jk5T0pnlP3dULEKpBAUlGWmZLdJSQH0OBaZLNK7L77SVlmqVwQvs3XrLAlT6+hLw
 o4YXr0SrGqRRlOJMFvIEGedoSAZFoW7WKHaynPfdeIIbaEt0c1hU+5ktN5SBIhpARES2
 jreR9LbYWU2l9qMsrxlyN/9Xp9EENb1vqT77eVVXiCFNPjAEWq0aBD8TuXDfkGiZiYva
 q6uxYOMytIT/fRCH3x/NQIDuZhx07RNqAMD8pnz7RzEJ/iFqrAzbzWu4FA0wvgtaQA31
 5xGrt0J2o/ndP9Fc7vQcqB3Sftp+eXgTccgTwa1AyiqfIMUyyYnI73sZbHbu3HQ/hRgy
 EYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3ZicXd694seHZ5hdBcLYtM3pUckF8eJMq6qQKQDTezA=;
 b=pgFfSUFvIDehp5mkC9mCqcSWemUn2gIJPyWwJBFsDX5MBEcQmyWbCR8T+qh3pup00K
 ccbBmxJvqv8NubB8YrE8m6s0pPjiU+709uTfwEEZQZ9E9nh7gG5+LYEwDlKn0llK39np
 YQHiuc9Cbb6W3qk3a6tMVkRtCFZq/OkMtS/lB5Fnu0QGrslWOvTMr830zureGZmNOtji
 bpRZsdiMPtmbTotAUs2jAtRCVaFnLgxNNX0cTi1SqbPHmKBh19ubA1LFYA/HSD6zSyd8
 5ux9yTr/g2Ls0nZ8nrNP0SP5FBsgfPA87w4pmBlfCxvEYgtGZzcgqXdD4c6FV/pmcIzG
 9Geg==
X-Gm-Message-State: AOAM532SZbfzMppLsvEZbOSJZDLcfBXz2/0wDqFxuLPI95XbUR7Wnyz7
 Ms44ZzUhHCxaIfFuFZEewFzGDg==
X-Google-Smtp-Source: ABdhPJzeMDu9kEJxLOUo375cRAIn1qOxmTSqx5qlso2Lbp9TACa6SguHySbsmivdgyy+63kRjOmy/w==
X-Received: by 2002:a05:651c:1503:: with SMTP id
 e3mr31635507ljf.182.1632301162848; 
 Wed, 22 Sep 2021 01:59:22 -0700 (PDT)
Received: from smtpclient.apple ([185.213.154.237])
 by smtp.gmail.com with ESMTPSA id e15sm126553lfs.107.2021.09.22.01.59.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 01:59:22 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [wireguard-apple] [iOS] Changing network fails with
 includeAllNetworks (Kill Switch)
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <CB84BD03-DB8A-4855-94CC-898100C0B97E@gmail.com>
Date: Wed, 22 Sep 2021 10:59:20 +0200
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <9D47F45A-59C7-4FB0-A9F8-2F13A1D4AB1A@mullvad.net>
References: <B3A4A27C-1FBF-4098-B38F-9F87F8C115B5@gmail.com>
 <5569D8DF-A7E8-4A13-BA6B-913785819E4E@mullvad.net>
 <CB84BD03-DB8A-4855-94CC-898100C0B97E@gmail.com>
To: Juraj Hilje <juraj.hilje@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Mailman-Approved-At: Wed, 22 Sep 2021 13:27:16 +0000
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

Hi Juraj,

Installing iOS 15 right now. I am gonna test it today too.=20

What stands out to me that, while you have multiple interfaces =
available, the network monitor still says that the network is =
unsatisfied. Very odd.

Cheers,
Andrej

> On 22 Sep 2021, at 10:55, Juraj Hilje <juraj.hilje@gmail.com> wrote:
>=20
> Hey Andrej, thanks for the response!
>=20
> I've tested on iOS 14.8 and iOS 15.0 (public release), and even with =
the patch (b244febfdf3069dd4e8db2d31f0368d5474d7616) i still have the =
same issue on my end.
>=20
> I will test the new iOS 15.1 Beta later today and let you know how it =
goes.
>=20
> Juraj H.
>=20
>> On 22.09.2021., at 10:08, Andrej Mihajlov <and@mullvad.net> wrote:
>>=20
>> Have you tried on the most recent beta? I think it works over there, =
but requires some tweaks to the network monitor code in WireGuard. I had =
a patch somewhere here but haven=E2=80=99t spent much time testing it:
>>=20
>> =
https://git.zx2c4.com/wireguard-apple/commit/?h=3Dam/enable-include-all-ne=
tworks&id=3Db244febfdf3069dd4e8db2d31f0368d5474d7616
>>=20
>> Waiting for the final release of iOS 15.
>>=20
>>> On 21 Sep 2021, at 12:55, Juraj Hilje <juraj.hilje@gmail.com> wrote:
>>>=20
>>> If NETunnelProviderProtocol is configured with =
includeAllNetworks=3Dtrue (Kill Switch), when network change is detected =
the device connectivity goes offline instead of routing VPN tunnel =
traffic through a new network.
>>>=20
>>> Here are some logs from the moment of this event:
>>> 2021-09-20 12:07:26.735453: [NET] Network change detected with =
unsatisfied route and interface order [en0, utun4, pdp_ip0]
>>> 2021-09-20 12:07:26.736186: [NET] Connectivity offline, pausing =
backend.
>>> 2021-09-20 12:07:26.736732: [NET] Device closing
>>> 2021-09-20 12:07:26.737503: [NET] Routine: TUN reader - stopped
>>> 2021-09-20 12:07:26.738970: [NET] Routine: event worker - stopped
>>> 2021-09-20 12:07:26.739613: [NET] Routine: receive incoming v4 - =
stopped
>>> 2021-09-20 12:07:26.742070: [NET] Routine: receive incoming v6 - =
stopped
>>> 2021-09-20 12:07:26.746712: [NET] peer(eN1f=E2=80=A6Oymc) - Stopping
>>> 2021-09-20 12:07:26.751550: [NET] peer(eN1f=E2=80=A6Oymc) - Routine: =
sequential receiver - stopped
>>> 2021-09-20 12:07:26.751597: [NET] peer(eN1f=E2=80=A6Oymc) - Routine: =
sequential sender - stopped
>>> 2021-09-20 12:07:26.753433: [NET] Device closed
>>> 2021-09-20 12:07:26.754097: [NET] Routine: decryption worker 5 - =
stopped
>>>=20
>>> Tested on devices: iOS 14.8, iPadOS 15
>>> WireGuardKit: 79aeb0be0d0aa3f6c8bd24309aaa8dcf03216fb4
>>>=20
>>> More info on includeAllNetworks option:
>>> =
https://developer.apple.com/documentation/networkextension/nevpnprotocol/3=
131931-includeallnetworks
>>>=20
>>> Can someone confirm this issue or point to a possible workaround?
>>> Thanks!
>>>=20
>>> Juraj H.
>>=20
>=20

