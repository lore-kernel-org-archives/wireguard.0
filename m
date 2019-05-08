Return-Path: <SRS0=PHiA=TI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CDBC04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 May 2019 17:35:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2FD21726
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 May 2019 17:35:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="l6QSS5fD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2FD21726
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc185da8;
	Wed, 8 May 2019 17:35:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64c7a5ce
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 17:35:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b555894
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 17:35:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0658fd34
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=wKILK5P9bRnKHLMeKXQdiT3br40=; b=l6QSS5
 fDjGqukuvNCBqJ49lIB/I9VzR1nkij74dIzW5ENr64IrBQ5ECRK6z3aY7btDl2Cj
 SmVEDqAfVLtLKDxQm+oXohSc0oXM3jGB/cpqHSKMP36zBjw8on4PLeiVLYTx5RfQ
 BbgGYvdj3/IPcp41Vt+NXGMd/cFUgViPukbO3Fr2zckB1EkIYG/DYcCy2Bzwr5Bg
 q9fnf+Xs/5HfUX5QcMU6jrJhVKprsQUXPOj+Doz071evWi1aANQh5+63JbgAca5W
 A5KqDFbP6YHhUK22qJ3wE1k4jZRaUVauUVKHyslXRH9Uk3yKSCjsS68X3aL9CUul
 1N0dLYuW84GViz0w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9565cfaa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 17:07:59 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id x16so9905161oic.6
 for <wireguard@lists.zx2c4.com>; Wed, 08 May 2019 10:35:46 -0700 (PDT)
X-Gm-Message-State: APjAAAXQSCSzZhkcMn76DYv9yMn1Akmct1EEv6ypwuoGgXAOX9UpQN14
 OL0TCPz/G1YgkuSfUV6VErrb81Vdy52ZCTsrEXk=
X-Google-Smtp-Source: APXvYqxaMeLsF7W0v1upGV7Cn/dzyXjMeZhMDcVFF/kemSS+7BVzYjmv8lrLq+1O0z07TkgPSMQlkzvQvHlQJZ7kfrg=
X-Received: by 2002:aca:c682:: with SMTP id w124mr3121947oif.52.1557336946072; 
 Wed, 08 May 2019 10:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190508121946.GA15707@zx2c4.com>
In-Reply-To: <20190508121946.GA15707@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 May 2019 19:35:34 +0200
X-Gmail-Original-Message-ID: <CAHmME9q5qvJ8L8r3-ap5GghbtaTNPSH87mH_roq_RLMtmTG_AA@mail.gmail.com>
Message-ID: <CAHmME9q5qvJ8L8r3-ap5GghbtaTNPSH87mH_roq_RLMtmTG_AA@mail.gmail.com>
Subject: Re: [ANNOUNCE] download Windows pre-alpha for testing
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Wed, May 8, 2019 at 2:19 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>   - Update mechanism.

Some info about this, by the way:
https://marc.info/?l=openbsd-misc&m=155723329924761&w=2
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
