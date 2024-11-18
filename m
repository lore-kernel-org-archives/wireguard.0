Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8DED591B2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 20:44:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e89835eb;
	Mon, 18 Nov 2024 20:44:42 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fec45ccc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 20:44:40 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-211f1a46f7fso36325ad.0
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 12:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731962679; x=1732567479; darn=lists.zx2c4.com;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aKTaVzXiCAec3Tyjrd89WA6CeVRBCOnqqKiIQ4/209w=;
 b=HA9LyF191KLXDWLk4h04JSlU29FtPB2q7JSSOuGvWoJLhrBOCUv/3kwj3vDZjG3K1a
 clwUozNQEI+B68jEd4GfvdL7Ij24KeIdeb3vfxZ3O2J9BuNudxPHvtCFh1nZGxg0rIWm
 7ix4TWwZHyxG1Za8BPrPLvuMSGffCGPd+1EDGPk9ZNjHGT1gXDTsyjlkXgOXh4FBWJyn
 rGKP7XySynIzoLIIZXnZeHbgD5tTILTIOArcDZIMx8EEEF5n20wVYSqJ3Ol4N4BFlT83
 gN+aWafvHO5fkYmHoQ6WrKvq87JPaBTadsbbXOEH1WODiXIL3V8NjZWapLfEuhDqfyrG
 43rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731962679; x=1732567479;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aKTaVzXiCAec3Tyjrd89WA6CeVRBCOnqqKiIQ4/209w=;
 b=PQVXaPNIlAvYJ5ONMnPPScI3JrSM/Z0Ov6Xry4ZyCYm33aVA/222JocdwSfUYCI224
 KmvfHVwYg/W9pSZk3HHs9XEmfg/uRZBX1aPIgRdawL4mza4BKeRjF05/5G+EWvqB64Gj
 h8SUn8CImmBeHOt/efM67QAacEjB3354btsW+cISlGHCLEsDMRp1Kaa0KMqdKmUzNlXO
 xXDk7rSBXOBA6aHFOXLWrM4OLNkUQjBSpv4CtTVBLLLdGAA+aVZnmPpzWtIylZiMb4d3
 160ct1rEDHgjU+pKZdbvdu+g3Y9MjIMKMzqR08wjqoD5BTjkEQGjHdSknuuEjz8uPbCG
 I7iw==
X-Gm-Message-State: AOJu0YyzU4tOF3wEd+1/YqP2kDCNvWBEiK84HFOH2JWb6vILEa+0AKS8
 m/ZXhhMKIbtR73dQScFrykrfNlpxdfDTzMUbR4mOdtB9NQrnhSA4jd3MV8UZ6qGS1UnUtryeHif
 4QzC6//9W7Xz0Jruzwtmf8FkmjPjM4Od0PurV
X-Gm-Gg: ASbGncup9hL4SbnISjLlqqSkOya1sZJoQo5/sCCuAW4cJsvuof1MhNUCsNhv9PJ13Wz
 XkoR3yjVVljMWfj0Xtj+vFqP2F9IjvDee
X-Google-Smtp-Source: AGHT+IHGBmy57KAu0HlHubkKaTd1BqOfX8EYJnZETNfEPTp1FMAEayQici09tykpfSJn3YIPEIejT7GVORR65C3UiSg=
X-Received: by 2002:a17:902:f68f:b0:1fc:60f2:a089 with SMTP id
 d9443c01a7336-2124ea7e89cmr326155ad.17.1731962678568; Mon, 18 Nov 2024
 12:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20240905200551.4099064-1-jrife@google.com>
 <ZzpkPWrrb_Z2ZfCq@zx2c4.com>
In-Reply-To: <ZzpkPWrrb_Z2ZfCq@zx2c4.com>
From: Jordan Rife <jrife@google.com>
Date: Mon, 18 Nov 2024 13:44:26 -0700
Message-ID: <CADKFtnTThMBDKCXufNaeci5uCeddOgLvXmqszyJoT6N=6xtWug@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
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

Hi Jason,

