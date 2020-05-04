Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D059C47257
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 16:51:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D8D32073B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 16:51:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZeJWEWN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D8D32073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13ea4fb4;
	Mon, 4 May 2020 16:38:52 +0000 (UTC)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b600bbb4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 16:38:50 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id t3so2537699oou.8
 for <wireguard@lists.zx2c4.com>; Mon, 04 May 2020 09:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qi0RRieGU+R12oDPsfAYSGBdwoT0E95SbHAAmzGiSxA=;
 b=qZeJWEWNRRJW6PqXmr5LQlWGCnAhjyCcgBWsepuMPUH5PB8rwQcFZzMJEeZuASGOJb
 19DfmV1CoGRK+oTmwfVBmXvGWg+Hl2O8QK1T1Oto7YOaF2RZvoNrFm3SuUUeFQkUTqiA
 SHWld6B8wIYaUoIop8gDcqQJ0qpswjDYA5Yg4BcYOzVFx4M0PIotXjsitmbbjloE7UQI
 MxTPMllp+64nq/F6XfGTpA77lj1Ow6CPIBPrUnvaezV9kY9VdM+GCgH99UGxF9L5YP2P
 otImdlfiBaG/OlPTTaT7jzPYvqMXHrIxNwHmUitrYYLVFybBLvw/Emfl9ccwhVJCYy2q
 YMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qi0RRieGU+R12oDPsfAYSGBdwoT0E95SbHAAmzGiSxA=;
 b=Rv6wR7AoAuQXF+khBnH91rFu1LA/vAsHjQV9lx7B0yEYwZjcLzkJ4kLs1eoCYfP7nw
 URypnhTXgbO4tNptB1Vv6fMcBQ/NcnUGEew1IMus+iPZD9OsIul39O7msXxdhw7C+8gc
 ueimVpRDiP0D0n+XTcxFDlQhJMn88VTAsS+6GRw/E5UNG88IAH10h976tjQwb0vLVuo3
 yDTbxzyrGI0bojK+mLyM1A614tA9ipBx2HT3yoQkkSyS5Wa26OVGAtYzZdnxFv/UkmGn
 lQzHvv9owabdeDiUiy2j8rWpSAewV6QIaV0ld02si0KGohOQg9E6UhsUzT3mTXo3ysa3
 pXpA==
X-Gm-Message-State: AGi0Puaohc+NbOj3/Gb5/3SLK3BM4Jes/lM8xtxR8PNCIs4VHtdYPRBu
 K1Bn5vu1j0fpPR8ZT4Y0ESuHBnGHD5I2vLAVsuQ=
X-Google-Smtp-Source: APiQypKheBqYi9H7y7QtLYylPZjznp6Dqj/YiS727wjavojIfQCSolKv1PHi2nOcOfwKjwDN8luiVyiEjT06sNERUwQ=
X-Received: by 2002:a4a:d44a:: with SMTP id p10mr15998856oos.11.1588611075626; 
 Mon, 04 May 2020 09:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAF75rJBKTbaK6CEQcmto=YcgA5NGrG85jSvSrYZpQV-L1xFMww@mail.gmail.com>
 <CAHmME9oNus499EVFHVfLNjbOhU+vOV4P7R7USCm1ycNH2e0apA@mail.gmail.com>
 <1588599653.habtnvnvne.none@localhost>
In-Reply-To: <1588599653.habtnvnvne.none@localhost>
From: Wang Jian <larkwang@gmail.com>
Date: Tue, 5 May 2020 00:51:02 +0800
Message-ID: <CAF75rJA+Cs8Zspete8r4sZoZYP=N8+OVZnRK2JL5468VyiRZUQ@mail.gmail.com>
Subject: Re: soft lockup - may be related to wireguard (backported)
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Alex Xu (Hello71) <alex_y_xu@yahoo.ca> =E4=BA=8E2020=E5=B9=B45=E6=9C=884=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=889:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Excerpts from Jason A. Donenfeld's message of May 4, 2020 1:26 am:
> > Are you routing wireguard over wireguard, or something interesting like=
 that?
> >
> > Is ipsec being used?
> >
>
> This "DN2800MT" looks like an Atom board from 2012; are you trying to
> run a very large bandwidth through it? I think it's plausible that
> buffering could cause a large enough chunk of work for a slow CPU that
> the kernel could erroneously think that the code is stuck. I don't know
> why that would happen on the tx thread though, or why it would result in
> an RCU stall, seeing as only a single access is made under an RCU lock
> in this function...

It's an old Atom CPU but still capable of handling at least 100Mbps
(even with encryption).

I have a prometheus running on this box, so I have monitoring data at
an interval of 15s.

Looking at the monitoring data
1. the event started from 1:02:00am, ended at 1:04:45am
2. peak time was 1:03:15am, for load, cpu usage and memory usage
3. available memory dropped from 3.359GB to 2.714GB at 1:03:15am, and
bounced up gradually
from this point

Seems it's related to wireguard's memory use, a cause or a result.
