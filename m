Return-Path: <SRS0=K7sE=LF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D344BC4743D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 06:26:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D3661184
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 06:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3D3661184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85343d58;
	Fri, 11 Jun 2021 06:23:54 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8949c3fe
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jun 2021 06:23:52 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id l1so2873025ejb.6
 for <wireguard@lists.zx2c4.com>; Thu, 10 Jun 2021 23:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=WoNPUaP/wOXDPzdeRvJoAu9RRthMDhPGOPSsQNmtL3M=;
 b=ar01TxtXW4/WO4Ob9THwFhTeq1Pb/blvtYsKux+Cjo1FQ9nMRIKUQKCvH3ey2FsHyV
 NS99jzIb/JiCkZgpNJ6t3lquOoB5rfK8s1nOMaPPoX+VpPdDvdIXEWf0Bwm7n7njydx0
 AdCIuToWYcHm/44GWJj3uRhG3q4GvA0yOEYjlr3dc8byf3AIazt5MrLjKENhegSv7Qw/
 MiM7GFg9W4P/N6qwQM9Zwc59aNRX1cxJD6K0LIRXmEiLLTKblENUMnjHbW1jTVBTxIKe
 8DikfV/oDwrpuOAJ9apJ4/Je2de9+Vnqm2oIb1+DzRDTJbn+RzP2+ezMbw1HSLRhapBD
 DsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WoNPUaP/wOXDPzdeRvJoAu9RRthMDhPGOPSsQNmtL3M=;
 b=KCofnn5ouo1JUzrq9LSxzRHeJeZGC6oAlMzqfjGO94aEk5vzbImmfNq6TC3RkHpeav
 yGxBCqQGfEZuG/TI1Njnrf3KaD/cabZRW6revob1YhkNSfDk4D+0j7Sg7RWE96VFN9pt
 LNGiphFTfZdWRb7N8RMenEfY5jghvVPurWix8DF+bCNIo6HsX4/82RzthanE+FpHsRgC
 f0MQC7UlFFf1rU8z/s/agnTVg65BlBkQKNqsJhGhIl0yibmVf7jWalunDon3+E3jnSYr
 umRq3BbHdO2Q8ziNHgFHXpu0/4Zw855AXFpzCjryBendwg4EFqR5aKJo7Kx+pUR7bsmU
 W8QQ==
X-Gm-Message-State: AOAM533ADaR7tKv5yZKJVi+eY260JurjqgHm+wZwHTAlxr5Fzfg+ZxwY
 7uOUNUfWAkHB5+62qn72f9a8QMs1JecwH/XR/zXovodWIsm+MQ==
X-Google-Smtp-Source: ABdhPJw02d7Xwvc/+g+o4RKuvuyVmW9uCRsQsFmrrYq3wGvxoCun6o1gBbZm6PFqp3fVOQ332lR6wKyjYATlJvM5hlk=
X-Received: by 2002:a17:906:a854:: with SMTP id
 dx20mr2219633ejb.128.1623392631682; 
 Thu, 10 Jun 2021 23:23:51 -0700 (PDT)
MIME-Version: 1.0
From: Dimitar Vassilev <dimitar.vassilev@gmail.com>
Date: Fri, 11 Jun 2021 09:23:40 +0300
Message-ID: <CAF+AZZXLYQtMA7j2ks2uk3SO5NnvSEW3VJ6zxwFG3SUGB736Ew@mail.gmail.com>
Subject: openwrt interface does not have a public key after upgrade from
 librecmc 1.4.8 to openwrt 21.02-rc2 to openwrt 21.02-rc2 ath79
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Greetings,
I upgraded an WNDR3800 from librecmc 1.4.8/ath71 to openwrt 21.02-rc2
ath79 and reapplied the librecmc 1.4.8 configuration. I'm seeing now
the interface configuration in the CLI and in Luci with all the keys,
but when I click on Status->Wireguard I get a message interface does
not have a public key.
I did have a look on
https://forum.openwrt.org/t/wireguard-interface-does-not-have-a-public-key/37549
and the other threads, but even when after applying the work-arounds
for DNS rebind protection still the same. My Luci is using self-signed
certs as well.
Any clues where to look further? I will be testing the device today to
see how it really works. I do have some overlapping IP ranges in the
configs that make me reluctant to test how site A machine works as a
client of site B, while the actual site A is running remotely over the
VPN.
Thanks,
Dimitar
