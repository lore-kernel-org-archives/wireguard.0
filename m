Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73306C4727C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:57:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A2C621481
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LVXAxgKi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A2C621481
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 326e7dd3;
	Thu, 1 Oct 2020 11:25:28 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8051a65c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 11:25:26 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d9968b3
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=lW98nhy/h7CSGC8bJVdI8iC6i4c=; b=LVXAxg
 KiSy+CrIhVTK9nchS+g4Uhndnbt0/geYRoXCcOrBB7VmqO6T1QYxrivoHCkIeVSA
 QS+d+kXSwkZlyt0d2e8uG7F7wMu0Fl973sgvPOT69+fkIrR2g1h3j/jmF2PwIKV8
 KAaIwroGrjPpKGtF2L/OqiFVujxCI57kGMLx4zqZ6AGL8wXXbC9sKDk9Io+5yL2m
 5+SmD0G0FRlD3qdrsXTfvp6NPwXzWT5sWFn4tK6Hc1gKPWGFvBYtLlKrOUiEkMcn
 dtJwlKwJ4a9S8kokolbaFy2H7oSN2zpOzjhpxQ8fMZwQ9c4/RWK/C1Mv6x5+0gTI
 ZUD8MU+rRUlBfZRQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80c4cc2f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 11:25:26 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id q5so5823996ilj.1
 for <wireguard@lists.zx2c4.com>; Thu, 01 Oct 2020 04:57:17 -0700 (PDT)
X-Gm-Message-State: AOAM532z6UoMMYdzfLYvcvwpFIM09CzMlmfPSAsziE++fen+VjFRieRE
 KyftY9tBRmCNW51IHYykSWi35x4scFHNQIzjy8Y=
X-Google-Smtp-Source: ABdhPJyNTX6b+2RtJHGyW3q3mQK0gAIkO+4863U33prpJ8Hd9S+7bjbpIz0z6PC9lCLipiIVdCGh2d/ISgaJURfFIDw=
X-Received: by 2002:a92:d289:: with SMTP id p9mr1405773ilp.224.1601553436583; 
 Thu, 01 Oct 2020 04:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <RO0eYtp8TKtVxKltNMcmKXS8FhbJRiFU1fBuG8XmE3h8AtjY2_JlRSw_k29pm-3r70B_3pQHIF1nk252-3wHqVMlnbGbub2GiCU3DN7arLY=@protonmail.ch>
 <036BBED1-14F9-42A9-8915-835F24A97926@knockaert.nl>
In-Reply-To: <036BBED1-14F9-42A9-8915-835F24A97926@knockaert.nl>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 1 Oct 2020 13:57:05 +0200
X-Gmail-Original-Message-ID: <CAHmME9qomaQdNUsvhDtp2caxAGBGXLee5FT_C8_q9A=yzQP3iA@mail.gmail.com>
Message-ID: <CAHmME9qomaQdNUsvhDtp2caxAGBGXLee5FT_C8_q9A=yzQP3iA@mail.gmail.com>
Subject: Re: Two small Wireguard frustrations on Mac & Apple iOS
To: Jasper Knockaert <jasper@knockaert.nl>
Cc: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Oct 1, 2020 at 1:24 PM Jasper Knockaert <jasper@knockaert.nl> wrote:
>
> Hi
>
> Just one other issue with the MacOS client. When you have multiple users
> on the same computer (say user A and user B) user A can import a
> WireGuard config in the client. Then another user B can see the config
> name, but cannot modify or connect because the required keys are in the
> Keychain of user A. So far all is fine. But user A may specify the
> config to connect on demand (basically upon login). Then when logging in
> as user B, WireGuard will still try to connect without having access to
> the connection settings (because they are stored in the keychain of user
> A). This causes an endless loop, which should be avoided.

Nice catch! Thanks. Will look into this too.

Jason
