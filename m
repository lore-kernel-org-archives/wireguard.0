Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBACCF64AA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Nov 2025 02:56:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12c02df6;
	Thu, 20 Nov 2025 02:51:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d7d6bd2f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Nov 2025 02:51:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0F5560188
 for <wireguard@lists.zx2c4.com>; Thu, 20 Nov 2025 02:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F0FC4CEF5
 for <wireguard@lists.zx2c4.com>; Thu, 20 Nov 2025 02:51:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gKoP0uuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1763607112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxwnO1tXJ08UsmEia1wxtoWT74hB995IOQ2mJYj07Xc=;
 b=gKoP0uuIbopTK0rnKV8/CHA1kFhBVCORPwyEICbqULSr6ylWja0kb/gJsThBYDpTX7+5NP
 KpXpQtyIQyqo5MnCtjCjzoN+ay/H2fRzjKcdTsAicT/9GvH6MhwmqS/Kc+HcwisR/cbtNl
 3TvcZha6JWbW90ZcTpwjh/46RT8vOWM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dca5e454
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Nov 2025 02:51:52 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-6574ace76dbso147394eaf.3
 for <wireguard@lists.zx2c4.com>; Wed, 19 Nov 2025 18:51:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXM+/lS6Sakl39V6uo4CM3yGum71h+9xVfq12o14DuFThZWg8nNbGlymjWWnUyoGIhlnUUX4ZK+kjw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yxs1E8DhZDkW4G5nAYXBfenwMH7bjbNfFLjSGd1Z2w9vUVEmbgC
 y5OR40LFXhEKlX2Ct1gGdS+cyqRIp+UvYdZVG8jS0EtHQXZxiU+bM6kHIXQsqOTADCHdtYIDStt
 wrBhEMJ5KVfKdXour2g5ZoM8kWAwG334=
X-Google-Smtp-Source: AGHT+IHmjORnbezK3Cy07NtvvPgPVh6yeAFooDJrIRHJz+756dVK12SB8CSm/8U/DvKr9P39OdEDkooLwhAxsRASbsg=
X-Received: by 2002:a4a:ec4b:0:b0:657:6746:cd0a with SMTP id
 006d021491bc7-65784a1cbb6mr521777eaf.8.1763606810489; Wed, 19 Nov 2025
 18:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-12-ast@fiberby.net>
 <aRyNiLGTbUfjNWCa@zx2c4.com>
 <d2e84a2b-74cd-44a1-97a6-a10ece7b4c5f@fiberby.net>
 <aRz4eVCjw_JUXki6@zx2c4.com> <20251118170045.0c2e24f7@kernel.org>
 <aR5m174O7pklKrMR@zx2c4.com> <20251119184436.1e97aeab@kernel.org>
In-Reply-To: <20251119184436.1e97aeab@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 20 Nov 2025 03:46:39 +0100
X-Gmail-Original-Message-ID: <CAHmME9oO0sGnHrZUeETmL+CCj1UZ+aQx_CPArXKpFuBhE9UYbw@mail.gmail.com>
X-Gm-Features: AWmQ_bkifYdvGI4adpQOGVNgvq1ZnMxuy40DUXaEKHs2njG343EQtkBA194udnU
Message-ID: <CAHmME9oO0sGnHrZUeETmL+CCj1UZ+aQx_CPArXKpFuBhE9UYbw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 11/11] wireguard: netlink: generate netlink
 code
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>, 
 Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, 
 Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
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

On Thu, Nov 20, 2025 at 3:44=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 20 Nov 2025 01:54:47 +0100 Jason A. Donenfeld wrote:
> > On Tue, Nov 18, 2025 at 05:00:45PM -0800, Jakub Kicinski wrote:
> > > On Tue, 18 Nov 2025 23:51:37 +0100 Jason A. Donenfeld wrote:
> > > > I mean, there is *tons* of generated code in the kernel. This is ho=
w it
> > > > works. And you *want the output to change when the tool changes*. T=
hat's
> > > > literally the point. It would be like if you wanted to check in all=
 the
> > > > .o files, in case the compiler started generating different output,=
 or
> > > > if you wanted the objtool output or anything else to be checked in.=
 And
> > > > sheerly from a git perspective, it seems outrageous to touch a zill=
ion
> > > > files every time the ynl code changes. Rather, the fact that it's
> > > > generated on the fly ensures that the ynl generator stays correctly
> > > > implemented. It's the best way to keep that code from rotting.
> > >
> > > CI checks validate that the files are up to date.
> > > There has been no churn to the kernel side of the generated code.
> > > Let's be practical.
> >
> > Okay, it sounds like neither of you want to do this. Darn. I really hat=
e
> > having generated artifacts laying around that can be created efficientl=
y
> > at compile time. But okay, so it goes. I guess we'll do that.
> >
> > I would like to ask two things, then, which may or may not be possible:
> >
> > 1) Can we put this in drivers/net/wireguard/generated/netlink.{c.h}
> >    And then in the Makefile, do `wireguard-y +=3D netlink.o generated/n=
etlink.o`
> >    on one line like that. I prefer this to keeping it in the same
> >    directory with the awkward -gen suffix.
>
> That should work, I think.
>
> > 2) In the header of each generated file, automatically write out the
> >    command that was used to generate it. Here's an example of this good
> >    habit from Go: https://github.com/golang/go/blob/master/src/syscall/=
zsyscall_linux_amd64.go
>
> You don't like the runes? :)
>
> /* Do not edit directly, auto-generated from: */
> /*      $YAML-path */
> /* YNL-GEN [kernel|user|uapi] [source|header] */
> /* YNL-ARG $extra-args */
>
> Do you care about the exact cmdline of the python tool, or can we just
> append:
>
> /* To regenerate run: tools/net/ynl/ynl-regen.sh */

The args are non-trivial, right? The idea is so that these files can
be regenerated in a few years when the ynl project has widely
succeeded and we've all paged this out of our minds and forgotten how
it all worked.
