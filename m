Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C44CC35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:34:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21BEB22522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:34:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xciQMtpH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21BEB22522
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b92a326;
	Sat, 8 Feb 2020 21:32:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b15f83b
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:31:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e28e5cf
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:31:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee884392
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=B8y+6Sl+cmkz+70gmKF7EWJhNPI=; b=xciQMt
 pH73NYwfmxgksrxHW7AY7N/cqdExDP8wKaEy6iqznZ16FBeKm4L2OcUfQrzfhHKv
 nW6OSWCgq8lUZYnXPbzs6WF9h0RdiVxp8id5pW8RKwIlE0dci7XFvFcTEmNnU07Y
 T3Js05THj91FpXi0Vw2UKYH2X+ULh9pSKfmhIwSlil9nvKQCUHGYc62CFaNUFbQ6
 PGec0v9YHpOVleuhMVffRXdWe/uddI6G1CGW7KR9oZ4rWIvOdN4qkuTjhCJayCSk
 DRocAsIXweSosFDNQx9ccAztAxgSlf6A3jja+QSLDwk6x3AN3+YjB3L80GOiobC4
 U2Wx2wZOK4hjf1rg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5cd90c83
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:31:58 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id i1so5590534oie.8
 for <wireguard@lists.zx2c4.com>; Sat, 08 Feb 2020 13:33:21 -0800 (PST)
X-Gm-Message-State: APjAAAU8ty1CRCvzRxajDWJFMwZixJ053HI10ibEAtMhyjd5igz+EtiV
 GPisPLcKJKzCqU3DEXnFTQkP7K6OiW7pDNl3jGk=
X-Google-Smtp-Source: APXvYqxtSwa84iL5bj4RfTddri64+Lw17UOqPLK4VWJMW55N+GDKL+AjAFdZikYHfPDbotqSTCY+6Lj84Ek85zoHMXQ=
X-Received: by 2002:aca:815:: with SMTP id 21mr6510269oii.52.1581197600436;
 Sat, 08 Feb 2020 13:33:20 -0800 (PST)
MIME-Version: 1.0
References: <CA+NJmkessNRmWxxST5tZSijVJU4QZevibKZ2XbXEWRCUty54PQ@mail.gmail.com>
In-Reply-To: <CA+NJmkessNRmWxxST5tZSijVJU4QZevibKZ2XbXEWRCUty54PQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 8 Feb 2020 22:33:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9qF6hMLctferUuRr-iASHhhM_DkyW-P3wGJL_qOUk0rFw@mail.gmail.com>
Message-ID: <CAHmME9qF6hMLctferUuRr-iASHhhM_DkyW-P3wGJL_qOUk0rFw@mail.gmail.com>
Subject: Re: Minor bugs in the sample script for ns-routing
To: Isaac Nickaein <nickaein.i@gmail.com>
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

On Sat, Feb 8, 2020 at 10:28 PM Isaac Nickaein <nickaein.i@gmail.com> wrote:
>
> The sample script provided at "Routing and Network Namespace
> Intergration" page seems to have a few bugs, at least on Ubuntu 19.10:
>
> 1. The execi command seems to have an extra "exec" at the beginning. Instead of:
>
> exec ip netns exec physical sudo -E -u \#${SUDO_UID:-$(id -u)} -g
> \#${SUDO_GID:-$(id -g)} -- "$@"
>
> It should say:
>
> ip netns exec physical sudo -E -u \#${SUDO_UID:-$(id -u)} -g
> \#${SUDO_GID:-$(id -g)} -- "$@"

No. The intent is that the ip process replaces the bash process
without fork(2)+wait(2), via execve(2).

> 2. The "shift" command should be moved into "execi" function.

Why? What does that accomplish? The structure is that the subcommands
inherit their arguments as though they've been called directly.

> 3. dhcpd seems to be replaced by dhclient. It would be nice if the
> script set it (and other configurations) as a variable, e.g. to make
> it easier for user to adopt the script:
>
> DHCP_DAEMON=dhcpd
> WG_IFACE=wgvpn0
> WLAN_IFACE=wlan0
> WLAN_PHY=phy0

You're free to reorganize this to work with any network daemon you
won't. For most users, dhcpcd+wpa_supplicant probably doesn't describe
their network setup, since most folks are in the habit of using large
management tools.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
