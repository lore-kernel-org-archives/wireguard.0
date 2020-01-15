Return-Path: <SRS0=e2pA=3E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1FAC33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:17:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88EC22187F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b78ROVi+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88EC22187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4c96523;
	Wed, 15 Jan 2020 18:17:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f4d8d77
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jan 2020 09:11:12 +0000 (UTC)
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e831e93
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jan 2020 09:11:12 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id l9so14697135oii.5
 for <wireguard@lists.zx2c4.com>; Wed, 15 Jan 2020 01:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5j7wppJQrewdiq1vETFu7rog2gkvSzPFKQxBbm/UoJM=;
 b=b78ROVi+YYizY77N5nRZm+HCsCbo0vph/dlPTpD9k1Z2hT8+VXaBhCNcQ95w/Z0e4V
 H8+GhyfQzu0zJnseFZnKJndupx19PYyGecMhxg+V+Cpq9QoUHYC0Bn1S+PrrPlGhhJut
 Uj1dEuBImFBg/27MrcexIsbBcIABUZ7msLUvMZUVSkm+3HL1TpihawZWPcK+aIujMsJ6
 TqQq7D5E4NXW7X6HaHeTExSkV+Ptok5DyVnNo/Tb0s9u1EQyMEN0ZyVSLOdQDC55ug5g
 wwCItJcoVoNbKKJ64JrJH3cbwj7ATBsn98+QIGPBodJpyaKXRgFJFBbeGcFQaKuXFMXH
 WVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5j7wppJQrewdiq1vETFu7rog2gkvSzPFKQxBbm/UoJM=;
 b=PCh6hMmwL0XHyKKKP3q34wK8Hd20FENtXrjrLLzrWO/wr7GwBdrEyzw0/Mi5NG30Pm
 MMYqgXlocT1I8R1VxL/BTgj2FpYIrnz7APygnqpliSUaSDc+DzwkFZ2gCQRPw829gBK9
 FBqUYDthj5N708SsC67J4CCh9+yLhxZxiY6dW/tprMKj60rAdlUtD48SV2YUb6BZ9Pme
 qtnCdjKt+iR5GnHo9EExBSU6iYw+1i4a1I7YG0JN6TmGpsumTYkF8Pcm+gZGWypOWkqB
 5RhFqxnNLNp48KtqII9evcIuLBuKAo8NoJ+dGhWUmhujJnQrcD9RxVdGESH/6GX4MmVP
 4Fzg==
X-Gm-Message-State: APjAAAUJZDgIKTHJsYwAW4lmpKyv+vGnNDxOOkROmFMz/Hkxpf17b3mK
 vIiZp/Q6u919Zjbz1qnSWgCmT0FNagXfK6Iz0bRrx7zlwZU=
X-Google-Smtp-Source: APXvYqw89o1/mtm/O0nzJSMMlV0NLAa5s+Q2Ek6fyNpqTKYxDn4FHvPG4xMunQeaAyj0lRT9E10X3VMlr4zB0dxcxME=
X-Received: by 2002:aca:d5d3:: with SMTP id
 m202mr19396002oig.161.1579079471403; 
 Wed, 15 Jan 2020 01:11:11 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Motiejus_Jak=C5=A1tys?= <motiejus.jakstys@gmail.com>
Date: Wed, 15 Jan 2020 11:10:58 +0200
Message-ID: <CAFVMu-q_B2EJk_GkY-3vxGT94Bcmozuom1jwQ15kZgbT81-=sg@mail.gmail.com>
Subject: multiple endpoints for a single peer -- implementation details
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 15 Jan 2020 19:17:04 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi all,

I thought I'd implement a prototype to use multiple endpoints for a
single peer, but after some analysis on "## Select new endpoint during
each handshake"[1], I'd like to share the concerns with future readers
who might try the same endeavor. TLDR: I think the kernel is not in
the best position to do this, "decision making in user space" may be
more appropriate.

To make it happen, handshake process would change. New suggested flow:
- Initiator sends a handshake packet to all endpoints quasi-simultaneously.
  - Each handshake is a new message with a different ephemeral key et al.
- Responder receives the first one and responds.
- Responder receives more handshakes within 1/INITIATIONS_PER_SECOND
and discards them.
- Responder may receive more after 1/INITIATIONS_PER_SECOND and responds.

Responder needs to maintain more than one handshake state for
MAX_TIMER_HANDSHAKES, specifically, the whole `noise_handshake`
struct. Following a later suggestion in the thread, this can have an
upper bound of MAX_ENDPOINTS_PER_PEER (TBD constant).

Responder's responses are technically different handshakes: different
ephemeral keys, different hashes, possibly different indices (I
haven't figured the role of indices yet). From this stems the question
1.

Questions:
1. how can initiator associate the one-of-the-many handshakes it sent
with the one-of-the-many responses it received? I.e. is there
common/derivable data shared between the handshake request and
response? I wasn't able to find one.
2. more a concern: neither kernel, nor wireguard-go implementations
are willing to accept more than one endpoint, and it would be messy to
extend:

include/uapi/linux/wireguard.h
  WGPEER_A_ENDPOINT: struct sockaddr_in or struct sockaddr_in6

device/uapi.go:
  case "endpoint":
  ...
    endpoint, err := CreateEndpoint(value)

Endpoint is fixed to be a single UDP address, and both kernel and
wireguard-go refuse unknown keys. To have tooling
backwards-compatibility (i.e. use newer wireguard-tools with older
kernel implementations), wireguard-tools would need to know the
supported "features" of the underlying implementation. And there is no
version negotiation between the user/kernel space. Which makes it
tricky to add features like this.

Related gotcha: currently DNS is looked up in userspace during
interface configuration**. The biggest selling point of "multiple
endpoints" is increasing probability to reach it... Given that:
1. wireguard-linux netlink API was not designed to be extendable (so
isn't wireguard-go).
2. DNS lookup is done on configuration time.

I am suggesting that "## Decision-making in userspace" would work
better here. Userspace would regularly* issue handshake initiations
and measure how long it takes for each endpoint, and hand over the
*single* endpoint to the kernel to connect. Interestingly enough, this
"userspace thing" is a combination of wireguard-tools for config
parsing and MNL, and wireguard-go to initiate the handshake. What do
you think, where could this belong? A userspace wireguard
implementation in C, and/or wireguard-tools implementation in Go would
make this easy, but we have neither. :)

Motiejus

[1]: https://lists.zx2c4.com/pipermail/wireguard/2017-January/000917.html
[*]: timing and conditions when to do the "probing handshakes" would
need to be very carefully considered. TBD.
[**]: my wireguard server is behind a dynamic IP with a DNS TTL of 600 seconds.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