Thanks a lot for taking a look!

> I'm actually less enthusiastic about this part, but mainly because I
> haven't looked closely at what the convention for this is. I was
> wondering though - this adds WGALLOWEDIP_A_FLAGS, which didn't exist
> before. Shouldn't some upper layer return a relevant value in that case?
> And even within the existing flags, for WGPEER_A_FLAGS, for example, old
> kernels check to see if there are new flags, for this purpose, e.g.:
>
>         if (attrs[WGPEER_A_FLAGS])
>                 flags = nla_get_u32(attrs[WGPEER_A_FLAGS]);
>         ret = -EOPNOTSUPP;
>         if (flags & ~__WGPEER_F_ALL)
>                 goto out;
>
> So I think we might be able to avoid having to bump the version number.
> GENL is supposed to be extensible like this.

I think the challenge with WGALLOWEDIP_A_FLAGS in particular is that
because it didn't exist since the beginning like WGPEER_A_FLAGS, there
are kernels out there that have no knowledge of it and wouldn't have
this check in place. While I think it's a good idea to replicate this
check for WGALLOWEDIP_A_FLAGS as well for future compatibility, we
still need some way for clients to probe whether or not this feature
is supported in case they're running on an older kernel. If we want to
keep the version number as-is, I see a few alternatives:

1. Include WGALLOWEDIP_A_FLAGS in the response of WG_CMD_GET_DEVICE.
This would be a new field inside each entry of WGPEER_A_ALLOWEDIPS. If
the result of WG_CMD_GET_DEVICE contains WGALLOWEDIP_A_FLAGS then a
client knows that it can use features WGALLOWEDIP_F_REMOVE_ME. It
could potentially be used later to contain persistent flags for an IP,
but for now would just be zeroed out. This fails if there are no
allowed IPs configured for the device you're trying to configure, but
in the case where you're trying to use WGALLOWEDIP_F_REMOVE_ME you
probably would.
2. Keep everything the same. Don't bump the version number. Clients
could in theory try to use WGALLOWEDIP_A_FLAGS with WG_CMD_SET_DEVICE
then check if their request had the intended effect (e.g. checking if
the IP was removed).

I slightly prefer approach 1 myself, as I feel it's a bit cleaner, but
I'm happy to discuss some other approaches here. I'm trying to think
about how these probes could be used inside the WireGuard Go library
and wg itself. Assuming approach one,

* For libraries that manage WireGuard like
golang.zx2c4.com/wireguard/wgctrl the first time a client uses
.Device() (WG_CMD_GET_DEVICE under the hood) there would need to be
some logic that looks at WGPEER_A_ALLOWEDIPS for one of the peers and
sets some internal flag like c.supportsAllowedIPFlags. When a client
later calls c.ConfigureDevice() the library would disallow direct IP
removal if the feature is not supported (c.supportsAllowedIPFlags !=
nil && !*c.supportsAllowedIPFlags). Alternatively, you could do all
this up front while initializing the client by creating some dummy
device + peer, adding some IP, then using WG_CMD_GET_DEVICE to see if
WGALLOWEDIP_A_FLAGS is present in the result.
* Similarly for wg, if the user is trying to remove an allowed IP
you'd first query the allowed IP for a peer and check for
WGALLOWEDIP_A_FLAGS if it doesn't exist in the response then the
command would fail and print something like "not supported".

Bumping WG_GENL_VERSION is cleaner still, since clients in userspace
just need to check an integer value and avoid any probing logic.
However, like you I am unsure what the convention is here and whether
or not this has any unintended effects.

> This file doesn't really do the _ prefix thing anywhere. Can you call
> this something more descriptive, like "remove_node"?

Sure. I'll update this in v3.

> Reasoning for this is that it copies the logic in add()?

As for the cidr > bits check, the intent was simply to fail if the
user passes an invalid value for WGALLOWEDIP_A_CIDR_MASK. Although,
unlike the add() case, I suppose we could just remove this check.
Worst case if a user passes something high like 255 remove() would
just be a no-op. It looks safe to remove !peer check as well. I can
update this in v3.

