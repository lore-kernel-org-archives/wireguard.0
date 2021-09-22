Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CACC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 23:54:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F34611C4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 23:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89F34611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=meshify.app
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9df99671;
	Wed, 22 Sep 2021 23:54:15 +0000 (UTC)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 66995d5d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 23:54:11 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id q81so12266595qke.5
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 16:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=meshify-app.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+2iyyQRLW5LEuptildtk0lIePL6MnegWQKpIQCR9uYU=;
 b=RN4uYQ/OgZRt5xqT55jN8qMgoySXW7AzF8AFdoTQ3jariNRfJrm7iHFUWGeQKJ0VyB
 yVUDD92aL2iF2Q0GkwYkwRnlwhbzgEOeP4wRFyrYod8uH51oFO/FreGRxFM/EG+Z2iSP
 un7TrnT58UaA+co14biJLGBok7AIaYqBzF7O7OFZevDC3AljPKUz+KBAtOqoEzZH5B2m
 ikP2HDiCHed0IR6WIifGUPJS4tpLuqyAUGmrDdNNLF8B9P34zQX0eCnoHmnlNbrTVt2p
 N++Ngd5GFkkhXg4KhsmOHyD/5lcn2KVnFV6tvXdn9F0Dwx6iR/G35LfpbuJIBfC9OJVU
 nMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+2iyyQRLW5LEuptildtk0lIePL6MnegWQKpIQCR9uYU=;
 b=TRZqQoFdFEN8Z//jTpOZuzeUDM7EpAI01Qw5Ezxb2lZbUWN7dw9jbhvsTNgDZOcO3r
 wpriT2bSOPRFeJ3w1A0alFwqzvy3Wum4nI44kid+YoXJody982EKjTZshnZazoyne/4C
 YRoCEVdNrP/JojWXrzwMxp1n9XRFey3qtwF2ursExByvYudRA8joOlCCZ9NSJgGGanpd
 b7zocvwWm4xKfuGc3+dpRBj6J1djZrSu52yiaLZs6dXiqB5CQveuq+JHtYDYoh/+cr/5
 G+2gM0g3DdJKWaznpWisVprUMBlOl6J6f4ZR7JQEW2rhTIVkMnWn19OtajRoye4cGoNu
 8ciA==
X-Gm-Message-State: AOAM53159ARD5l3sOclEx6hVNSZtxZpfnNuqfu4YeoX1g0iojZvz5vsT
 q7+9NOgfWA9OroXjyfSgiJu5Vkj9a0B7pDHtU16SAw==
X-Google-Smtp-Source: ABdhPJxkVVJKqEjn97HzwWGCa2RWw4C+hq2gE/kWXKHmV6B/u6XSMW58df+5NM8r4imNfbypx1TBgLmeegJW+t83DZM=
X-Received: by 2002:a37:2d04:: with SMTP id t4mr2093532qkh.160.1632354850584; 
 Wed, 22 Sep 2021 16:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <B096024B-E199-462E-978C-73B2C1D4C8D2@anatoli.ws>
 <CAHmME9pjuin565o4Ckmj2rHEhO9bAd4uaGarMA9SAMmP=85_wQ@mail.gmail.com>
 <23be4054-af4f-b9a2-c01f-6e6dc33096a4@anatoli.ws>
In-Reply-To: <23be4054-af4f-b9a2-c01f-6e6dc33096a4@anatoli.ws>
From: Alan Graham <alan@meshify.app>
Date: Wed, 22 Sep 2021 16:53:59 -0700
Message-ID: <CAMeHLtyiG_nKz2BAi+_bD4HBZu-CCVb8N7nqBn6H42rZ5QKv0w@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Anatoli <me@anatoli.ws>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi,

I have an iOS 15 iPhone 12 Pro Max with three tunnels configured.  The
upgrade from 14 to 15 busted the configs as described.  I deleted and
recreated one of the tunnels and it worked fine.  I updated to today's
bits (which appear to have been released in record time).  The tunnel
that I deleted and recreated is still working fine.  The other two
tunnels now have red backgrounds and I can no longer click them to see
the (empty) details like I could in the older build.  Trying to
activate it does not work (it does not, however, rapidly switch
between on and off).  It looks like I can delete them by swiping left
to reveal a delete button, but I can leave them in their current state
for more testing.  I did not have on-demand turned on for any of the
tunnels so I cannot speak to that partially working state.  I have
iCloud keychain on, so that doesn't appear to be a fix/workaround.  I
also have an iPad that I haven't upgraded yet, so I should be able to
test the upgrade path, but I'm not sure these bits resolve the
problem.

Best regards,
Alan

On Wed, Sep 22, 2021 at 4:26 PM Anatoli <me@anatoli.ws> wrote:
>
> Sorry, I replied before I've got your mail about the new version.
>
> This is how the old version was behaving. Haven't tested yet the new version.
> I'll test it and report today or tomorrow.
>
>
> On 22/9/21 19:26, Jason A. Donenfeld wrote:
> > On Wed, Sep 22, 2021 at 4:24 PM Anatoli <me@anatoli.ws> wrote:
> >>
> >> I can confirm that recreating the tunnel from scratch does work. So the problem is that the tunnel settings become corrupted when iOS is upgraded from 13.x / 14.x to 15.0.
> >
> > What are you testing? The new version of the app or the old one? Does
> > the new one corrupt settings or only the old one? Precision is
> > important here.
> >
