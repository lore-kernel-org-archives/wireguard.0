Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77729C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 13:03:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07DA2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 13:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="EbWCPq/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07DA2082F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b91b96fd;
	Sun, 25 Aug 2019 13:03:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 750774d7
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 13:03:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id beff530b
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 13:03:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acb8793a
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=LtvaWo
 Za2atBLIgMqVYgDPLBpwQ=; b=EbWCPq/lnqtoVKaDmACGtYUTo7iXpW5Ay9JKq1
 +Fy16inLBCIFXmYMbqoxngCvFeWFwu5dCJ2FGaFL34O9qvN5476wDiFWgklwYFEL
 ecuOBMknv5Yl3F9opCwJwpFVVdo+eFHeawn6ZsIi8gMX5P81e+1NSwIMYM/qITQc
 WnC5+esLAKjA9mWIf/2tm7raxwCFM8Hf5hoSHKWMSlDNc2KFWW8r0J+ngvHAi4qV
 KT/Vu1yp2DGaqQSQ0NWtEYPWgrQeFqCJjG2qoI1NwYxp94/SHQ6hTOhMB9fnWNsx
 0aDRrz3158sKyvBeFu6/iSzE995Ob1AyufsNkSRs9bNP7SjQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a7288fe
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 12:21:39 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id f17so12833054otq.4
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 06:03:26 -0700 (PDT)
X-Gm-Message-State: APjAAAWV8MxLLBl7TdsJ1zYkwy+axHPO7uuoj7ZW9FNs73+TW6wNaL+n
 qY8ga4LNd05oh0dyw5VjH2IGzzVW15ROto7AuFs=
X-Google-Smtp-Source: APXvYqxQt+AEDdlaFdXbaKndBDTKuRljRBAkmDynW9NBPulB4+gBxaGoYYIzq7i1RWxTix4fuPGtLH8p9xxG9S7hIkM=
X-Received: by 2002:a9d:66d8:: with SMTP id t24mr11817660otm.52.1566738205834; 
 Sun, 25 Aug 2019 06:03:25 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 07:03:15 -0600
X-Gmail-Original-Message-ID: <CAHmME9oK37++in5rr7QR_8Q-NsbdGdU=aBmYXYBdYbg03pOVDg@mail.gmail.com>
Message-ID: <CAHmME9oK37++in5rr7QR_8Q-NsbdGdU=aBmYXYBdYbg03pOVDg@mail.gmail.com>
Subject: repositories and contributions
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey folks,

As WireGuard has grown, so has the number of repositories,
maintainers, and contribution guidelines. I put together a unified
list yesterday that should help newcomers make sense of what we're up
to:

https://www.wireguard.com/repositories/

Let me know if there's something in there we've left out.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
