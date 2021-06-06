Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2279DC47096
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 10:51:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E8E61029
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 10:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E8E61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4550458e;
	Sun, 6 Jun 2021 10:51:41 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 35aa3f08
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 10:51:36 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 538DC200B0;
 Sun,  6 Jun 2021 12:51:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1622976696; bh=lI4XolXv/9HTpqSarstez/Y+dIlMtLQzFnxrWzBM8/4=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=a+vBU41HS4zBdzjULLhSJ44Gc0xwRgl81tJDcywj3EbRYSNrL03nC+bsVFLZXmcih
 SQfyL2hSxLMY4WnMcitVM5a6VqZvprcli8l4H0DSkMW6ujgJAfcQKE41L8i7uKb9bQ
 wSpASJWg7KaouhHSl1U8PeNcVFja0pcPWqy3ZKJbPwNcpy2m2dIatoiM3eYMloju/k
 qB1mIu1PEv4gG8/VP9BWSPoqtxxrxWZtqQR89rjmtLDkn4MFvhD9FN7f8t++WiDj+/
 sl20Fb5BTiaRURZZHntL0A+Kq7L83BvuCNiedcuX4RRzNkion1S8QXXqa6/RN8ZI9c
 77Hkisq4jMWOw==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id D0D1E1A60267; Sun,  6 Jun 2021 11:32:44 +0200 (CEST)
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Roman Mamedov <rm@romanrm.net>, zrm <zrm@trustiosity.com>, StarBrilliant
 <coder@poorlab.com>, Baptiste Jonglez <baptiste@bitsofnetworks.org>, Joe
 Holden <jwh@zorins.us>, wireguard@lists.zx2c4.com
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
In-reply-to: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
Date: Sun, 06 Jun 2021 11:32:44 +0200
Message-ID: <87v96ribib.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


Hello,

so given that fragmentation is disallowed the PMTU discovery always
needs to work and the wireguard MTU needs to be correctly adjusted.

Speaking of a DC situation, I think this might be tricky. Imagine the
following situation:

- endhost A has an MTU of 9k. PMTU 9k. wg 8920.
- the path changes, the PMTU reduces to 1.5k (this is something we see
 happening from time to time)
- How is the wg MTU adjusted in this situation?

And to clarify: with disallowing IP frag, you are obviously only
referring to the outter transport. Within the tunnels, IPv6 and IPv6
packets can still be fragmented, so application operation is not really
affected.

Interesting approach, I am not really sure if realisticly feasible,
especially when thinking about long range/low bandwidth media where
you'd basically say "wg cannot do IPv6 on these mediums". Satelite
systems should probably work fine, I am more concerned about mesh
networks, in which wg is quite popular already.

Cheers,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
