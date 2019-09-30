Return-Path: <SRS0=knlp=XZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A28C4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Sep 2019 07:52:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB0E3218DE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Sep 2019 07:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="mL2F3A8B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB0E3218DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 388c297a;
	Mon, 30 Sep 2019 07:52:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 980e0d71
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Sep 2019 07:52:36 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [IPv6:2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba00060e
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Sep 2019 07:52:35 +0000 (UTC)
Received: from nico.schottelius.org (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 65B352036B;
 Mon, 30 Sep 2019 09:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1569829954; bh=lCMgIn/vkKYoWGQa+RV3fVA9DEKRLY56mV3B/SpYM/I=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=mL2F3A8BrBclEmoIKnC88zgVf6LabK+16Y2BcmcSnIX/G+oPe6Otzq5mCUia6Lj84
 +EouKEOn6z7NmCG+6N9ELyOqP0SitlOtMzzkZGBCMmsNrwZLAHIPOvFraClY3EZeIL
 jEWxKLb+Tr2kd3k9FpfjTrG4sNngChVxKx0uSEAU=
Received: by nico.schottelius.org (Postfix, from userid 1000)
 id 57AB91A01027; Mon, 30 Sep 2019 09:52:34 +0200 (CEST)
References: <71fa7444-07f7-d7da-9a0b-895a27be18bd@bartschnet.de>
 <72539641-4832-70d5-09b5-430a8ab2deae@noc23.de>
 <CAOAVeL0e4JP+T6Z1353UPRmEXL84ZX5MSe+pjTO6xzzn9TB83A@mail.gmail.com>
User-agent: mu4e 1.0; emacs 26.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Henning Reich <henning.reich@gmail.com>
Subject: Re: IPv6 endpoint AND IPv4 fallback endpoint in roadwarrior scenario?
In-reply-to: <CAOAVeL0e4JP+T6Z1353UPRmEXL84ZX5MSe+pjTO6xzzn9TB83A@mail.gmail.com>
Date: Mon, 30 Sep 2019 09:52:34 +0200
Message-ID: <87eezyp6f1.fsf@line.ungleich.ch>
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


At lookup time this works already. The problem is, if the underlying
network topology changes and you need to reconnect via IPv4, when you
had IPv6 underlying before.

This is the feature that is - afaik- not currently implemented in
wireguard.


Henning Reich <henning.reich@gmail.com> writes:

> Should a DNS entry Wirth one
> AAAA record and one A record solve thus problem? So the OS decide the best
> way to connect?
>
> Ulrich Kalloch <ulli@noc23.de> schrieb am So., 29. Sep. 2019, 16:29:
>
>> Hello @ all
>>
>> i am interested in this too.
>>
>> Regards
>>
>> Ulli
>>
>> Am 27.05.19 um 20:10 schrieb Rene 'Renne' Bartsch, B.Sc. Informatics:
>> > Hi,
>> >
>> > is it meanwhile possible to define an IPv6 endpoint AND and an IPv4
>> > endpoint as fallback
>> > in case a road warrior does not get IPv6 connectivity when switching
>> > internet sockets?
>> >
>> > Regards,
>> >
>> > Renne
>> > _______________________________________________
>> > WireGuard mailing list
>> > WireGuard@lists.zx2c4.com
>> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--
Your Swiss, Open Source and IPv6 Virtual Machine. Now on www.datacenterlight.ch.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
