Return-Path: <SRS0=iDgY=II=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FROM_WEBSITE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798B3C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 00:31:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 746F064FF7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Mar 2021 00:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 746F064FF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c06e264;
	Wed, 10 Mar 2021 00:31:41 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 23fb60de
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Mar 2021 00:31:39 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ci14so33329872ejc.7
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 16:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l8CG4GeHOG0HcYXGdRLwIESd0NTxucG9+pAh/fNZrkU=;
 b=n51FUh/Io8GaLOTY0Ax/KDRp+sUSEBv+ja0Ng6LRRlergL+6kyCE5O3S91yvYRZukD
 RLztOQfu0X+kvWB2xskxNGmu9237V/kpTUuuJNjznjxoeutg5tP3JyM4JJTKCM2CUDwk
 Q9hJPe3Mrq4+cjWHiIhJWAl7WxRLf7AlhJS/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l8CG4GeHOG0HcYXGdRLwIESd0NTxucG9+pAh/fNZrkU=;
 b=uHStyXvOlipHnss1LIaD91mhvPE5I/TQ6oB0GsszDipy2r13NPP5/+AnBMDmqSZR5P
 VqL92mJr7JYkDK1dMTOB8r/B6H7XBv8s5Zt3HZF4I5GVZjXTtb7HxVtQ1JARWk5NJkjj
 HOzxyVLmkBgHJKCpUp4WKXrk+TYAOeZrVyQHgvPUeJYnD/MPBBvxTG9JiMiPqnWd53eS
 JDCcafg10vvTxqGqHrVkP8muKkE86+63OW13JWtcARs9ZxE+JkdoAMFu3/FTFUFTDB8s
 3W0Po2bq46jz7DLJtPGydIBQiJAufnMzSbsptzVNWzNz83o1BJqcLIpuVgf+md5ClkiV
 F7hg==
X-Gm-Message-State: AOAM532Koc7r+rF0RIVcDXfsG3gL8yAegQR3mTLMVoWhaUYO2VnZN/vw
 vowBKsx21XVXsfckffM51cG6pzt7n4xIxQ+T3NcypP8u634N7hn+
X-Google-Smtp-Source: ABdhPJwyAHPrXtEp1sCUIUdQKRwP59XtYvjIuvEIA5JQgQdXxRIOhKS6C38wUkvaNP6f0IieIs6ZtQK+KCPoL7B1R6k=
X-Received: by 2002:a17:906:a51:: with SMTP id x17mr696526ejf.25.1615336298800; 
 Tue, 09 Mar 2021 16:31:38 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOUJVEyxfT-bOhUe4gZb7yUN_=xwun13pnt+iDZus=LRXQ@mail.gmail.com>
 <CAHmME9pC=y2_d_z6iyB2ci0O2gKw7WyXnkTxj7AAfwbWLcA7zg@mail.gmail.com>
In-Reply-To: <CAHmME9pC=y2_d_z6iyB2ci0O2gKw7WyXnkTxj7AAfwbWLcA7zg@mail.gmail.com>
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Wed, 10 Mar 2021 08:31:27 +0800
Message-ID: <CAKVinOWSAKSmJZAnx5FazKQqXWnwQkt-AxBH3pR6JrL3SYvi+Q@mail.gmail.com>
Subject: Re: Any possibility to run wireguard-go with android vpnservice?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Thanks, but I knew android-gui, it used gomobile JNI,
What I'm trying to do is use the same control script (I've integrated
PHP into android)  to manage wireguard process cross multiple
platforms (for example: Android phone and armbian linux TV).
So in my case, command line wireguard accessibility is in first priority.

I saw that someone did it with
tun2socks(https://github.com/jackyflame/Yysk/blob/8ac2b21c1b11eba30205d92e8f96c6d80caaa1dd/app/src/main/java/im/socks/yysk/ssr/SsrTunnel.java#L286):

first Runtime.getRuntime().exec( ... tun2socks  --tunfd
vpnConn.getFd()  --sock-path /local/data/tmp/wg0.sock ...)
then System.sendFd(vpnConn.getFd(), "/local/data/tmp/wg0.sock");

So I'm trying to imitate it with wireguard-go arm64 binary, but I got
no progress

Thanks for your great work

Malcolm Ke

On Wed, Mar 10, 2021 at 5:26 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> What you're trying to do has actually already been done and is
> available with a nice Java wrapper:
>
> https://git.zx2c4.com/wireguard-android/about/#embedding
> https://search.maven.org/artifact/com.wireguard.android/tunnel
> https://javadoc.io/doc/com.wireguard.android/tunnel/latest/index.html
>
> This should hopefully save you a bunch of time.
