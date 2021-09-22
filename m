Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A109C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 13:26:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A5B36112F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 13:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A5B36112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45784309;
	Wed, 22 Sep 2021 13:26:53 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 915989ae
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 13:26:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d21so6671572wra.12
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 06:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0lpOOemQKe7UKkaOGBdeVxb99U3vIzRCIHx68aMQLk4=;
 b=NryR0T/Qp2Ipg3ko3PnEaSEoU52AhVmySfpAId3kg2jY1DWDmcV34ZB0n/7/yU/SZH
 cyFHfvoFQjkEbPTZS/iz56CYtljwgU8UqXbfetG1V3/w40tk0D+C/U0WNvQsMNgrI31m
 8dPM0CiAtyv7y82bsEc+z8BhKxKfLyc4B16TzTCiINcGQX0tDQ3/QhBA36s9gSPdld+p
 3X7Nbhev9Vge2bIYxNzeO2WnbM7fPX2eMG/dBGSYwUeG4Lr0IF5o5WRkul/lvu4oOhin
 YmfE1pPcKat+VBUK7RaSA2JbbV/FPRNEX4Zq4vhg28oY26isxVF/uECkfzDca5/7IFSx
 bhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0lpOOemQKe7UKkaOGBdeVxb99U3vIzRCIHx68aMQLk4=;
 b=fmpSkAw01MCZ36e19FlKXfEcFVHgEOujh9JOkWJAO3FXR0Max/IyJL9nnVLGgXBNUK
 /98T1G0gvOsN2lcJTh96d9+OA/hrZg5Ay75f4dseu76eDu9MTaHY3JGvkV+yaZ6LhWWX
 91Aqhq2VnaOLRzKwrbOUlfNZSPs30UXvlesVZ+rduRreJVBSSKjQO8P5S5HnLbVh9t0r
 lQzLNoSIfqqpQ/wiQSd5fCoTm0vOyPYoqvK6srV6yIyN8NZ/StMEl6nzu2B8ykr1NTP2
 G2h9Yv5EsucsK6X6PtxfyMN0un0q7kKUiRbX9/wweGHejY4ccMO3hu+SL4Trmpw1Vn2X
 C7cA==
X-Gm-Message-State: AOAM530Y2IVmSEO/5Kf9o112QeL72+tgSDzLhpNFzfJUsOsphQgu2X7/
 Zw8mIo3Gnc4j8SMrbhbz/3lplkiHZ6XrFmYXMOc=
X-Google-Smtp-Source: ABdhPJwqL8AkPV9ujokEh1jlTgfwWIbsXictuItQjFJ7KMFdKRG1d5LviS30+BA1miUeFu1Aj2Kv+g==
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr41561572wrr.173.1632317209798; 
 Wed, 22 Sep 2021 06:26:49 -0700 (PDT)
Received: from smtpclient.apple ([188.252.198.230])
 by smtp.gmail.com with ESMTPSA id k19sm2042865wmr.21.2021.09.22.06.26.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 06:26:49 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [wireguard-apple] [iOS] Changing network fails with
 includeAllNetworks (Kill Switch)
From: Juraj Hilje <juraj.hilje@gmail.com>
In-Reply-To: <9D47F45A-59C7-4FB0-A9F8-2F13A1D4AB1A@mullvad.net>
Date: Wed, 22 Sep 2021 15:26:47 +0200
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E65FFE7D-9BCC-4EEF-9CF0-FA46CE6B9096@gmail.com>
References: <B3A4A27C-1FBF-4098-B38F-9F87F8C115B5@gmail.com>
 <5569D8DF-A7E8-4A13-BA6B-913785819E4E@mullvad.net>
 <CB84BD03-DB8A-4855-94CC-898100C0B97E@gmail.com>
 <9D47F45A-59C7-4FB0-A9F8-2F13A1D4AB1A@mullvad.net>
To: Andrej Mihajlov <and@mullvad.net>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Hi Andrej,

I've tested on iOS/iPadOS 15.1 Beta, and it looks like the issue is =
fixed there.
Let me know if you can confirm the same on your end.

