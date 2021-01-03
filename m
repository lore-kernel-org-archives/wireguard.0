Return-Path: <SRS0=V5dh=GG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF20C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 13:49:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 715072080D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 13:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 715072080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f4cee30;
	Sun, 3 Jan 2021 13:37:40 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 525b7d5a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 13:37:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=gTXYcVmPtbDVG40TH3mZjtXCq/WpjjENmHLWvwMXhSrsCiIWaDsyMHlIovOLMi88x4aqH9wXUIHcNfZULTo4jt8wU8gLHSQipR/nhDkef2Hg8EsKntdHfCl76jwAptmpK2OZHb0zcaz49qJKPcttEYv9WkpIrTDDz4HWvZRlgkzcYeyiKQm1TBw8AiZtVPqoo4S2WFrrQiwVmAFotkf51SENJqaU1+VwVHRC/owfpc8OxlSwx0QgcyILHRbGmfbQlvuUsUSX85O3jyrGjueFL4bipRLz/A0qAUNofXQzTSqf1xU89BINNatVxYvzkCz3YBrVu0YPpBGJG80hJgVwSw==;
 s=purelymail2; d=msfjarvis.dev; v=1;
 bh=gz15uuczCCWSLwrcDW0jm0LZLw3pEu69nrp9JtbreRA=; h=Received:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=Orn7ekApukYSz9c9Jm1jomlJxIFFz8H5W4Qb5Hxbyd4eUyf0srlPX6qNABQ1Ef18VTvwZ/1zz0ageiIUg9WDJXXaf9fgjzcFw5Kay4zZojRvRpOStV5U6tF6U/fdEhMixd+v9rhCJ1zonJVH4uxopo9oZqTx+Syp/0kXHTNk8t3OANgDXrBOEj0AgNybF4Z8HyxjhbFUKK6wblW5pCBi8o/OZxzoPLYTa072sCRRGV1nltnROw1PIXm/bH0x89+srh/2P01evzki4Q+M8ZpP/P35Vp7zpKr8Cc6Dlr6eojrI6vNeVqQEY4Fuey+pED6mNEwUoqQn2wxXTnXjuHJxlg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=gz15uuczCCWSLwrcDW0jm0LZLw3pEu69nrp9JtbreRA=;
 h=Feedback-ID:Received:From:To; 
Feedback-ID: 322:138:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by ip-172-30-0-124.ec2.internal (JAMES SMTP Server ) with ESMTPA ID
 1438416940; Sun, 03 Jan 2021 13:48:00 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 03 Jan 2021 13:48:00 +0000
From: Harsh Shandilya <me@msfjarvis.dev>
To: =?UTF-8?Q?J=C3=A9r=C3=A9my_Prego?= <jeremy@pregonetwork.net>
Cc: wireguard@lists.zx2c4.com, team@wireguard.com
Subject: Re: wireguard android don't prefer IPV6 endpoint
In-Reply-To: <64137c2f-266a-1a06-9130-e8b42ecd4edf@pregonetwork.net>
References: <ead64d0f-af1e-8d5c-3d87-ed14902c5e1e@pregonetwork.net>
 <64137c2f-266a-1a06-9130-e8b42ecd4edf@pregonetwork.net>
User-Agent: Purely Mail via Roundcube/1.4.7
Message-ID: <37dc844baef3dd8540df172318dafa21@msfjarvis.dev>
X-Sender: me@msfjarvis.dev
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
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

Hey J=C3=A9r=C3=A9my,

On 2021-01-02 08:27, J=C3=A9r=C3=A9my Prego wrote:
> I confirm the same problem in wifi
>=20
> Le 27/12/2020 =C3=A0 07:02, J=C3=A9r=C3=A9my Prego a =C3=A9crit=C2=A0:
>> hello,
>>=20
>> I've always encountered a bug with android wireguard when using an=20
>> ipv4
>> / ipv6 endpoint.
>>=20
>> I tested with two phones:
>> Huawei p10 lite android 8.0 emui 8
>> Xiaomi poco m3 android 10.0 miui 12
>>=20
>> When i'm in LTE (not yet been able to test in wifi), wireguard=20
>> connects
>> to the endpoint in ipv4 and not in ipv6, and i don't understand why it
>> is doing that.

The WireGuard Android client is designed to prefer IPv4 over IPv6 as of=20
now=20
(https://git.zx2c4.com/wireguard-android/tree/tunnel/src/main/java/com/wire=
guard/config/InetEndpoint.java#n97).=20
This may or may not change in the future, and we'll announce here if it=20
does.

>> However, chrome, for example, does use ipv6 by default and not ipv4.
>>=20
>> My phone does recover an ipv6 in 2a01: cb1a ........ / 64 and not an
>> ipv6 type fc00 / fd00 / fe80 ...
>> I also specify that if I only have an AAAA record, the tunnel works=20
>> fine
>> in ipv6. but suddenly, I can no longer connect to wifi which only have=
=20
>> ipv4.
>>=20
>> I would like wireguard to favor ipv6 when it is available, and=20
>> otherwise
>> switch to ipv4.
>>=20
>> Is it possible ?
>>=20
>> Thanks,
>>=20
>> Jerem

Cheers,
Harsh
