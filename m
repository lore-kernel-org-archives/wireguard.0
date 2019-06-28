Return-Path: <SRS0=Sp06=U3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0064BC4321A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 12:32:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B9D42133F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 12:32:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="c80Vf3GB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B9D42133F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2a65222;
	Fri, 28 Jun 2019 12:32:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f7614a6
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 12:32:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5a60f57
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 12:32:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0068cfd3
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 11:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=CbRDOMb2G8PMJJbhd22cF1X+RJ4=; b=c80Vf3
 GBoKkK8GWyy63BvHxmdS4K8vjyRQegjiKOcQISSN757nKCgqO6axOKpVmKnYHzim
 kZQL3Ys7tbnku6r0KkFsmFfBcx3b3cPpLltV4OktFW8cT7a7K3JxWOmXznGKx8EH
 EVbrWAfB/nBPUWkYXaa8UHDCsn+mqjGh5AEsWem/lAOC0kkP6iHc0R39pJuMts9g
 Mg0Fj1ZctGytpp8ouP/yWYlcNhSRKzRCuEIGrymYBpjOIv1+lrnNWLrXx6XWdLz2
 oWlItC1dLJ2mAogicMktdDotChcpkLLvSXdymduf4oa3zg4PzdLo/lKVjsrnbjw6
 5wSgeNeAkm4/LPuQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9294b863
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 11:58:15 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id v186so4131761oie.5
 for <wireguard@lists.zx2c4.com>; Fri, 28 Jun 2019 05:32:32 -0700 (PDT)
X-Gm-Message-State: APjAAAUFEqU+eYh2NvMaHiFsc2F+HWzvMWbJV0uWVYuHHqUaJRlAvlLk
 rttZhxiX9hsbPV/r0AvAPDHceVourVmgnLz2wTs=
X-Google-Smtp-Source: APXvYqxqIYierPFslV+uHLGg5O8Lk5va8TEASLCnc/6xBP54eZsz9pyBbK7DzoFOh1C65Obm+Rqqa4k0ia1tCVsBpqA=
X-Received: by 2002:aca:ccd2:: with SMTP id c201mr1372446oig.119.1561725151925; 
 Fri, 28 Jun 2019 05:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <CADXv92b2P79-OJBzK+aXhKFr3k_VqZkkkAuZOg5dALui8aNTiA@mail.gmail.com>
 <CAHmME9qi6eb+YCKx8NdtN85ouTszDBrCsrshT1sYFTUXw8K_zQ@mail.gmail.com>
 <CAKJniYQ-YcFrYm8hz2Q8aWaJf2jLTsa_g2VGy_UaqfEx2yBUtQ@mail.gmail.com>
 <CAHmME9rT11fPmBuRxa_sSRjW01ZN6eSJuDEpKOpGVbH2e=SZew@mail.gmail.com>
In-Reply-To: <CAHmME9rT11fPmBuRxa_sSRjW01ZN6eSJuDEpKOpGVbH2e=SZew@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 28 Jun 2019 14:32:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9rNis62NiBZTyuaOjcxRtu2N9=90GaLR03_zQOPmYwFhg@mail.gmail.com>
Message-ID: <CAHmME9rNis62NiBZTyuaOjcxRtu2N9=90GaLR03_zQOPmYwFhg@mail.gmail.com>
Subject: Re: RHEL8 package install or build fail
To: Christopher Bachner <hello@chrisbox.org>
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

This commit fixes it and will be included in the next snapshot:
https://git.zx2c4.com/WireGuard/commit/?id=80f006d3656ce2858675020a23879e916ea8a4fc

[ec2-user@ip-172-31-24-82 ~]$ cat /etc/redhat-release
Red Hat Enterprise Linux release 8.0 (Ootpa)
[ec2-user@ip-172-31-24-82 ~]$ uname -a
Linux ip-172-31-24-82.eu-west-1.compute.internal
4.18.0-80.4.2.el8_0.x86_64 #1 SMP Fri Jun 14 13:20:24 UTC 2019 x86_64
x86_64 x86_64 GNU/Linux
[ec2-user@ip-172-31-24-82 ~]$ sudo ip link add wg0 type wireguard
[ec2-user@ip-172-31-24-82 ~]$ sudo wg
interface: wg0
[ec2-user@ip-172-31-24-82 ~]$ dmesg | grep wireguard
[  693.365784] wireguard: loading out-of-tree module taints kernel.
[  693.382433] wireguard: module verification failed: signature and/or
required key missing - tainting kernel
[  693.390216] wireguard: WireGuard 0.0.20190601-8-g9e71cce-dirty
loaded. See www.wireguard.com for information.
[  693.397561] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
