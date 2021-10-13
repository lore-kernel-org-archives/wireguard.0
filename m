Return-Path: <SRS0=+Ywq=PB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2998CC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 18:17:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E8C961139
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 18:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E8C961139
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ea09ed7;
	Wed, 13 Oct 2021 18:17:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id af5ee3e8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Oct 2021 18:17:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D1D361152
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 18:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FTgdm7FA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634149027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eYwWv9E3fXOpYowfWCiYq0Zy+GFEsOeS9G6duSg/FAA=;
 b=FTgdm7FARWqDtdQGnp/Y7+9oEtvBPSppsb+oQ5S1bkEp8IxCbWfcV7zehyUB8N3mOsN+CE
 uc9tz8S641Q4Fm/CwjV5VcbJzZ1PKRZxtmnuSb+hnp6mBoIxnmi2q+fss+LPp+a8JdgxoF
 bHkcFECJve/pJISn2mYNnCC8g3RnvFY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f9269344
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Oct 2021 18:17:07 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id h2so8443980ybi.13
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 11:17:07 -0700 (PDT)
X-Gm-Message-State: AOAM532cxNKv1wknoPxA6iwfk+9eKyRI9XknLUtppK7pqVejdp2JLgFY
 4jco+njQam+UWGRlf4V8KXwUGmXDqJ+ULWS/nYI=
X-Google-Smtp-Source: ABdhPJykMlW/CZJARrHP7DJsnM9rQbZnqRGv5foQeNWg+B2Ox/zgussATgjWWDQuSaLLl6yk2CDHLU2ypV7nz5ohiyA=
X-Received: by 2002:a05:6902:120f:: with SMTP id
 s15mr973736ybu.449.1634149026717; 
 Wed, 13 Oct 2021 11:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
 <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
In-Reply-To: <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Oct 2021 12:16:55 -0600
X-Gmail-Original-Message-ID: <CAHmME9q3j=2HG-4v5tpHRM9DCKpw+5iSMyzu30jAUHS1r=eDHw@mail.gmail.com>
Message-ID: <CAHmME9q3j=2HG-4v5tpHRM9DCKpw+5iSMyzu30jAUHS1r=eDHw@mail.gmail.com>
Subject: Re: Windows Log Output to Event Viewer or Text File
To: Frank Wayne <frank.wayne@northwestern.edu>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Frank,

On Wed, Oct 13, 2021 at 7:30 AM Frank Wayne
<frank.wayne@northwestern.edu> wrote:
> >> On Tue, Oct 12, 2021 at 3:39 PM Frank Wayne <frank.wayne@northwestern.edu> wrote:
> >> That's pretty awful. It is only possible to get the last 2048 events and no way to get just the events since the last update. There is no way for an aggregator to simply collect WireGuard logs on Windows.
>
> > Your "that's pretty awful" aside, is what you're asking for some kind of CLI "follow" mode that doesn't terminate and spits out logs to stdout perpetually?
>
> > Jason
>
> No. I'm not sure that would be much of an improvement.

Why not? It would make it possible to tail the log more easily and
pipe it into whatever log collection daemon you want. And if that's
indeed still not an improvement, what is the relevance of your
previous mention, "It is only possible to get the last 2048 events and
no way to get just the events since the last update"? I find the tone
of your messages quite abrasive rather than informative. Can you slow
down a bit and try to describe the constraints and requirements of
your system, and then we can try to figure out what would be a good
path toward realizing a good design there? Let's start with: what's
missing in a tail mode that you can pipe to whatever, other than,
"it's not ms event logging"?

> In Linux (under systemd), kernel logs are accessible in journald, can be forwarded to (r)syslog, and from there to a text file or external syslog or wherever.

I'm pretty sure systemd-journald epolls on /dev/kmsg. In other words,
it aggregates logs from different sources. That's not a whole lot
different from a follow mode, right? But why are you talking about
Linux, or about kernel logs for that matter?

> I can't imagine that a proprietary log format would fly in Linux, or even be contemplated.

On Linux, wireguard.ko simply uses printk, like other kernel drivers,
and wg-quick(8) uses stdio, like many userspace programs. But why are
you talking about Linux? What's the relevance?

You've used the word "proprietary" but I think "bespoke" might be more
clear. There are open source implementations in C, C#, and Go in the
git repos, and it should be rather trivial to parse in any other
language too.

> In Windows, logs would ideally get sent to Event Logging into a WireGuard log. That way, the user or administrator can use Event Viewer to view the log, forward the log,  or use a collector (like Splunk) to retrieve and aggregate the events.
> I'm not sure why WireGuard doesn't use Windows Event Logging. Is there something that precludes the use of Event Logging by WireGuard?

Event Logging appears to be rather slow and clunky, and I'm not sure
I'd be too happy about blocking on that during packet events. It's
also very cumbersome to use -- especially for things like crash dumps,
which require a separate process or dll -- and the boilerplate
involved doesn't look very appealing. In contrast, memory mapping a
file, memcpy'ing buffers into it, and getting timestamps by reading
0x7ffe0014, means no calls to libraries or any interactions with other
moving components that might be in an undefined state.

Event Logging might yet be possible to use, though. But it seems to me
that'd be some significant research and development work, to figuring
out how it could work in a lightweight way, and also revisiting the
way wgnt logs things.

If this is something you'd like to work on, I'd be happy to review
patches and read descriptions of a simplified event logging
implementation. You're probably not the only user with this concern,
and in theory I'd be open to considering it, provided there's a way to
make it less clunky than initially meets the eye.

Jason
