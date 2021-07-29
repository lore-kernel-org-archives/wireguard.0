Return-Path: <SRS0=TwOG=MV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37991C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Jul 2021 11:03:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AA2360EC0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 29 Jul 2021 11:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AA2360EC0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06254e56;
	Thu, 29 Jul 2021 11:01:08 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1b8c6b6b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jul 2021 11:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1627556461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jzWAUFkEKEpZOAxXO3gs3E9eAW0QzNhKev6PNEKS4LU=;
 b=WhRtTxiOA6hAFdzuY9s2Dy0XzcdpK+r0a00OComL5v9wdVaHRBE9yIlrpoBj3O++m/y9Jw
 Ve87e/QfbN6s5O9PNCzK16WVl2VP7/R4uob45gGgVLLvxWmL4nq3m5meESjOh5Ic2MOv3y
 LFBio6vFoRPFHnbjaZXe8w3eeq/q0T4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2c6eb572
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jul 2021 11:01:00 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id w17so9493837ybl.11
 for <wireguard@lists.zx2c4.com>; Thu, 29 Jul 2021 04:01:00 -0700 (PDT)
X-Gm-Message-State: AOAM533NVN3YX71TcGGqLxPLD9hFBoJlseoYUqQr1IeV3GDI5vdJ+9EV
 8soOl/MR8SUiwgx51gdm9/HQseYzUPOqYzIoByw=
X-Google-Smtp-Source: ABdhPJxmxdWXQQByoB3aOoOfOvrquXRt2dzB8xa0bO0sp1by/mJQTduIcE3IIRgqLCF5FxnegBMRNv1nCMYs6T1gSoA=
X-Received: by 2002:a25:be09:: with SMTP id h9mr6180322ybk.239.1627556459765; 
 Thu, 29 Jul 2021 04:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
In-Reply-To: <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 29 Jul 2021 13:00:48 +0200
X-Gmail-Original-Message-ID: <CAHmME9r5kecTj1iBGyqjvNRKsHZPRrXmN+fDXkaX3y==VPoMqA@mail.gmail.com>
Message-ID: <CAHmME9r5kecTj1iBGyqjvNRKsHZPRrXmN+fDXkaX3y==VPoMqA@mail.gmail.com>
Subject: Re: Problems with Windows client over PulseSecure VPN
To: Peter Whisker <peter.whisker@gmail.com>,
 Heiko Kendziorra <kendziorra@dresearch-fe.de>, 
 Christopher Ng <facboy@gmail.com>
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

Hi Peter, Heiko, Christopher, and others,

An update on:

> I had a strange idea for how to fix this without requiring
> recompilation or removal of that code.
>
> 1) Enable DangerousScriptExecution:
> https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md#hklmsoftwarewireguarddangerousscriptexecution
>
> 2) Add a PostUp line to your [Interface] section:
>
> PostUp = wg set %WIREGUARD_TUNNEL_NAME% listen-port 0

I just wanted to let you know that this problem has been entirely
fixed (I think?) in the "WireGuardNT" kernel driver project I've been
working on (and haven't yet announced aside from development
screenshots on Twitter), and therefore the above steps will no longer
be necessary. When that ships as part of the v0.4 series of the normal
wireguard-windows client, you won't need the "listen-port 0" hack
anymore, as the kernel driver uses a more clever trick than the one
used by wireguard-go. So please do watch this mailing list in the next
few weeks for an announcement of that project, as I'll be very
interested in some real world tests and confirmation of the fix.

Thanks,
Jason
