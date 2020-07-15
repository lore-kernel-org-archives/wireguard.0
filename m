Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F64CC433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 12:41:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6834A206E3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 12:41:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=acpr.dev header.i=@acpr.dev header.b="fk++jYuA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6834A206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acpr.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c64ae3f;
	Tue, 21 Jul 2020 12:18:39 +0000 (UTC)
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [2607:f8b0:4864:20::931])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2c940f1c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jul 2020 11:53:07 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id c7so536645uap.0
 for <wireguard@lists.zx2c4.com>; Wed, 15 Jul 2020 05:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acpr.dev; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=T1RZ1nYfuyBtCm/oZ/a3yL26oBm7mNIh1d7n7crgMi4=;
 b=fk++jYuATb+ffZ3qZzZsSUbwnEFANpdCj0p5LuD84nlZc06hvi7IklEH6pQHTLknYu
 7Zroyfi/md7g7ZUFSqSDRZW4DJHSbHB0A1jjrrHNcHKp01QJKY4qCorPvF7oMmEUjh3X
 Bt/Pwx8gYdvTtr8+TmVbXPtFFF+Yc2mhY6c+c/JScngspRWTo6IrN52fMPzxDsv6t4UE
 VULs4QybXzxYpBywQKjXHYZ2H99yFuLbC6Gt/HyBQeehG4Osp5PcA9UIk+Xwwd9Fhdgp
 1m/TA/aKwtoQu01ee8APSLMdQyhEmKfssnczxwBCG3zGVPa66SAlloX3sKoXOuxU9+8o
 OLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=T1RZ1nYfuyBtCm/oZ/a3yL26oBm7mNIh1d7n7crgMi4=;
 b=DT2+7zOO8JoJge5oXi5qUuAwdwu8rsfTXsVMNTuD3D3bH5PYKhcN7+s3thAxvG6hO6
 zfrHkYGLIQDVD+hgm/oif/QemFZjmEsfBg/UpOX9VafRGllrqWCQ9K/wFqkatnA8h9Wl
 UwzdfAKKhrByDvmqAjKXUxZRKzZgZX/PtBBtg0pOBgozmy4b9iJBIOmqdDRIi4vs91Xb
 d1gOfJlJYQfCxTk71oguB9JRptzCtUO4Ldw3neV2E3rFjpfS16+wfC2Udyjufa04CESs
 fVOhnGlJmjiVFocl4ZyRA1hzJVp9EhRJmlbKCFTbM1GmGTa8v+6hc81hutUqMmMttT2N
 lc8w==
X-Gm-Message-State: AOAM532BiN7Nr4u3313Gh9pMufkjI3ctrwIUTl1jNKtbPz0XITKZd2BG
 LpCcltSxcPw35Hkyy+zxoTJutJnIfGvBiwGUvKAXGEF6q88=
X-Google-Smtp-Source: ABdhPJxnyGNiAG+t7oq7GgiTEBcsyifOsn5WF888hH85sEbo7xmUxpDPHsGYPzeat4f0D00/XvMRyFh34KnbDIXXRp8=
X-Received: by 2002:ab0:486d:: with SMTP id c42mr7047113uad.64.1594815290429; 
 Wed, 15 Jul 2020 05:14:50 -0700 (PDT)
MIME-Version: 1.0
From: Adam Cooper <adam@acpr.dev>
Date: Wed, 15 Jul 2020 13:14:39 +0100
Message-ID: <CAN00TTomuZoagZF2McBkDW1ZimSouN-jnDLm+Hq7OKeH-sF9zg@mail.gmail.com>
Subject: MacOS IPv6 not functioning without custom static route
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 21 Jul 2020 14:18:38 +0200
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

I'm using the latest MacOS client and have all the appropriate stuff
setup on my server (Ubuntu 18.04) to use NAT IPv6. This works for all
my other devices (android, ios, windows) in that I can access IPv6
only sites just fine.

But on my Mac I'm unable to reach IPv6 destinations that are not on
the VPN IPv6 network.

AllowedIPs = 0.0.0.0/5, 8.0.0.0/7, 11.0.0.0/8, 12.0.0.0/6, 16.0.0.0/4,
32.0.0.0/3, 64.0.0.0/2, 128.0.0.0/3, 160.0.0.0/5, 168.0.0.0/6,
172.0.0.0/12, 172.32.0.0/11, 172.64.0.0/10, 172.128.0.0/9,
173.0.0.0/8, 174.0.0.0/7, 176.0.0.0/4, 192.0.0.0/9, 192.128.0.0/11,
192.160.0.0/13, 192.169.0.0/16, 192.170.0.0/15, 192.172.0.0/14,
192.176.0.0/12, 192.192.0.0/10, 193.0.0.0/8, 194.0.0.0/7, 196.0.0.0/6,
200.0.0.0/5, 208.0.0.0/4, ::/0, fd82:88::1/128

Should push all traffic correctly (the final local IPv6 route being
redundant I know).

What I'm finding is that the Wireguard client is creating a new tunnel
(utun1) and using that for all the defined routes in IPv4 but it is
not setting a default route for IPv6.

My system (and I don't really know why) has a preexisting tunnel
(utun0) which is set as default

default                          fe80::%utun0                 UGcI
     utun0

Wireguard is not creating a new default route pointing at utun1. If I
do that manually

sudo route add -inet6 ::/0 fe80::%utun1

Then everything works as expected.

The only thing I can think of is that Wireguard is seeing the existing
tunnel and that it is default and assuming it does not need to create
a route, even though that route is for a tunnel that Wireguard is not
responsible for. Is this a bug? What can I do?

Probably worth mentioning that I tried to replace ::/0 with ::/1,
8000::/1 but that just results in completely broken connectivity in
IPv6 and IPv4 - which may be another issue in and of itself.
