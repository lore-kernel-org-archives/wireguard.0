Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B5C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Mar 2022 19:44:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c04c0688;
	Mon, 21 Mar 2022 19:34:56 +0000 (UTC)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id eb61798c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Mar 2022 14:20:45 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 x26-20020a4a9b9a000000b003211029e80fso13815844ooj.5
 for <wireguard@lists.zx2c4.com>; Sat, 19 Mar 2022 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=UWWEtn+zRW1j0uqlnBNC3XGRPVVg8cgXrWKA2T2YTvM=;
 b=Uc7Se3zt8gPg1+lb9vZGSGQu0bsSXXPuSZtpbwaHIe3fY1VDw/J6SExa8nnV+SU89E
 1kLZFWhU2C87J2Na6nDOUu94lpX/y1joCKIZYW27UhWuTSp83/GEUybIzb8IcGsULJIv
 GkKPPrrB43XEHCXCo5K1+i8vO/XG+3SYsoL832TVfIUVDw56SADP/+uJtHcND/+yxh/h
 k0y2AvPVEQjAB5qPGYL+Ht+uFJjlxuzBsg4boo1ez2hsGrv7m1mUpwoGW/taHCjGPxr/
 XhFC/zJhcmXQSijDIjzIFVsnLOUemJMCwd6+/526GzqVuFBwFuNQdNebqLP1WP6v3jas
 iCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UWWEtn+zRW1j0uqlnBNC3XGRPVVg8cgXrWKA2T2YTvM=;
 b=cGjq4UF4/BIx+LSHjzXqEuQZh6rCdsr8prHAnq+nG3kST0gHOhDmWt9HssNjR+nkU/
 IsZxN0tT7nPsdFfP53REbubt7JZgf9kWOPkDKwtB9dalhe5XL5lkKE7Bk/aGAimq6Fri
 fbYDvFwRb+7iPlgyhpvcEe2iflt/LE27PKcPvZAEsqHMEa4n9cGukO5XqCZkiFk9Lc9n
 8TWGg6LrmsZHoZm/gYoMVQTd8TF3+sl7Di6c/GuusFPzExihPDGv+3i6oDrQICHnzf30
 BJNbSTgPZYJDs+T9eAItBnfGoeEGQHavOQVWSRJsskvkrHzEufW5ZmOoaFj0Z0chlgyy
 EqEA==
X-Gm-Message-State: AOAM532cJUNiC8VHbzTCpOCzXNdic1n4F+7GTD9IJT7y32zkAMeG9hmt
 MjOYtpcSCLxkdfit9qnJ2wL7lljLsxGnN4lKhYNctuYDDu8=
X-Google-Smtp-Source: ABdhPJx9OgMwSuaiUhVnN6zuCqqNYlM05ZdIZzWDMbapNAAuabNea9RfbZ5iZU1+wQXVzU1A5EjutFC00AYhXoJSml0=
X-Received: by 2002:a05:6870:5b8c:b0:da:6a40:8e6e with SMTP id
 em12-20020a0568705b8c00b000da6a408e6emr9108251oab.177.1647699643279; Sat, 19
 Mar 2022 07:20:43 -0700 (PDT)
MIME-Version: 1.0
From: Barry Cisna <brcisna@gmail.com>
Date: Sat, 19 Mar 2022 09:20:32 -0500
Message-ID: <CAL0AYvcHYP1GN+DZN96fQw9f+FUU8b+C9yOCrWGnAEtezCnBDA@mail.gmail.com>
Subject: Systemd-resolved problem
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 21 Mar 2022 19:34:47 +0000
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

Newbie to Wireguard,

1- Server VPS in Google Cloud Debian Bullseye,
2-  Home Server Debian Bullseye , behind CGNAT.
 After many hours trying to get this to work,,here is situation, from
'client' server2 i can ping any external /internet ip address, i
cannot web browse/ resolve names. Have tried multiple iptables
examples.
So now find that when i do an sudo wg-quick up <wg0>
systemd-resolved.service is in a 'degraded state'. As soon as i down
the wg0 the systemd-resolved service is running normally again

 when doing a resolvectl with the wg0 interface up there are no dns
servers on the wg0 interface
