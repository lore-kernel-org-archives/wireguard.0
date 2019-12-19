Return-Path: <SRS0=Cs4w=2J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BC2C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:24:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEB8121D7D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:24:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="a6JHb4PB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEB8121D7D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 290aaeab;
	Thu, 19 Dec 2019 01:23:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 940a8371
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 01:23:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bab772ca
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 01:23:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1c27960
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 00:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Nn7FjLA4niwi06x5QZfExgR7Z+s=; b=a6JHb4
 PBHybBhbKSOj2EhnZ6afyLIuDYDZzgSs0XqdiuIfPDIAgJ8/wjzYkJQ1+BaOmqa5
 Oem9ZeGhwS+iJ0DvJ6pX9gBlhyomyLIRLETVgDoJLU4U5i9etGXYdYmJ/ZfbYasd
 8cxmHbZh8bF9hTkDI343r+hp57fplStO5PKui2P24+nwYWsVlZGuTAmaglzvAbIB
 xM+jRDkfUsa4R8IuMO/QaoxZcNPbgcfHBbinb2szuyQVFmiAvSQt1oIRKDsSdvoo
 A+hgOtdlRWHO3C0mmL/2nK13Ir89jJsAIKFIwgAycCpTxfzKwMjb+SA+nYX+SSqp
 1sAjE7JfcRD6Ph1g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 24b05a9e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2019 00:27:09 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id k14so4897635otn.4
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2019 17:23:47 -0800 (PST)
X-Gm-Message-State: APjAAAVl5E3b6IfwtzF8gJRET19j39HQcb3BWB2AAtPIhQwdMoF+QNy1
 ZXrQtjqz7FYPdChhtqpLzZRHeJfJ4pOz1jxeScA=
X-Google-Smtp-Source: APXvYqxXl2GEWJ7GXMxOsxM1LfPO3BkW7Bpbpq+bQlvDO4ALDze0dEde3+MGX97IAlBAi/FSwTNWNNXxjAtGy7nMrvw=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr5963819ota.52.1576718627253; 
 Wed, 18 Dec 2019 17:23:47 -0800 (PST)
MIME-Version: 1.0
References: <4844fb6f08514ebaa39511d00e9cf9dd@Shepherd.axinom.de>
In-Reply-To: <4844fb6f08514ebaa39511d00e9cf9dd@Shepherd.axinom.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 19 Dec 2019 02:23:36 +0100
X-Gmail-Original-Message-ID: <CAHmME9ra-0GQ8VVTmd1XSyNCrR9iohHAH+U6Oexs6vRrmwTgYg@mail.gmail.com>
Message-ID: <CAHmME9ra-0GQ8VVTmd1XSyNCrR9iohHAH+U6Oexs6vRrmwTgYg@mail.gmail.com>
Subject: Re: Windows tunnel shows established but traffic sometimes does not
 move after recycling tunnel
To: Sander Saares <saares@axinom.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

I suspect the reason is because WireGuard uses a fresh interface each
time, so you have to reenable forwarding after the interface comes up.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
