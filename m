Return-Path: <SRS0=L39c=CA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDFBC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 19:11:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 550052075E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 19:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="z1J5P5wz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 550052075E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afcc8e79;
	Sat, 22 Aug 2020 18:44:30 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b542d7a5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Aug 2020 18:44:30 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa97a05c
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Aug 2020 18:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=W/gqeTytL2PceQ60AgLbYz2Qks0=; b=z1J5P5
 wzg4apeXthMaV5GimLv1v3FNpMjVX/Kg6w/ZfujYGu2YnVagTCzNQ1Tvi7g/+78q
 5d5U8CUWIlQmQFvsaw85xiEmWDpAcrGCsVi+FVl8psn0tmiNuo0cvTEepsa8uBBE
 +9oWvknkcUJTbjSfoTUCOHCUT9bMPedkW7Rsa8L2hRGIEPHlY8QpwEtfyPYTGZ/n
 MzprdA8KKrPStQh73Wh7GE8I1F7Rf1m5M+wmKc7+1rFGOUzcZ1gnR1/GZtbszLEd
 nhP/ihAamZUfqnQ3FmGMv1mJlaeX0MOOczbsS16KxZoD05CzOJ6N572E95jcKJLe
 IdVXdvLeYZN762LQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e325c6de
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Aug 2020 18:44:29 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id r13so4129636iln.0
 for <wireguard@lists.zx2c4.com>; Sat, 22 Aug 2020 12:11:13 -0700 (PDT)
X-Gm-Message-State: AOAM5328P8QMIc5puYJAZVHIro9RzB4Dhbj38U/FETkZRzu7eB9DyQhz
 sCWLO7/HWj7orJQ1o1oIqU0BXNjMBO5lfuufe+4=
X-Google-Smtp-Source: ABdhPJz8OvkbWbCiKyZf2zXy1Mn5FVQ1+yAR2Btvyz5XVXg7k2osQWJHhL+eg+FfwVQ3S9UthSbU+0LJ9sNiqAe7p/U=
X-Received: by 2002:a92:b74a:: with SMTP id c10mr7399677ilm.231.1598123472675; 
 Sat, 22 Aug 2020 12:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <e120a0a3-2170-4d2f-eaf5-878b09a0ab61@posteo.de>
In-Reply-To: <e120a0a3-2170-4d2f-eaf5-878b09a0ab61@posteo.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 22 Aug 2020 21:11:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9pC+M1Wh-NCa5XAUAVFhT5hnJA2Rdnfj+DWdmxk5S5rLA@mail.gmail.com>
Message-ID: <CAHmME9pC+M1Wh-NCa5XAUAVFhT5hnJA2Rdnfj+DWdmxk5S5rLA@mail.gmail.com>
Subject: Re: Invalid handshake initiation after peer reboot: bug?
To: Eicke Herbertz <wolletd@posteo.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Eicke,

It could be a customer's network is mangling packets or something,
though that seems least likely. More probably, if you're dealing with
tiny devices, might it be that they don't have a real time clock
battery? WireGuard relies on a timestamp counter always moving
forward. It doesn't have to be accurate, but it just can't move
backwards. So you might try syncing your OpenWRT router to some
network time server of sorts before initiating a WireGuard handshake.

Jason
