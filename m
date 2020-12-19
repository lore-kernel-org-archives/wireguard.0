Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MIME_QP_LONG_LINE,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CA0C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 12:08:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB53F23AC2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 12:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB53F23AC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alexburke.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97fd5014;
	Sat, 19 Dec 2020 11:59:45 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [95.128.36.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3079fca8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 11:59:43 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out003.mykolab.com (Postfix) with ESMTP id BF5C240E33;
 Sat, 19 Dec 2020 13:08:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 in-reply-to:references:message-id:date:date:subject:subject
 :mime-version:from:from:content-transfer-encoding:content-type
 :content-type:received:received:received; s=dkim20160331; t=
 1608379706; x=1610194107; bh=NjaAUU1jgYUsn84p99PbYI5zV1kVI9LMf4O
 u/fbgaAY=; b=xJgB1AQIuy1Td3W3F/Zsf2PDO+yuiAcrFQylyam7q0zGaOOxz9U
 cLVyCq6xH/1yH7i3X4wPmZYIsGxcuJ7IB4lZelknulCjTZIdsEQurB7FEzjOiBxW
 TqxCt4IHXogvsuny3uw0ZC/4To1NHdqWZvaEjUG3ACrefmosh5yJ0x+zKPKOk1nS
 i7/lLL7x64s3N0b7XEjezu2MiGA1UygKw8KSiC+0NMOCA5o9/KiuhYB8ZrE9UbQe
 yhpIg3oVNzCpEp2ZbCeZW5UMPai9TelBYQAKRL56vbdPeBYeeB/GEqdzTFySXGu6
 vc8SAmTmE2EUPTQVv/4iMUdlGVe2tbcLhbSQWzccH02pwrZ+FVHVvIawhp4pZbZZ
 yY4Qo4gl2TYy8e9cQ/QBulJi569hYX4op4vZqhexSbtrdvlq2aK3yTzFjgM39TwC
 D9rLRVrvTeMfsklPAbb+pWPuEEBlDN1uhdoTkGlqVU+7aeiewt5KthpZqGRAls32
 lMOa0GjfIdCZPgfdYe7BysrQdXMWNAc+HhG1yUJW72WRcBpnKthOWwPBL2mLfrym
 ITLE83q86TQXNUWnvi1vmb76SbqLNG3CZv9bQbj6atNnM7gtrcbLCCaJaC6iftel
 E5U5xzbB0gNW/gDWAE6gVLrKeI4u67GcB2tjOs2HXoA4Jy9c5IZ7J2AA=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72gtwGePtct3; Sat, 19 Dec 2020 13:08:26 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
 by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 9546E40357;
 Sat, 19 Dec 2020 13:08:26 +0100 (CET)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
 by int-mx001.mykolab.com (Postfix) with ESMTPS id 438A18BB;
 Sat, 19 Dec 2020 13:08:26 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alex Burke <alex@alexburke.ca>
Mime-Version: 1.0 (1.0)
Subject: Re: MacOS and wg 1.0.11 issues (for me)
Date: Sat, 19 Dec 2020 13:08:23 +0100
Message-Id: <B181D38E-36B8-4F8B-A19B-AD176AC5DF37@alexburke.ca>
References: <CAHmME9oA9iibjYJpkO6COjNkK=h3qTBfH0X95JCuFbACNdxzGA@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <CAHmME9oA9iibjYJpkO6COjNkK=h3qTBfH0X95JCuFbACNdxzGA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hey Jason,

> There is no testflight on macos.

That doesn't mean we should throw the iOS baby out with the macOS bathwater.=


Food for thought.

Cheers,
Alex


> Le 19 d=C3=A9c. 2020 =C3=A0 12:48, Jason A. Donenfeld <Jason@zx2c4.com> a =C3=
=A9crit :
>=20
> =EF=BB=BFOn Sat, Dec 19, 2020 at 12:10 PM Laura Smith
> <n5d9xq3ti233xiyif2vp@protonmail.ch> wrote:
>>=20
>> Jason,
>>=20
>> Out of curiosity, is NetworkExtension not available if you push a test ap=
p via TestFlight ?
>=20
> There is no testflight on macos.
>=20
> I've now added Janne as a developer device on the WireGuard account by
> using the unique hardware ID of his laptop, so we're able to make a
> bit of progress that way, but Janne's availability for testing is a
> bit limited, so I'd still be happy to learn about other people who
> have the same problem and can help out. I still am unable to reproduce
> it myself.
>=20
> Jason

