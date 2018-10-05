Return-Path: <SRS0=6kAx=MR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83470C00449
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 17:34:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FA1213A2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 17:34:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xtEdiZfq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2FA1213A2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e660fcb3;
	Fri, 5 Oct 2018 17:34:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcffe9e1
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 17:34:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7eb69fe
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 17:34:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b13735f
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 17:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=K2KaMpyXW8UnKHVtwJWSDnz0JQc=; b=xtEdiZ
 fq1il3MqnAmBB7E1VUnAjuj04s4q6OtfvW1GpUiM8J4aEGX72hnzNB3aZQ3Vu/1r
 zQEeopack7wmnDPMSPxsH6MxZL4Jir1pWtBI3/GADy1TN8B4mdA5lCElxAzyy4dR
 lRbRvK+t1kb/yZVRkm23DsBREz9NC304StHWpAbQUKBX30SPlAU67dKuMDHMBGLw
 8hIFWEZNIFU138+nqD9r9UMqWpoYWw+iGn1o98Bjz1R09z1ZqUjlHYHuPKqDTiXn
 rdQBS7NkeumKgh93fDGK0bsU1/ATv3co48UKNvlcJvAQootxcD/U4bjSP+UAhbPD
 d3QT9wG5sDDL/0cg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0178edc0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 17:34:00 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id e17-v6so11017044oig.12
 for <wireguard@lists.zx2c4.com>; Fri, 05 Oct 2018 10:34:26 -0700 (PDT)
X-Gm-Message-State: ABuFfogOzZdMe9AUFXkDvOcXkFEZa0XAjtaJXjda5g9J2TCYOiPQh6ns
 0p0aXbd/gaJn7rMIEXzg0X0xANMb4UUHhdrtHPQ=
X-Google-Smtp-Source: ACcGV61LjYGOX4sKJGg/V3/RcVhqyRBAXa9mX50TapXO9blvbwC2GdYJJJ7iMmu1fkiVWRJ3bq+PcnS+NzzpKJ4ReSI=
X-Received: by 2002:aca:b256:: with SMTP id
 b83-v6mr6115264oif.235.1538760865917; 
 Fri, 05 Oct 2018 10:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20181004155359.GA5957@puremoods>
 <CAHmME9rt2irKq1JFkkWdNLKFTJapCKopkUCpnyXugN=dUWqW=A@mail.gmail.com>
 <874le0d82v.fsf@toke.dk> <20181005155328.GB22501@puremoods>
In-Reply-To: <20181005155328.GB22501@puremoods>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 5 Oct 2018 19:34:13 +0200
X-Gmail-Original-Message-ID: <CAHmME9oCrSogDHZh_+jzKHDs8ugqsgUUjrBqVx3P2OxLGmnA0g@mail.gmail.com>
Message-ID: <CAHmME9oCrSogDHZh_+jzKHDs8ugqsgUUjrBqVx3P2OxLGmnA0g@mail.gmail.com>
Subject: Re: Sending just ssh traffic via wg
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
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

Hey Konstantin,

On Fri, Oct 5, 2018 at 5:53 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> > Any reason why you can't just do
> >
> > ip rule add dport 22 lookup 2468
>
> Yeah, this works, too, and is quite a bit simpler. Jason, any reason why
> I wouldn't use this?

Definitely use that. A reason for preferring netfilter for this would
be if you're doing lots of crazier netfilter stuff as well and want
complex rules. But for just tcp:22 matching, Toke's suggestion is by
far the best. I imagine internally, the kernel can just look into
`struct flowi` during the route lookups and doen't need to do much
subsequent parsing.

The one thing I'd change is you should add "ipproto tcp" to the
command so you don't match udp:22 as well.

> Every time there is a network blip, the admin loses their OpenVPN link
> and, if they don't re-establish it quickly enough (typing in their
> username, password, TOTP token value), then their ssh sessions reset.
> Quite possibly the worst thing to happen to an admin in the middle of
> troubleshooting something.
>
> Similarly, if there's an alert in the middle of the night that requires
> checking something out, it's annoying to have to first establish an
> OpenVPN connection before being able to ssh in to a system.
>
> So, we're working on a new setup where admins would have an always-on
> WireGuard connection to the infra, but that connection only allows ssh
> traffic. In this case, don't need 2-factor on the wireguard link, just
> packet encapsulation. But should the admin need to bring up the OpenVPN
> link for accessing something like an iDrac interface on a Dell, they
> need to be able to do this without needing to shut down their WireGuard
> tunnel first (since both WG and OpenVPN provide routing to the same
> internal ip ranges). Therefore, I was looking for a way to *only* send
> port 22 traffic on the wg link.

This seems like a reasonable and simple way of doing it. You could,
instead, make a little ssh wrapper that does the netns/vrf/cgroup
stuff if you wanted this at the process level, but probably the
heuristic of ssh==22 is a totally good and acceptable one that will be
less error prone.

By the way, hopefully as core development simmers down, I'll be able
to focus a bit more on infrastructure projects like adding 2FA on top
of wireguard.

> The following achieves what we need:
>
> [Interface]
> PrivateKey = [omitted]
> Address = [omitted]
> DNS = 127.0.0.1
> Table = 2468
> PostUp = ip rule add to 10.10.0.0/16 dport 22 lookup 2468
> PostDown = ip rule del to 10.10.0.0/16 dport 22 lookup 2468
>
> [Peer]
> PublicKey = [omitted]
> AllowedIPs = 10.10.0.0/16
> Endpoint = [omitted]
>
> This achieves what we need *quite* nicely!

I've add this example to the wg-quick(8) man page:
https://git.zx2c4.com/WireGuard/commit/?id=3e2f5495ea684d7f06fbefc50290e7d8985fc3de

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
