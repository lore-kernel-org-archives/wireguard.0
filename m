Return-Path: <SRS0=Jxxz=WS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82914C3A59D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Aug 2019 08:55:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BAE4205ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Aug 2019 08:55:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="CJDCjz9k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BAE4205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01bd0438;
	Thu, 22 Aug 2019 08:55:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17fdcd99
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Aug 2019 08:55:03 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11e490ef
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Aug 2019 08:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:From:To:Subject:content-disposition;
 bh=XqIB6JB9MmQNiNuoMIFpseS7xU5niPg4iw85OnujevM=; b=CJDCjz9kW2XL2fBJxwJECs8b67
 A6zYIT0ncqdRRmshYi4a37oYXlrK+GkTpgEF4Ve9xPVHoXuaI8fS5NcHgMtCfR28i0G1xHKT7kD39
 kc4czFrD+nazH0wSBq507PJedVeuVL+MYMK/utvfPlmJgB9EHS5Jaj7PDP6oOzdOFOGp35atNQWyh
 X+PAzMozQC1Kr0+gnex/d46oNQ0p5PWJSjr9juL6r7g61Eds2Wptg0ndkTsNVHSqsmOkp88McchSQ
 J6KDpxC390yHHN568Dls4C5K9sPyFuoS5XBOlAHttdptLEknbwA4oNMuX8u+H9X/dpYz3pXTN2QCC
 pWkG5o9mIPxXkB2PPSRN27sqd8rOzyKlwrJUw5FRz7gCWW0R/rQvF5DKKgQblmS7jtwlnvhukcZ4d
 gSjqOHpJVqX39eUxRuSk1K7MsFq+quaOW2cTFNBi7PALqhAKhlNmyubUCYCypjk9CFLo5bm5HkYU8
 L2IlrymugAVVjODWu3V3CQfWv8Gxw6fbcmj/j+LFxOgB34MTTTbFCZ2nhudRmzdC0AaZfBz+7cOXh
 ekgk0nPzRNcroKeFJ0FCpzOHlvHjbAxdAfTeL1eUttLT31uRqbwLJVKfjmZPepnO3OXqI59vuIi3R
 affYpH+u3kpQHlkJr8auMvMflqj5GZdgc+AMszNXA=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1i0irz-000294-8E
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Thu, 22 Aug 2019 10:55:01 +0200
Subject: Re: Support FIDO2/CTAP2 security tokens as keystore
To: wireguard@lists.zx2c4.com
References: <9ecf3b0f-a73f-52a3-b7b8-3b96a7e67eab@bartschnet.de>
 <20190818170928.ps2fymkisd4giefv@feather.localdomain>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Message-ID: <c8accebb-1a7f-7b3e-26b5-2d0b13347fb3@bartschnet.de>
Date: Thu, 22 Aug 2019 10:54:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190818170928.ps2fymkisd4giefv@feather.localdomain>
Content-Language: en-US
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Am 18.08.19 um 19:09 schrieb Reto:
> For starters, storing stuff on a hard disc is certainly not "quite 
> insecure".
> Are you aware that you can encrypt discs / partions / files?

Anyone with access to the running machine or malicious software can read 
the keys on hard-disk.

How do you de-crypt the encrypted disk on a headless machine which has 
to reboot autonomously on error conditions?

> Wireguard also allows you to set the private key on the fly, so you can feed it
> for example secrets stored in pass (gpg encrypted), which you *can* decrypt with
> a yubikey already.
>
> Are you speaking specifically about wg-quick?
> In that case the manpage already shows you how to feed wg encrypted secrets
>
>> Or, perhaps it is desirable to store private keys in encrypted form, such as  through
>> use of pass(1):
>> 	PostUp = wg set %i private-key <(pass WireGuard/private-keys/%i

The point of security-tokens is you never get access to the private key.

Instead you pass the stream-cipher encrypted with the public key to the 
security token

to be de-crypted by the security token.

Regards,

Renne

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
