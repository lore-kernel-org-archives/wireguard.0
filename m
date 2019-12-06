Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB492C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:19:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C86024659
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="F2U65Vev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C86024659
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93f9b47a;
	Fri, 6 Dec 2019 15:19:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8737612
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 15:19:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef10515d
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 15:19:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5acf356b
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=KcdaDDcR6jcga7WqoCC+zSoIx/0=; b=F2U65V
 ev3i2soMeU/sPvXx+rmSG5shK0kwAJvL1eodaj1Seem36WoN0iTVGdc+dUER4wFl
 UmX7EpqPAJPlnw4sqCi500zxN/0K4roSlJpXVkUd3o8DKnqsjxJHGEXul791SGJB
 9CYrzA63HbkOFzubUWFEhejL3kz+Ki03B248IOLhMJ2QWUPvJVUgmovpO2i/tKbB
 3LNz28MMyJ39WCAdEpVSOKmuIcYqZkSLmVN+AooOxQ2HGcMQa4qT9r//Md23iEae
 sroyA+qJ2SD5LNQUlCQ0K9jOWmu2C4CPKGYbm581mMz1Z+VBuw0o+Pcyegeql87q
 06l+gh7jdjWv3rYw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5ae009f6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 14:23:59 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id i4so6102689otr.3
 for <wireguard@lists.zx2c4.com>; Fri, 06 Dec 2019 07:19:01 -0800 (PST)
X-Gm-Message-State: APjAAAV9dAXLMvz2VeaAST+JdFomG+84xDgpM1oSNXEiA8p3r1bRe8+i
 +VgdPk80r+q30W1/upklI4BqgMYIYa3fJ1d55Ow=
X-Google-Smtp-Source: APXvYqxHyVKgD1f1b5lzQog4iFE/KkXquCQ+6jeTr8z8OdsbWfBtJO1kSGgF/cYkQOl/nbfTyWZr+UpyRWuR+xSROeo=
X-Received: by 2002:a05:6830:1141:: with SMTP id
 x1mr11555968otq.120.1575645540832; 
 Fri, 06 Dec 2019 07:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
 <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
 <fdc450ad-f382-87d7-4c63-c31d595295df@gmail.com>
In-Reply-To: <fdc450ad-f382-87d7-4c63-c31d595295df@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Dec 2019 16:18:49 +0100
X-Gmail-Original-Message-ID: <CAHmME9pTt2MPH3gxks8S=3hVKS6P2XFkJd5eT7uivsoK7QPMJg@mail.gmail.com>
Message-ID: <CAHmME9pTt2MPH3gxks8S=3hVKS6P2XFkJd5eT7uivsoK7QPMJg@mail.gmail.com>
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
To: Vasili Pupkin <diggest@gmail.com>
Cc: "William J. Tolley" <william@breakpointingbad.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Vasili,

On Thu, Dec 5, 2019 at 10:28 PM Vasili Pupkin <diggest@gmail.com> wrote:
> I've just figured out that the same effect can also be achieved with
> iptables:
> iptables -t filter -I INPUT -m addrtype --limit-iface-in ! --dst-type
> LOCAL -j DROP

Neat trick, but it still requires this to run on all incoming packets
from all interfaces, right? In other words, it enables a strong host
model for the whole system instead of just with regards to addresses
"owned" by the WireGuard interface. Adding support for the latter
would get us back to the original rule we're using right now, right?

>  But for the sake of wg-quick
> the filter can be enables for wireguard interface only to be sure it
> wouldn't break anything else

How do you propose this works? That'd require adding -d, right? In
that case we're back to more or less the original rule. If you do it
with -i, then it fails to filter the bad packets that we want to be
filtering.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