Cheers,
Juraj H.

> On 22.09.2021., at 10:59, Andrej Mihajlov <and@mullvad.net> wrote:
>=20
> Hi Juraj,
>=20
> Installing iOS 15 right now. I am gonna test it today too.=20
>=20
> What stands out to me that, while you have multiple interfaces =
available, the network monitor still says that the network is =
unsatisfied. Very odd.
>=20
> Cheers,
> Andrej
>=20
>> On 22 Sep 2021, at 10:55, Juraj Hilje <juraj.hilje@gmail.com> wrote:
>>=20
>> Hey Andrej, thanks for the response!
>>=20
>> I've tested on iOS 14.8 and iOS 15.0 (public release), and even with =
the patch (b244febfdf3069dd4e8db2d31f0368d5474d7616) i still have the =
same issue on my end.
>>=20
>> I will test the new iOS 15.1 Beta later today and let you know how it =
goes.
>>=20
>> Juraj H.
>>=20
>>> On 22.09.2021., at 10:08, Andrej Mihajlov <and@mullvad.net> wrote:
>>>=20
>>> Have you tried on the most recent beta? I think it works over there, =
but requires some tweaks to the network monitor code in WireGuard. I had =
a patch somewhere here but haven=E2=80=99t spent much time testing it:
>>>=20
>>> =
https://git.zx2c4.com/wireguard-apple/commit/?h=3Dam/enable-include-all-ne=
tworks&id=3Db244febfdf3069dd4e8db2d31f0368d5474d7616
>>>=20
>>> Waiting for the final release of iOS 15.
>>>=20
>>>> On 21 Sep 2021, at 12:55, Juraj Hilje <juraj.hilje@gmail.com> =
wrote:
>>>>=20
>>>> If NETunnelProviderProtocol is configured with =
includeAllNetworks=3Dtrue (Kill Switch), when network change is detected =
the device connectivity goes offline instead of routing VPN tunnel =
traffic through a new network.
>>>>=20
>>>> Here are some logs from the moment of this event:
>>>> 2021-09-20 12:07:26.735453: [NET] Network change detected with =
unsatisfied route and interface order [en0, utun4, pdp_ip0]
>>>> 2021-09-20 12:07:26.736186: [NET] Connectivity offline, pausing =
backend.
>>>> 2021-09-20 12:07:26.736732: [NET] Device closing
>>>> 2021-09-20 12:07:26.737503: [NET] Routine: TUN reader - stopped
>>>> 2021-09-20 12:07:26.738970: [NET] Routine: event worker - stopped
>>>> 2021-09-20 12:07:26.739613: [NET] Routine: receive incoming v4 - =
stopped
>>>> 2021-09-20 12:07:26.742070: [NET] Routine: receive incoming v6 - =
stopped
>>>> 2021-09-20 12:07:26.746712: [NET] peer(eN1f=E2=80=A6Oymc) - =
Stopping
>>>> 2021-09-20 12:07:26.751550: [NET] peer(eN1f=E2=80=A6Oymc) - =
Routine: sequential receiver - stopped
>>>> 2021-09-20 12:07:26.751597: [NET] peer(eN1f=E2=80=A6Oymc) - =
Routine: sequential sender - stopped
>>>> 2021-09-20 12:07:26.753433: [NET] Device closed
>>>> 2021-09-20 12:07:26.754097: [NET] Routine: decryption worker 5 - =
stopped
>>>>=20
>>>> Tested on devices: iOS 14.8, iPadOS 15
>>>> WireGuardKit: 79aeb0be0d0aa3f6c8bd24309aaa8dcf03216fb4
>>>>=20
>>>> More info on includeAllNetworks option:
>>>> =
https://developer.apple.com/documentation/networkextension/nevpnprotocol/3=
131931-includeallnetworks
>>>>=20
>>>> Can someone confirm this issue or point to a possible workaround?
>>>> Thanks!
>>>>=20
>>>> Juraj H.
>>>=20
>>=20
>=20

