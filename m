Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6867DC35671
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 12:45:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C101A20675
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 12:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQMXRGIH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C101A20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfd315ad;
	Sun, 23 Feb 2020 12:41:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8711057e
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 12:41:58 +0000 (UTC)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08df8464
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 12:41:58 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w1so6988722ljh.5
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 04:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=ZSAe0neNSSaFzzn3pK7jJI+mg5Du5Lji9aEy+ShS+mg=;
 b=jQMXRGIHUJryoZ68DIfPqWt51QtXMfMUS04ODEHHI7Q/CJ+cxsIE2XqqVNxdvDW+EX
 NpmhsU1CpNKgT0ytEDGjr4HmO0A3jgyPKXJp5OTt+HJuYLPXRgpLhjZiwvW8KYeF9epU
 OsdLcGSaNDrcMpKUFhHQuFAC5W0ftjbwbgEoD4NFNyGu3UbivmUrgJgscsrmrpPzug5Z
 fe2jM/+jhyQxmE/gn+5LGGXtJ932mtLoRVFmkUlhCu9/6s6kaN12H4eTqlJ/L2KGVktB
 Aemx0xfkIWB7F8/runcq6P+j9handshdDR5XCZv/hh+qrPRW2EnoNq+4BXQhTQv5Bk53
 xDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ZSAe0neNSSaFzzn3pK7jJI+mg5Du5Lji9aEy+ShS+mg=;
 b=KpiJtbCCeLI1sa5zQAXaIZOwxMtmX+f1k80Yozugrvan9faQfntDBZVZdI0zML9vJz
 eMhPT9lJyxydCxCOPEldxzE9uvA4QXJXffMXDOAmF1ruYxCl3Sn41vDypRNshDgqF3U+
 NtqP95d//ddJi2v+jrfHv+ORZ0MvGlCiH6k0WUxbE8gk0SFQXkEnQte3N7DvZEklI0KH
 iJQW4WG1XevDirUg+PDjHmiXEZn8xMPntlIiTg9wMrdV/esM02joGyCgexjSeuIxOTsE
 j1lAfKys7yTVXoR7WSvAtOhQbXHnrVUfSalkIrQSjahETh7AosTyzPqcDP8KbCWTGwED
 j2Lw==
X-Gm-Message-State: APjAAAXVw5tockycnCWb2vhxedyxjeYil6C83qonQoh183E5+GVqFA1T
 dx43TubUhe4Yq7RXBEBuD9TbEpaY
X-Google-Smtp-Source: APXvYqxUYFHpfiuPSnh6sSbmuGg5ApJqnnuTIC6amMKQSKvXNcNaPcogcoZhfZNvW9JEyeq07rPK+A==
X-Received: by 2002:a2e:99c5:: with SMTP id l5mr26523442ljj.88.1582461912047; 
 Sun, 23 Feb 2020 04:45:12 -0800 (PST)
Received: from mammut (2481-7a97-c98e-345f-a980-830b-07d0-2001.dyn.estpak.ee.
 [2001:7d0:830b:a980:345f:c98e:7a97:2481])
 by smtp.gmail.com with ESMTPSA id h19sm4553282ljl.57.2020.02.23.04.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 04:45:11 -0800 (PST)
Message-ID: <6631a080206c608c7b92cffab3f739c66a1ff1e8.camel@gmail.com>
Subject: Re: [PATCH] wg show: Add json output
From: Arti Zirk <arti.zirk@gmail.com>
To: Matthew Oliver <matt@oliver.net.au>, wireguard@lists.zx2c4.com
Date: Sun, 23 Feb 2020 14:45:09 +0200
In-Reply-To: <CAEQe3e=JMOwASvDGuC00uiYdTY_VaU0PnB285pU715i7g4uRaA@mail.gmail.com>
References: <20200217035701.28261-1-matt@oliver.net.au>
 <CAEQe3e=JMOwASvDGuC00uiYdTY_VaU0PnB285pU715i7g4uRaA@mail.gmail.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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

On E, 2020-02-17 at 15:47 +1100, Matthew Oliver wrote:
> Someone asked about this in the IRC channel, so quickly wrote up a
> patch to add it. No pressure if you do/don't want to merge it :)

If you have wireguard-tools package installed then it should be
possible to use the incldued wg-json script to do the same

  sudo /usr/share/wireguard-tools/examples/json/wg-json

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
