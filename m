Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3703C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 21:29:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBBA5206F6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 21:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=petergarner.net header.i=@petergarner.net header.b="L+FwLBsR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBBA5206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=petergarner.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 917c642d;
	Fri, 24 Jul 2020 21:05:53 +0000 (UTC)
Received: from mail.petergarner.net (82-71-1-246.dsl.in-addr.zen.co.uk
 [82.71.1.246])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 877d9bdf
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:35:33 +0000 (UTC)
Received: from [192.168.1.20] (mqtt.petergarner.net [82.71.1.246])
 by mail.petergarner.net (Postfix) with ESMTPSA id 09DC360022C;
 Fri, 24 Jul 2020 09:58:26 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.petergarner.net 09DC360022C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petergarner.net;
 s=mail; t=1595581106;
 bh=8lnt4Phv6XXiCOw/0StWUh5aMK1uM5gU698pMWPv8MI=;
 h=Subject:From:In-Reply-To:Cc:Date:References:To:From;
 b=L+FwLBsRgTJR+grxFEeMUjHhwtXS7fhwEpakPtnDyfj1Xv98fhqaMv607fe66qIhr
 lupKjw5y8yr34RoJyaf/X9WWxlOhAICkGaff+AsmW97BKoD9zw1QlB5ioeNxRMFKDd
 0UbHtxCdMBW47yTqKKfGbFyWwcAHfzBb5jKQAa9W6j9JSmbxye2lOym+HfYXrtfnVe
 ccNiFPsO6ygusS6rSLgPXfRSLDr3j/x75VlXvQM8cbjnzNApijPbwAMQrMQeCFVFRU
 nZYlFqTPgCHETq3doYt3SFtIkt6La+jdarhDuqcXctoUux811AaF1BE9bHypLMuc5E
 kSnPe+xM7fvGg==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: Using OneRNG hardware RNG can I get wireguard to use /dev/random
From: "Ipad@petergarner.net" <ipad@petergarner.net>
In-Reply-To: <CAH8yC8nCwwx8h8HmTGhsh10Dm4ThQTc=53ESfO=6iAXx4XvqmQ@mail.gmail.com>
Cc: peter garner <peter@petergarner.net>, wireguard@lists.zx2c4.com
Date: Fri, 24 Jul 2020 09:58:25 +0100
Message-Id: <7D62871B-4F42-4B15-AEDA-25352B041FFA@petergarner.net>
References: <CAH8yC8nCwwx8h8HmTGhsh10Dm4ThQTc=53ESfO=6iAXx4XvqmQ@mail.gmail.com>
To: noloader@gmail.com
X-Mailer: iPad Mail (17G68)
X-Mailman-Approved-At: Fri, 24 Jul 2020 23:05:52 +0200
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


>> On 24 Jul 2020, at 09:33, Jeffrey Walton <noloader@gmail.com> wrote:
>>=20
>> =EF=BB=BFOn Fri, Jul 24, 2020 at 4:28 AM peter garner <peter@petergarner.=
net> wrote:
>> I've used my OneRNG v3.0 external device to recreate my SSH moduli and
>> am now looking to recreate my wireguard keys.
>> According to the Wireguard docs it uses /dev/urandom:
>> https://gist.github.com/rmoriz/58f1768218a4fbc4b318615bfb85111d
>> fd =3D open("/dev/urandom", O_RDONLY);
>>       if (fd < 0)
>>               return fd;
>>       ret =3D read(fd, out, len);
>>       close(fd);
>=20
> Unrelated, the kernel-crypto folks recommend using /dev/urandom.
> Wiregaurd is following best practices. Also see
> https://lkml.org/lkml/2017/7/20/993.
>=20
> Jeff

Thanks Jeff - all is now clear (that link helped as well). I've been doing s=
ome additional research and everything makes sense.






