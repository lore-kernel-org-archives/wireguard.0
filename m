Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SHORT_SHORTNER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC2BC55ABD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:08:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659ED20797
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=knockaert.nl header.i=@knockaert.nl header.b="E8CZ7405"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 659ED20797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=knockaert.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff93b5fb;
	Tue, 10 Nov 2020 13:03:53 +0000 (UTC)
Received: from mail.knockaert.nl (mail.knockaert.nl [2001:980:6492:1::4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5fbf892a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 13:03:52 +0000 (UTC)
Received: from [169.254.95.168] (unknown
 [IPv6:2001:980:6492:1:4831:4906:a281:82b8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: jknockaert@knockaert.nl)
 by mail.knockaert.nl (Postfix) with ESMTPSA id 1A6CC5A056E;
 Tue, 10 Nov 2020 14:07:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knockaert.nl;
 s=mail; t=1605013651;
 bh=3tPbNNq9mvpRCb26TgwQJHQJAqc578ootnETUeJtf44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E8CZ7405Mz3QNk/l74/aK2BqkhIKPA2GtFQWSYXMj/NHTiQdG+nGEMt4vry8d/0If
 JxaarQiF84qgDLx15VTuy+jsxQajYN8MtUfcrx6V2X+PyIrQLEnEIPylYuXiRDt8ny
 sz64dnxLpC3C8CrR2qH7oesmfRQzM1Bl8DsT9Ax4=
From: "Jasper Knockaert" <jasper@knockaert.nl>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: wireguard@lists.zx2c4.com
Subject: Re: MacOS: Can't have multiple on-demand tunnels
Date: Tue, 10 Nov 2020 14:07:30 +0100
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <127FE83F-C861-44EF-9541-4B449174AD7D@knockaert.nl>
In-Reply-To: <ca2d6ca6-1bca-c177-1ace-60480edee2db@al2klimov.de>
References: <ca2d6ca6-1bca-c177-1ace-60480edee2db@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Virus-Scanned: clamav-milter 0.102.4 at green
X-Virus-Status: Clean
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

Hi

On 31 Oct 2020, at 12:31, Alexander A. Klimov wrote:

> Has anyone seen this problem, too?
>
> https://youtu.be/qkRmzvnhfzQ
>
> Does anyone even know how to workaround it?

I can confirm this. You can have only one on-demand tunnel on a mac. 
Even when having multiple user accounts only one user can use on-demand 
functionality (as the others cannot access the keys which are stored in 
the keychain).

Jasper
