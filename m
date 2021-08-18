Return-Path: <SRS0=OAC8=NJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B329C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Aug 2021 05:54:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E6E060241
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Aug 2021 05:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E6E060241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tomcsanyi.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8de1cd7;
	Wed, 18 Aug 2021 05:54:16 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0dbd7a02
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Aug 2021 05:54:13 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id b10so2516750eju.9
 for <wireguard@lists.zx2c4.com>; Tue, 17 Aug 2021 22:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=a46eehnFtljDxQCPqZq96uqGGDEStxA7zC23keAapUM=;
 b=u7GI94GMfcsIe2T7KhrOJwZ3CogruTw24dWa+uzHwqVDRlTVL/fgth4kPwvNj7Jg6t
 2NdR14HPIp6WXIiS3juSyCZ1EQS1jjnBWwahM0DQbS119/u1Ra1pRvHa0YAI5ffcR4EY
 0sNgILwabVS2q3wS1x7Y/Qe1QeQ4lymQhSgbsjokDq2jr82QQM3CTfW8p5oCEf10hBk1
 zQyFzdSI9BE71Jmi9EGYaEc32PQTliFKQaqVnIV4RcQy/M6Id6aOoBJJWVYOyBSAM6HS
 71OdOkz9j4zNBQSmJlmVFqCPwfZRpD8qP05KAwUfNGPIKf1BrYF0cmOLhPfUsp/R7bfl
 HcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=a46eehnFtljDxQCPqZq96uqGGDEStxA7zC23keAapUM=;
 b=M3dTcCGL/Jm1V+9e1oSuXnH8nwhVLGp5bUUtRii81gT2a8/tyvq53djISOhCNv2AUO
 nZJoHaVV9UCeDvTAgl906pxmUyhJcni8Xuk3wFfCjAHR6Y1UCgRBra1c+Sm1gYofTxZ+
 IUJ1YJi7qxdpVXu0cirgde14+uyzGgrm1/0DUADUvz+TGkWOReDk7+J5Wd51Z3CQ483E
 lSyv/6OHWAoDdnddRiew9jtvHeQWXgZIskPjPqSIo1Lr80RKtE33DyVytar/Qo/985LP
 2Eox239r1VaDtDIWMNLiKZzZKCWhwhbBgUQEi+ELintTwqVDqqsX/I4XKrkkpD3HQBTQ
 Wv5g==
X-Gm-Message-State: AOAM530FaXAs0CxEEWQcz+vWGtgMbrKGhY9uq17iNieD+/xbMWLTybDa
 i0krh7tIWUCl6xbhDb0Nvek9XX3Wj+kwZCoI
X-Google-Smtp-Source: ABdhPJwPnpTNWTtwXtNNd7688soxO3mkpPjvEysVzwyVlLhnWZYM2OpeXAHjuWvSmmw7wDvwgpd0og==
X-Received: by 2002:a17:907:c12:: with SMTP id
 ga18mr566253ejc.107.1629266053383; 
 Tue, 17 Aug 2021 22:54:13 -0700 (PDT)
Received: from smtpclient.apple (80-95-82-192.pool.digikabel.hu.
 [80.95.82.192])
 by smtp.gmail.com with ESMTPSA id gl2sm1531622ejb.110.2021.08.17.22.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 22:54:13 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
Mime-Version: 1.0 (1.0)
Subject: Re: Domain as endpoint when using wireguard with network namespaces
Date: Wed, 18 Aug 2021 07:54:12 +0200
Message-Id: <03667268-5415-4FB0-9D4B-1E51466A3F5C@tomcsanyi.net>
References: <CANO0tfaBiU3r+bvBp5q57EBc4FNu0+FJ78_7G=vPzdJvuTi18g@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <CANO0tfaBiU3r+bvBp5q57EBc4FNu0+FJ78_7G=vPzdJvuTi18g@mail.gmail.com>
To: Waishon <waishon009@gmail.com>
X-Mailer: iPhone Mail (18G82)
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

I am sorry, but I need to ask: if your namespace does not have an internet c=
onnection how would you connect to your remote endpoint after the DNS lookup=
 issue is solved and you received the IP behind vpn.example.com?

Kind regards,
Domi

> 17.08.2021 d=C3=A1tummal, 23:06 id=C5=91pontban Waishon <waishon009@gmail.=
com> =C3=ADrta:
>=20
> =EF=BB=BFHey there,
>=20
> I'm currently trying to setup a wireguard-tunnel inside a
> network-namespace as descriped in the documentation, which fails when
> using a domain as endpoint:
> https://www.wireguard.com/netns/
>=20
> First I've created the wireguard interface inside the birth-namespace
> of the host using "ip link add wg0 type wireguard". Then I moved the
> wg0 interface to the newly created network namespace, which doesn't
> have any network interfaces and network connections beside the
> loopback interface.
>=20
> Then I configured the wg0 interface inside the network namespace using
>    wg set "INTERFACE_NAME" \
>        private-key <SECRET \
>        peer "PEER" \
>        endpoint vpn.example.com:51820 \
>        persistent-keepalive 25 \
>        allowed-ips ::/0
>=20
> This however results in a "Temporary failure in name resolution:
> `vpn.example.com:51820'. Trying again in 1.00 seconds..." error
> message, which makes sense, because the wireguard-tool tries to call
> getaddrinfo inside the network namespace. The namespace doesn't have
> an internet connection and the lookup fails.
> https://github.com/WireGuard/wireguard-tools/blob/96e42feb3f41e2161141d495=
8e2637d9dee6f90a/src/config.c#L242
>=20
> As a user I would expect that the wg-tool does the lookup in the
> birth-namespace of the interface and not inside the newly created
> network namespace.
>=20
> What is the recommended solution to resolve an domain endpoint when
> using network namespaces and wireguard? Just manually lookup the
> domain in the birth-namespace and use the ip as endpoint? The
> implementation however would be quiete hacky to make it properly work
> with IPv4 and IPv6.
