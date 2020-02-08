Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEC2C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:21:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6678B22522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:21:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pUJtBjMz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6678B22522
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc4d2063;
	Sat, 8 Feb 2020 21:20:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d5d1607
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:20:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4980dc31
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:20:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2eef59eb
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=2yWC2b6yU+96JUO4IVpaflokaqk=; b=pUJtBj
 MzgA2vhsJLgMeG03aY1rram00+3qzNuoki1h//vXX+rptW9I22SWBWjS+tdyEEkP
 zhhgjQjmRDOIItOGEJaCFWfXYA0/yME1TDSAZcSVk5/SQiG1DgAEem8xUlekOaiQ
 NS6KrmA0OUGOox+DjaaRudJtY3mf1eOIvsCOS9sn4FaErzffgtkJtffXv3NeS3zS
 PX+jLwXuLT4OJf0rCicO+xqBaFyy0svSWhtKvRou3Etw7oDGOm/mxLA+KfCOjFhI
 aNb3A4AiVhKyYQucNPGNYbePLbRC40nhHhnfEfAfJJ2w7Rt7491J474GoZ/QA6dl
 NhsvtjYB8IhwDf8Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e47f7f52
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:20:17 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id j132so5574279oih.9
 for <wireguard@lists.zx2c4.com>; Sat, 08 Feb 2020 13:21:39 -0800 (PST)
X-Gm-Message-State: APjAAAW0F4dArZpR0N5r4bGgBKiNsPBnfOrT6BfiYHtaUqoY5H7eogAh
 RbKAS2NZiv6FRpmARigN5c3nFHlaVlmTdlYr3m0=
X-Google-Smtp-Source: APXvYqyjQ3PhvbD+LiZT6FhzROcBV5/tVZeQexNrTDPJQbAyNMjH5k9G29+6bSkjPVsfO9pDqkxEWAXcA0d6ajxQiGA=
X-Received: by 2002:aca:c383:: with SMTP id t125mr5973585oif.122.1581196899085; 
 Sat, 08 Feb 2020 13:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20200208202347.23048-1-khaberz@gmail.com>
In-Reply-To: <20200208202347.23048-1-khaberz@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 8 Feb 2020 22:21:27 +0100
X-Gmail-Original-Message-ID: <CAHmME9pcctNULgWxuYBF00YrjsDsUOPbWj=V9e9mczyQkN7F=A@mail.gmail.com>
Message-ID: <CAHmME9pcctNULgWxuYBF00YrjsDsUOPbWj=V9e9mczyQkN7F=A@mail.gmail.com>
Subject: Re: [PATCH] Small cleanups in man wg(8)
To: Kai Haberzettl <khaberz@gmail.com>
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

Thanks. The first two chunks seem right, but not the last one. Applied as:

https://git.zx2c4.com/wireguard-tools/commit/?id=95aa00b8846396273a4ece75de7701d11516e050
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
