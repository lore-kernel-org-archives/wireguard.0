Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0BFC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 15:11:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E51BB20831
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 15:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="Pmvzqa/Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E51BB20831
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1ea5329;
	Mon, 19 Nov 2018 15:05:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efb4dd32
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 08:35:01 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30d757e9
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 08:35:01 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id 192-v6so24611081oii.6
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 00:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZvMU79JwZfspk5CkJj7HxlLyYnuFEWIFNLT6lSo/po=;
 b=Pmvzqa/YmeW7ONxWlZJ5hAEgyxDQaC4GdMAolSb4JzT8z/Q/2WVBtXOSGMHqgBPdL4
 MNIK9J0fkMVnNeJdCoHBtlu6zZdTcSGAkKJiUABr+e0hHukKcKkPOcS+kffGNUFXXB0t
 +WqHO6PImOFhVjjZCt8wsZNHSTyV6pUB35vuyqWpYUjid1QSJOiVBCdBCUqrzkWyfSyE
 ih4YHqPiziY1XPM+jZx32bQ/f5fVwgZKnJYo/8jtPZJ5r4ReCQW7dYXzVHRswMYYxVfK
 A/b2vr3Lx7L+zBM1QS1PtwB7KaWtMgyOKCenG8BroMCs8no1dxRfr0ut7j8Y/d9LMUhw
 AKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZvMU79JwZfspk5CkJj7HxlLyYnuFEWIFNLT6lSo/po=;
 b=eQCt5mQEPmQBybyBXZ8IwpKQVnQ53Pm21dKRiBfy2KuBfT9/nYKyi0Q0gwrq0sO7fg
 hgOKw6MrTY1rMMc8stqLAgVIOMZxlbG+phOCV8eIPkgwO/cioK8Xmwbb3L8Wmijrgd1o
 4iXTFQcMElEWnfxAYWky4Q9c41WwbslzhtWZrC58hBWf39aqnYbPUCnUlMouSnxcktzx
 LuJQvJLlBfI5qIRab/VV57bw0vRSClpShExHCLJsGmHqC9uwiOVirNmHX1cIPYl58f6S
 0PfNxlVv3cbvfo1PjGhyO2wVfz4KR3KAIIJIEZXAo4J2zDcW8TASyUbpAgmXJXSbKD4z
 rCbA==
X-Gm-Message-State: AGRZ1gKZihGPy7Wwiyl/AAafaVT6OHhoeEmdJu2BuiPCFSrJEBarVtlo
 VT4F2RbI8WJwIa37X1RrAW/sw1zVCTOz2vcK+D+m6A==
X-Google-Smtp-Source: AJdET5dTMfNH1dkMmcNqp2T2n5iMdWOWM7PNdNdHCFueW4EMtqxFXoTHoUO3rz9mUuYKSWXfKiWyDAv4pT0t7hFR/oA=
X-Received: by 2002:a54:4607:: with SMTP id
 p7-v6mr6371720oip.126.1542616858384; 
 Mon, 19 Nov 2018 00:40:58 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
 <1542611942.d09p50zvb2.astroid@morple.none>
In-Reply-To: <1542611942.d09p50zvb2.astroid@morple.none>
From: John <graysky@archlinux.us>
Date: Mon, 19 Nov 2018 03:40:47 -0500
Message-ID: <CAO_nJAaTdB5+8UJODas0giO3AAfZuW3YYFwaL3vZoO9JH-sv+Q@mail.gmail.com>
Subject: Re: Traffic on port 53 fails on LTE but works on WiFi
To: mdt@emdete.de
X-Mailman-Approved-At: Mon, 19 Nov 2018 16:05:15 +0100
Cc: wireguard@lists.zx2c4.com
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

Thank you both for the replies.  I first tried reducing the MTU
(/etc/wireguard/wg0.conf setting MTU = xxxx) where I tried values of
1360, 1300, 1200, and 1100 but all met with the same result.

I next tried the suggestion to run `tcpdump udp port 53` when I have a
problematic client connect on LTE and when I have a successful
connection on LTE (different providers).  I need to read up more of
this output before I post publicly as I might be disclosing personal
privacy info.  I will say that each of them contain some lines like:

... Type63103 (Class 50031)? <BAD PTR>[|domain]
... Type4168 (Class 47859)? <BAD PTR>[|domain]

The difference is that the problematic client seems to only contain
lines with either 256 or 512 sizes (I assume sizes).
time stamp IP blah.myvzw.com.9725 > wireguard.domain: 256 [xxxxa]
[xxxxq] [xxxn] [xxxxau][|domain]
time stamp IP wireguard.37024 > dns.quad9.net.domain: xxx+ PTR?
xxx.x.xxx.xxx.xx-addr.arpa. (44)
time stamp IP blah.myvzw.com.9725 > wireguard.domain: 512 [xxxxa]
[xxxxq] [xxxn] [xxxxau][|domain]

But the successful client connection has these plus a number of lines
where the 256 or 512 is 1024.  Again, I need to read about not
disclosing personal info before I post the entire dump file.

Is the little info I did post diagnostic?
On Mon, Nov 19, 2018 at 2:32 AM M. Dietrich <mdt@emdete.de> wrote:
>
> Hi John,
>
> Quotation from John at November 18, 2018 19:55:
> > ... on port 53 ... do _not_ work when I connect via LTE
> > (Verizon supplying the data).  On LTE, I am no longer able
> > to transfer data to/from the server peer but I can handshake
> > with it.
>
> Vodafone blocks UDP traffic on port 53 in LTE.
>
> > 1) What can I try on the server peer side to diagnose?
>
> I would check with tcpdump. it seems Verizon does some package
> inspection, maybe reducing MTU will do?
>
> > 2) Do people feel that Verizon is actively blocking the
> > connection on port 53?
>
> Not with Verizon but Vodafone which does a complete block -
> not even the handshake goes through. Not sure about the cause
> for that, maybe they want to control your DNS that way.
>
> Regards,
> M. Dietrich
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
