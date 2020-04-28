Return-Path: <SRS0=XOuh=6M=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E3BC83001
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Apr 2020 00:04:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D0562078C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Apr 2020 00:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="iDKBXxmY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D0562078C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2577cf8a;
	Mon, 27 Apr 2020 23:52:47 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 699133e1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 23:52:45 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80a091b7
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 23:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=GkiN1G4Bt3rOqUd8ua1dX91W5IY=; b=iDKBXx
 mYKkOuIG1adKYL4Hv7f8chC6Px9U03xC/DIfxOTsKFaXX9sWx9pAisn72bNWb1cf
 XVZYqOJ513hKrgDNrZWFWWlUqor8pd3968MMWMdNxeoj6jaqnjPiLhALjSNQkhGy
 zUrYhkOqPydteg9KxOexfMjz85UF0EDEodOS8Ez1VPgxCsfJuI42aoONfb+gLPKh
 q9h6JrN1qYv8TsdPWm6iMTCu699Bp5ga8FoQ7Em3AGfxpImbgBO/OkHChPEg8X5C
 okBxr+pxV6UQYEcj/7H1MtnqjXWZQZc84FVJe0mLMsAw580N9WFpL5VGM+5WRKTk
 IphfVJaFHsVjRBrg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86fb1674
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 23:52:45 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id 19so20898152ioz.10
 for <wireguard@lists.zx2c4.com>; Mon, 27 Apr 2020 17:04:19 -0700 (PDT)
X-Gm-Message-State: AGi0PuaDZEl6beSuG38l/nD8tb+VqeYpHWa6+CqiPc9f7ZwiIBmkT2bD
 /C0Eltk4YOIfpPq9TlltkMHXSy8GQqnCEA223SM=
X-Google-Smtp-Source: APiQypKqeB8eQU8xHPFV0j9a4hkhjy7ClpHNfuy+qw9FnUTNZIX4iOPHMJXde6ClCMBGdNkY6AF5NBDVpUUiS05wm4I=
X-Received: by 2002:a02:a68e:: with SMTP id j14mr23070730jam.86.1588032258636; 
 Mon, 27 Apr 2020 17:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <1588008413-5667-1-git-send-email-asmadeus@codewreck.org>
In-Reply-To: <1588008413-5667-1-git-send-email-asmadeus@codewreck.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Apr 2020 18:04:07 -0600
X-Gmail-Original-Message-ID: <CAHmME9rT_sZrp6rZJV=Jqw-7kwCgkZ2yiBYJqiunb2gibBGhOA@mail.gmail.com>
Message-ID: <CAHmME9rT_sZrp6rZJV=Jqw-7kwCgkZ2yiBYJqiunb2gibBGhOA@mail.gmail.com>
Subject: Re: [RFC PATCH] wg-quick: linux: raise priority for mangle nft chain
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

This patch is missing a Signed-off-by line.

On Mon, Apr 27, 2020 at 2:02 PM Dominique Martinet
<asmadeus@codewreck.org> wrote:
> -       printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
> +       printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerouting priority -160; }\n' "$nftcmd" "$pf" "$nftable"
>         printf -v nftcmd '%sadd chain %s %s postmangle { type filter hook postrouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"

Should this one be -160 too?
