Return-Path: <SRS0=Z38T=74=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDD8C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Jun 2020 20:03:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 197F52071A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Jun 2020 20:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.umd.edu header.i=@cs.umd.edu header.b="FYuc8Hxf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 197F52071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cs.umd.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c53776e5;
	Mon, 15 Jun 2020 19:45:06 +0000 (UTC)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id af81f0b2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Jun 2020 19:45:03 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id o4so9631678ybp.0
 for <wireguard@lists.zx2c4.com>; Mon, 15 Jun 2020 13:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.umd.edu; s=google2;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1mWee5/aYG8JouLP3t0EDhi5QHJa26su2H8FAjJEggU=;
 b=FYuc8HxfFTqWNs2nLxlbI0sppR+CVOnSoJsKdICC+U2hsmmCipvtKGCpP3k2BuvdiZ
 cNr+Ja8BMpaQ+BtlGBDcX98UznqfckvK5KlJZvOSoibtjyRGpwZazZ8Ui12M9CdFxI5R
 mzAcGgijEyUxJuxt8i3xo62kdw+AkcSaMfblU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1mWee5/aYG8JouLP3t0EDhi5QHJa26su2H8FAjJEggU=;
 b=FihQUKWLN7hvUucr9oJsAfKmMeFJMLEqzJXiQPtA7go9pp/x3JZKeEKt4u38LAKfB2
 Uc0sO+/u1Kw1wWwmK43soh7AabpaPfd3sYoz/zIrmNT+ciOpcQ8MHzfxAzO2J5aNO2Nr
 QK4AOg5PcszDrn6oHVx1iKv9KXmMByk14+9CYkYgG7xskIRpcdltr4+nZ2YZEvcgy7Ye
 tRv+63viLV5iHN/1t1TlyJIBFN3g2a+DDd8samPnbqy4/O3RSRqrZdsgCbX1j0EQF+89
 SgSmSu5LhLhSw12h6fPK9253MPGI4RjXoFe5sRrLPXVyG9piXPWFNLwbZrGsKZXu++rC
 NpFg==
X-Gm-Message-State: AOAM5312dM4jMz+3Y02q6RDx0d+VVsM2KJlQH9PW5GGnguK3lwC5jggQ
 Ja92KnZ0vcBZ8RmqGUIj77Z4sYVt2LSRppNzBujS0F8F45E=
X-Google-Smtp-Source: ABdhPJzBd6xVVEIhsxiGFGj0BglBUNz3UfI5mkeUbqEsJ1YBxjwNzOP5/q++pHuA/YnwivJ6N0IhmrVJswxBO7tOzg8=
X-Received: by 2002:a25:af93:: with SMTP id g19mr51349193ybh.109.1592251374769; 
 Mon, 15 Jun 2020 13:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAM+N7v=DWfk-b8V0C5kjrTRPv-nTb5OuuVoSYMMNNATdK6yR=g@mail.gmail.com>
 <433a642e-4bde-cd7b-021c-2dd8663d3d47@lists.m7n.se>
In-Reply-To: <433a642e-4bde-cd7b-021c-2dd8663d3d47@lists.m7n.se>
From: Sergey Ivanov <seriv@cs.umd.edu>
Date: Mon, 15 Jun 2020 16:02:41 -0400
Message-ID: <CAM+N7vnykeL=0oF4zq_2zO2JVGLAiMwe7PLGkHptR8S238baUA@mail.gmail.com>
Subject: Re: Openwrt wg0 behaves not alike that on Fedora: why?
To: mikma.wg@lists.m7n.se
Cc: wireguard@lists.zx2c4.com
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

Thanks!
You are right, it was a rule: '-A zone_wireguard_forward -m comment
--comment "!fw3" -j zone_wireguard_dest_REJECT'. Corresponding setting
in the luci web interface was "Forward" from the zone "Wireguard" to
"Wireguard". Although I also need a separate ip route table for this
VPN to get access to subnet routing.
-- 
  Sergey.

On Mon, Jun 15, 2020 at 7:02 AM <mikma.wg@lists.m7n.se> wrote:
>
> On 2020-06-14 20:19, Sergey Ivanov wrote:
> > Hi,
> > I have a question about wg0 on OpenWRT not forwarding packets from one
> > client to another. I have a laptop at home in my home LAN, and a
> > computer at work in a very restricted LAN. They can not see one
> > another. I spent a lot of time trying to get them connected by adding
> > their wg0's IP addresses to the AllowedIPs on my home router running
> > OpenWRT. I saw pings from each of them successfully decrypted (I've
> > used ping with patterns) on the OpenWRT wg0, but they never got routed
> > further.
> >
> > When I decided to try to move the same AllowedIPs from OpenWRT's wg0
> > to my desktop Fedora, it immediately worked. It looks like some sort
> > of setting like isolation of the clients, or hairpin mode which is
> > different on OpenWRT than on Fedora.
> >
> > Can someone help and suggest what I should look at? I'd like to have
> > it working on the router which is all time on.
>
> You should look at the firewall in OpenWrt. It's probably dropping or
> rejecting the packets. In particular look at the forward option of the
> firewall zone assigned to wg0. From the OpenWrt Firewall - Zone Settings
> GUI:
>
>      the forward option describes the policy for forwarded traffic
> between different networks within the zone.
>
> Since WireGuard is a routed (and not bridged) VPN the above setting can
> also control forwarding between hosts on the same network.
