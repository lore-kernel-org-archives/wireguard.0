Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC72C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 07:43:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 504F820679
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 07:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozkJeduP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 504F820679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21e12d17;
	Wed, 28 Aug 2019 07:43:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a014b4e5
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 07:43:44 +0000 (UTC)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93768712
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 07:43:44 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id w18so1621204qki.0
 for <wireguard@lists.zx2c4.com>; Wed, 28 Aug 2019 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YF9ai3khf/MKPBGkBeWDZzVjf2MqACuEWlcFdQrfqJM=;
 b=ozkJeduPff84omQU9prkRjykECJymO/Fgyh2wVKBmNdLRyUYqD1+/bzeKeEPycCsMC
 vJPj9rPnUkjhUKVL2ISxtJw6GYHbyKJyuQFUVZC3Sv195r2hF4tH8CM4t6znyqtwjQyq
 GTwy7wrAYXAd9GRpNGxRcY0KpQJU034erwsOvG8EFS9t0Tue/5YZVQFV+J0K+Y7Obmcf
 u4U1JkRJEnDNR00/pfw7LE3L83ux3RHEtD+19qh9ZMGJ0d7lOSqId2qNwjV0hpBq4Znh
 3aqszvymhcOirm8IpU3iukNXb02zCLIvVsYeKpY3RMBQacdWsEQlfmayvhs8Fash+CGS
 Q6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YF9ai3khf/MKPBGkBeWDZzVjf2MqACuEWlcFdQrfqJM=;
 b=AfBg+L4VvBnKTv8+aEXmdCnWOGJ4TJY8tZL46s7s4y0DqPqfFE8oi4gili67Iz1oLV
 6vk3cnbqiBNVI6FU9wv62KGYHavv+dZ0JzQlUjlFsvLZChXKEzPudbvlNVK4uTFMjkMh
 HIzl+BndtHLNT3twmuvVJMHK3NZTjGYnhvYTrj6XRn5Y/7PJvuexm3H4M2Em+T0tgKYr
 WOvRlYld244iCCae7LYoBD6QcH0vOkq85EtcM+NkjY10LMnyjdgLm0xA/i+kKq52gBJz
 ux6r+pXvGyI65GVVhbcyyabBpuFBtSe9INoHQ/g9iVg/m6UAMihp84LfyeFBgFFXunPl
 Ec6w==
X-Gm-Message-State: APjAAAWJ0VVxPC3PeZ47yb/mk81GAsFRYlzn3t2R2Esw2+2NWVzPJqEv
 5jyza7SlyqLERfnOF83MYaOFs+ttCqWGBwx18Y4feYss
X-Google-Smtp-Source: APXvYqxzSodf1dDs/8Elbi0HURXq7k8e2kakQAWjSO14z572aSw4K0sGnB+eCieLyUDhbYjqChc/MJS3XX8WndMQBFs=
X-Received: by 2002:a05:620a:16dc:: with SMTP id
 a28mr2373509qkn.200.1566978223892; 
 Wed, 28 Aug 2019 00:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
 <20190826180244.GB5022@matrix-dream.net>
 <CANcuY=oE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=CxkMQ@mail.gmail.com>
 <em05f3a9de-8e41-4353-affa-3fb52e65cda8@ryzen>
 <20190828065411.GA6914@matrix-dream.net>
In-Reply-To: <20190828065411.GA6914@matrix-dream.net>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Wed, 28 Aug 2019 10:43:32 +0300
Message-ID: <CANcuY=qhYgh5AFmu-opyf95cuTqGuUgPN0te7dCR563ZGwkpTQ@mail.gmail.com>
Subject: Re: Keep-alive does not keep the connection alive
To: =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labawi-wg@matrix-dream.net>
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
Content-Type: multipart/mixed; boundary="===============1733602023945947519=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1733602023945947519==
Content-Type: multipart/alternative; boundary="00000000000067edbe0591288ccd"

--00000000000067edbe0591288ccd
Content-Type: text/plain; charset="UTF-8"

> As a workaround you could
>   - unconditionally periodically update the endpoint
>   - monitor last handshake time, when large update endpoint or restart
>     tunnel
>   - add keepalive to server - it might reduce your downtime
>

Keepalive does not seem to work in my experience.
On Linux i set up a recurrent script that tests connection to the wg tunnel
gateway and restarts the connection if the connection test fails.
But on Android this is not possible without additional tools running in
background that will use battery and negate wireguard's benefits.

--00000000000067edbe0591288ccd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
As a workaround you could<br>
=C2=A0 - unconditionally periodically update the endpoint<br>
=C2=A0 - monitor last handshake time, when large update endpoint or restart=
<br>
=C2=A0 =C2=A0 tunnel<br>
=C2=A0 - add keepalive to server - it might reduce your downtime<br></block=
quote><div><br></div>Keepalive does not seem to work in my experience. <br>=
</div><div class=3D"gmail_quote">On Linux i set up a recurrent script that =
tests connection to the wg tunnel gateway and restarts the connection if th=
e connection test fails.</div><div class=3D"gmail_quote">But on Android thi=
s is not possible without additional tools running in background that will =
use battery and negate wireguard&#39;s benefits.<br></div><div class=3D"gma=
il_quote"><br></div></div>

--00000000000067edbe0591288ccd--

--===============1733602023945947519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1733602023945947519==--
