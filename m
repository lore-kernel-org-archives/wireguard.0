Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FE5C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:22:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D025E22258
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gM6WI+FQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D025E22258
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 523f5fa4;
	Fri, 9 Oct 2020 11:49:06 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e7949669
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 11:49:05 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e9693a7
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=8SQsfXrnSwQyvT0efskRMny96LE=; b=gM6WI+
 FQLRanzspEn6lfMZYFpB5lGZVivT+SRWKeOzuwWCqKVpfwqyE7ch0/xh6KA6Ut4w
 vlydbcb/5RB/igu5ozKLsAblgs+07l8TF21jtcvtY0S69npwun+1ZSlhcer32BdT
 qcZih0W1PBlmhMI0kygXSGzCGiHEAb13NscAz/N4kCidRl1qHopIq+K7kSz064S5
 QpbO3De9lgOvMtZpalOQJjq7wTQM8bsaeVqiDTkB6Y2Za2NC/iNtcF4OzLU3mSGb
 n3Q7ErR/yhIj20HhGNCGnyW3ysVWEajlSbPwkLH9n4NnyXgw+DsWRZlmlklns7Jl
 dSRunIarRlL4055w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8bdaeb25
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 11:49:05 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id q1so8960509ilt.6
 for <wireguard@lists.zx2c4.com>; Fri, 09 Oct 2020 05:21:58 -0700 (PDT)
X-Gm-Message-State: AOAM5328lg0WtLZSF0zW/kpWaZiqQ2DrpjloGy4A35X0vkhmeyE0tldZ
 NWPNSykx3N1hzWcLn/UrFF7PW6reycKSoJDLLrc=
X-Google-Smtp-Source: ABdhPJyfgY2crHmqPvhH19YMHE3aJ1x/M9Y5yokCTkxovLdJwBsamCrPNPT67z2T2fzEDCMrPhUs9/U+Nq5XfQV+/6k=
X-Received: by 2002:a92:849a:: with SMTP id y26mr10420725ilk.38.1602246117544; 
 Fri, 09 Oct 2020 05:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <etPan.5f80552b.45639067.8db@ovpn.com>
In-Reply-To: <etPan.5f80552b.45639067.8db@ovpn.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Oct 2020 14:21:46 +0200
X-Gmail-Original-Message-ID: <CAHmME9rTGWNuS=AOj_jUnC7QvWW1od5jmJcvLurA-oukFiwf=g@mail.gmail.com>
Message-ID: <CAHmME9rTGWNuS=AOj_jUnC7QvWW1od5jmJcvLurA-oukFiwf=g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Samsung_Galaxy_S10e_can=E2=80=99t_reach_local_devices_?=
 =?UTF-8?Q?in_network?=
To: David Wibergh <david@ovpn.com>
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

Hi David,

I haven't seen other reports like this before, so I'm not really sure off hand.

Firstly, do the Macbook and the Thinkpad respond to pings in the first
place? Modern macOS and Windows have built-in firewalls that usually
prevent this. So make sure that the pings work without WireGuard part
of the equation. If you've done this, and it works without WireGuard,
and it doesn't work with WireGuard, then we can proceed assuming this
is an issue with WireGuard.

That config seems fine on a cursory glance. You mentioned that this
only happens on certain phones. Which Android phones work as intended,
and which do not? Which operating system versions are each of these
running? The more general information about this that you can provide,
the more we can narrow it down.

Between Android releases, there have been subtle changes in their
routing particulars, and between Android vendors, I've seen aggressive
power management policies affecting WireGuard, and between Android
configurations, I've seen newer features like DoH/DoT confusing the
VPN subsystem too. And there may be other weird patterns and quirks
too. If this really is a problem with "phone X but not phone Y," we'll
need some more smells to find out what's going on.

Alternatively, you can dump `ip route show table all` and `ip rule
show` and `iptables-save` on each of the phones and see if you notice
an obvious difference in the routing that netd sets up. That might not
lead to a fix of the issue, but it might add more precision to why
it's not working as intended.

Jason
