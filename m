Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48991C2BA1A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Jun 2024 14:57:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13b0b575;
	Thu, 20 Jun 2024 14:52:19 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 78c91d4c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Jun 2024 14:52:16 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1f9b523a15cso7721285ad.0
 for <wireguard@lists.zx2c4.com>; Thu, 20 Jun 2024 07:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718895135; x=1719499935; darn=lists.zx2c4.com;
 h=content-transfer-encoding:autocrypt:subject:from:to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=52GQsQlFwQgrwa27ImkM9ftdI2zTTD3ypg0F/kwiYpQ=;
 b=jUZqFEC8c2q1HPatN1JN2DhniEvZcK8m+e/N7tBOxsXNsP/HJ1wFw8S08AcxnKW1Qv
 Mqkp4ifvOYkD2taMFGun4v0EzC93Ozv1HKTdL/9aUQooMiXej6P9Wbti0FWw7wRETldu
 1eshqTwYWuhSSqZvByUPGE5nbMdnt1vRywV69aZqpzCTaTdmxB14914TeJQl2IjyRqv3
 3FuuDYmC4n0kxPGlnF5hUFB4zinjT724YqDlTrs2s4moQwnpmWEAuEWjHc3eSwyqbCLy
 l7glq6fc3764JeQSPZ8ygexEdCIt6jfagZiLWGq5dcx7znABxdsnWJw+UfcfKR/Ye+iv
 naYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718895135; x=1719499935;
 h=content-transfer-encoding:autocrypt:subject:from:to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=52GQsQlFwQgrwa27ImkM9ftdI2zTTD3ypg0F/kwiYpQ=;
 b=b6uVfbYyenJaezgRpx9PbXUpwRuEsvL00lTDlOvj++l4wXx+TVNoY4JiKlM4S8DuPx
 uFTw7oHhHA6JuOv77n85VUIx1IiOLJVfxS96konD3zAWzzI9Bs95ZSTCSrVRfC8LIYBa
 1xie2PAlOB/HFvQiFAx0tqHKnrUlL6/G25nUpOdr7bCSER3r428LqLgqeP0u9oB0hdZS
 gjOWPpS8Ic6ZaynCqrmGA1eQvwjUWB3lVw+i+nUkUN1uTQlXY6v+XEKJUiDBGjuYP/oz
 ypneQXOMkn029GO68zQEvs1tkv1lnLTJXUmy/9iJB3sbtjrCuxpob8NcOFE33KcNptbS
 erSw==
X-Gm-Message-State: AOJu0Yw+Bf8mIWFLRgQEFKsD2CNyc3lSn8yF39naSFgUSd4KbqVo6P2r
 +QNv27LsfWGkE3BB6UD8jtpGZin/1/Ux+auPKcK+bNWxlzkzX4DETK6BIw==
X-Google-Smtp-Source: AGHT+IE6Mp4TyAS+lQsfzdcMJ6NqvX42msgAFXSF+jeMk1+GT44ptvWzPK4oL6dA7mAABxmIWGKZPQ==
X-Received: by 2002:a17:902:ccc3:b0:1f9:cdab:fae with SMTP id
 d9443c01a7336-1f9cdab1131mr26766005ad.34.1718895134569; 
 Thu, 20 Jun 2024 07:52:14 -0700 (PDT)
Received: from 1-169-135-157.dynamic-ip.hinet.net
 (1-169-135-157.dynamic-ip.hinet.net. [1.169.135.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f5ad14sm138197775ad.303.2024.06.20.07.52.13
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 07:52:14 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) 
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange ECDHE (P-384) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by localhost (Postfix) with ESMTPSA id A490E1405AB
 for <wireguard@lists.zx2c4.com>; Thu, 20 Jun 2024 22:52:12 +0800 (CST)
Message-ID: <384d1fdd-a32f-4839-bb8b-2761be363b50@gmail.com>
Date: Thu, 20 Jun 2024 22:52:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Nohk Two <nohktwo@gmail.com>
Subject: How to detect the IP CAM on LAN from WG tunnel ?
Autocrypt: addr=nohktwo@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

This seems a common question but I don't know how do you solve this problem.

My machine has an ethernet interface: eth0
   It's network is 192.168.100.1/24

I created a wireguard interface thru eth0: wg0
   It's network is 192.168.128.1/24

I have an IP CAM on the LAN: cam1
   It's network is 192.168.100.21/24
   This is physically on the same LAN as my machine's eth0.

My machine has a MASQUERADE iptable entry in the nat table:
   iptables -t nat -A POSTROUTING -s 192.168.128.0/24 -o eth0 -j MASQUERADE

My phone uses the wireguard connect to my machine's wg0.
   This wireguard configuration allow 192.168.100.0/24.
   My phone's wireguard VPN IP address 192.168.128.10/24.

So my phone should be able to connect to my IP CAM without problem.
   192.168.128.10(phone) source NAT as 192.168.100.1(eth0) then connect to 192.168.100.21(cam1)
   192.168.100.21(cam1) reply to 192.168.100.1(eth0) then NAT rewrite to 192.168.128.10(phone)

However, the IP CAM's mobile App on my phone never remember the IP CAM's IP address and will always scan the network to find out the IP CAM. Then Failed if my phone uses the wireguard VPN.

Maybe the problem is that my phone and the IP CAM have different network, 192.168.128.0/24 vs 192.168.100.0/24.

How do you solve this problem ?
