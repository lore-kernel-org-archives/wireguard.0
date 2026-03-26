Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DC410A88E5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Mar 2026 16:30:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 16d2530b;
	Thu, 26 Mar 2026 16:30:47 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2aab3de7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Mar 2026 16:30:46 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Authentication-Results: mail.toke.dk; dkim=none
To: sh0rch <sh0rch@iwl.dev>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: gutd =?utf-8?Q?=E2=80=94?= WireGuard traffic obfuscator via
 TC/XDP eBPF (no kernel patches)
In-Reply-To: <GVXP251MB07901AF0DC973F21B13077F88349A@GVXP251MB0790.EURP251.PROD.OUTLOOK.COM>
References: <GVXP251MB0790009AEBCBE7855DDCB5B28375A@GVXP251MB0790.EURP251.PROD.OUTLOOK.COM>
 <87qzp9mru8.fsf@toke.dk>
 <GVXP251MB07901AF0DC973F21B13077F88349A@GVXP251MB0790.EURP251.PROD.OUTLOOK.COM>
Date: Thu, 26 Mar 2026 17:30:44 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <871ph6o8nf.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

sh0rch <sh0rch@iwl.dev> writes:

> Hi Toke,
>
> Thanks a lot for taking a look, really appreciate it!
>
> I actually started with Aya, but ended up losing some hair fighting
> the verifier :) libbpf_rs just worked for me in the end.

Yeah, writing the BPF code in Rust is hard, still, but you could still
use Aya to load, and avoid the extra dependency on libbpf? Not sure how
much of a difference that makes in practice (I just noted you were
chasing small binaries, so maybe that would help?)

> About the veth. I=E2=80=99m trying to keep things compatible with stock
> WireGuard and also need proper routing through a relay/gateway. Inside
> my perimeter I can use plain WG, but to get traffic out I rely on a
> gateway, so I need packets to go through the normal networking stack.
> If everything happens in eBPF, it won=E2=80=99t even reach netfilter. Tha=
t=E2=80=99s
> why I went with veth, also gives a bit more flexibility than tun/tap.

Hmm, not sure I undestrand what you mean by "rely on a gateway"? What
breaks if it's run only on TC, exactly?

In any case, if you need the extra step you could still have the BPF
programs run on the other side of the veth device, but still just as a
pair of TC ingress/egress programs? That would still simplify the BPF
side of things, and make the usage of veth devices optional.

> Ideally this would all live in AF_XDP + userspace, but that=E2=80=99s har=
d to
> rely on in VPS environments where AF_XDP support is still limited.

Don't think you'd get very good performance doing that, AF_XDP has a
pretty severe performance penalty if you want to re-inject packets into
the kernel. So unless you're actually creating an obfuscating middlebox,
going with BPF like you did here seems like a better solution :)

-Toke
