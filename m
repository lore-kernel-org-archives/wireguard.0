Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4EDC46467
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Jan 2023 23:41:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd755ec8;
	Wed, 4 Jan 2023 23:41:18 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4ca5b3a8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2023 23:41:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id m3so17940953wmq.0
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jan 2023 15:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J7Y9rTfsAnYJPlrUdLUuRDaL1SAu/rQiHP4iWQR2BuQ=;
 b=R5+F3LB6tu2rWtS16jIbbB2BTFUDkh6cle+6MTHYzcKPHxEBQGk8heNw+kA2DjfcL/
 g/suYBdLqMxLpr1YNgROb+Qzp3cZbQZSzNY7X7FXGr6GMtgOKZnOGwY4zTD8jSIoRhZc
 La5v5qgZ37R9J0a3h6j4EIP+ImLGEP+wG8bsj3J88XN8PE0kqaq5Cqu8BDdyG3SQayS+
 rZpndMahQjrkRKP+iHvxuUu1hgMBFlGk16HzLDU9UtWXLmFALK5px6IGPN2Zc+/eklix
 Nxf2hGmKFQwwCRbE7onBgZYFPsF66341cAi9FhnLVj+Wze80VYIWThjOB1tHRVOfDXmS
 l5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7Y9rTfsAnYJPlrUdLUuRDaL1SAu/rQiHP4iWQR2BuQ=;
 b=jj+w7UQgjEhQGga79M5xYnq4AepiT+2m/jAY22GXYzmgewCGMFaodZQWwOA1UOoukT
 ct61SjEYp4XM1wvAULJ605EXZg4R2kD7btdk8fxEkKGAYSa/IcbAILoVy2ajJVLIsMK+
 ihTgYS6kzJAzwyvS1kGKu/W6fafKbCfBuUznjtPAdqxl7yWHovf5jCayvJUuxDlLmZrH
 m55p6PZ0OrsGxb16dINSP3xijs8O4rx/meZAsg5ZrqMFZbdYJ4oAhJ+s6tM++fMDdBgi
 kC7VPpkm/bcIjtVYv6A+i61K5l/7LZN9THyP32t8+aGemws2I5kOFpJhsrPzQuOfSBO3
 E45Q==
X-Gm-Message-State: AFqh2ko+jiyHeMk6z6qqsBaPfCzjppR/Q+DnvapPK2+WdZSiGXTKuPg7
 Emm7KJBHjs923WgyPOTAM7+qOJnEU+k8TMIhyoE=
X-Google-Smtp-Source: AMrXdXtRBqYsnNQDHwheNMcLVNlnfK27Ej0S3aAniwX6bIWtj4c6qs4k8/bBE8C4eIJmjc9O7L520L5NzO+ncRxKR44=
X-Received: by 2002:a05:600c:1d1d:b0:3d3:5737:3afc with SMTP id
 l29-20020a05600c1d1d00b003d357373afcmr2931597wms.202.1672875676130; Wed, 04
 Jan 2023 15:41:16 -0800 (PST)
MIME-Version: 1.0
References: <8798af73660eb86c6fd661be90af8b73@skidrow.la>
In-Reply-To: <8798af73660eb86c6fd661be90af8b73@skidrow.la>
From: Omkhar Arasaratnam <omkhar@gmail.com>
Date: Wed, 4 Jan 2023 18:41:04 -0500
Message-ID: <CAHx9msfDB5G7s=greo-7AxsgN463NQQsC7rmcR=ZhRSCJLHXYw@mail.gmail.com>
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

Are your NAT rules necessary? They seem to be forcing *everything* through

--oa


--oa


On Wed, Jan 4, 2023 at 8:50 AM Jeremy Hansen <jeremy@skidrow.la> wrote:
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
