Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2F6C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 20:41:13 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2DBB64E24
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 20:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2DBB64E24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openziti.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af5f1563;
	Thu, 25 Feb 2021 20:41:10 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8a31b619
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 20:41:07 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o22so5575011pjs.1
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 12:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:thread-index:date:message-id
 :subject:to;
 bh=mtfOzOgRLPZmf5Pndvn6xefgUit1NeWfV6T2En6Fxwo=;
 b=tmBYtoGOxbXnGGoCDK6Y17hUCSX/zO4MnEhR9TMy3m3y6LX6kEge5RIjWL2Bl+VQF+
 MN0F0VdGwaXMGWkcPKShTQ0VWuUgCRY6H6ymzFVX40KGL2LcuhXc8xRrIp13CzMKW2Ht
 ikDr9C91GT4XPYCAaOjXqoiKklFiMoodypUInwZ9/ikZFxCvfuhUcTZBRFLdWsPXRIOa
 /qkqHOx60Yr6Cq5gDRoUkex0g40hUYb/S9ACpfjdrMv8ndDKYdiQAZfKPGI/HNBAPy9M
 3axSn8CaPrSBndC9uvyJpgkqWe/XpJIvylYOZllgCdEiqC7zEA1UdfgTT1zqt2Q6rTlb
 rzFw==
X-Gm-Message-State: AOAM533ryG2nfPDKwh6OEeXtQQZGgLU2Dm38v1kN5x/MSN7gEEKtNAzu
 r1y6NOvwAj9xQ0rjgJWs/w3Y8Y7TZpCUGw==
X-Google-Smtp-Source: ABdhPJycw9MiJlV5n39fzKELA/a8YUsYINNhLoww++goYj8jrz1JzFQofF+EDJQ6/JtD9GW4TU0GMQ==
X-Received: by 2002:a17:902:e84e:b029:e3:e730:d907 with SMTP id
 t14-20020a170902e84eb02900e3e730d907mr4762277plg.38.1614285665848; 
 Thu, 25 Feb 2021 12:41:05 -0800 (PST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com.
 [209.85.216.43])
 by smtp.gmail.com with ESMTPSA id h28sm3407029pgn.21.2021.02.25.12.41.05
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 12:41:05 -0800 (PST)
Received: by mail-pj1-f43.google.com with SMTP id t9so4233144pjl.5
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 12:41:05 -0800 (PST)
X-Received: by 2002:a17:902:8a96:b029:e2:fecd:e3a3 with SMTP id
 p22-20020a1709028a96b02900e2fecde3a3mr4666295plo.79.1614285665340; Thu, 25
 Feb 2021 12:41:05 -0800 (PST)
From: Clint Dovholuk <clint@openziti.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcLtnmGA6fv4gpoQxiGJckKL4ktDg==
Date: Thu, 25 Feb 2021 15:41:03 -0500
X-Gmail-Original-Message-ID: <a477c3a212d0566b76618848651827bd@mail.gmail.com>
Message-ID: <a477c3a212d0566b76618848651827bd@mail.gmail.com>
Subject: Wintun releases notification - or 'latest' option?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Any chance you'd consider sending an email to the list when wintun gets an
update?  Right now there's no great way for me to get the 'latest'. The code
changes infrequently so it's not a huge deal but it'd be fantastic to be
notified when a new release is out.

Alternatively some form of redirect from say
https://www.wintun.net/builds/latest.zip -->
https://www.wintun.net/builds/wintun-0.10.2.zip would be really nice?

Something to consider, maybe? :)

Thanks
-Clint