> What's the reasoning behind returning success when it can't find the
> node? Because in that case it's already removed so the function is
> idempotent? And you checked that nothing really cares about the return
> value there anyway? Or is this a mistake and you meant to return
> something else? I can imagine good reasoning in either direction; I'd
> just like to learn that your choice is deliberate.

Yes, I opted for idempotence here intentionally. At least for the use
cases I have in mind the intent is basically "remove all these allowed
IPs from this peer if they exist". If an allowed IP already got
removed or is mapped to another peer somehow then that's fine. I'd
imagine it complicates the code in userspace to have to deal with
corner cases involving possible error codes returned when removing a
batch of allowed IPs. You'd need to query the device again, reform
your request, etc. I /think/ add() is idempotent as well in cases
where you re-add an IP to a peer, so there's some symmetry here.
Perhaps if there are use cases that need more stricter checks in the
future we could introduce a new flag to return an error code in this
case.

> As I mentioned above, you need to do the dance of:
>
>         ret = -EOPNOTSUPP;
>         if (flags & ~__WGALLOWEDIP_F_ALL)
>                 goto out;
>
> So that we can safely extend this later.

Good idea. I will add this in v3 as well.

> We get 100 chars now, so you can rewrite this as:
>
>                         ret = wg_allowedips_remove_v4(&peer->device->peer_allowedips,
>                                                       nla_data(attrs[WGALLOWEDIP_A_IPADDR]), cidr,
>                                                       peer, &peer->device->device_update_lock);

Nice, will do.

> That comma should be a semicolon because what comes after is a complete
> sentence, and there's no conjunction.

Good point. I think we might actually need a comma /after/ otherwise:
"...; otherwise, ...": "WGALLOWEDIP_F_REMOVE_ME if the specified IP
should be removed; otherwise, this IP will be added if it is not
already present".

> I'm not so keen on this, simply because we've been able to do everything
> else in that script and keeping with the "make sure the userspace
> tooling" paradigm. There are two options:
>
> 1. Rewrite netns.sh all in C, only depending on libnl or whatever (which
>    I would actually really *love* to see happen). This would change the
>    testing paradigm, but I'd be okay with that if it's done well and all
>    at once.
>
> 2. Add support for this new flag to wg(8) (which I think is necessary
>    anyway for this to land; kernel features and userspace support oughta
>    be posted at once).
>
>
> Thanks for the patch. I like the feature and I'm happy you posted this.

Option 1 seems like a heavy lift for this patch. I think option 2
makes more sense, as long as there is an understanding that netns.sh
needs to be run with the latest and greatest version of wg in order
for all tests to pass. Maybe we can add a version check to selectively
disable the remove IP tests if wg is on an older version. I agree
though that long term option 1 would be nice, as it provides a finer
level of control and tests could be run without as many external
dependencies. I can get rid of the remove-ip cruft and send two
patches to the wireguard mailing list if that works, one for the
kernel and one for wireguard-tools.

However, this raises some questions about the wg interface itself
which would be used both by netns.sh and end users. Looking at the
current interface for wg, the way to configure allowed IPs currently
is "wg set". For example,

wg set peer ABCD... allowed-ips 192.168.0.24/32,192.168.0.44/32,192.168.0.88/32

The intended effect is to completely replace the allowed IPs for that
peer rather than to make an incremental change. I think we'll need to
extend the interface a bit. There are a few directions we can take
here:

1. Add a new flag to "wg set" like --incremental in which case it
won't use WGPEER_F_REPLACE_ALLOWEDIPS under the hood. Support addition
or removal of allowed IPs with a "-" suffix on CIDRs you want to
remove (192.168.0.24/32-,192.168.0.44/32-,192.168.0.88/32).
2. Same as 1 but with a new argument name, allowed-ips-diff instead of
the --incremental flag. This appears more in line with the current
style of wg's arguments.

There are a lot more variations here, so I wanted to get your input
here before just picking a direction. Thanks again for the thorough
feedback!

-Jordan
