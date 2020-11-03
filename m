Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73300C4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:43:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0473206CB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:43:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyAB1HGE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0473206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73628a25;
	Mon, 9 Nov 2020 22:40:18 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d2a8d34b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Nov 2020 10:28:41 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id y16so18488921ljk.1
 for <wireguard@lists.zx2c4.com>; Tue, 03 Nov 2020 02:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=OLioIAiA0oY6wfzjH8Gr2KNkfU/nn16P7QLkJVTziYs=;
 b=cyAB1HGEAoAEvmGajG419rjr9m5QNZCLOr0jnEtY+6Z/iZU0h4+v+3aYqzUx3apLU8
 X7R79b692sFYoN+dVD6hxP28Ow/BH5n1qSb4WrVZLKvi/JrRYVYk46Vbb5N3h613P+9O
 s2R6y2GP9uNWkJLhRcPdqM4Z9bn5t8GwZIbgiGWwmkS3GKFq7E+3aMrVAy1GmcDq56+x
 ALnbybih+lPugfFDemdqIgvXVbx07kq/IicHDYiEAeRDM9oQdrevSjfYgX0wsqY7nocK
 hhwBNAPomDQakNykbsjt2WeryJWSufMehBP++mhWk6xrYAO8My1lfJnhcXst/j26ccGV
 QvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OLioIAiA0oY6wfzjH8Gr2KNkfU/nn16P7QLkJVTziYs=;
 b=e9a8e3TGjOF/Gt1Ym/sdpeng6/ZBs/GOU1hXmLE+gtYhvyQv3813B2/HoSybl/FOnu
 bbpcLk95sPXCFqADkpbq2EFzsnZNYysMQvafzfVqvcMKt7pepz0RsMObEPuXfZEeSFvl
 nW+zct8gd9PPetJfNi9k5tnU8NkxqxMqfO+bf/0k2Pu/EeJVNUsLJI34kcRvzOAvvZlI
 woGoc0R26u6bM5o2rzTVIdz5PjtbvpsTPSZK8bxalQchXEgo75uOV8ksJ2Pw7pPBZl5i
 4KLwQuDhY2l0LQ+VkKCcrXVO4HERcCQH/3sKpGxFBre3ycfGyazVE/trMhHd4ycGZDY2
 0M5g==
X-Gm-Message-State: AOAM530isdqkyDpjINeorj3TTQRo5frP/2k8OJ1+1LetzJGqQVuM84O3
 FTxWPTdLFAZUyvKmKL9YFgRIbxUN93sYEv3RDFFGjD80v+M=
X-Google-Smtp-Source: ABdhPJyAZmTghL8mSGd/XB/LbU/TmBIIYEOO/DzMQ1YjEis1lIEcOb8C+kgulh86r/02rPTRra5HHO3Y+AqPpY6Mflo=
X-Received: by 2002:a2e:b802:: with SMTP id u2mr7929520ljo.210.1604399486349; 
 Tue, 03 Nov 2020 02:31:26 -0800 (PST)
MIME-Version: 1.0
From: Yves Goergen <yves.goergen@gmail.com>
Date: Tue, 3 Nov 2020 11:31:16 +0100
Message-ID: <CADJb3qRk2nuvQdyF1+=9yf84annmJ+nyapdokFx1o-WcVfvfKQ@mail.gmail.com>
Subject: Add local DNS forwarder to Windows client
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:11 +0100
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

I've already used WireGuard to connect to private networks and it's
quite easy once you figure out how to set it up. (Most tutorials are
outdated and haven't been updated, new ones haven't been written.) One
thing that's really missing however is DNS support. All I can do now
is connect to IP addresses. Names are not resolvable on the other
side. If I add the "DNS" directive to my client configuration, it
replaces the local DNS resolver and *all* lookups go to that server
instead. This isn't working either because I'm on two local networks
and each has its own local DNS server that can only resolve its own
local names (and forward the rest to the internet).

Specifying both networks' DNS servers also fails because when
resolving a name, one of them is chosen at random (and the other one
isn't regarded) and then you won't be able to resolve some of the
names some of the time. This is also very frustrating. And it wouldn't
scale to multiple active tunnels.

The solution I've read about is to set up a local DNS forwarder that
can be configured so that it uses multiple servers and queries each of
them and returns only a positive response. This way it could query
both local LAN DNS servers and for local names, only one of them would
resolve the name. This is a bit complicated to do if you're not
permanently connected to a VPN, or if you move from one local DHCP
network to another (like with a laptop). And it requires additional
software, setup and configuration, and probably intensive maintenance
and care. All of this makes WireGuard a pretty ugly alternative to
OpenVPN where all of this already works. Despite all the disadvantages
of OpenVPN.

I'm asking if it's possible to integrate such a local DNS forwarder
into the Windows client application. I imagine it would start up
automatically once the first tunnel is activated. And it would replace
the local system's DNS server setting for as long as it's active (like
the tunnel-configured DNS server already does). And it would query the
original locally configured DNS server and all configured DNS servers
for the active tunnels. It would then be able to resolve local names
and tunnel-remote names without any additional work on the user end.
The user wouldn't have to perform many complex tasks upon activating
or deactivating a tunnel. This would make WireGuard be as simple and
productive as I believe it was intended to be (but isn't yet).

This probably stops working as soon as other VPN software is used in
parallel, but the current "DNS" setting has the same limitation, it's
better than nothing and most of the time, you only run a single VPN
software.

Please let me know what you think of it.

-Yves
