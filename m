Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A297C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 00:27:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8BA23B99
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 00:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8BA23B99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 745823dc;
	Sat, 19 Dec 2020 00:18:25 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 20834050
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 18:46:56 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id w16so1877578pga.9
 for <wireguard@lists.zx2c4.com>; Fri, 18 Dec 2020 10:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=7hK4GPLtukbOCfT/rDRC8KmX9rwvhWhhgUuFbR5smhA=;
 b=o35dGkcni+p/YbPtfFUEU1BfeVfntnl/ch/h53Ia+phPwGKNcCLSL+QtqAjOPkuxh2
 5V4DAYcZ0aBxGB4FZL3tfpqHEYlUwI6AWBfSmwm9pcJ3TCGC6s7/HZiuWTq8B00qOKLP
 OAWb3p9JuPBjF3oX/2tgoM1FTYswQDUYPpwTeVtD3bbWbFf7kJQQh+KoQow/9o4N4ZUh
 GQS5DrFGPIRvtsa6FN59L0FHu6dsLxWAfbSYYYtqT0WtndDrJNd7zDdCgnq7spWuB/iY
 Su8Hnb5XqsOe8DoYqwSPJ0Eg63MfIcvWZfnPJ6S2TA5AZz+9DSm/FSHN/qJTi+EJItu+
 ufiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=7hK4GPLtukbOCfT/rDRC8KmX9rwvhWhhgUuFbR5smhA=;
 b=fPbV229AbbLbBbTQvDfHwBLqeFG37hAPYjwp445F61ntq9xig1874hgMKHJ8mAus7d
 dUbHebP0TtSVdG3P0GhRH8ejY9l86xD5nZeFloAGy1QcsYd9oQlIPjfCNsuLn+DDvtdS
 bUum3OIKrtMqdxlbmVGh0iHEab0RRZmK0t7FUK4nspq1o+UOdarQ/nKcLC2xpSCvyWc9
 ARsiOFA5TSFPPe2mNICJZYmEo91pHtUdCEBDblLQgnl9Tjuu5j378t7SKqBD182zR3cy
 GwGBFeacwPlgdKGaEFDaIMqelzVBxhf3rphzqRMt+RTZ63GL3+U2wYlzFYqqoxsK7GeW
 JGgg==
X-Gm-Message-State: AOAM530XTCWb/7jBLhFVPrgJEuWcV2B+mPnQBnURkxNr5rrknVNIsFcF
 lP1jeITHqxN9mLoFbDCh4ciqgY0oyUFey/oF0WlRpc4fVhJ4YsR3
X-Google-Smtp-Source: ABdhPJxPQsajfic+g9OsiSj99Mo+ebhN4HQbfycBSc2wJP3itqU3x3+dkZNiuLSlP8B3pw27JPqe5rpoMvogjaXaMD4=
X-Received: by 2002:a63:a516:: with SMTP id n22mr5271156pgf.125.1608317735677; 
 Fri, 18 Dec 2020 10:55:35 -0800 (PST)
MIME-Version: 1.0
References: <CAPvFRCvvTkOafJtHZKv-3BBrgnCv6WJHNCGgfPhmN7ha7Rk6ng@mail.gmail.com>
In-Reply-To: <CAPvFRCvvTkOafJtHZKv-3BBrgnCv6WJHNCGgfPhmN7ha7Rk6ng@mail.gmail.com>
From: Yuchen Lin <kloselyc@gmail.com>
Date: Fri, 18 Dec 2020 10:55:24 -0800
Message-ID: <CAPvFRCur4H9UeXVuh8tFs5HMX_Ka8_iUiQD=d_H4A=C2Wsw1HA@mail.gmail.com>
Subject: Re: [WireGuard] config file works on iOS app but not on Mac app
 (wireguard-apple)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Dec 2020 01:18:24 +0100
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

Hi, Wireguard development team members,

How is your day so far?

This is Yuchen Lin and I am currently working on a project based on
your open-source project wireguard-apple.

The code is well structured, easy to understand, and works really
well, except for one issue. When I was trying to connect to an actual
network with a config file, the iOS app I built works fine. But on the
macOS App, the config file could not be activated and giving me the
error saying I need to make sure I am connected to the internet, which
I am certain it is connected.

I am on the latest commit for 12-07-2020 (UI: macOS: Fix UTF-8 and
UTF-16 conversions in highlighter code 9269c7c Andrej Mihajlov
<and@mullvad.net> Dec 17, 2020 at 8:36 AM). Is there any possibility
that you might know which direction I should digger deeper to solve
this issue?

The following log is the log when the fail activation happens.

2020-12-17 10:12:00.691632-0800 WireGuard[24714:5440757] Metal API
Validation Enabled

2020-12-17 10:12:05.061536-0800 WireGuard[24714:5440757]
startActivation: Entering (tunnel: testsite)

2020-12-17 10:12:05.062793-0800 WireGuard[24714:5440757]
startActivation: Starting tunnel

2020-12-17 10:12:05.063050-0800 WireGuard[24714:5440757]
startActivation: Success

2020-12-17 10:12:05.067607-0800 WireGuard[24714:5440757] Tunnel
'testsite' connection status changed to 'connecting'

2020-12-17 10:12:05.080159-0800 WireGuard[24714:5440757] Tunnel
'testsite' connection status changed to 'disconnected'

2020-12-17 10:12:07.932564-0800 WireGuard[24714:5440757]
startActivation: Entering (tunnel: testsite)

2020-12-17 10:12:07.933307-0800 WireGuard[24714:5440757]
startActivation: Starting tunnel

2020-12-17 10:12:07.933513-0800 WireGuard[24714:5440757]
startActivation: Success

2020-12-17 10:12:07.936723-0800 WireGuard[24714:5440757] Tunnel
'testsite' connection status changed to 'connecting'

2020-12-17 10:12:07.946500-0800 WireGuard[24714:5440757] Tunnel
'testsite' connection status changed to 'disconnected'

2020-12-17 10:12:12.935242-0800 WireGuard[24714:5440757] Status update
notification timeout for tunnel 'testsite'. Tunnel status is now
'disconnected'.


Any help would be really appreciated.
Thanks,

Sincerely,
Yuchen Lin
