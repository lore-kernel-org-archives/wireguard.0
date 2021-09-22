Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE027C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 13:29:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25C6A61090
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 13:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25C6A61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab88b181;
	Wed, 22 Sep 2021 13:27:17 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id af7d46a5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 08:08:49 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i4so8701965lfv.4
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 01:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad.net; s=july2021;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0/z3d2HIflu1Nijk/NpqTA98UeCIueH01umnldxL+UY=;
 b=GZO21fNv9jhu1Es8erDHWtIIT0GGIdloThqF+91NlaETb7cz4KqwvPXAC50ya7nshy
 U1NWxWh+7xc3jLTXzhxaOVafHBLDrqitdwC48IMr6QbQzSu5+JLKl1Y3mE/THDphgpch
 EqFka3Nz/0rt0YGWC6UYxCit4jmzrV66m3iNelbhIXbwcUDGVM7BStqMB5pA97w1OQXl
 nSvnRYg3iObBqDu8hDCv9E5fDrre9zh9Ef0MXxU7EvHvN8UxQj9YtWOjc6vFVYsuNR6r
 MlkpoGzBd0Ni9WS7AKsiA/uulQ+aZc3zfCO9lNHY2C6lpwpJeVRAd/ntNv3qMpUwW9XS
 Nu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0/z3d2HIflu1Nijk/NpqTA98UeCIueH01umnldxL+UY=;
 b=WoObVSfd9dRBw45g7vNCR/5GFZsY4AZienEUN0Ao/t2lXqln8LFpbPyJqWl5m07h7R
 eevONHcZXu7bxuDXSY2caAivdknPm1OPp2Kn37nMmdj5ocIohTUKDkiCRMOmGeFfXzZo
 jk9j3cDx09T+0thg8l2WcuLdipgSMyE1emRVMCa6Etzd6D/UqxsbyEBtzND0g1d/zNiw
 CY/nBoq+HuPh17pqJ//A1i8NlSvQP7E8H2s6MNoiC20HDnvWWjSoDHWuKLoSsigIs/dX
 lC61jeIA1nOqNisDpiljbJk5aBjB9eUG9lu+RF3Q4gQ1AWF1BqR936hEc79aCwYq1yWF
 zXig==
X-Gm-Message-State: AOAM531tlE+FpraQ1+bMh+gJMMDuIBeYjXWyfZKCzMA1MeROiwOSrcAW
 uEPueXDNeiKBrsCnaGluYUuZAw==
X-Google-Smtp-Source: ABdhPJytjgeJzdT6vAG5LwJpTIcrGQkD3NS1EfR89WM60sX2pSznJTy1SRCkGkHkV99ZPvFmzXsPYg==
X-Received: by 2002:a2e:b0c2:: with SMTP id g2mr2328731ljl.139.1632298128595; 
 Wed, 22 Sep 2021 01:08:48 -0700 (PDT)
Received: from smtpclient.apple ([185.213.154.237])
 by smtp.gmail.com with ESMTPSA id y11sm115707lfs.135.2021.09.22.01.08.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 01:08:47 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [wireguard-apple] [iOS] Changing network fails with
 includeAllNetworks (Kill Switch)
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <B3A4A27C-1FBF-4098-B38F-9F87F8C115B5@gmail.com>
Date: Wed, 22 Sep 2021 10:08:46 +0200
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <5569D8DF-A7E8-4A13-BA6B-913785819E4E@mullvad.net>
References: <B3A4A27C-1FBF-4098-B38F-9F87F8C115B5@gmail.com>
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

Have you tried on the most recent beta? I think it works over there, but =
requires some tweaks to the network monitor code in WireGuard. I had a =
patch somewhere here but haven=E2=80=99t spent much time testing it:

=
https://git.zx2c4.com/wireguard-apple/commit/?h=3Dam/enable-include-all-ne=
tworks&id=3Db244febfdf3069dd4e8db2d31f0368d5474d7616

Waiting for the final release of iOS 15.

> On 21 Sep 2021, at 12:55, Juraj Hilje <juraj.hilje@gmail.com> wrote:
>=20
> If NETunnelProviderProtocol is configured with includeAllNetworks=3Dtrue=
 (Kill Switch), when network change is detected the device connectivity =
goes offline instead of routing VPN tunnel traffic through a new =
network.
>=20
> Here are some logs from the moment of this event:
> 2021-09-20 12:07:26.735453: [NET] Network change detected with =
unsatisfied route and interface order [en0, utun4, pdp_ip0]
> 2021-09-20 12:07:26.736186: [NET] Connectivity offline, pausing =
backend.
> 2021-09-20 12:07:26.736732: [NET] Device closing
> 2021-09-20 12:07:26.737503: [NET] Routine: TUN reader - stopped
> 2021-09-20 12:07:26.738970: [NET] Routine: event worker - stopped
> 2021-09-20 12:07:26.739613: [NET] Routine: receive incoming v4 - =
stopped
> 2021-09-20 12:07:26.742070: [NET] Routine: receive incoming v6 - =
stopped
> 2021-09-20 12:07:26.746712: [NET] peer(eN1f=E2=80=A6Oymc) - Stopping
> 2021-09-20 12:07:26.751550: [NET] peer(eN1f=E2=80=A6Oymc) - Routine: =
sequential receiver - stopped
> 2021-09-20 12:07:26.751597: [NET] peer(eN1f=E2=80=A6Oymc) - Routine: =
sequential sender - stopped
> 2021-09-20 12:07:26.753433: [NET] Device closed
> 2021-09-20 12:07:26.754097: [NET] Routine: decryption worker 5 - =
stopped
>=20
> Tested on devices: iOS 14.8, iPadOS 15
> WireGuardKit: 79aeb0be0d0aa3f6c8bd24309aaa8dcf03216fb4
>=20
> More info on includeAllNetworks option:
> =
https://developer.apple.com/documentation/networkextension/nevpnprotocol/3=
131931-includeallnetworks
>=20
> Can someone confirm this issue or point to a possible workaround?
> Thanks!
>=20
> Juraj H.

