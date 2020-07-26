Return-Path: <SRS0=JBbb=BH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C58CC433EA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 16:00:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 754AB2053B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 16:00:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqpjSUkr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 754AB2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0ed9d2c;
	Tue, 28 Jul 2020 15:36:44 +0000 (UTC)
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 13fc1dd7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Jul 2020 10:34:24 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id x6so328883qvr.8
 for <wireguard@lists.zx2c4.com>; Sun, 26 Jul 2020 03:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Y1kCMVbjrpc/+ute+2XPP79AvaJpEQcrvqEukrnhtbw=;
 b=pqpjSUkrnTjNE6h9gMLChZ6e3yocvYPt8iD0CsYIdcY59AKCJZEvnrlUgVDnWXFW9C
 uQZQeK3IF2zlwC+cjlo7v6YxAEpvkYz+GiDpo/fQjvEwEew4Q8lZf8T9mKGbfbaQRIVh
 rIFqJWesMqGLtLrGqaUlByQLJtHwfiQ4uSpU2zpjiy4FZkgp0gb57qJTEb+iKCu0JAu1
 DUYgY3xO94OdmWZaIBG/cgxRELxgtFS6SZ8pXoA3z+F5JnWW/b76tnk4eWBToO+f4rBg
 ts+TOdk/YLgDUkNle0pgsxos1hl6YRafewL9YyBH7bNezuOXNPf7o4elZRzRLJ3Hz8by
 +1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Y1kCMVbjrpc/+ute+2XPP79AvaJpEQcrvqEukrnhtbw=;
 b=EmBHz854BZD5sSvVWk1vsdRfU4j0QZ1aoWPK3tf+fCduH1PgR2SbQhnyasELCAR4ig
 DhuuhMtQs24hrDqSy7VOjRc7XuWISKk76pmBkTiUUXh3QlB9XvmbeuvW3MRzju/D84GH
 wAcAB1vhv8nIUpoIvbG13VKXkLi4gd4HxkFLSTtkUOdME774VvhHx6OoA90Ayi58qUJS
 cah5A/vj4yt74xSbSJn9dznV/ZVmQEoQRHk0JdgNmRPPLkkkn9vbeBNr7No55BW/9Wzs
 w2YelbhjkGK4m/Y+hCoS6O2I6hXFu6iUP/qLijqmP6qTeWb6BR/+gX2FidlreEwQa20I
 FHeQ==
X-Gm-Message-State: AOAM532esHMdysn/IyjpsOTczSBKJmI23CyX4lgHGnoyLUcpl9k3XXfK
 SP0h9pEQ0kTDK2NQYtAq0QaqbyAWDFR8dg==
X-Google-Smtp-Source: ABdhPJzRP3DOf+Oy5HNRSCbLt/gQnacc45+nYcLaYTmb+Cq+n+xG/Ym3X+fj2yxVCm58G3UEDZ8/Kg==
X-Received: by 2002:a0c:aa41:: with SMTP id e1mr17027181qvb.117.1595761054388; 
 Sun, 26 Jul 2020 03:57:34 -0700 (PDT)
Received: from [192.168.2.232]
 (76-253-187-197.lightspeed.rlghnc.sbcglobal.net. [76.253.187.197])
 by smtp.gmail.com with ESMTPSA id p66sm14114741qkf.58.2020.07.26.03.57.33
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jul 2020 03:57:33 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Gunnar Niels <gunnar.s.niels@gmail.com>
Subject: Confused about AllowedIPs meaning?
Message-ID: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
Date: Sun, 26 Jul 2020 06:57:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 Jul 2020 17:36:43 +0200
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

Hello, I'm new to wireguard and have been experimenting with it in my home lab.
I'm interesting in using it to join two home networks (192.168.2.0/24 and
192.168.4.0/24). They're typical home networks in two physically different
locations, each with their own gateways to the internet. I'd like for the
machines on each network to use their default gateway for internet access, but
configure things so they use a simple linux machine (raspberry pi) to route
to the other subnet over wireguard is the destination is the opposite subnet.

One wireguard node is exposed via an endpoint with a dns A record (I'm port
forwarding to the internal machine). On the other subnet, the rpi node is behind
NAT and pointed to that endpoint.

I have been able to get the wireguard nodes to connect and route machines on
their opposite networks, but I haven't been able to get non-wireguard nodes
to communicate with non-wireguard nodes across the tunnel. I have a few questions
I'm trying to clear up:

* Is it true that there isn't really a notion of a server/client from wireguard's
perspective, they're really just nodes, and I've applied the semantic designation
of the node behind the endpoint as a server, and the node behind the NAT as the client?

* Here's my "server" config on 192.168.2.0/24:

===

[Interface]
Address = 10.2.0.1/24
ListenPort = 34777
PrivateKey = <server_priv_key>

[Peer]
PublicKey = <client_pub_key>
AllowedIPs = 10.2.0.2/32

===

Here's my "client" config on 192.168.4.0/24

===

[Interface]
Address = 10.2.0.2/24
PrivateKey = <client_priv_key>

[Peer]
PublicKey = <server_pub_key>
AllowedIPs = 0.0.0.0/0
Endpoint = <server_host>:34777
PersistentKeepalive = 15

===


The simplicity of the wireguard config is one of the best features about it,
but the only thing I'm unclear about here is: exactly what is the "AllowedIPs"
field configuring? I'm not sure how to configure these fields for my use-case.
I'm guessing the server configuration is explicitly whitelisting the client,
but I'm not sure what 0.0.0.0/24 on the clientside is saying. It feels like
I should have my subnets as part of this field, but I'm not sure where because
I'm not sure exactly what the field represents.

If someone could elaborate on it and point me in the right direction given my
objective, that would be much appreciated!

-GN

