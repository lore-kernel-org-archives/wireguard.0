Return-Path: <SRS0=7uyE=GL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20ABFC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 06:56:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4CA7233EA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 06:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4CA7233EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wandera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1eb99235;
	Fri, 8 Jan 2021 06:56:47 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a2c880c6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jan 2021 06:56:46 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id 6so13165291ejz.5
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jan 2021 22:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=rmiBDjc1zNdd/Jwc434d1BzjFaBEBd2WtZ6ECRy5jus=;
 b=W0Y+nEJ+EZgTJWlQos1i1/tfHp6GaWgN+QgviG9L2d8LdfdjuP1FQS+r/z6/mLRSdU
 f94J4ch4yBhThCDIm68ZjV9aMm2CCGjtG4Ng4t2Cdb07+Dn2vewWhLbF5aTFxxIMxCWj
 4Epc7HJt9M6wm5Tuk/VIeZgBJeE4C+IO6NCjOndlKrvoj1KaVSxL5R6W9mVLCYte+KWa
 E0pUdZt6qPiPyRDzSN73gqh3+v2nJvxPbs6fKpzmIsGKi57kSiNvvMZDWSbaOZJPHe33
 qo+eniqcAjKFGV1pIIDSXQqe2GDmVgNYrmH9RJlC62+W8zHC+k/2KqwL/ivTk6W+CHXp
 bmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=rmiBDjc1zNdd/Jwc434d1BzjFaBEBd2WtZ6ECRy5jus=;
 b=VPZO00/tkAaC4+cpJezSGr5hMJV/GEpRmrTiPJBYc5ZRG5jSFMTQ2ordvMum54znvw
 WtQyKY4gNilOFckLySbcS7pJ2JE783u9RF4hgfDqwm7fw5sf6M+QaX2AjIgtkwVg/9jf
 NbAjIv8H/2fxuCo+AlONwQkuMKiW0D2vQ7hQBSR7BaybstQyBL12gHUyuyJ4rXebLgk3
 Sm/KguoC/fQP7QN0WhgiVyn+Zo+Wu4Iudha3JzsKo8nNkqH5P9ol4ozfh/1EZiFwQHjd
 H70VX9kjjrETWkZuc9+L9p+breUK7xbV/+CAWsprwGLgWMje94pA7mPqGJOz5luSZYJd
 PHKw==
X-Gm-Message-State: AOAM532DypQelxsB1rAHjq0G0+2WxYuKGhoodJ+z8dx74ayVk9tVFZ1n
 8P3q7DQD1LzXACwvxb8Ddatv3UoyZCOh5+yjKknELl5y3gT2QkwQb3RTAUCppjGJL7GtN9wiSvi
 kPCnG8h2GgWKtFh1k10V/lAFkh0M4vBNfPhpsFm3b6hSKsnzhie3sJWHUOA2hgQsOKbKJiLDFZx
 5pxf8pIKKZgGo=
X-Google-Smtp-Source: ABdhPJwEQHfYkot0YG6Ej/G6oQRIUciB/zBTrO6e4dGk+T0F0IDY7nt027olr45F5JOUN5XnhH1Maw==
X-Received: by 2002:a17:906:298c:: with SMTP id
 x12mr1756917eje.244.1610089006116; 
 Thu, 07 Jan 2021 22:56:46 -0800 (PST)
Received: from [192.168.1.172] (ip4-46-39-166-79.cust.nbox.cz. [46.39.166.79])
 by smtp.gmail.com with ESMTPSA id
 s12sm3464333edu.28.2021.01.07.22.56.45
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Jan 2021 22:56:45 -0800 (PST)
From: Laura Zelenku <laura.zelenku@wandera.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: Handshake state collision between parralel RoutineHandshake
 threads
Date: Fri, 8 Jan 2021 07:56:44 +0100
References: <27D86318-AED9-49EC-94EE-1FFC806533DC@wandera.com>
To: wireguard@lists.zx2c4.com
In-Reply-To: <27D86318-AED9-49EC-94EE-1FFC806533DC@wandera.com>
Message-Id: <7D9D671E-382C-4399-97B8-DEEBBF047C15@wandera.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi there,
we are able to prepare appropriate fix/pull request for this issue. We just need your desision as Wireguard representatives. There are listed 3 proposals in previous message. Do you see some of them feasible?

thank you



-- 
*IMPORTANT NOTICE*: This email, its attachments and any rights attaching 
hereto are confidential and intended exclusively for the person to whom the 
email is addressed. If you are not the intended recipient, do not read, 
copy, disclose or use the contents in any way. Wandera accepts no liability 
for any loss, damage or consequence resulting directly or indirectly from 
the use of this email and attachments.
