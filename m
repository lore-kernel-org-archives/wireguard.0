Return-Path: <SRS0=2IG6=P4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3483DC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Nov 2021 17:19:35 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 100B961027
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Nov 2021 17:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 100B961027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 865391a7;
	Tue, 9 Nov 2021 17:19:32 +0000 (UTC)
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [2607:f8b0:4864:20::a30])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e6934c82
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Nov 2021 17:19:30 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id t127so10377491vke.13
 for <wireguard@lists.zx2c4.com>; Tue, 09 Nov 2021 09:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/E7IlnjWccK52bx3VI1iEPX4CN+uGuTUS7qGhyPiE/w=;
 b=o6pN8KFI+jFnqsr702PliA5lK8uzh998Dva9Rj8AQXO3S0VGuay/nv2qlJU0w8XC0a
 Xt6GSgybKK1IYog6Hy4deXmDjLsSXCHPhE54B524WI2rtxbYXOSqv8I6yMIJ07v6TCtm
 RMVF2P7wGKB0AFVRlS802ULBmc1aAEpWHHeurChoeI8v6R22Y8MjwcjCKbQ3DH5vXExW
 Slt0tAciFmRRjXO8TZcPUZzl6e0nb93vZ4VQoks48e7GzlesZ8cv8XHTBB7OevWHvTJx
 T9Ny69QZA5+CqQulk5hts7ir1ScNP7ZJuq2BpLAMu3g0W9uu+VdppzYzOPvoEOTH2dBa
 qh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/E7IlnjWccK52bx3VI1iEPX4CN+uGuTUS7qGhyPiE/w=;
 b=knETuhLRw/QhaOnULTZ+NH/7m292JJdL1GCoj9WJVETKSh0JLajYfR2Beb+BkxPqao
 8MrPc4xlDhWdqg0xARYwGrOwUJqFv/oMUc2Z6OylBUr3yUtPaoq6K52mTJLiMfXEFhE9
 sL3Cc8j91zAy2odV9Vob10JlIVD5iixbpWo00qIO04vCcC161IjyL36T6e/apxYVDuEQ
 jg6f3IqHTnxRX2bxD0lSN1LvjT3Qd7/9USGtTPiMUiOiOZp6KaIHDeWJ054jHFJ8Ow1N
 7+etrD6KlgPYU9sQwRuQ2EeSNe2c921gjgzIh2VoyJYHWzx6TTZ2RA25DRCOw1WEedVE
 c0og==
X-Gm-Message-State: AOAM532yEiq4oSYhYsrbJPgmw+hTIkQIp4OljMWoAdSe3CyFdxpausRZ
 my1cL/Bf+Bz2jFlQ8gqoTrMXrCsAMTyeIrnhPNzvog15tB4=
X-Google-Smtp-Source: ABdhPJzyWSsQOX5BIPP/UIpA9YAQiKSQSen2DOE45cexdNBfWs48H3mIN2LAt8zoz11my4wqU9c/iQXYFOLjOvw6Nzc=
X-Received: by 2002:a1f:20c2:: with SMTP id g185mr12511362vkg.25.1636478364964; 
 Tue, 09 Nov 2021 09:19:24 -0800 (PST)
MIME-Version: 1.0
References: <CABOEyuLiu96_KxEH5sdGLaE5-s9e8F_c0a1PKHSnFcMKp5YHow@mail.gmail.com>
 <CAHmME9oPi=LvdcZC-FA+SvyxEmcRULtNB8hAQZoCAX=kQycTXA@mail.gmail.com>
 <CABOEyuJidG_u8SFGnhV6aw5y7PHVhaW_diDrpdMMHfOE4fHRWA@mail.gmail.com>
In-Reply-To: <CABOEyuJidG_u8SFGnhV6aw5y7PHVhaW_diDrpdMMHfOE4fHRWA@mail.gmail.com>
From: Ryan Roosa <ryanroosa@gmail.com>
Date: Tue, 9 Nov 2021 12:19:14 -0500
Message-ID: <CABOEyuKT7ebroX2yRU9xixDVCBmJV15Hy1vh-nUwrmdGjX6=QQ@mail.gmail.com>
Subject: Re: wireguard-freebsd handshaking issue upon underlying WAN
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Kyle Evans <kevans@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
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

Just wanted to provide some feedback that pfSense development
snapshots of 2.6.0 running WireGuard package v0.1.5_2 include the fix
and there I have validated that removing WAN connectivity at various
intervals up to 10 minutes no longer impacts subsequent handshaking
once the connection is restored. I have not yet tested on OPNSense but
I imagine the results will match once I do (if not I will reach out).
Thanks to everyone for their efforts on resolving this one, I really
appreciate it.

-Ryan

On Wed, Oct 27, 2021 at 7:45 PM Ryan Roosa <ryanroosa@gmail.com> wrote:
>
> Hi Jason,
> Thank you very much for this! I received word from the OPNSense team
> that the referenced snapshot should be made available in OPNSense
> 21.7.5. I will test and provide feedback just as soon as I can get on
> the aforementioned OPNSense release which includes the fix.
>
> Cheers,
> -Ryan
>
> On Tue, Oct 26, 2021 at 5:29 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hi Ryan,
> >
> > Thanks for the report. Kyle saw your reddit post earlier and tracked
> > this down, I think/hope, to a bug in the state machine cranking. I
> > committed the fix here -- https://w-g.pw/l/yQTw -- which will be part
> > of the next snapshot. Hopefully that will fix the issue, but if it
> > doesn't, please do update this thread so we can keep searching.
> >
> > Regards,
> > Jason
