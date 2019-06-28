Return-Path: <SRS0=Sp06=U3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3E7C4321A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 14:53:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6920E2064B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 14:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="aYtZQmyZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6920E2064B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6f35f71;
	Fri, 28 Jun 2019 14:52:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ee764f3
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 14:52:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dc8faea
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 14:52:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dec4ae0
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 14:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+tN0KKZ/YzOPJ463S0sXuDLrOP0=; b=aYtZQm
 yZIp23Ec6MFHnMMCw25i7iahoGlneILrtvY1zRDfJfJX6kvLlRA9gMFCMxv68Uvb
 SSNa46DuEeGxbtnIvAKDjwKwLKXutEWWToKMxA9WwmZ6DSnUUyp/6O1CkQeBgEXj
 b+4ctypiBWJuOWlb6lhUWfOp90d1NPT5N4boUoInQ7tb6eQAJS6xNETbEnFaRqKB
 Qz6ooJMIVCw+ZjSKm7pjs2ZSMCwbdPvcpo5yYmAQcLaozC7hMCIEyZHJSF1ZGuYr
 15Q+OJWn0Arbh0+QJHFaOl0m8+vZ4s5wYgfrH+atCxV/EcJs7JqN//ky3oaQCM3D
 JxncUYQacqetOAVg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 75284031
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 14:18:37 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id e8so6206500otl.7
 for <wireguard@lists.zx2c4.com>; Fri, 28 Jun 2019 07:52:55 -0700 (PDT)
X-Gm-Message-State: APjAAAW6lgZtBXS34TQD5DuM+XhdBiymm4fhqMuVYuwdWjRTK3QFveXy
 pWrMhMQMl/xFDeKrGjKwsizE/l3WNRw3slueiQc=
X-Google-Smtp-Source: APXvYqyZax9gtjjqgYGkwQ7UegavaMBM4QfOomPEnfb3SrWTG+syF4gKcCia1kC6jBe3N8OXq7Ii7EOwNR3IxBZ6/7g=
X-Received: by 2002:a9d:67d5:: with SMTP id c21mr8546655otn.243.1561733574555; 
 Fri, 28 Jun 2019 07:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <CADXv92b2P79-OJBzK+aXhKFr3k_VqZkkkAuZOg5dALui8aNTiA@mail.gmail.com>
 <CAHmME9qi6eb+YCKx8NdtN85ouTszDBrCsrshT1sYFTUXw8K_zQ@mail.gmail.com>
 <CAKJniYQ-YcFrYm8hz2Q8aWaJf2jLTsa_g2VGy_UaqfEx2yBUtQ@mail.gmail.com>
 <CAHmME9rT11fPmBuRxa_sSRjW01ZN6eSJuDEpKOpGVbH2e=SZew@mail.gmail.com>
 <CAHmME9rNis62NiBZTyuaOjcxRtu2N9=90GaLR03_zQOPmYwFhg@mail.gmail.com>
 <CADXv92ZnXYbUYJOnA_xsr6Q4HCfSxFZaqLN0WXDLobCUjsJayg@mail.gmail.com>
In-Reply-To: <CADXv92ZnXYbUYJOnA_xsr6Q4HCfSxFZaqLN0WXDLobCUjsJayg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 28 Jun 2019 16:52:43 +0200
X-Gmail-Original-Message-ID: <CAHmME9r+yjBGcfoG7Tkp7UE=1Te_j32c7zWF+_pqCwP8rfJUCg@mail.gmail.com>
Message-ID: <CAHmME9r+yjBGcfoG7Tkp7UE=1Te_j32c7zWF+_pqCwP8rfJUCg@mail.gmail.com>
Subject: Re: RHEL8 package install or build fail
To: Michael <gravitygrazer@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Fri, Jun 28, 2019 at 4:48 PM Michael <gravitygrazer@gmail.com> wrote:
>
> Hello Jason,
> applying the patch for compat.h resolves - compiling works fine. However the Netlink headers libmnl.h were missing, seems there is no standard RHEL8-dev package for the library, had to take it from netfilter.org/Fedora. Then OK:
>
> [ 9386.069776] wireguard: WireGuard 0.0.20190601-7-g44070b9-dirty loaded. See www.wireguard.com for information.
>
> [root@paris src]# wg show
> interface: wg0

Apparently you have to add the "codeready" repository in RHEL8, as
libmnl-devel was removed from the main repo according to the release
notes.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
