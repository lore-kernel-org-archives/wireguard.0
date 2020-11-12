Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586FBC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 13:20:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F9F2085B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 13:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gugod.fr header.i=@gugod.fr header.b="KV8AdEvW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F9F2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gugod.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb826373;
	Thu, 12 Nov 2020 13:15:35 +0000 (UTC)
Received: from mail.localhosting.tech (mail.localhosting.tech [66.70.129.155])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8735d4c4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 13:15:32 +0000 (UTC)
Received: from mail.localhosting.tech (localhost [127.0.0.1])
 by mail.localhosting.tech (OpenSMTPD) with ESMTP id 2497f11c
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 14:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gugod.fr; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=Lb/GyDXnZ
 HRoVtvmchzguxnu/a0=; b=KV8AdEvWGc8zekXUtvTuTff5d4wAaHhPvFElGfxY8
 L4P/u/f1mHRcju1w/etaZ8vQjwce6b9/ceAUfBAbqOZhHlKMd7P4QHuHUg3MlVtP
 TigOXSZd5SNC8FMR7sD7klZ1O+Y1V1uQoOxdF3C6rkNbr5gON5X9Uq7dSv2o0DrP
 DS++geK5lQst0R16Eaakmk3tLfwrQrSNxG45Dk79tdkzmL9n1BxB3IKtZ0GqEKmT
 ScshO5SrwDSLo22llRMA79eT28/b0aByb2d49dNW56yAjJEaW2l+YCrGBb06TMla
 OfdEX18zJhjxlzmiIlq5Z3e6k6kKDzogd6Afa/Oayivgg==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gugod.fr; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=2Dp
 0OVpaZVg3Odx2EUbJUI9h2Sq9v2JGhiEdHrz9a35jHuY8FUdcvwo9KekucFc/DWT
 NVyVLYWX/hyBQq3MxRCOA6AfkbXfY4taUp2ksfMNjXb7PzYoBA8B90i+U2S6LkJA
 ApaYxT5/XdL8rjPX4LQir5qX10+fLfwxtElJFirbgBPbEHJp79amD3wTFFZLidFp
 nJkkEQKsT7lEPTxH/Hpyn00nIy2BKapL7yvgoIM6ZKORT7cP0ui7NB/60hts4Rmd
 hOeGytV3G8XMUDucGtJGbIVTgcPSWZ5KgoPicnpMj1zF1VoU/4hyi3jUXTvQNVdy
 kIRNdA8IY+sMDQoDvPA==
Received: from [192.168.1.133] (<unknown> [193.33.56.42])
 by mail.localhosting.tech (OpenSMTPD) with ESMTPSA id 1fc44133
 (TLSv1.3:AEAD-CHACHA20-POLY1305-SHA256:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 14:19:29 +0100 (CET)
Subject: Re: [ANNOUNCE] Wintun 0.9 Released with Major Usability Improvements
To: wireguard@lists.zx2c4.com
References: <20201109162558.GA2277411@zx2c4.com>
From: Guy Godfroy <guy.godfroy@gugod.fr>
Autocrypt: addr=guy.godfroy@gugod.fr; keydata=
 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
Message-ID: <af4681fe-918e-04e1-1e3f-e1b90428e2bc@gugod.fr>
Date: Thu, 12 Nov 2020 14:19:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109162558.GA2277411@zx2c4.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Just noticed that wintun icon is heavily inspired from french subway
warning message "Don't put yout hands on the door" :-)

Anyway, great job.

Le 09/11/2020 à 17:25, Jason A. Donenfeld a écrit :
> Hi folks,
> 
> Simon and I are very excited to announce the release of Wintun 0.9, the
> release in which Wintun finally becomes easy and enjoyable to use by
> developers. I consider this the most significant release of Wintun yet.
> 
> Webpage: https://www.wintun.net/
> 
> For background: Wintun is a driver for the Windows kernel that enables
> userspace programs to create network tunnels. It's a "/dev/net/tun" of the
> Windows world. We use this for WireGuard. We had investigated OpenVPN's "tap6"
> driver but found it to be a crumbling mess with dubious security, and instead
> endeavored to write a lightweight minimal replacement that obtains extremely
> high speeds using a ring buffer, similar to Linux's io_uring.
> 
> Big Change 1: API Library and Easy Distribution
> -----------------------------------------------
> 
> We used to rely on an obscure Microsoft technology for distributing Wintun,
> called MSI Merge Modules (MSM), in which application writers would bundle the
> signed MSM we provided as part of their MSI installer. This was great in that
> it encapsulated a lot of logic and hid it from developers, but relying on MSM
> was a hassle and precluded the use of Wintun in many non-MSI apps.
> 
> The MSM also would simply make sure the driver was installed, but wouldn't
> provide anything else. It was up to developers to then navigate arcane Windows
> driver instantiation APIs, which are some of the oldest and most obscure to
> use. Then, once installed, developers had to manage a ring and various IOCTLs
> themselves. It all worked -- WireGuard and OpenVPN (after receiving our
> assistance) successfully deployed it -- but it was cumbersome enough that
> nobody else was going to use this.
> 
> With Wintun 0.9, we're changing what we distribute and also providing an easy
> to use API. Rather than shipping MSMs to developers, we now ship a single
> basic boring wintun.dll. This dll hides all of the driver installation and
> adapter instantiation logic, and provides a nice interface for managing
> adapters and shuffling data in and out of the ring buffer. So, application
> developers can now just grab that dll, plop it into their application like
> they would any other dll, and use Wintun without even noticing that it's
> inserting a kernel driver when necessary
> 
> Big Change 2: Support for WOW64 and ARM
> ---------------------------------------
> 
> Windows does not support setupapi.dll and related driver functions on 32-bit
> processes running on 64-bit operating systems. This meant that it was
> impossible for WOW64 processes to use Wintun. Wintun also formerly required
> 64bit addresses, which made the kernel ABI clumsy for WOW64 processes. With
> Wintun 0.9, we now bundle a 64-bit version of Wintun inside 32-bit versions of
> the wintun.dll, and we marshal calls back and forth to an on-demand proxy
> process running on the native architecture.
> 
> Not only do we have this for basic WOW64, but we also have this working for
> Windows' ARM64 emulation of x86 binaries. So you can now run an x86 program on
> ARM64 and wintun.dll will figure out what to do.
> 
> This has big effects for us. Since Go still has not been ported to ARM64, we
> use an ARM build and rely on this new feature of Wintun. This means we should
> have a WireGuard for ARM64 Windows release in the coming week or two.
> 
> Big Change 3: Administrator User Permissions
> --------------------------------------------
> 
> Wintun requires the Local System user. But if you're running as Administrator,
> the wintun.dll library will attempt to do its operations as Local System,
> automatically. This effectively means that normal apps can bundle Wintun now,
> rather than just services.
> 
> 
> Please let us know if you have any questions or feedback. We're certainly
> interested in developer reports on what integrating this is like.
> 
> - The API reference is available online:
>   https://git.zx2c4.com/wintun/about/
> 
> - And there's some simple example code too:
>   https://git.zx2c4.com/wintun/tree/example/example.c
> 
> - A signed wintun.dll for amd64, arm64, x86, and arm is on the webpage:
>   https://www.wintun.net/
> 
> - And of course, it's open source:
>   git clone https://git.zx2c4.com/wintun
> 
> Regards,
> Jason
> 
