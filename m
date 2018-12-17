Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EA0C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:27:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE7C218FC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:27:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bod.org header.i=@bod.org header.b="BikJRtnU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FE7C218FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bod.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa2f9bca;
	Wed, 2 Jan 2019 18:24:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d252d154
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 04:25:26 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3afe324
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 04:25:26 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id w21so9034946ioc.1
 for <wireguard@lists.zx2c4.com>; Sun, 16 Dec 2018 20:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bod.org; s=default;
 h=mime-version:from:date:message-id:subject:to;
 bh=mHTgQAH+13bsKVpLVdO6nITrAQExOZTZFP9tdkbU/Oc=;
 b=BikJRtnUI6VA9eoUTunL7l+ZYI7TQc4HMsw5eYKXFI29jGZofSJyRPtAVe811Ok/7J
 2kohgvqSZ+3Be/srV0H2zM2W/8JVZxOm/xBVgGyVwGylZXNFRdb8ARtBkV5mHAX8L10v
 AjGSFcC393c56cjwX1WtkwGze5O4y246gwszr246bsksmYTOfx7T/+YWr9VOHebi4zR+
 PO3o3n7nRQVRfHkSNxwXISOzfsggFlm+GwIs2fd5hMFSACpzSD8DbswKDjQm/m+RpyKt
 nNLWm+joFqPqdUorZM8EMkoyPDOqNtiIUK9azThhItZSQ7ZagOr7dw9onSAfZzzN41oQ
 yuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mHTgQAH+13bsKVpLVdO6nITrAQExOZTZFP9tdkbU/Oc=;
 b=pbgJDnr7uMIHO1HS7D3vccBteJzkY3Hd1LlVCt4KLadKAK/AaxCsjsW5XfbcOVmSya
 YdQquUlj0viqRB2hik+IWgBJ+XXa5Z7r57uI65mRJSSA4QJLCD+oONmKS+6kxpXYhkIY
 p3DELvw7NlyQbzi7B6XjcbJ2+z39UAYYOlf8v49i7bTJKIM6omqLdXI4wXewo7t9yEqC
 4TQ/KUavc2hN+l8Bk65qwcakudumpZz5b5JMyRMPdG4nJHOY+i0+XRwOWZ90dKBto4a6
 5pnJZOVsMeawUedRx0i9NSfkV4twSp0Q10wpDMDVA2qXyDsYuO1Tnw4hzK5Gvo4XjZ5M
 u2uA==
X-Gm-Message-State: AA+aEWaoJLNvS6qVXw5r/yC50TNdeAb6KZxBnk7hYtn/oIUu0/gi/lr5
 NAb98R+ebjTqrmsyBMyhJplKIKQr8pyysR+tn9K08IVZrqrFfQ==
X-Google-Smtp-Source: AFSGD/VJ/UAItg/jjbfwjF3JlZu/t4eq3KcBS1FZkv8mjKQmuM78orICbz9XF98qdpFWDS9uQpZyPDg33J+cNQIG/iI=
X-Received: by 2002:a6b:919:: with SMTP id t25mr9586817ioi.207.1545020741839; 
 Sun, 16 Dec 2018 20:25:41 -0800 (PST)
MIME-Version: 1.0
From: Paul Chambers <bod@bod.org>
Date: Sun, 16 Dec 2018 20:25:31 -0800
Message-ID: <CALfMqR4usxbVu4V5j+b-v0WCbwN-gUZvdz+ewz3Z7u7v3htV=A@mail.gmail.com>
Subject: Access to existing services on host,
 Wireguard for new outbound connections
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 02 Jan 2019 19:24:43 +0100
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

Sorry if this has been asked and answered - List archives and Googling
have turned up all kinds of semi-related information, but frankly,
taken en masse it's more confusing than helpful.

I have a VPS running services that I continue to need to access (ssh,
zabbix agent, etc.) while any new outbound connections originating on
that host should go out over the wireguard VPN interface.

In other words, established/related traffic to inbound connections to
the public IP of the host should go back out the interface it arrived
on (not the default route), while new outbound connections originating
on the host should follow the default route (i.e. exit via the
wireguard interface)

My experiments are complicated by not being able to SSH into the VPS
when wg-quick switches the default route, kind of a circular
problem... I'm resorting to writing scripts that bring up the VPN, try
something, then log information into files, then bring down the VPN
connection again. Pretty tedious.

One idea I haven't tried yet is if I use an iptables match for
'related,established' traffic in the outbound table to set a fwmark,
and use an 'ip route' rule to use that fwmark to switch to a table
that's a copy of the routes/default route before wg-quick changed the
routing.

I've seen examples that use an 'ip rule' to set a fwmark on outbound
traffic originating from the public wan interface, and 'ip route'
rules to switch to another table for that traffic, which contains a
copy of the ip routes before the default route was switched. But that
technique doesn't seem to be working for me, and given the debugging
challenges, I'm having a hard time figuring out why.

Doesn't seem like a strange thing to want to do; any advice would be
much appreciated.

- Paul
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
