Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DF4C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 08:55:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A076135A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 08:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40A076135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65b4e368;
	Wed, 22 Sep 2021 08:55:14 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b1362f36
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 08:55:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u15so4552300wru.6
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 01:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=19LmEqkQdGzfizRmOF7UG/vPyeqd/XbX9vK9V6BA9cM=;
 b=fmU+1XSFBL7KtkbNfTshjWOUalPqTcom7udONhAyTrsVdnY/qjdFH8dr2XnV9NNAFH
 1VGCkk1AwqkIa04lZWRV6aYU7A62vCm0nvgK5maQWtaDQWosD7tbDCrBG5FIDel+L8pz
 p7QfwsrF56QEYbiiJfn69ylhEUqTIXlR4a5VIMnaHfBKPRox+Kk2SUCmKcMVNka7Sp84
 E/tlvMeHXktgC7AzgQyWqHU2tf3GtdLJLbDKtBWfrotgt/XzDBUwVpJne4KX8HKNPdJY
 pZVY8wYc1XhWZYQBzZYBiL0441ZpFjRdpsL107u2dX2w7bn9WaVBVkz6PA/x6zL4qKCE
 tuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=19LmEqkQdGzfizRmOF7UG/vPyeqd/XbX9vK9V6BA9cM=;
 b=zHaqyDLNCS30RO/h9lUPvIP0SX7NZEAHOCONhDHN7/wiVtDMH7HPeDJvmnGTQRBXhc
 LCd2zcpZUkyHMc174hC2XeB7S5/w2sPyeJrfLJaIZHYqd7nc2zhSysvO+23UZFWigEq6
 6kxWD9Rb1NzHPO4Sx7WJjd+7955xyvzfygrnXf3nr6fdjHs/lhVd1i3dCTJcnvUwOcH8
 3c1P4HswoQDcEbIV6dos+jKbO+svH5tgVl9T5v2KVzJt1qv3zqeMg+2YsAMna6YmIbLJ
 JsYDSIU9VBti2Zd6UmfMo2JXLTcjrcxaKAzaK/nGJHmdyI+l5KTiWEejKDUap/wCEjKA
 Yx4Q==
X-Gm-Message-State: AOAM531IU59+1cS1LFNk5cDyADoJwqMUzHtnekP8uKg1Rq3aBQSVAlK4
 jsYukmjfxU8GOdICybuNMnU=
X-Google-Smtp-Source: ABdhPJybM79AIZKeNrP1Al/K8O6K7xgyPUPATomrrOTzmJ2nI22xSveYdYEXAzTiejj8PUb8s3UgEw==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr9213902wmk.5.1632300910054;
 Wed, 22 Sep 2021 01:55:10 -0700 (PDT)
Received: from smtpclient.apple ([188.252.198.230])
 by smtp.gmail.com with ESMTPSA id h15sm1471061wrc.19.2021.09.22.01.55.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 01:55:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [wireguard-apple] [iOS] Changing network fails with
 includeAllNetworks (Kill Switch)
From: Juraj Hilje <juraj.hilje@gmail.com>
In-Reply-To: <5569D8DF-A7E8-4A13-BA6B-913785819E4E@mullvad.net>
Date: Wed, 22 Sep 2021 10:55:07 +0200
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB84BD03-DB8A-4855-94CC-898100C0B97E@gmail.com>
References: <B3A4A27C-1FBF-4098-B38F-9F87F8C115B5@gmail.com>
 <5569D8DF-A7E8-4A13-BA6B-913785819E4E@mullvad.net>
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

Hey Andrej, thanks for the response!

I've tested on iOS 14.8 and iOS 15.0 (public release), and even with the =
patch (b244febfdf3069dd4e8db2d31f0368d5474d7616) i still have the same =
issue on my end.

I will test the new iOS 15.1 Beta later today and let you know how it =
goes.

Juraj H.

> On 22.09.2021., at 10:08, Andrej Mihajlov <and@mullvad.net> wrote:
>=20
> Have you tried on the most recent beta? I think it works over there, =
but requires some tweaks to the network monitor code in WireGuard. I had =
a patch somewhere here but haven=E2=80=99t spent much time testing it:
>=20
> =
https://git.zx2c4.com/wireguard-apple/commit/?h=3Dam/enable-include-all-ne=
tworks&id=3Db244febfdf3069dd4e8db2d31f0368d5474d7616
>=20
> Waiting for the final release of iOS 15.
>=20
>> On 21 Sep 2021, at 12:55, Juraj Hilje <juraj.hilje@gmail.com> wrote:
>>=20
>> If NETunnelProviderProtocol is configured with =
includeAllNetworks=3Dtrue (Kill Switch), when network change is detected =
the device connectivity goes offline instead of routing VPN tunnel =
traffic through a new network.
>>=20
>> Here are some logs from the moment of this event:
>> 2021-09-20 12:07:26.735453: [NET] Network change detected with =
unsatisfied route and interface order [en0, utun4, pdp_ip0]
>> 2021-09-20 12:07:26.736186: [NET] Connectivity offline, pausing =
backend.
>> 2021-09-20 12:07:26.736732: [NET] Device closing
>> 2021-09-20 12:07:26.737503: [NET] Routine: TUN reader - stopped
>> 2021-09-20 12:07:26.738970: [NET] Routine: event worker - stopped
>> 2021-09-20 12:07:26.739613: [NET] Routine: receive incoming v4 - =
stopped
>> 2021-09-20 12:07:26.742070: [NET] Routine: receive incoming v6 - =
stopped
>> 2021-09-20 12:07:26.746712: [NET] peer(eN1f=E2=80=A6Oymc) - Stopping
>> 2021-09-20 12:07:26.751550: [NET] peer(eN1f=E2=80=A6Oymc) - Routine: =
sequential receiver - stopped
>> 2021-09-20 12:07:26.751597: [NET] peer(eN1f=E2=80=A6Oymc) - Routine: =
sequential sender - stopped
>> 2021-09-20 12:07:26.753433: [NET] Device closed
>> 2021-09-20 12:07:26.754097: [NET] Routine: decryption worker 5 - =
stopped
>>=20
>> Tested on devices: iOS 14.8, iPadOS 15
>> WireGuardKit: 79aeb0be0d0aa3f6c8bd24309aaa8dcf03216fb4
>>=20
>> More info on includeAllNetworks option:
>> =
https://developer.apple.com/documentation/networkextension/nevpnprotocol/3=
131931-includeallnetworks
>>=20
>> Can someone confirm this issue or point to a possible workaround?
>> Thanks!
>>=20
>> Juraj H.
>=20

