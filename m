Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAD0C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 04:27:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8CAA20817
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 04:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pa9ow+qz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8CAA20817
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b638ac4a;
	Mon, 19 Nov 2018 04:20:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 730a7964
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 04:20:56 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d666e392
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 04:20:56 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id v1-v6so24932281ljd.0
 for <wireguard@lists.zx2c4.com>; Sun, 18 Nov 2018 20:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nEYDI5zpSK9sgmEQflyErKDeDPoHt3e/8d5O/RLwtq0=;
 b=Pa9ow+qzz5qBeMCo1bAMBK7tjVkhDFph+fcbnOBCSq/5s55VbK9lQPm0AhDhdJUale
 2Ruod5OP4BYrDoZX52A1AV0ZU40JhNkQrg+qz6m+nRWrOgx7FZpKP6a1GsXSVOHZmnkB
 7Qr7/rwtORTmpwCMEXJ0uFxlcMJoBqTuAbIj1VH6I6kWbaRWsYHwF3KisDXGfk8DXeBD
 IsHzzhyx5Cq33S+KMEQkCjt2VpP6q5TDGLWRLVopGFc4hUrqmumnaXldbF0FVL1AOsBP
 tPDBmRQrCv2YBe5DHKMbJmiVA5tjzHIVUz/3vA6c61AbPk99hNkKrx/zBJD7LSihdfNW
 MUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nEYDI5zpSK9sgmEQflyErKDeDPoHt3e/8d5O/RLwtq0=;
 b=lklLhAYbyjq3W7fdwRSlFqLyCk7Qns4mgEiMq/QZZhrMPO8b8ejBI3MYuiDAz6XY/k
 g5CkBQgRenKj1kGig76DxG54gbqHhgng2bnO0wSFUxtsSRX2qAcSmzH4jZhzxy5B5C8n
 OMAULUwokSxh+njskqQbrvg1PydIJjmukFBBjzWTSiiVt1Vy2xO594CII8Liws/2fnlP
 qWGSl0r+ciB6nFPBxU/PFmTwyjG5lxSfaJOXBXQf0xpr03LnCU4x2neggDv79uuuYRzR
 0rqKSq+mtExLMbsQT1vNMaWlspSLCq/dsrwRS5m8H0OuzQ0VBLnLvSusF0o4NCj36UgH
 sW2g==
X-Gm-Message-State: AGRZ1gL2FtDr/SkstCITLh10vcEPQAWuiRIObItXsAbWBLfFbpRqM2p7
 o13Fe/hq/99gDkeh+RG7D6LlVilcrd31tHpTVCs=
X-Google-Smtp-Source: AFSGD/U551r0GjFQav0YwM8sNbreEHg+rHlIJfe1nv08XkWOPSUW+3Ila+OUAaqHfEqhYJ1fyFv/NeqQhFbog5tVKh8=
X-Received: by 2002:a2e:1f01:: with SMTP id
 f1-v6mr8430873ljf.129.1542601610281; 
 Sun, 18 Nov 2018 20:26:50 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:45c1:0:0:0:0:0 with HTTP; Sun, 18 Nov 2018 20:26:49
 -0800 (PST)
In-Reply-To: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
References: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
From: Quan Zhou <quanzhou822@gmail.com>
Date: Mon, 19 Nov 2018 12:26:49 +0800
Message-ID: <CAMRLKH8xmUnAf6J+0OSQC3+QBN0jkMa0erRzEzBH9xb-m49K-Q@mail.gmail.com>
Subject: Re: Traffic on port 53 fails on LTE but works on WiFi
To: John <graysky@archlinux.us>
Cc: wireguard@lists.zx2c4.com
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

> 1) What can I try on the server peer side to diagnose?

# tcpdump udp port 53

maybe you can try to `ping` and `traceroute` to your server in addition.

On 11/19/18, John <graysky@archlinux.us> wrote:
> I have a simple WireGuard VPN setup I use running WG on a home Linux
> box and connecting to it with several iOS clients.  The server peer is
> setup on port 53 since a the networkadmins of some remote WiFi
> networks my mobile devices seems to block udp traffic on higher ports.
> Encrypted connections work fine on WiFi as I have setup, but do _not_
> work when I connect via LTE (Verizon supplying the data).  On LTE, I
> am no longer able to transfer data to/from the server peer but I can
> handshake with it.
>
> If I inspect the output of `sudo wg` on the server peer, I see the
> endpoint IP address changes to reflect my Verizon LTE IP and the time
> since the last handshake reset to a few seconds which is consistent
> with my ability to connect to the WireGuard peer server.
>
> I am unable to transfer data (pull up a web site or check email etc).
> It's as/if Verizon is blocking my data flow on port 53.  If I change
> the port from 53 to 123, it seems to work fine although I do not have
> universal connectivity on the various WiFi networks I visit on port
> 123.  The optimal port would be 53 for my use case.
>
> So the questions:
> 1) What can I try on the server peer side to diagnose?
> 2) Do people feel that Verizon is actively blocking the connection on port
> 53?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>


-- 
Regards,

Quan Zhou

F2999657195657205828D56F35F9E5CDBD86324B
quanzhou822@gmail.com
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
