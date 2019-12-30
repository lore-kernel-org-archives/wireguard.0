Return-Path: <SRS0=ofmn=26=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CA0C32771
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:02:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F5D20721
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLJa459r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29F5D20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f377fa79;
	Thu, 9 Jan 2020 06:02:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d975e39
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 10:16:44 +0000 (UTC)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb804c91
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 10:16:44 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id 66so45680298otd.9
 for <wireguard@lists.zx2c4.com>; Mon, 30 Dec 2019 02:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yTIyW4vcDBLd2nlBl20gyRHhaX99ee2itGc060NuXFk=;
 b=JLJa459r5K4BQXCAr/p5OCelBjDBvQ5RSDMGHflfUYCk7bCw2FGe7gK1QDofMHmbvE
 6qw3Z+4xmvA5gaZhboF30/Ob13uIyMQSEGESR8iuQ0RLJPfnAAmyfysZ8y9jPHALkFDF
 7Ta66labNzivEo2W1KveGW+JZk0zb/e1LGz1NlOiuZBnDR9VFMh/xSVBEzJLV6yEvGx1
 AoePOe0Mfw03JKL4LfeS+EImEv91yS6Wj49w44W7FZUYuM6IEuD/GfEtpLvD9+ezN3Wi
 XKGn67Gf83LyzvDjyLi4OLwuGErGtx1n0l6xbOFUfGktFWMOHpA0IXbDqVSEmIT7EGh6
 5Wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yTIyW4vcDBLd2nlBl20gyRHhaX99ee2itGc060NuXFk=;
 b=EosOzqwO082pfLhnZvMVrBYJpO7gZy7G0lz7cPjRie9qFaG1kZXdSGvQCsU+QcODJD
 KfDkfHKrpPECV3/TfkeuvjxVSJELMY4CaTQEj2w2RhOx7yJEM4RpezM2iso+WMzJvdZ3
 /6Rm9qd92ATBecel4LWty7HXrtcDvb6V/uqCQOrJacNu3OT8eihEabgMeyA7VaiDUbwB
 lf0BntLUsm/2+vqOFDFVtkuZhFsW/ltmuBERettHNMw+N8ISsu02rcEraPZUjgwlQHn3
 Jtbz+Lp00yI33CnmwVs9oQOMHLOq/qMPNF7L14KLSbVCG/6CSjOd71Yn9XMWsqaLfRZR
 F6Og==
X-Gm-Message-State: APjAAAWXCXkUSvONK53jjo7cb20reIQKyqTU8spQaB9aC48H48cYdXPj
 38R1vuRM0FnvMp9vSX2jLiyyrXqxg4QV03O/+8oC1FzRkMI=
X-Google-Smtp-Source: APXvYqwofkwpapX6DbOmElqkNeZSZ5QAFy+8//EKWXhuwSP6V4S93LHxA4QalMYOwmlYgA82atyKZseJeOLoLsfEbyw=
X-Received: by 2002:a05:6830:1d4c:: with SMTP id
 p12mr75803647oth.198.1577701003533; 
 Mon, 30 Dec 2019 02:16:43 -0800 (PST)
MIME-Version: 1.0
From: Michael Brookes <mgsb81@gmail.com>
Date: Mon, 30 Dec 2019 10:16:32 +0000
Message-ID: <CABfcST9Ovn7=2gmXhKYEmp4tA6w33KnV4f5KEXZtqz33nfVt3g@mail.gmail.com>
Subject: Explanation of multiple addresses in config
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 09 Jan 2020 07:02:19 +0100
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

Hello

The manpage for wg-quick states one can use Address multiple times in
the Interface section of a config.  I've tried this but it yields
unexpected results.  Here is my config which I'm using on my Ubuntu
laptop:

[Interface]
PrivateKey = <key>
Address = 10.19.49.103/24
Address = 10.88.118.166/16

[Peer]
PublicKey = FgVLScjX29jwnXXbHStFpNKcFqbaiNK6LuSWFglrWCo=
AllowedIPs = 172.18.1.0/24, 10.19.49.0/24
Endpoint = endpoint1:51820
PersistentKeepalive = 10

[Peer]
PublicKey = itXrReVj+wuecrSs+VNnEEkpc7wHb8QhXQtMQUBrOj8=
AllowedIPs = 172.27.0.0/16,10.88.0.0/16
Endpoint = endpoint2:51820
PersistentKeepalive = 25

wg-quick up <config> gives me an interface with both addresses
assigned, 10.19.49.103 is listed first, 10.88.118.166 listed second in
the ip addr output.
Running tcpdump in parallel on both peer endpoints and my latop, I
ping an address in the ranges the second peer lists in its AllowedIPs,
for example 172.27.3.141.
tcpdump on the wireguard interfaces shows the following:

10.19.49.103 -> 172.27.3.141: : ICMP echo request

I can see the peer itXrReV... receiving the echo request but it's
coming from the first Address listed in the config and endpoint2 only
has 10.88/16 addresses in it's AllowedIPs.

Any insight into what's happening would be gratefully received, I've
tried asking a couple of times but not had any feedback, I suspect I
am fundamentally misunderstanding something here.

Regards and thanks.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
