Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0F2C47090
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Dec 2022 13:11:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62266301;
	Thu, 1 Dec 2022 13:09:22 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dfc23bc7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Nov 2022 10:03:27 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 t19-20020a9d7753000000b0066d77a3d474so635389otl.10
 for <wireguard@lists.zx2c4.com>; Thu, 24 Nov 2022 02:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BkgAx4gVoeJBEYX6EB2lkEpCk3WN+Nu60lwY9qDEkI4=;
 b=hYpbihpgEmTfp2kmwBhSzdEvF9CMgX92E0rfEkst0yl2tjQuBu3k/1oMrqQeQxlK0Z
 FUugr5aSxVngfYR32U7cOYPw+BFqe6QkrtE9lXdBsHQkG+pSqeUOAYLL/F2E8BEjl/m7
 lDNg4jfSJT498U098B1j78FND1e3qSAmbJLeD19cWfw90bDqmQ+TmVFUwP7Z/C4dpGKf
 WDv/FRTbROJjeBm+mn5jR3mYvuFaBzs291vv2ZI0FB/PoMLs5TXvWSs/DNuln66xTNRf
 1X37B7papURBC5TYHoPRfaYzB9HnYwTxByS8ctUGPYBzezlinQ39Tz1eDL5zMyVjnZNg
 iZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BkgAx4gVoeJBEYX6EB2lkEpCk3WN+Nu60lwY9qDEkI4=;
 b=IcMhLyP4mLohmPshbKelUelPEpQGgv/GN9FVKDn/zmllR7V6aHdzffIRuwHuZdESl4
 VnoxoR4RBo/F+qJodMgRwPejTc/DX/dwr/8V2NH9jGKPxuKi3d6xhT66E3wDreGoLBUu
 MeTXpChAOwE1h1u6F9UUnNFHE0CccTw9MUtUrmn+olyizoz5BaTAdJ+8ELOOuF/mN3cS
 HX5xmQrjfWOefDxyidzHBVB7KwSYUmdOAt6NAp0LCqcriLJUQOhWryj82Rr8GqwHrbc9
 6yW9tCY2dFCey83XhmsUiEzmGiCtYW1ZFBz4aa7qqHR/Mm829i7nQAafgdHcfW5F4QA1
 /kmg==
X-Gm-Message-State: ANoB5pk4QGnx2/Ve30fkvVg84BsCM8npP2Kzgvik/N7xdkeYoke8TBdH
 Ep6TRPXvQTGj5uAQ/CHLKpirJm+t3yMc06UlrmrVWrEyPWo8W5BO
X-Google-Smtp-Source: AA0mqf4JtyJCxzXYNSBeDYapRL0Ke80xxqC/0ff6PT9l6hStSsU/TU2vzqxIejyYXOi6sDiN8/1a2+o3Dyk3mCfOiIk=
X-Received: by 2002:a9d:5913:0:b0:65b:ce9d:197e with SMTP id
 t19-20020a9d5913000000b0065bce9d197emr6104410oth.167.1669284205669; Thu, 24
 Nov 2022 02:03:25 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Ond=C5=99ej_Grover?= <ondrej.grover@gmail.com>
Date: Thu, 24 Nov 2022 11:03:14 +0100
Message-ID: <CAOyjJOLRZb7BuGBQAK6_bKBCcLOkQnHQ7FcZuaLy0=_+EsJXeg@mail.gmail.com>
Subject: DNS endpoint resolution in container namespace
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 01 Dec 2022 13:09:15 +0000
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

Hi,

I tried to follow the example here
https://www.wireguard.com/netns/#ordinary-containerization
but I found out that the DNS endpoint resolution through

ip netns exec container wg setconf wg0 /etc/wireguard/wg0.conf

won't work, because it is run in the new container namespace not yet
capable of DNS resolution.
Looking at the source code here
https://git.zx2c4.com/wireguard-tools/tree/src/config.c#n242
confirmed my suspicion that the DNS resolution is done by the wg tool
in the container namespace rather than in the original namespace.

In an ideal world the DNS resolution should IMHO happen in the
original namespace capable of DNS resolution where the world-facing
UDP socket using that endpoint IP is anyway.
Often one could use just a hard-coded IP (that's indeed what I
resorted to in the end, or  perform DNS resolution at container
provisioning time as suggested by mrngm in IRC) for the wg0.conf in
the container, but with DynDNS and similar setups this may not be
possible.

But since that might require significant changes (e.g. requesting DNS
resolution in the original namespace through the kernel?), perhaps at
least in the short term I would  recommend that this caveat is
mentioned on the webpage and/or perhaps in the example the `wg
setconf` step would be run in the original namespace (unless there is
some repercussion to that I did not consider).

Best wishes and thanks for all your work making wireguard what it is today,
Ondrej G.
