Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271FAC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Jan 2023 16:42:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2e2c7d2;
	Wed, 4 Jan 2023 16:42:13 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0f8b4259
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2023 16:42:11 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id n12so23767699pjp.1
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jan 2023 08:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p37Hhkc2jhfwO2pNpqFsklfZydjbD0Bz259pcBvbbzg=;
 b=X988S4cnp6J1eOGE2KQ8r3vCAO+DSDG2/5YypoerulyfiU4Omo/14zcafjE4hCrHhy
 eE8b51Mc6a61q9ANKlXMIfNnvqoUf4HHXo2Mzb/uZ9xb/+UFXqLxCennSUdwpXEiJf9e
 dZzf7rrLsxibCcMAvoRh/W2d4ZZeZQDAHjBmn/P3kaD00cfep4xopzLZybIKdQgyQ59s
 hp09djD3N2TxnPm8S1lrHg9g/PcD1IuSwZM7La1AslZ3KpqxnHSo9AP28y36BrX4UmTB
 qxYdw3CJXDSxWMiSvxl0cdOzSgMABWbdZYXcCW+3XrFTNuAEoHKX3GlX6V9ObdUNklGo
 ZOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p37Hhkc2jhfwO2pNpqFsklfZydjbD0Bz259pcBvbbzg=;
 b=OPfuFiOdAviSh62q5N1FPHfbnvwlBu9Vl25undo2fKQEOhkAepNSmp69h4OZC897tX
 Q104XA0jmdWG+UDCfiS0G116SxEZXF46FnQL2MdkcIhUkiHv917R18g2koPMRnokH5fQ
 tW7oT7JYEEI+K1rURq3Plzrst6+wb+NFPkY+RFGZGKJGfQoIrYw5N268dhh3bwRwwmm3
 Qz5caD2JNPntsgdlD+2ANo3VyNAkh1Gj3/hnj8pkxD6cha1UhV7UKm+3+juIk4bDBld/
 bXbPud5sVD6mcpGuS0Of+SJ2hAfq1zmWBH+qbUNJaLh7ItakT42nIgCp195ayzNdvZsq
 c+jQ==
X-Gm-Message-State: AFqh2kpQE2w/dmIjmdU+tuiWBiOlk4DIHkmG3Y6AY8NZo/udMPGc7823
 oR812lqQYdPSRFoRPgEme7Jy4ga/GmxvBHzvEY8=
X-Google-Smtp-Source: AMrXdXsjO9gJaYFuzHAoYoxojB5ZFmQnDWehv8Ajt9bKU3E1f1w/i+d9XujC56tPN3R8fBEd1nGX1yuj1ZLt1/s/g2s=
X-Received: by 2002:a17:90a:e38b:b0:219:4ae8:1d9b with SMTP id
 b11-20020a17090ae38b00b002194ae81d9bmr4054474pjz.147.1672850529190; Wed, 04
 Jan 2023 08:42:09 -0800 (PST)
MIME-Version: 1.0
References: <8798af73660eb86c6fd661be90af8b73@skidrow.la>
In-Reply-To: <8798af73660eb86c6fd661be90af8b73@skidrow.la>
From: Szymon Nowak <szymonn841@gmail.com>
Date: Wed, 4 Jan 2023 17:41:59 +0100
Message-ID: <CA+hy6dt_ovauoKPJpELD+sv6OUFx1zLHofMyuMroxg4=vuOa5Q@mail.gmail.com>
Subject: Re: Prevent all traffic from going through the WG tunnel
To: Jeremy Hansen <jeremy@skidrow.la>
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

Correct settings

AllowedIPs = 10.10.10.10/32, 192.168.128.0/17, ::/1, 8000::/1

On Wed, Jan 4, 2023 at 2:48 PM Jeremy Hansen <jeremy@skidrow.la> wrote:
>
> I have a remote network that I've tied in to my WG server.  I'm noticing
> that all traffic from this remote network that goes outbound to the
> internet is getting routed through my wireguard server.
>
> Client config:
> [Interface]
> PrivateKey = XXXX
> Address = 10.10.10.10/32
> ListenPort = 51821
>
> [Peer]
> PublicKey = XXXX
> Endpoint = 11.11.11.11:51821 <- IP of the WG server.
> AllowedIPs = 0.0.0.0/0, ::/0
> PersistentKeepAlive=25
>
>
> Server config:
> [Interface]
> PrivateKey = XXXX
> Address = 10.10.10.1/32
> ListenPort = 51821
>
> PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o %i
> -j ACCEPT; iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
> PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -o
> %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eno1 -j MASQUERADE
>
> # IP forwarding
> PreUp = sysctl -w net.ipv4.ip_forward=1
>
> [Peer]
> PublicKey = XXXX
> AllowedIPs = 10.10.10.10/32, 192.168.128.0/17 <- Client's internal
> network.
>
>
> My goal is that regular outbound traffic just goes out the client node's
> outside routable interface and traffic between the internal networks
> goes through wireguard.
>
> For example, I'm seeing email being sent through the MTA I have
> configured on the "client" is showing up as originating from the
> outbound IP of the "server".
>
> Thanks!
