Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39929C54FB9
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 13:57:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58ebfab1;
	Sun, 19 Nov 2023 13:35:10 +0000 (UTC)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 280fbf0c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Nov 2023 18:43:18 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2802c41b716so3951438a91.1
 for <wireguard@lists.zx2c4.com>; Mon, 06 Nov 2023 10:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699296197; x=1699900997; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QSUFzUI7rnY0qi+/de7BpD0utAMBbHZ2rfhoqzmagvE=;
 b=TcaZTi3OrTqHwTte1P7Y9gQF2C3lbfrNOMGLDqKXrJLwfXktMl7KOEVh8b90qJtqs3
 DfdAc4DXSsHpGkYCkB5Qp2iHCXR8Rtrbt6/La8Q6Gdehcit8edHnDaR3ckXqd1gQP5I/
 ssIt2u2b75Z6lbl4Cjiv9Vj9DtycX4LeIxysOl9CTZs7tJvXA9T/FASNc2nUGX210iUe
 VKPTAcGo5/KHN5bWZZ7FT1RJqDgxDcyypqIMHkSwlgag92zefZbnDOQ70qBf7gPPKDlF
 U79c0T+Uc4IQBsnQzVWvPJv4xwQhnVkxVEuG3XsVqrr/iFJvBz7QB8w2n7MvXGgrLxQn
 A+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699296197; x=1699900997;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QSUFzUI7rnY0qi+/de7BpD0utAMBbHZ2rfhoqzmagvE=;
 b=QQ2B44k02sG4O4veObtm5Bt3+OriAMvN04K43GMzf9DkzLZskAD46u554y2HVwW/ra
 Ll+nap71FGw2BaZ5YXn7qXlhT7vYtWqixMFlZbTIf1gbyoK3S2V043GxI6JaSD4cb6aj
 IDhmc27IukkPv5xTDqp0FMkuYN9nQYUKUdH/dEnOQBSQZ/pwsMiTcx2b25L9Mfda0yw5
 d7JKzhmzbz41N0AE1DWOImStu9tb/OBOLKP8SH0xUZu0DHaeWlVjwN/np0HCh9ZErdy9
 eB6UjrmKqMXBM56KHw5S54ao26R71IcVQDFIa3F1uBYeKozyZds7Po1NaLG+k/eQH7hT
 jbPQ==
X-Gm-Message-State: AOJu0YxSfE/5ucXpHPqXaa6xHWJZ9B4WuZl3XiqbaNToyhJwhG39xQbr
 RbUsHIMRRqjI+IxjSQ8AzBR1T0Q0dt36kBwmvH+fNlQXJtY=
X-Google-Smtp-Source: AGHT+IHYTg4c0sMhjeLLD5SPD0ge7ojAIGEt1CYtzQCb/GpqEEp0tFdB2L95rOgYgfOwGTCxwSXXFP6aKKCxvN4Up4A=
X-Received: by 2002:a17:90a:1a:b0:280:1d7f:440f with SMTP id
 26-20020a17090a001a00b002801d7f440fmr21085903pja.26.1699296196929; Mon, 06
 Nov 2023 10:43:16 -0800 (PST)
MIME-Version: 1.0
From: Erik Schulz <erikschulz184@gmail.com>
Date: Mon, 6 Nov 2023 19:43:06 +0100
Message-ID: <CAE5KivgR-GA0GXpF3smL=XybcCKz4UvOsfRsm6ZSKtTUcsPc8w@mail.gmail.com>
Subject: Bugs in MacOS client: Infinite reconnect when using on-demand and
 switching user; missing reconnect feature
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 19 Nov 2023 13:35:10 +0000
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

I'm using the MacOS App Store client,
App version: 1.0.16 (27)
Go backend version: 1e2c3e5a

I use multiple users and switch between them.

a)
When logged in as user A, which has the tunnel set up, and Wireguard running,
when switching to user B, Wireguard disconnects the tunnel.
As user B, trying to switch on the tunnel in Settings > VPN, fails.
I'm guessing this is unavoidable, and a security feature of the OS,
but if not, it would be nice to have a configuration option to allow
the tunnel to continue to operate.

b)
when having "On-Demand" enabled for ethernet and wifi,
When switching to user B, the Settings > VPN seems to be in an
infinite loop, switching on/off. I'm guessing that Wireguard (running
in user A) is trying to establish the tunnel, but failing. I'm
guessing that there is a bug in the retry/wait logic for On-Demand.
This causes high cpu load.
This means that I'm unable to use "On-Demand".

c)
Instead of On-Demand, it would be nice to automatically reconnect when
switching back to user A.
Currently I have to enable it manually each time I switch to user A.
Could the app remember that the connection was active before user
switch, and when switching back, automatically reconnect?

Thanks!
