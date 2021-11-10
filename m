Return-Path: <SRS0=+cFr=P5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1449C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Nov 2021 06:39:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD3061179
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Nov 2021 06:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCD3061179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb4e56be;
	Wed, 10 Nov 2021 06:36:55 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c0f37594
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Nov 2021 06:36:54 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id D8A0494F00
 for <wireguard@lists.zx2c4.com>; Wed, 10 Nov 2021 06:36:52 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Hpw9w5PTGz4g1S
 for <wireguard@lists.zx2c4.com>; Wed, 10 Nov 2021 06:36:52 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 909832E654
 for <wireguard@lists.zx2c4.com>; Wed, 10 Nov 2021 06:36:52 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f169.google.com with SMTP id v4so1206628qtw.8
 for <wireguard@lists.zx2c4.com>; Tue, 09 Nov 2021 22:36:52 -0800 (PST)
X-Gm-Message-State: AOAM5326HP0rLvyGoImpp6sr4aAdayktFkjetrGq9STuvzkDmHLsoQ6O
 hLndSPU6OQ64Ncyoj1vvcWrfq24Kr8OehAdNNnk=
X-Google-Smtp-Source: ABdhPJyCGqDcdJCmZQHaUG94ZmhN5/oRf+CG0qCiQMQ16IjyVjVVfTSdhpp6TwV6FYEfoUgGjvMkFTAMD00PyjlwZzg=
X-Received: by 2002:ac8:4e28:: with SMTP id d8mr14688022qtw.11.1636526212150; 
 Tue, 09 Nov 2021 22:36:52 -0800 (PST)
MIME-Version: 1.0
References: <CABOEyuLiu96_KxEH5sdGLaE5-s9e8F_c0a1PKHSnFcMKp5YHow@mail.gmail.com>
 <CAHmME9oPi=LvdcZC-FA+SvyxEmcRULtNB8hAQZoCAX=kQycTXA@mail.gmail.com>
 <CABOEyuJidG_u8SFGnhV6aw5y7PHVhaW_diDrpdMMHfOE4fHRWA@mail.gmail.com>
 <CABOEyuKT7ebroX2yRU9xixDVCBmJV15Hy1vh-nUwrmdGjX6=QQ@mail.gmail.com>
In-Reply-To: <CABOEyuKT7ebroX2yRU9xixDVCBmJV15Hy1vh-nUwrmdGjX6=QQ@mail.gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Wed, 10 Nov 2021 00:36:41 -0600
X-Gmail-Original-Message-ID: <CACNAnaHYUxPvV53NditMvNfkn9YvYSv=ief=FDew2kmHjJ5hgg@mail.gmail.com>
Message-ID: <CACNAnaHYUxPvV53NditMvNfkn9YvYSv=ief=FDew2kmHjJ5hgg@mail.gmail.com>
Subject: Re: wireguard-freebsd handshaking issue upon underlying WAN
To: Ryan Roosa <ryanroosa@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Tue, Nov 9, 2021 at 11:19 AM Ryan Roosa <ryanroosa@gmail.com> wrote:
>
> On Wed, Oct 27, 2021 at 7:45 PM Ryan Roosa <ryanroosa@gmail.com> wrote:
> >
> > On Tue, Oct 26, 2021 at 5:29 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > Hi Ryan,
> > >
> > > Thanks for the report. Kyle saw your reddit post earlier and tracked
> > > this down, I think/hope, to a bug in the state machine cranking. I
> > > committed the fix here -- https://w-g.pw/l/yQTw -- which will be part
> > > of the next snapshot. Hopefully that will fix the issue, but if it
> > > doesn't, please do update this thread so we can keep searching.
> > >
> > > Regards,
> > > Jason
> >
> > Hi Jason,
> > Thank you very much for this! I received word from the OPNSense team
> > that the referenced snapshot should be made available in OPNSense
> > 21.7.5. I will test and provide feedback just as soon as I can get on
> > the aforementioned OPNSense release which includes the fix.
> >
> > Cheers,
> > -Ryan
> >
>
> Just wanted to provide some feedback that pfSense development
> snapshots of 2.6.0 running WireGuard package v0.1.5_2 include the fix
> and there I have validated that removing WAN connectivity at various
> intervals up to 10 minutes no longer impacts subsequent handshaking
> once the connection is restored. I have not yet tested on OPNSense but
> I imagine the results will match once I do (if not I will reach out).
> Thanks to everyone for their efforts on resolving this one, I really
> appreciate it.
>
> -Ryan
>

That's good to hear, thanks for following up! :-)

Kyle Evans
