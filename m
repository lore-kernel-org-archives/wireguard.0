Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B52C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 20:05:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B07B60C4B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 20:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B07B60C4B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1d67223;
	Thu, 14 Oct 2021 20:03:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5c162caf
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 20:03:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B15D76105A
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 20:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZdizEI53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634241781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h2Q5sEEyyalNq5ROgcx9ARx4ITQIuJNsiXwqRhvNhvQ=;
 b=ZdizEI53bA/rTdPoHPYNOWF/RYCYe3DNStn43zXC7tie930vm6EmE0LNu6W1apCjJ8UQKZ
 bOqTtLzaSnRhBgWQ2CnV8P2rjGZj0t6QdZ1Ci1XqQiu9tdgWSCstjn0pnfKj8NRCT0tEUd
 +wNgabOy3KBU7IO8OV9e06eqiMD08KU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e2627cc8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 20:03:01 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id q189so17470895ybq.1
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 13:03:00 -0700 (PDT)
X-Gm-Message-State: AOAM531oLmtYxZdVyscHVi1p0zqcOdVVSysIpyOyfVMlavlhBxWbjnfg
 PKeFeYqhMqUcNIpsd56hMg4jrDDgp1IMCZxDbvc=
X-Google-Smtp-Source: ABdhPJxALLWHxK2QP1VBhtvaOOSJIotHUsK1SaiwgMnyqCQLy0spAnF+W6mDroaiOgf1woQ2hlpk2w7PCrH9TZE4JTI=
X-Received: by 2002:a5b:783:: with SMTP id b3mr8635330ybq.328.1634241780284;
 Thu, 14 Oct 2021 13:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
 <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9q3j=2HG-4v5tpHRM9DCKpw+5iSMyzu30jAUHS1r=eDHw@mail.gmail.com>
 <PH0PR05MB79629688EB84BF07A2AEF54F99B89@PH0PR05MB7962.namprd05.prod.outlook.com>
In-Reply-To: <PH0PR05MB79629688EB84BF07A2AEF54F99B89@PH0PR05MB7962.namprd05.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Oct 2021 14:02:49 -0600
X-Gmail-Original-Message-ID: <CAHmME9rMPgJ3E82nLoXyFYDT7DyjkLsdV3ange9sd_Qm+1-BNw@mail.gmail.com>
Message-ID: <CAHmME9rMPgJ3E82nLoXyFYDT7DyjkLsdV3ange9sd_Qm+1-BNw@mail.gmail.com>
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

From what I can see, none of what you've written describes what's
lacking in a potential command that would tail the wireguard log and
print it to standard out, perpetually. At least I couldn't figure it
out from a close read. As I wrote before, you could then pipe this
into event log or into any place else. You spoke more about why
snapshotted logs are problematic, and I'm inclined to agree with you
for a few reasons (though not the one you mentioned). But what I'm
suggesting is a tail mode, that keeps spitting out new logs as they
arrive. Are pipes problematic? Is there no ingestor that reads data
from stdin that would be convenient to you? Where does the tail
approach fall short? Does the message-based approach of event log
clash with the line-based approach of wireguard's unix-like logs? I
would like to fully understand what about this approach fails to meet
your design criteria.

One thing we could pretty easily do is add a "WireGuardEventLogger"
service, {un,}installable with:

> wireguard /installeventlogger
> wireguard /uninstalleventlogger

which would then scoop up the binary log as it grows and spit it out
to event logger, in real time. This wouldn't be too hard to do.
However, I would really like to first understand precisely what the
shortcomings would be in a simpler tail subcommand. That seems a lot
more versatile and simpler to implement too.

Thanks,
Jason
