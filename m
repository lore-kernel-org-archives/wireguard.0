Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFFCC5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 10:19:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C60221FC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 10:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=werehub.org header.i=@werehub.org header.b="lvaSYIeJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56C60221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=werehub.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de9ed869;
	Tue, 17 Nov 2020 10:14:01 +0000 (UTC)
Received: from mail.werehub.org (mail.werehub.org [94.112.245.205])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a52c0996
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 10:13:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 044A240376
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 11:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=werehub.org; s=mailcow;
 t=1605608310; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rIRt5piOoRlru5hgn543nt/qfQqmciMxkOcMnFOhm0Y=;
 b=lvaSYIeJtw49/91i1JO0PPGpgeYDvGyIksc96cKwd3mJt5I2bKKlUMnL0UPQKqiZkXcQ3M
 dWDEpEZWBzCn1XZPoO7XMy2VyPieKrqpaNoNDAJeWaKhl3NMrotgdlXvctqNVTcI1+tN3S
 WuLJ/vkPxwdUSJmFXqNNdaXXa50TS17++0O5StS8HN5OSQEk/KQOtnEKLx81pFWI/oWzvF
 ueW7ti5kjU034wbOAblG9SRUkzcTrDjpIAkWRnT5m1bPcp1aTd6z/4e2Q+vn2a0wjnfygj
 cxiMaRH5rHjUFTyhXYny/5/QDuKAloJY1AIYCF5ZlZYhJ6nMdsIVFa3E+ueHRQ==
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: wireguard@lists.zx2c4.com
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
 <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
From: Viktor H <vh217@werehub.org>
Message-ID: <80326e63-7e41-bc86-65ed-152b6784dfe5@werehub.org>
Date: Tue, 17 Nov 2020 11:18:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
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

Hello,

Jason, thanks for a quick reply and a PoC. I have tested it and it seems 
to work fine.
(small note: non-admin user can't Activate the tunnel via systray 
context menu, they have to open up GUI and click "Activate"; 
deactivation via systray context menu works)

As for the concept itself, I feel I am not qualified to judge the 
security implication of this solution since my knowledge of Windows 
security and network internals are next to none.

I have also tested increasing metric on the wg interface above the 
metric of local link with the same IP subnet [1] and that also seemed to 
work, therefore enabling the option for "always-on" setup.
I have however experienced that there might be a problem in the case of 
pushed DNS server since it might hinder normal (non-VPN-related) usage 
of the Internet, e.g. in the case the pushed DNS server does not resolve 
IPv6 addresses but the client does have IPv6 connectivity.

It seems that the "Network Configuration Operator" as Patrik Kolmqvist 
suggested might be one of the routes to do it properly. OpenVPN afaik 
uses its own group "OpenVPN Administrators" for this kind of thing [2] 
though again, I am not experienced enough to be able to consider 
security of this approach.

Finally thanks for pointing out the ACL setting for the service option, 
that seems to be similar or equal to the solution on Reddit I posted 
earlier, so I'll look into it further.

Thanks everyone.

Viktor

[1] 
https://docs.microsoft.com/en-us/powershell/module/nettcpip/set-netipinterface?view=win10-ps
[2] https://community.openvpn.net/openvpn/wiki/OpenVPN-GUI-New#gui-group

On 13.11.2020 3:16, Jason A. Donenfeld wrote:
> Hi Viktor,
>
> I am actually interested in solving this. I took an initial stab at it
> here, but I'm not super comfortable with the implementation or the
> security implications:
> https://git.zx2c4.com/wireguard-windows/commit/?h=jd/unprivd-knob
>
> Aside from doing this from within our existing UI, the general
> solution using the service-based building blocks is to simply allow
> users to start and stop services that begin with "WireGuardTunnel$".
> So the flow is something like:
>
> 1. wireguard /installtunnelservice  path\to\sometunnel.conf.
> 2. Change the ACLs on WireGuardTunnel$sometunnel to fit your user.
> 3. Have the user use `net start` and `net stop`, or similar, to
> control whether the service is up or down.
>
> That's not super pretty, but it should work, and it is automatable.
> Meanwhile, I'll keep thinking about various ways to do this in a more
> "first-party" way.
>
> Jason

