Return-Path: <SRS0=OAC8=NJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF01C4320A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Aug 2021 21:31:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DBB610E8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Aug 2021 21:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30DBB610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dab506fd;
	Wed, 18 Aug 2021 21:30:28 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6a2fa2a8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Aug 2021 21:30:25 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id oa17so3564971pjb.1
 for <wireguard@lists.zx2c4.com>; Wed, 18 Aug 2021 14:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/nPe4E2T8nX39ip9S1GZ1EL0AW6cYBNA9Q/KxSVbDgI=;
 b=aCKeb0qnwEXQji5nRCBJU/RNhU7/LFNHkxaDm6BZaISNHmQ35j5iFYTICYDiPHRvjs
 R+db/62xMg3ZrmW1Jn9RxsGLRlAmGuKf2UfWls0aTtWJ3ZKfHF86oK6uP2DHaEy8dqL8
 7vkc8AUAI3p8mV+5veTPx573Q8ZcbQkxcU2gdJwXryxgUPU9XWJ1G3triMx99dCV8YmD
 rVKbO+Ao1gHrTAUyyAsMV1GBq486LxokFFtDq2Y24WYTnyQtyDnGZT2HDUS07RaU/Ww0
 PfUV+VF40iAzz96lM2IHNaokIVhdHxroc8bnrmBf5+z+mNAz7B+JP2nEDjCx3Q8Dh9zS
 K9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/nPe4E2T8nX39ip9S1GZ1EL0AW6cYBNA9Q/KxSVbDgI=;
 b=K8IqXoynnaDX1DZLBti0P5E1/nbhsrIl0JiiRz2poS/2kX56YxHpPE0FZa9CfD18ww
 HnI7i5KhxmmL/Zy/vs4QFNQfR5NnTyryQIR+gWYBXNuX212Ay6/FFRwdWqpO9JMRNu02
 766/mLsryrVZPYucdoAoRqvTsncx666u7mtjQjEfaWiIO/lxVnWxRXu/wxhaGWcAQkfb
 vbhLGbrHgmwpl2slkQJgcOR9hhBof3FGKji4pt85ZJ1ebhCZIx7CHLtAA4mYgBfoYNRF
 62zGgdRjkKfgBSbrQOiA4MHFaqbd+RTvcXzUnd8R+mhdkKSeFckAVfKGzYYOdtup8AL7
 G72w==
X-Gm-Message-State: AOAM532ZpAb0/rts2uqg2fr6KeB9wphBOPJYq63R4o5j/3/LHNUrbAYi
 45QHGQpYabYNW5K48PyLaDpmn8jXRdsSwGjiMapH++TJMh4=
X-Google-Smtp-Source: ABdhPJw3liWXAh8uIwuUDiQvfam2pn8koTYn5yx1xAtKYfMldVbJYdYKWdsZhn3RgYRlnTcz7f3ut9QZa2sUbfC4U+M=
X-Received: by 2002:a17:902:c9c3:b0:12d:be99:219f with SMTP id
 q3-20020a170902c9c300b0012dbe99219fmr8727272pld.72.1629322223559; Wed, 18 Aug
 2021 14:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANO0tfaBiU3r+bvBp5q57EBc4FNu0+FJ78_7G=vPzdJvuTi18g@mail.gmail.com>
 <03667268-5415-4FB0-9D4B-1E51466A3F5C@tomcsanyi.net>
In-Reply-To: <03667268-5415-4FB0-9D4B-1E51466A3F5C@tomcsanyi.net>
From: Waishon <waishon009@gmail.com>
Date: Wed, 18 Aug 2021 23:30:12 +0200
Message-ID: <CANO0tfY_ghrypwJ=XYVmAsLK0Ln2e8WYQNLOdYmu4tYP9tt8OA@mail.gmail.com>
Subject: Re: Domain as endpoint when using wireguard with network namespaces
To: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
Cc: wireguard@lists.zx2c4.com
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

Hey there,

thanks for your reply:

The reason why it works when using an IP instead of a domain is the
"birth namespace" concept of wiregurard. You're creating the WireGuard
interface inside your init-namespace (birth-namespace) which does have
an internet connection. The UDP socket for sending and receiving the
encrypted packets is also created here.

Afterwards you move your WireGuard interface into a newly created
network namespace. The UDP socket is still inside the birth-namespace.
When you now call "wg set" with an IP-Address from inside the network
namespace, it "tells" the UDP socket inside the birth-namespace to
connect to this endpoint over the internet connection of the
birth-namespace.

When the UDP socket receives encrypted packets, WireGuard decrypts
them and puts the network packets in the device queue of the WireGuard
interface, which is inside the network namespace (I hope I understood
the source code correctly). So you don't need an internet connection
inside the network namespace to create a wireguard tunnel, when using
an ip-address. I've tested it and it works fine, as described in the
documentation https://www.wireguard.com/netns/.

However when using a domain, "wg set" tries to lookup the domain
inside the network namespace (which doesn't have an internet
connection until the tunnel is created) and not inside the
birth-namespace.

I think that the wg-tool should determine the namespace of the udp
socket and do the DNS lookup there. However I don't know if this is
even possible to implement.

Kind regards

(P.S. I think I didn't send the first reply as Text only mail. I hope
the thread doesn't end in chaos ;)).
Am 18. Aug. 2021, 07:54 +0200 schrieb Tomcsanyi, Domonkos <domi@tomcsanyi.n=
et>:

I am sorry, but I need to ask: if your namespace does not have an
internet connection how would you connect to your remote endpoint
after the DNS lookup issue is solved and you received the IP behind
vpn.example.com?

Kind regards,
Domi

17.08.2021 d=C3=A1tummal, 23:06 id=C5=91pontban Waishon <waishon009@gmail.c=
om> =C3=ADrta:

=EF=BB=BFHey there,

I'm currently trying to setup a wireguard-tunnel inside a
network-namespace as descriped in the documentation, which fails when
using a domain as endpoint:
https://www.wireguard.com/netns/

First I've created the wireguard interface inside the birth-namespace
of the host using "ip link add wg0 type wireguard". Then I moved the
wg0 interface to the newly created network namespace, which doesn't
have any network interfaces and network connections beside the
loopback interface.

Then I configured the wg0 interface inside the network namespace using
wg set "INTERFACE_NAME" \
private-key <SECRET \
peer "PEER" \
endpoint vpn.example.com:51820 \
persistent-keepalive 25 \
allowed-ips ::/0

This however results in a "Temporary failure in name resolution:
`vpn.example.com:51820'. Trying again in 1.00 seconds..." error
message, which makes sense, because the wireguard-tool tries to call
getaddrinfo inside the network namespace. The namespace doesn't have
an internet connection and the lookup fails.
https://github.com/WireGuard/wireguard-tools/blob/96e42feb3f41e2161141d4958=
e2637d9dee6f90a/src/config.c#L242

As a user I would expect that the wg-tool does the lookup in the
birth-namespace of the interface and not inside the newly created
network namespace.

What is the recommended solution to resolve an domain endpoint when
using network namespaces and wireguard? Just manually lookup the
domain in the birth-namespace and use the ip as endpoint? The
implementation however would be quiete hacky to make it properly work
with IPv4 and IPv6.
