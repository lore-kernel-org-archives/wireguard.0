Return-Path: <SRS0=y9CJ=PH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AD6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Oct 2021 12:22:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 744D461260
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Oct 2021 12:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 744D461260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b73123d1;
	Tue, 19 Oct 2021 12:22:40 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e6ccaa17
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Oct 2021 12:22:39 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w19so12073851edd.2
 for <wireguard@lists.zx2c4.com>; Tue, 19 Oct 2021 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=AfFuyk0Ayhp5Vcp85AMnqu6XGzmClSpzgKVX27xg3kQ=;
 b=U/OxN+A7lpxRtH9lXdDHu5QEIY+K3XxTFNCKuPNnOyo92hIi1MT7zhdNQE2Rp8XGyG
 GGjbRRVatoJ5XPGO576iCYGjKsTdZqeMmEP9meYHVaLxSpwohtnkh5CCvwsYTQNVrF12
 4w1Dm1aMVbh8FqCxAhYs5R8effR0EhD5aX+/Z8c0H8kW+BuejspxiLq9PUJsbduA2xYx
 VGGbmGD9vf9r7QQnjt+HUQmWVH8B1hEjVWkW9Z3GrKZjzm6k4KJEnZ2DhVRxfoC/cbIg
 z0R5rpSXJy0FCd7cC+d6cHfWPS+G9pu01+c5LztRDdHXlCl1oeabtYC4n4kFz8djsmci
 tncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=AfFuyk0Ayhp5Vcp85AMnqu6XGzmClSpzgKVX27xg3kQ=;
 b=F4d6py9totl2Ouvh2Wg7nnGSFtL/q8pENZF5ZkI8AcdtU2wSWZLakckG7qNcVr668W
 AZdGrwOGQ9Zm6WsIfj8nGgeoyCyLmG/WT9HVF/CkfOtLs8OBCbNYvyK5PvUhQN29KqWJ
 pA/ZV/kC5E/D6Z1YAN5jyW7k67pVSq4NFmEv1gT8dIZQ9q1fqOOoFuWOXAZHsYbFyB9a
 sqtA4eF5HFPqwASvFrzC+IrTT/g2ChtjeU8J2IZOh+Sf5BEATG1gauhhQFmA/VRdyMQP
 78n8fADIKqftZ9oFGhVOi8vI8ndN63ztic35myGxjcp++ALopMp88ALNcCRWQJbYtkeP
 2HFA==
X-Gm-Message-State: AOAM533bOLryRln0KQ9SzvuBOBI2dK597NCeQdA7u6dTHJwWFOmQIpYc
 Ou3Z5gVQYxwcBImpxzuDcVEbO4TK77nFIEIE
X-Google-Smtp-Source: ABdhPJxy2nMRVSfowE1BP4WjB0eGmVyfB3LJFhcWEqxxUC4TFAotJtY5Ojpkf9xGxhikMmph54+3MA==
X-Received: by 2002:a05:6402:1547:: with SMTP id
 p7mr54951703edx.371.1634646159029; 
 Tue, 19 Oct 2021 05:22:39 -0700 (PDT)
Received: from smtpclient.apple ([2a05:4f46:d13:e00:8018:2865:4a3d:9d6e])
 by smtp.gmail.com with ESMTPSA id u4sm9952214ejc.19.2021.10.19.05.22.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 05:22:38 -0700 (PDT)
From: Juraj Hilje <juraj.hilje@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [wireguard-apple] [iOS] Changing network fails with
 includeAllNetworks (Kill Switch)
Date: Tue, 19 Oct 2021 14:22:37 +0200
References: <B3A4A27C-1FBF-4098-B38F-9F87F8C115B5@gmail.com>
 <5569D8DF-A7E8-4A13-BA6B-913785819E4E@mullvad.net>
 <CB84BD03-DB8A-4855-94CC-898100C0B97E@gmail.com>
 <9D47F45A-59C7-4FB0-A9F8-2F13A1D4AB1A@mullvad.net>
 <E65FFE7D-9BCC-4EEF-9CF0-FA46CE6B9096@gmail.com>
 <85F39D56-E800-4EAE-B159-85335D150A4A@mullvad.net>
 <66E63699-8CC0-4382-ADD3-1AC878898D8C@mullvad.net>
To: Andrej Mihajlov <and@mullvad.net>,
 wireguard@lists.zx2c4.com
In-Reply-To: <66E63699-8CC0-4382-ADD3-1AC878898D8C@mullvad.net>
Message-Id: <FD3103A9-03E3-43E8-A398-D589D923B806@gmail.com>
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

Thanks for the follow-up!
I had the same result on my end, everything worked as expected on the =
iOS 15.1 Beta.

