Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1423C4320A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FE460F35
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2FE460F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 336d6735;
	Sun, 8 Aug 2021 23:00:13 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4f66debe
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Jul 2021 04:18:19 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id a2so20478081pgi.6
 for <wireguard@lists.zx2c4.com>; Mon, 12 Jul 2021 21:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=rZijZ8zZzjIrFfncpkp5Gauu72w7qN96cGEXwN+72xw=;
 b=XdDA0Awd4ScA1juFPu6mJXwYkVIPHi5nirnDTEsryS9YYYGHMX6d1xAFGE7CFL/vy5
 Y/H9l4UUncJpKBlWNaLGVF/8pVU+8FpyxXROelhE3RJjWI3wGwfGa+XZUcWMsW09jO2N
 swdSgF58OXvZq8cC7DX6nZvR0jxagNO/bgJMSQjRSlHp39VuEFK5VQ+IxDDl+ZjVQvPs
 uHpxasEoUI66Ae3ZRO5CRrculJDtNB/5iQbrtqAwouWt1cFIIsl9yz8WKeaWy71EyOOT
 KDeLjq4t7nmOFx5Uhte+vM4TjV9bn5D+dT8R564MWPir5sFWoBZJ3WPtBLOX9hgEX7OX
 QBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=rZijZ8zZzjIrFfncpkp5Gauu72w7qN96cGEXwN+72xw=;
 b=edwgIOMntrljAyP/aPUjYxswfJJZGMaUBfQRYnRVee36gvjgHyrey9Ee7jvwOzXuCC
 /FcP0GRL/2IZ0vGncKP6TtqrW1zzxXk0KnlzFvQXG0h5Z3JTNdZHQZZp1OrmU6cMaH4L
 D5VqUX/o7hWa8yztZpnEPf8ZgfvB9rkfeVY/kTu+gIloMdJnv/iIi90Fb3rqi2rBF8nk
 0e+JHWClITQrbiblP100GSHK9uTm1gaUzYr3kFO6/lD410EnGFI/KAkOZu1bnPzsBwHX
 K5tkuNM6qcVHV9dFehrkX+OwSYftl34f+2FpxWXO/xvQ+znKWXvyZo8jyvSuoMQA/9Rq
 OG3Q==
X-Gm-Message-State: AOAM5326SOS7s3U1Y9w7QunDqWn23Hv0bWXiY54fngub7uB17UaBQ4RN
 /LYIq+4jQAdkK+iC+CnHgyxpVupajZU=
X-Google-Smtp-Source: ABdhPJwgsUn1YdaUvVUW2tiD3vyXRjxhCzDF2YpJq5LvH9kfHTwdsMwM3YuE3DnjeGZNsCPh7EQzhw==
X-Received: by 2002:a05:6a00:2c3:b029:317:874a:391c with SMTP id
 b3-20020a056a0002c3b0290317874a391cmr2436311pft.5.1626149897456; 
 Mon, 12 Jul 2021 21:18:17 -0700 (PDT)
Received: from smtpclient.apple (216-19-179-128.dyn.novuscom.net.
 [216.19.179.128])
 by smtp.gmail.com with ESMTPSA id j16sm19514855pgh.69.2021.07.12.21.18.16
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Jul 2021 21:18:16 -0700 (PDT)
From: Miguel Arroz <miguel.arroz@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Connect to more than one tunnel simultaneously on macOS
Message-Id: <AB949986-F736-458F-B3BD-4E70412939EC@gmail.com>
Date: Mon, 12 Jul 2021 21:18:16 -0700
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Mailman-Approved-At: Sun, 08 Aug 2021 23:00:12 +0000
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

Hi,

First of all, thanks for all the work on Wireguard, including bringing a =
really nice integration to iOS and macOS. This works so smoothly that I =
completely forget I=E2=80=99m using VPN software, which I suppose is one =
of the best things that can be said about VPN software. :)

So, I was configuring a second tunnel on my Mac this weekend and =
realized the Mac app only allows connecting to one tunnel =
simultaneously. Even if it shows both tunnels connected, traffic only =
flows through one.

I=E2=80=99m tempted to take a look at the source and see if I can come =
up with a patch, but before that, I would like to ask: was this was done =
intentionally (due to some limitation on an API like Network Extension)? =
Or is it something desirable but not yet implemented?

Thank you,

Miguel Arroz

