Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B1DC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 03:58:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E0B2196F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 03:58:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Zp/J2M6l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E0B2196F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c44bc7f7;
	Sun, 17 Feb 2019 03:49:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45a1177a
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 03:49:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44f983cd
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 03:49:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 594166cc
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 03:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=FNva1vArpsAWJUVd4znwFOrHwCg=; b=Zp/J2M
 6l+GdoHcG+UNYT6T/hU/ynIW1owKvpdGZpTl3dRchg0n3JbqOVuvspcHyKN3fXAh
 HK3YWoTJy2hyxHTKANjEUJ920S1x0HEepbbH3R4fAYdEHWfzgLFlhAMcx+CCg6Fi
 wBB+Ep6DSpsXcawTMWqGqyw70EBPunazIoE2+igHBRT4NDKjuqztjNZlD6MxkEe/
 VAC5jetRTFQrqthuu57PaHXYYvPFLF6tLIpU2V6Hivn3wB7Fpl6XzE1tmHOnNoUb
 XlfuGLeVBFkddubQYcgrUSxDd0C/bp4kCwDmkfMOoFGFogFJPfWzqCWz3sGc6XoG
 SGE+C4Cpnw5Wcu8g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 32c4648d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 03:40:18 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 98so23144170oty.1
 for <wireguard@lists.zx2c4.com>; Sat, 16 Feb 2019 19:57:47 -0800 (PST)
X-Gm-Message-State: AHQUAuZJAvsJl5oGOuLScIJ8umra/q94F9+DosdioTwYUzTdkbz23kBa
 Xc9ld51XuBMzUV2TJyc3DFGLt/KMNCvG3/0dtNo=
X-Google-Smtp-Source: AHgI3Ibh2/TQNn2rrKvW/zG/gpJu0aK/xPchD+h9HMvDqqAAff+oZLfgTLFh2fA28uM9sMHR+VG6b801atxyUqa05F0=
X-Received: by 2002:aca:4506:: with SMTP id s6mr10629725oia.115.1550375866564; 
 Sat, 16 Feb 2019 19:57:46 -0800 (PST)
MIME-Version: 1.0
References: <71ef4a71-19fe-8d4e-c3a2-f704ad8e8b67@anatoli.ws>
 <CAHmME9oWg6E0PyQP0-uTC-WfN4gkYhUrd+gYTT390CnfT8ufZw@mail.gmail.com>
 <4fa3479d-bb82-033f-c177-3269ddb8f011@anatoli.ws>
In-Reply-To: <4fa3479d-bb82-033f-c177-3269ddb8f011@anatoli.ws>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 17 Feb 2019 04:57:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9q_-Vwij4YacxF4utTk7mVZ3HvKSexysj45TEwGKMUm-Q@mail.gmail.com>
Message-ID: <CAHmME9q_-Vwij4YacxF4utTk7mVZ3HvKSexysj45TEwGKMUm-Q@mail.gmail.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference at ..
 (linux 3.13)
To: Anatoli <me@anatoli.ws>
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

Hi Anatoli,

Thanks for the .ko. I've fixed the compat backport here:

https://git.zx2c4.com/WireGuard/commit/?id=e7348a19a45f4f1311df6266b654c7fc8d50f976

You can either apply that yourself, wait for a new snapshot, or reenable IPv6.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