> On 19.10.2021., at 11:54, Andrej Mihajlov <and@mullvad.net> wrote:
>=20
> Follow up on this. It looks like the VPN connection breaks on my iPad =
running iPadOS 15 after changing DNS settings via WireGuardKit.=20
>=20
> Tested on iPadOS 15.1 beta today and it seems to be stable.
>=20
>> On 28 Sep 2021, at 13:03, Andrej Mihajlov <and@mullvad.net> wrote:
>>=20
>> Hi,
>>=20
>> I can confirm that it behaves correctly on iOS 15 (tested on iPhone =
12) and iOS 15.1 beta (tested on iPhone 7). Tested by toggling =
cellular/wi-fi and airplane mode on both devices and network monitor =
seems to be functioning properly.=20
>>=20
>> I haven=E2=80=99t tested this patch on iOS 14.8, but I had previously =
tested it on iOS 14.5 (IIRC) and it didn=E2=80=99t work there, that's =
why this patch is scoped to iOS 15+.
>>=20
>> I am running the "am/enable-include-all-networks" branch which has =
the following changeset:
>> =
https://git.zx2c4.com/wireguard-apple/commit/?id=3D07bc66e7b181fb2068d457b=
31c1fdd05bdd2214a&id2=3D58e94f077329f6c7b96ec069243495d4e649fe36
>>=20
>> Cheers,
>> Andrej
>>=20
>>> On 22 Sep 2021, at 15:26, Juraj Hilje <juraj.hilje@gmail.com> wrote:
>>>=20
>>> Hi Andrej,
>>>=20
>>> I've tested on iOS/iPadOS 15.1 Beta, and it looks like the issue is =
fixed there.
>>> Let me know if you can confirm the same on your end.
>>>=20
>>> Cheers,
>>> Juraj H.
>>>=20
>>>> On 22.09.2021., at 10:59, Andrej Mihajlov <and@mullvad.net> wrote:
>>>>=20
>>>> Hi Juraj,
>>>>=20
>>>> Installing iOS 15 right now. I am gonna test it today too.=20
>>>>=20
>>>> What stands out to me that, while you have multiple interfaces =
available, the network monitor still says that the network is =
unsatisfied. Very odd.
>>>>=20
>>>> Cheers,
>>>> Andrej
>>>>=20
>>>>> On 22 Sep 2021, at 10:55, Juraj Hilje <juraj.hilje@gmail.com> =
wrote:
>>>>>=20
>>>>> Hey Andrej, thanks for the response!
>>>>>=20
>>>>> I've tested on iOS 14.8 and iOS 15.0 (public release), and even =
with the patch (b244febfdf3069dd4e8db2d31f0368d5474d7616) i still have =
the same issue on my end.
>>>>>=20
>>>>> I will test the new iOS 15.1 Beta later today and let you know how =
it goes.
>>>>>=20
>>>>> Juraj H.
>>>>>=20
>>>>>> On 22.09.2021., at 10:08, Andrej Mihajlov <and@mullvad.net> =
wrote:
>>>>>>=20
>>>>>> Have you tried on the most recent beta? I think it works over =
there, but requires some tweaks to the network monitor code in =
WireGuard. I had a patch somewhere here but haven=E2=80=99t spent much =
time testing it:
>>>>>>=20
>>>>>> =
https://git.zx2c4.com/wireguard-apple/commit/?h=3Dam/enable-include-all-ne=
tworks&id=3Db244febfdf3069dd4e8db2d31f0368d5474d7616
>>>>>>=20
>>>>>> Waiting for the final release of iOS 15.
>>>>>>=20
>>>>>>> On 21 Sep 2021, at 12:55, Juraj Hilje <juraj.hilje@gmail.com> =
wrote:
>>>>>>>=20
>>>>>>> If NETunnelProviderProtocol is configured with =
includeAllNetworks=3Dtrue (Kill Switch), when network change is detected =
the device connectivity goes offline instead of routing VPN tunnel =
traffic through a new network.
>>>>>>>=20
>>>>>>> Here are some logs from the moment of this event:
>>>>>>> 2021-09-20 12:07:26.735453: [NET] Network change detected with =
unsatisfied route and interface order [en0, utun4, pdp_ip0]
>>>>>>> 2021-09-20 12:07:26.736186: [NET] Connectivity offline, pausing =
backend.
>>>>>>> 2021-09-20 12:07:26.736732: [NET] Device closing
>>>>>>> 2021-09-20 12:07:26.737503: [NET] Routine: TUN reader - stopped
>>>>>>> 2021-09-20 12:07:26.738970: [NET] Routine: event worker - =
stopped
>>>>>>> 2021-09-20 12:07:26.739613: [NET] Routine: receive incoming v4 - =
stopped
>>>>>>> 2021-09-20 12:07:26.742070: [NET] Routine: receive incoming v6 - =
stopped
>>>>>>> 2021-09-20 12:07:26.746712: [NET] peer(eN1f=E2=80=A6Oymc) - =
Stopping
>>>>>>> 2021-09-20 12:07:26.751550: [NET] peer(eN1f=E2=80=A6Oymc) - =
Routine: sequential receiver - stopped
>>>>>>> 2021-09-20 12:07:26.751597: [NET] peer(eN1f=E2=80=A6Oymc) - =
Routine: sequential sender - stopped
>>>>>>> 2021-09-20 12:07:26.753433: [NET] Device closed
>>>>>>> 2021-09-20 12:07:26.754097: [NET] Routine: decryption worker 5 - =
stopped
>>>>>>>=20
>>>>>>> Tested on devices: iOS 14.8, iPadOS 15
>>>>>>> WireGuardKit: 79aeb0be0d0aa3f6c8bd24309aaa8dcf03216fb4
>>>>>>>=20
>>>>>>> More info on includeAllNetworks option:
>>>>>>> =
https://developer.apple.com/documentation/networkextension/nevpnprotocol/3=
131931-includeallnetworks
>>>>>>>=20
>>>>>>> Can someone confirm this issue or point to a possible =
workaround?
>>>>>>> Thanks!
>>>>>>>=20
>>>>>>> Juraj H.
>>>>>>=20
>>>>>=20
>>>>=20
>>>=20
>>=20
>=20

