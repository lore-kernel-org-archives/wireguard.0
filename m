Return-Path: <SRS0=SlID=MQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E02C64EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Oct 2018 18:56:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A072084D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Oct 2018 18:56:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="IlHqm4bS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47A072084D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19361307;
	Thu, 4 Oct 2018 18:55:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1627f030
 for <wireguard@lists.zx2c4.com>; Thu, 4 Oct 2018 18:55:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4446234a
 for <wireguard@lists.zx2c4.com>; Thu, 4 Oct 2018 18:55:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06c76b43
 for <wireguard@lists.zx2c4.com>; Thu, 4 Oct 2018 18:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=ZnJG6pCtLBEO8q2cXTY1t79RtP0=; b=IlHqm4
 bS6m5nfjH4b8fdqf9FFgcgUkqsQOqm2NNNrZxc0/mAcLujwg+rqCY2JpaU0hVmT3
 I9+1rqvRxqZcsDsH1c9r/ImhjvI/UmSdTVXmhV6qMGOKEkJrfNokFRmEFwoD3+Mz
 NEitAyHpl5YD+sbFh1xQqNFuCpW9828lYab9JhARsdmPauT9Yv5NuAmmEogfZk6D
 g3GKUAGv2ByHtl9ezIt7MMPwAsu5j4DYWRHgxAOP7XFjDD0hNtWpxz3ocX6bKNfr
 freRUxJKIEf4PNV3WC08mJFmf20PJ/hEAwc/oyvvA+kPygqRh9Z2R4yHecsn/rF4
 PelVIP36SFkAA1+g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3a5c62c7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Oct 2018 18:55:54 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 36-v6so10220309oth.11
 for <wireguard@lists.zx2c4.com>; Thu, 04 Oct 2018 11:56:14 -0700 (PDT)
X-Gm-Message-State: ABuFfogIY+48DMUrc4TOeYIVn3trg0XOjb5DDGL3lqH/4IFmThxBFGHW
 FoapKYePv7T0gCZ9ofjMRfyNVS4h+6U+8ojBI04=
X-Google-Smtp-Source: ACcGV61Np4rKlamHN1vM7trqXC+OSgexU39/m6Qp6XeKgfPwqt6ypoe7VXdrSCz1MWlLAClEYKQMElaHLOPzCNWxV3k=
X-Received: by 2002:a9d:42c3:: with SMTP id c3-v6mr4674468otj.54.1538679372531; 
 Thu, 04 Oct 2018 11:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20181004155359.GA5957@puremoods>
In-Reply-To: <20181004155359.GA5957@puremoods>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Oct 2018 20:56:00 +0200
X-Gmail-Original-Message-ID: <CAHmME9rt2irKq1JFkkWdNLKFTJapCKopkUCpnyXugN=dUWqW=A@mail.gmail.com>
Message-ID: <CAHmME9rt2irKq1JFkkWdNLKFTJapCKopkUCpnyXugN=dUWqW=A@mail.gmail.com>
Subject: Re: Sending just ssh traffic via wg
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

When you're doing policy routing with packets that are being forwarded
by the system -- a router, for example -- then the prerouting table is
sufficient. But for locally generated packets, you have to use the
OUTPUT table and also probably MASQUERADE. I just reproduced
everything here and confirm this works:

ip route add default dev wg0 table 2468
ip rule add fwmark 1234 table 2468
wg set wg0 peer [...] allowed-ips 0.0.0.0/0
sysctl net.ipv4.conf.wg0.rp_filter=0
iptables -t nat -A POSTROUTING -p tcp --dport 22 -m addrtype
--src-type LOCAL -j MASQUERADE
iptables -t mangle -A OUTPUT -p tcp --dport 22 -j MARK --set-mark 1234

That works pretty well for me. If you don't want to disable rp_filter,
you can do a little dance of setting and restoring the connmark in
egress and ingress so that incoming packets are matched against that
routing table too.

Alternatively, if your goal is actually to just send certain processes
through the tunnel, you have three more options:
- Network namespaces, and then `ip netns exec chicken ssh 1.2.3.4 ...`
- VRFs, and then `ip vrf exec chicken ssh 1.2.3.4 ...`
- Cgroups and net_cls.

All three work well and are differently convenient depending on your
needs. I wrote up the netns stuff on wireguard.com/netns/ but haven't
gotten around to documenting VRFs and cgroups with wireguard, but they
in fact should work the same as for every other situation that uses
those, so any old tutorial will do.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
