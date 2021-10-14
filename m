Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD00BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 21:57:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D9A6108E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 21:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3D9A6108E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab9ba7c3;
	Thu, 14 Oct 2021 21:57:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a8fd2cb4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 21:57:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF49561090
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 21:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pyvkQcOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634248620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H+w+Xnj0v/xZIeUdHSDOwLVPeVHT0JQXqKq6apXLbgM=;
 b=pyvkQcOZwIKNsSOJETtYqHUj3FQLY4ka+WZ3dfK6PHrE3SNOF3KIQWidlMY5+/tdtigQcw
 9+KqMKNnmGB+U1PPDX8/4bbTPZ0BzAcuvKYrXKw1f93awspNaE9XoH/a9NaQu+moU69ID3
 zTxSNjSLEVA3LHJ/a5IdnKYZlCBtieM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 47469245
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 21:56:59 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id s64so17954206yba.11
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 14:56:59 -0700 (PDT)
X-Gm-Message-State: AOAM530r8nl1G/7J7tBqF+Q5o8uDlAxCFIh6jbVEyqJFVAUFSn4afEgs
 KBnedKJgdZZCx6qmoUJqqHkOEwftlWB1cmZ5hHU=
X-Google-Smtp-Source: ABdhPJyTiKijFNexcMbV6hImVm5fOdK/PKfR4T6YUpwpxIL69yNR3YqQJi4ocECnDXX1UEBAFmU7nJn6wTjcL0Pp+rk=
X-Received: by 2002:a25:948:: with SMTP id u8mr9019455ybm.472.1634248619052;
 Thu, 14 Oct 2021 14:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
 <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9q3j=2HG-4v5tpHRM9DCKpw+5iSMyzu30jAUHS1r=eDHw@mail.gmail.com>
 <PH0PR05MB79629688EB84BF07A2AEF54F99B89@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9rMPgJ3E82nLoXyFYDT7DyjkLsdV3ange9sd_Qm+1-BNw@mail.gmail.com>
 <PH0PR05MB79620040C1298C80677C4BF999B89@PH0PR05MB7962.namprd05.prod.outlook.com>
In-Reply-To: <PH0PR05MB79620040C1298C80677C4BF999B89@PH0PR05MB7962.namprd05.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Oct 2021 15:56:48 -0600
X-Gmail-Original-Message-ID: <CAHmME9q9VB7eEsZCFUqo8XG7qj1pe2RwgLezJEHueF4_AjmA4A@mail.gmail.com>
Message-ID: <CAHmME9q9VB7eEsZCFUqo8XG7qj1pe2RwgLezJEHueF4_AjmA4A@mail.gmail.com>
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

On Thu, Oct 14, 2021 at 3:45 PM Frank Wayne
<frank.wayne@northwestern.edu> wrote:
> The service approach is interesting, too. It would be simpler to ingest.

I started writing this, and got something basically working, but got a
bit tripped up in annoying lifetime issues of registering an event log
"source" in the registry, and the boggling configurability there. I'm
kind of shying away from it after an initial stab...

To answer the more concrete questions about a tail approach:

> Will every host have WireGuard installed? Forever?

This is a tougie, I guess in the same way that scooping up
non-streamed file-based logs are: at some point you have to do a sweep
to see if there are new files to grab, or in this case, if wireguard
has been installed. So on one hand, "polling" is pretty gnarly, but on
the other hand, you do that anyway for file-based logs I imagine.
There are probably other SCM-based or MSI-event based ways of doing
this without polling that are more complicated.

Does Splunk have any condition logic like, "do this collection routine
if file F exists; otherwise wait to do it until it exists"? If that
kind of thing is built in, then you're done. If not I agree this is an
annoying point.

> Is wireguard.exe in the PATH? For the user that Splunk runs under?

Yes. It's added to the system PATH.

> Should the script check the registry for the executable's location if it's not in the path?

No. The installer always sets PATH.

> Does that user have permissions to the WireGuard program directory?

Hmm. Here indeed is where the granular decoupled permission system of
Event Log comes in handy, I suppose. But in theory you should be able
to do the same for wireguard's log:
"%PROGRAMFILES%\wireguard\data\log.bin" is just a file path like any
other, and you can adjust its permissions accordingly. By default its
parent directory is O:SYG:SYD:PAI(A;OICI;FA;;;SY)(A;OICI;FA;;;BA), but
you could set a more particular ACL for log.bin itself.

> Can we run that script on endpoints without checking each team's security policy regarding in-house software running executables outside of its scope?

I imagine probably so in the sense that wireguard.exe is already
executed several times in a few different funny roles, so things might
already be sufficiently permissive. Have you seen any wireguard.exe
policies being passed around places? If you've got a link, I'd be
curious to see what people are doing.

Jason
