Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28DFBC388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:04:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5608F2064B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFYAhuj6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5608F2064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cb9706e;
	Tue, 10 Nov 2020 12:59:04 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 762d7167
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 12:52:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id 19so1355095wmf.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 04:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:references:in-reply-to:subject:date:message-id:mime-version
 :content-transfer-encoding:thread-index:content-language;
 bh=sOkrzrBqofO8imR4FzlYg8eIPyrCSDq0JQa1aw0XnFQ=;
 b=YFYAhuj63TKLN7W3+bx7wm3je5lVj4FQ/PEWB65iszZ5b9eZitmQENkcaQg7lFiAvV
 IG5a+Tmkp0KvARTvZuqnZW6x96EwMOf2l96SZr+LddsbWHC85WkHjBmEBfAHfB1tTdsh
 a2sYK4Ut3S+r6PlwHlF5AEzT2agECtdJ4J9Fu9QTaC+p3C4qv8aZRp/fCl0yrkZXXSB0
 4CU8eDPvl1AnOda0DIPd6Nr0HGPxE0moFJCG8THiXzbwoKY5BL9wGYNt9tb8JD1XPbsJ
 kt0M+vl6D+4BqgDMkh3F3v+Lgh/EDs3yZWRQWHMtiWFvCsecydESl7yDHDP2BQEqsy30
 wUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=sOkrzrBqofO8imR4FzlYg8eIPyrCSDq0JQa1aw0XnFQ=;
 b=HaojMlqNxIE1lD7OfAF7+0BliWxX7cDrlmJ/+LkMedKTdwg7ooFs66Hjz+CjHpm/rq
 8rWzY9ioaxlC/OuVamhwyDDKLm8RZL3+s1asouYQpjExVTO9CFDyeS510DUcVXYuMrny
 mht5dluQPo2dq22+LCKv56drJXygeP/BMODNtHNftMk9fSUe75O7P17J8N1KP2bbRQ3/
 akaQ+UFkn1NJpfE+q2voweOso92H2E2Y27QJyChJAyv1VUO6VX79NDloOIkdF8PnMwj7
 POdo3omPxo3eJKmw+kSq6MqnKsZBDdv6/fiuQ6/hzr60Lq86wdq2BEB7ZX94CK8vgudw
 YwFA==
X-Gm-Message-State: AOAM530A5GIJMV1mYjZWsvETi3M15CBnIYslY+XOCgnjCmvsf2wV4a3l
 TXbwrtID48LZ/OExQZX9PL1ICbHBFKfgOg==
X-Google-Smtp-Source: ABdhPJybAmf/Xln9Rp5DS4TMqdTbNZ+6U0x+Lpw0JxHGnFQvggWheLbZ2B/Rvah37JGshntiNvbPRg==
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr4617986wmd.73.1605012966044; 
 Tue, 10 Nov 2020 04:56:06 -0800 (PST)
Received: from TICTACPC2 ([2a02:120b:2c7d:320:84a2:f5df:5eb4:2a22])
 by smtp.gmail.com with ESMTPSA id g138sm2827798wme.39.2020.11.10.04.56.05
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Nov 2020 04:56:05 -0800 (PST)
From: <samuel.progin@gmail.com>
To: <wireguard@lists.zx2c4.com>
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <20201110134743.1615fcf4@frign.de>
In-Reply-To: <20201110134743.1615fcf4@frign.de>
Subject: RE: Should we sunset Windows 7 support?
Date: Tue, 10 Nov 2020 13:56:06 +0100
Message-ID: <00fa01d6b760$da95c480$8fc14d80$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGiIb/2UHAuS8Fc7FjKD9QRhcCEUwJbQa6fqhej6jA=
Content-Language: fr-ch
X-Antivirus: Avast (VPS 201109-4, 09.11.2020), Outbound message
X-Antivirus-Status: Clean
X-Mailman-Approved-At: Tue, 10 Nov 2020 13:58:56 +0100
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

Dear all,

FWIW, Microsoft sells extended support (Windows 7 ESU) to corporate
customers using Pro or Enterprise editions. It can be extended until Jan
10th 2023.

https://docs.microsoft.com/en-us/troubleshoot/windows-client/windows-7-eos-=
f
aq/windows-7-extended-security-updates-faq

Kind regards.

Samuel

-----Original Message-----
From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Laslo
Hunhold
Sent: mardi, 10 novembre 2020 13:48
To: wireguard@lists.zx2c4.com
Subject: Re: Should we sunset Windows 7 support?

On Tue, 10 Nov 2020 13:27:20 +0100
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

Dear Jason,

> Windows 7 has been EOL'd by Microsoft since January of this year. It 
> is no longer receiving security updates or fixes. This email is to get 
> the conversation started about doing the same with WireGuard for 
> Windows.
> [...] Do we really want to keep maintaining gross stuff like this? It 
> makes me uncomfortable to have kludges like that sitting around in the 
> code. Shouldn't I write an auto-downloader that then checks hashes? 
> Shouldn't I build this into the installer? Shouldn't I....
> waste tons of time supporting Windows 7 better?
> 
> Probably not.
> 
> But I know so many users are still using Windows 7. I'd like to hear 
> from you to understand why, in order to assess when is the right 
> moment to sunset our Windows 7 support.
> 
> So, if you care for Windows 7, please pipe up! We're not going to 
> remove support for it overnight, and we're not prepared yet to 
> announce any sort of formal deprecation plan, but the world is moving 
> on at some point.

this is a really difficult judgement to make, which comes up every time
Microsoft EOLs an operating system, because it really often is still heavil=
y
used.

My stance is that we as open source developers don't owe anybody anything,
and if Windows 7 users really care about WireGuard they can create, share
and maintain a patchset that implements the fixes themselves. You shouldn't=

be the one paying the price (i.e. time spent) because people insist on usin=
g
an EOL'd operating system, which presents a security issue in many other
aspects as well. If they can't do it themselves, they could pay somebody to=

deal with such a patchset, or just keep running the last supported version
of WireGuard.

In an utilitarian sense, because you're losing time over Windows 7 support,=

everyone else is negatively affected, because it's time you could spend on
aspects of WireGuard everyone benefits from, and not only those running an
EOL'd operating system.

To put it shortly, I'm completely in support of sunsetting Windows 7
support, or even just keeping the Windows-7-changes in the next release for=

one last time and then immediately dropping them right afterwards in the
git-master. I'm not sure what you exactly mean with sunsetting, which is wh=
y
I've given the above "drastic" proposal in case sunsetting means dealing
with this nonsense for another year or something.

With best regards

Laslo Hunhold


-- 
L'absence de virus dans ce courrier =C3=A9lectronique a =C3=A9t=C3=A9 v=C3=
=A9rifi=C3=A9e par le logiciel antivirus Avast.
https://www.avast.com/antivirus

