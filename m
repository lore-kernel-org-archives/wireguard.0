Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5FAC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 19:02:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029E120851
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 19:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="rHddAR4D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 029E120851
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86294c2b;
	Mon, 19 Nov 2018 18:56:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2028591
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 18:56:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ef11956
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 18:56:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd80e5a9
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iv7vfBSvs3bzG37r4URpS+AAFsA=; b=rHddAR
 4DiREtWpgihO5s/asSuR7V9WQMj4EM24VjgqAzgPTpoVA+KF+z2JL6LBkmp+BRK1
 ihaOFbydtrhEaSAmiYFFM2rRveojyhqjHs5cZBWbNu8PYATqXCB27/Q8ZSpG9Cte
 sjmF996z+f8dFjr6tAQHHm0pWAzt+IVDHo+VWpVf3AzC9Tw5MQE+GJSTVcX4DBVP
 bng2yf6GnVEH98hkdr5Ixa+0ksiXGl+eplS884xrBImoK37IyVNeki/8YpCN2+Y4
 lWatklfdnJdeaotIWcVqTKxrcj+4CJFIk9YARjy6TBTdTM/+QZWTl41AOe+1uXRa
 yBdLFMLG61Wr2nmw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 54389d7c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 18:56:18 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id g27so28651380oth.6
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 11:02:19 -0800 (PST)
X-Gm-Message-State: AGRZ1gKFlC1RdwYQGzo62Y6I9gd5ojk9DzL91cQlqGiu4u1GAJTpiH+n
 YHmvj3uTrqmlJdAdtVRcrmI+rBe9osOLo7e4Io4=
X-Google-Smtp-Source: AJdET5eAHEqxbuzkncK+Mu8WygZEfcOZYmZPzEcbDEuM2EskcQyp9PDRByCeldURiHcws3mtee+KeRs0GRpCc1VGblM=
X-Received: by 2002:a9d:837:: with SMTP id 52mr13184227oty.143.1542654139061; 
 Mon, 19 Nov 2018 11:02:19 -0800 (PST)
MIME-Version: 1.0
References: <aab31593d316f5de@frisell.zx2c4.com>
 <VE1tYzOPCJK4AHXvf6wzqzseITkoWAV3A_3BoPB5C8OhHHGDTmldi2DLkFtiljNrdHKAr6UYea2Z-qT56WEom5upq12Mr4-KpX7CKNDts6g=@protonmail.ch>
In-Reply-To: <VE1tYzOPCJK4AHXvf6wzqzseITkoWAV3A_3BoPB5C8OhHHGDTmldi2DLkFtiljNrdHKAr6UYea2Z-qT56WEom5upq12Mr4-KpX7CKNDts6g=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 19 Nov 2018 20:02:07 +0100
X-Gmail-Original-Message-ID: <CAHmME9puWPwmOjRYcEmmFAf2KMM2KyDiV4EJPHRBBXkNSBrZqg@mail.gmail.com>
Message-ID: <CAHmME9puWPwmOjRYcEmmFAf2KMM2KyDiV4EJPHRBBXkNSBrZqg@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181119` Available
To: Jordan Glover <Golden_Miller83@protonmail.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Jordan,
On Mon, Nov 19, 2018 at 7:04 PM Jordan Glover
<Golden_Miller83@protonmail.ch> wrote:
>
> It fails to build for me (doing in-kernel build with Linux 4.20rc3 and WireGuard/contrib/kernel-tree/create-patch.sh) with below message:
>
>
> make[2]: *** No rule to make target 'net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.o', needed by 'net/wireguard/built-in.a'.  Stop.
>
> There is also following warn when applying wireguard patch:
>
> diff: /WireGuard/src/**/*.S_shipped: No such file or directory

Ugh, sorry. This keeps happening: neglecting the jerry rig scripts,
because they're not in src/. I need to either move those into src/ or
add them to the CI so that this doesn't happen again.

https://git.zx2c4.com/WireGuard/patch/?id=37466fb996ea174cddd3d836c2f49c53b10648ad
should fix it.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
