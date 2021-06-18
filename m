Return-Path: <SRS0=aBj4=LM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7F8C48BDF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Jun 2021 12:24:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D2F6113E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Jun 2021 12:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48D2F6113E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91929c15;
	Fri, 18 Jun 2021 12:24:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 47ee39fc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Jun 2021 12:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1624019081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nibbK4Uh4rxV6XrXRdAg8SC86+I1F6qfODoi+MfIFko=;
 b=Mw8A0tuOwBcYJnhz3p5rNs2rBkZLPjrOcatovAu+lw8fVtJp9bseu+JiSjRwtmKdxysXsG
 zwzJ7QBrKR8C6YCkofzWNQ2NhyUqwtHeEaPnW0tAlayLMW2ZxBPD5CPFuZkZ0CACTS6etd
 2XDHOYkRU3XDBTYmg+z47R/Ll/KQEsQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 01972ee0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Jun 2021 12:24:41 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id i68so10444244qke.3
 for <wireguard@lists.zx2c4.com>; Fri, 18 Jun 2021 05:24:41 -0700 (PDT)
X-Gm-Message-State: AOAM530tvigLS8sjkbWbVzbly1cg4Du4jRA7VxqlLv42NgzRa2FlJaU+
 EDS2Gve05x+i9i0J9fNi+GBLNuAYRggcwcDUfDM=
X-Google-Smtp-Source: ABdhPJwMQTSW2dScq0T+SHVgunn/JRWNW1cFf0NB8KsGOy30ID+XXGbN4unXXOh7s+ypq0cMk+XQFZzON9ESu0Kf9gw=
X-Received: by 2002:a25:660a:: with SMTP id a10mr13146294ybc.178.1624019080697; 
 Fri, 18 Jun 2021 05:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
 <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
 <YMpPnKhUuTHNU1Q0@makrotopia.org> <87v96dpepz.fsf@toke.dk>
 <0102017a18f77a7e-85cc3154-dbac-4a9f-a0c5-acba247919a6-000000@eu-west-1.amazonses.com>
 <YMsYrpAm/29Q91GX@makrotopia.org> <87sg1gptky.fsf@toke.dk>
 <877disdre0.fsf@toke.dk>
In-Reply-To: <877disdre0.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 18 Jun 2021 14:24:29 +0200
X-Gmail-Original-Message-ID: <CAHmME9qnqixzDKegMprkT8xNXHfbrhGZfwAROp6vjrQLJEo87g@mail.gmail.com>
Message-ID: <CAHmME9qnqixzDKegMprkT8xNXHfbrhGZfwAROp6vjrQLJEo87g@mail.gmail.com>
Subject: Re: passing-through TOS/DSCP marking
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Florent Daigniere <nextgens@freenetproject.org>, 
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

Hey Toke,

On Fri, Jun 18, 2021 at 1:05 AM Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> > I think you can achieve something similar using BPF filters, by relying
> > on wireguard passing through the skb->hash value when encrypting.
> >
> > Simply attach a TC-BPF filter to the wireguard netdev, pull out the DSC=
P
> > value and store it in a map keyed on skb->hash. Then, run a second BPF
> > filter on the physical interface that shares that same map, lookup the
> > DSCP value based on the skb->hash value, and rewrite the outer IP
> > header.
> >
> > The read-side filter will need to use bpf_get_hash_recalc() to make sur=
e
> > the hash is calculated before the packet gets handed to wireguard, and
> > it'll be subject to hash collisions, but I think it should generally
> > work fairly well (for anything that's flow-based of course). And it can
> > be done without patching wireguard itself :)
>
> Just for fun I implemented such a pair of eBPF filters, and tested that
> it does indeed work for preserving DSCP marks on a Wireguard tunnel. The
> PoC is here:
>
> https://github.com/xdp-project/bpf-examples/tree/master/preserve-dscp
>
> To try it out (you'll need a recent-ish kernel and clang version) run:
>
> git clone --recurse-submodules https://github.com/xdp-project/bpf-example=
s
> cd bpf-examples/preserve-dscp
> make
> ./preserve-dscp wg0 eth0
>
> (assuming wg0 and eth0 are the wireguard and physical interfaces in
> question, respectively).
>
> To actually deploy this it would probably need a few tweaks; in
> particular the second filter that rewrites packets should probably check
> that the packets are actually part of the Wireguard tunnel in question
> (by parsing the UDP header and checking the source port) before writing
> anything to the packet.
>
> -Toke

That is a super cool approach. Thanks for writing that! Sounds like a
good approach, and one pretty easy to deploy, without the need to
patch kernels and such.

Also, nice usage of BPF_MAP_TYPE_LRU_HASH for this.

Daniel -- can you let the list know if this works for your use case?

Jason
