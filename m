Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FD1C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 11:42:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62F162082A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 11:42:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYphCM0a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62F162082A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fdaa456;
	Sun, 4 Nov 2018 11:38:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5f59a24
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 11:37:57 +0000 (UTC)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79f973b8
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 11:37:57 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id f24so5510672otl.5
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 03:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xmZSGUdrgeZZb9gl8czyDx8Ke/te84kwvCnpIZumBO0=;
 b=pYphCM0aB+CxRAl8TYpDVYgy475dNkl+RcoJjFKrtzB2EHDUQKjw15vtiZIOn9q0pV
 jbUc459EPNyZ96Unbg/4l2mqKon6L/NXIWqCWCgrms+sP4hExwd8AlLyGiFT1h4Pawb1
 crGjIRGCYfnsvV/5lCyU5epYkQEXNDXz38DCcoziW+Gb8gWO4mFEMdidw4738v91uu80
 zNUglXUnEnfRoxAUMydlYARkkpBv+59XfflwIilvO35KogaQZ3O4OycVQgVbWMtGxS8X
 wbIp943TpZFvJUdQFeQlMZI8sorDf/+yLoHQD7vF9ipOachDx/dk5xxKIbqGPgme97IM
 288w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xmZSGUdrgeZZb9gl8czyDx8Ke/te84kwvCnpIZumBO0=;
 b=j44aZOzjIo4Uhu5QIg8cVJxDBvzvZ85Rw4Qm0PNEUOI/TpkkxteUCNUWUwQ3uxmRC8
 GAdIzM4N8GHwE27ctPCs8tQMX99pMyAIizbtbUhoa1hCABW0yMUth5pwNQbY+BvACW3W
 UMWHJW9EzNRVmpE7qPVJsWzQedC88L0V1ZzASovPWaPPCOJ1b6g419lm/1APjIxEPDgj
 xJMBKLt5/+1K4oeiEMwC16ok2UKZ8y6z8RiQ7RqME9u38CevEgVlEtqIQzQzbz1PdzwM
 f/MtQJHh+muawFXrRnUc4cql4zcHZQMkbR0fA++iY8rplMzvMl0DDFnroceYwtNcvriZ
 Xwbw==
X-Gm-Message-State: AGRZ1gItfsItnOMQkrGUMfWf+zBk8zMoAYKKpa9p6HKoG7Pa//Q7LyPa
 pOkca+IpiNTWQUOzCF3c322ZVS/AbZBTnFdjBwM=
X-Google-Smtp-Source: AJdET5fS7wqCZsOZWUyzQbguF38ES+j7GLxv2sTnnTbxBjMxNtsqXWkWfLBtAipQUr00e5PlZ2RA5Q8EPDrfElcsit4=
X-Received: by 2002:a9d:3cae:: with SMTP id z43mr11305050otc.159.1541331721968; 
 Sun, 04 Nov 2018 03:42:01 -0800 (PST)
MIME-Version: 1.0
References: <22f7e0cd-b0cd-aa6b-29dc-18ef2d689c2b@gmail.com>
In-Reply-To: <22f7e0cd-b0cd-aa6b-29dc-18ef2d689c2b@gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Sun, 4 Nov 2018 12:41:49 +0100
Message-ID: <CAKXLc7e5ddvAskcDyFON=qapYfdKjd2rLYFnaoxrE1Y5yh=Vew@mail.gmail.com>
Subject: Re: match on wg packets and redirect
To: adrian.sev@gmail.com
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

On Sun, Nov 4, 2018 at 10:10 AM Adrian Sevcenco <adrian.sev@gmail.com> wrote:
>
> Hi! Is there a way to use iptables to match wireguard packets incoming
> on 443 and the redirect them to the actual port?
>
> In many hotels/hostels and other free wifi it seems that only 80+443 is
> allowed but amazingly both tcp and udp...
>
Should be, just don't try to match "wg packets", match instead your
(other) endpoint IP address and port.

And why would you even need to do that?
If you have an endpoint (in cloud, home, etc.) with address 1.2.3.4
and port 443, just connect to that, no iptables should be needed.

And you can still use the same ip to host a https website (it uses tcp) :^D

Cheers,
Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
