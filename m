Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C9CC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:44:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB4F2081D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Np3rNEDX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB4F2081D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98af2213;
	Sun, 4 Nov 2018 17:39:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e133e974
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:39:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4145c3c4
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:39:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 212b1349
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Sy5rdqmc7W4lqDk760pPwsqE0ww=; b=Np3rNE
 DXmWhrhmmW+mgbHWTZSbTTys8YQioZYy9Xj4sDy2EbwWCnJLFvL4BxJRGpxKB9gR
 aHZmEa83ZOBYPz3fcbosJWlKSd3hQ+NbtOy/nk+cvalclQhpwQz8jma6pjNujLoE
 eFzvvaPi7776STrRHjMSJYc4wzfTOFsOy3cI9m8rinqjcb8KdjqPt04oSiVlNSJZ
 DyepQiZqvbVOgZCSK5HnV6/E1i24fpWMJVMMgeRvrlt+3C9nll12EgV/M6eTpRTH
 0lYX0vYQ8MuuX/ObSUv5l3qYqSx7sf4jfPM0iW4XYruE3a8Tb5UpoRXxL5HUkLhJ
 B6R0dhy/VEC2HU0A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3e8c0d58
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:39:56 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id n46so1700362otb.9
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 09:44:04 -0800 (PST)
X-Gm-Message-State: AGRZ1gIrP2nIaBgh7NSuIT6sfndjoCARlK2t5QekQ0Zqt5D8FDMhSsR9
 Dwb3CcflZvmBuhxk7ArBNSALp74DYifVoYhQW70=
X-Google-Smtp-Source: AJdET5fEYF5pz6n64RZ+mVlq1vEQmIP3/GvB7mL4nyh1az68S0wY4WZkAccYqhYQ3ezTkQ4SVdwPvJxjPp+klA4OB0A=
X-Received: by 2002:a9d:837:: with SMTP id 52mr11047807oty.143.1541353443958; 
 Sun, 04 Nov 2018 09:44:03 -0800 (PST)
MIME-Version: 1.0
References: <CAD6UttB+_G4RY-TwyJ7w6rX-wKqqRqds0B9hMVvFPfjNHvwtgg@mail.gmail.com>
 <CANO=1yKaU=8wkaSZffR7qb3EQwHUcUWbPb6-2zLQ0YZoAkpjFQ@mail.gmail.com>
In-Reply-To: <CANO=1yKaU=8wkaSZffR7qb3EQwHUcUWbPb6-2zLQ0YZoAkpjFQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 4 Nov 2018 18:43:53 +0100
X-Gmail-Original-Message-ID: <CAHmME9r9DGqNB=VjVxWok-n1s8vx7h70aBR1eTqYRsc1chgiOA@mail.gmail.com>
Message-ID: <CAHmME9r9DGqNB=VjVxWok-n1s8vx7h70aBR1eTqYRsc1chgiOA@mail.gmail.com>
Subject: Re: Google Play can't Download through Kernel module backend
To: Tushar Pankaj <tushar.s.pankaj@gmail.com>
Cc: love4taylor.me@gmail.com,
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

On Sun, Nov 4, 2018 at 6:21 PM Tushar Pankaj <tushar.s.pankaj@gmail.com> wrote:
>
>  when I'm connected via the kernel module, HTTPS has issues (but nothing else).

HTTPS _in general_ or just HTTPS as used by the Play Store?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
