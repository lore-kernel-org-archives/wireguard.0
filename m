Return-Path: <SRS0=+2x1=QC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7D6C282C7
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Jan 2019 09:50:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A8C214C6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 26 Jan 2019 09:50:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tW8qNPkZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A8C214C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b13fc5d;
	Sat, 26 Jan 2019 09:45:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51719775
 for <wireguard@lists.zx2c4.com>;
 Sat, 26 Jan 2019 09:45:10 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e68a7a0b
 for <wireguard@lists.zx2c4.com>;
 Sat, 26 Jan 2019 09:45:09 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id m19so9723156ioh.3
 for <wireguard@lists.zx2c4.com>; Sat, 26 Jan 2019 01:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vDRmeflbpXrnNU8+om7TDQp9HxWEkyZc4AVyFD+RtoQ=;
 b=tW8qNPkZiJ8aI9SvInvqf/VPrdy7fbN8B4TWOnZItxGqKtC4QWkOKDe3IYjej8YpM5
 H7CAY8Hncwayc4aCAM6w8iit5m0WrHabIclFeWjLd8XwKiVF/yvrZYtGsIIeDqRaYC0A
 84ff8pzeRlZ5S5hg/MOEu8k32RiaccmCep7F505WxJCSf0km1wWPZZmG6fW29dM8A+JL
 wDuMsi+9eUuAHVX9NBUnPAUirDXEC7b2T2++OQa1zZHWjcz8GrHq6xi/c3csfb5RiEZ6
 J7uLLkvR8nFrsQusQFcqw3dn2yejOPOR/xHcyA9LQg9JMZC9y+RHAzFsIkVe69kbze+R
 CIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vDRmeflbpXrnNU8+om7TDQp9HxWEkyZc4AVyFD+RtoQ=;
 b=jzVv2EMybirqjAYWUNKCwHttx0dOyyrQgqNExGbK5C8pgQYLX9zmRu69WBWORI0NW/
 4HGKqBGsPrNrar8ZZf2Ni2IkrDFSozM7TPLXn9VdfhohaiscgQwTAqxp3xTWOP0HH1Yr
 WdyD5OkDWLP2lSWcdMH0rD2YjPRodDHGKGOp8NtQ7lmpwGfXPB+RCQLHwkd07SHFhXBs
 9AkEEtUmcZzQqbaV0sNVTC2QMOotiBzrtzVpfyMLj1hgx33zRTlhismlx5MSB94GKCrZ
 Tt1f6XYEMC16oVVDZdQvUe8wJ4wldNs8eePnbM8N+1bq5kEZPeyB12zSwJ6k16vQTUHw
 8pwg==
X-Gm-Message-State: AHQUAuaK5D7U22AlQvAA1oVN3XPyzNG4jnY/BCCcGhIF4jJNf40wS9Hs
 ejXiU+88aTvReEuMdact7tCURL3KXOTgIgSoBLo=
X-Google-Smtp-Source: AHgI3IbP80CZeTrUDn/2+nJoEcg5mw2nPDxQlc6dEzOcoeMs/BhTincQI/WNZZapgZ3Q50l0kUeM65iwicp1Zl2l07U=
X-Received: by 2002:a5d:8199:: with SMTP id u25mr8886412ion.113.1548496234980; 
 Sat, 26 Jan 2019 01:50:34 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oWcFMquF4TuaQ3o1KVN2pBwr4+uyJx4=ujGVtzexzqzw@mail.gmail.com>
In-Reply-To: <CAHmME9oWcFMquF4TuaQ3o1KVN2pBwr4+uyJx4=ujGVtzexzqzw@mail.gmail.com>
From: Germano Massullo <germano.massullo@gmail.com>
Date: Sat, 26 Jan 2019 10:50:22 +0100
Message-ID: <CAGa=++RfGNuA1N0uc9Vk+5fG50oFEqU2Mqsjy_R9gBBUKHBn2w@mail.gmail.com>
Subject: Re: WireGuard @ FOSDEM -- Meetup
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============6756039772989204432=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6756039772989204432==
Content-Type: multipart/alternative; boundary="00000000000005aa8605805960e7"

--00000000000005aa8605805960e7
Content-Type: text/plain; charset="UTF-8"

See you at FOSDEM!

--00000000000005aa8605805960e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">See you at FOSDEM!=C2=A0</div>

--00000000000005aa8605805960e7--

--===============6756039772989204432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6756039772989204432==--
