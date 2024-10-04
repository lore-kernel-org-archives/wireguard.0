Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B51D49220
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa0d6526;
	Mon, 18 Nov 2024 12:36:19 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa67a4e8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Oct 2024 20:16:01 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-71def18fe1cso423212b3a.0
 for <wireguard@lists.zx2c4.com>; Fri, 04 Oct 2024 13:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail-com.20230601.gappssmtp.com; s=20230601; t=1728072959; x=1728677759;
 darn=lists.zx2c4.com; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WkmbkobtwyE4r4r3gBRTA4YCDB1EYPfB+0B9s5CrXhc=;
 b=puKZ7j1R3IB+Nx1tv1WiFzCHTpSizYepq4/Syle5ZNXdM8jR1UMIGsEv7zSOfhkjGY
 nGIXKP81yA9NB+0VdSYj80jQ0kVdJg0WpZjkMXrdet8AkPZTw2IOeyIh964H0uHA4MWj
 p3U96saW7ycA9IPbyUBNSgsR1pUiwd3YGrLw0TCoDtnKJRIhsUom2tmbUSgO1unEdcaQ
 7vAyG0Z6Mr1JT/AaPMOZExY+DAJpAswgtMOhQvBctZJYGxdlRgVAaBEDEzKql+eV9jpk
 0VYaHgx13MPvO2BaMvUlow1jSSnwzx9ZSjqQezm4yiHT6xElcis3+Es4b8pXPEHIgzZp
 Y1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728072959; x=1728677759;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WkmbkobtwyE4r4r3gBRTA4YCDB1EYPfB+0B9s5CrXhc=;
 b=WWHyYpqOoY4bqEfPrmrosGmKkDd1La/I2V8Pfe1AwRcryft137bsBj6UpGSFz+2pNo
 F2bemJOviHtfZXQmBgJ8aJIP7L0H7qyNiK+bm2BkSkFoTOamz2fxgYjeV2lO+AwlxVyb
 RFfRHQ7UcAymckfOBUJqZtxopSK4QK4CpJgjnrBTuRzNw0AKDrh0uRDw22O36JNUKckf
 z1keKverFkP3H004sBPPhw9eCcbGYxeGY7MRZwG6Gjl7gRDTfo8xMcV4PhXSeBGOZ/O6
 ArP5MQkshTwa6dnh+M0RR74yfKqmUvryUO1yteH54KEx2VrBnYaB43HYfikf7ky1I8wa
 An3A==
X-Gm-Message-State: AOJu0Yw+OLfF+V+R9LupojbkDjF+H8YTlSJBgM5FWvNG/IaduhgixX38
 6mh19G40xp4pKT3PEuddYdXjVL3/ZBIqSrgHHs90m66V+crgUDduQZB46ehi8GwBjKPiwVgEQrP
 usKErY2jArgEKh5j6Ci9jgtnhV/9tA9AhjLnwyg==
X-Google-Smtp-Source: AGHT+IGYVEyBHWfXfa9rA2bhnqW90FHO3ud94kiH9q/S8WBR59Ai5C4aoDUbnjQVX1zibEHrL6aaECSdDPUMOm6/a/U=
X-Received: by 2002:a05:6a00:1312:b0:714:1bcf:3d93 with SMTP id
 d2e1a72fcca58-71de239d3e3mr5909551b3a.5.1728072958839; Fri, 04 Oct 2024
 13:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAAqPzm5TKTj2fvosyFmavENBZFRoxn5OeYh37z04101Q-JdHSw@mail.gmail.com>
In-Reply-To: <CAAqPzm5TKTj2fvosyFmavENBZFRoxn5OeYh37z04101Q-JdHSw@mail.gmail.com>
From: Ameir Abdeldayem <ameir@ameir.net>
Date: Fri, 4 Oct 2024 16:16:16 -0400
Message-ID: <CAAqPzm5hS0JWzayNUtV3Ss7wp0+ApbjD3q0kcZ_hwngDPD6-tA@mail.gmail.com>
Subject: wireguard-go - sendmmsg: function not implemented
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:35:39 +0000
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

I am trying to run wireguard-go on a router running FreshTomato, which
uses uclibc as its libc.

When running wireguard-go, I get several of these messages:

DEBUG: (wg) 2024/10/04 13:48:25 peer(oXlL=E2=80=A6hrHI) - Sending handshake=
 initiation
ERROR: (wg) 2024/10/04 13:48:25 peer(oXlL=E2=80=A6hrHI) - Failed to send
handshake initiation: write udp 0.0.0.0:36895: sendmmsg: function not
implemented

I believe there may be a compatibility issue between the sendmmsg
syscall and my version of uclibc.

Do you know if there's a way to build a compatible wireguard-go? Are
there build flags, for example, that would cause wireguard-go to use
alternative syscalls, like sendmsg, instead (even if there's a
performance hit)? I thought that with CGO_ENABLED=3D0 I wouldn't hit
this issue, but it might be that the syscalls are being called
directly in code.

Thanks,
Ameir
