Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69176E728E1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 30 Sep 2023 19:09:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9074c54a;
	Sat, 30 Sep 2023 19:09:48 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9714697d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 30 Sep 2023 19:09:46 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-533c5d10dc7so16626398a12.3
 for <wireguard@lists.zx2c4.com>; Sat, 30 Sep 2023 12:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696100986; x=1696705786; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aiG+rR+R6t56lqWfRqLp7eEyf7rlNWDwPW+R1Jte8F8=;
 b=YICQdTx40EsOE6L+FSXC0aefn2Fy36k9FbUoF3whzr0+QzEg3GhY5/tvSgEUg9oAxN
 z+YGEj1aVuVEtiX201JA89U7y8H9pptk7toKXA0KBP8JFBX0WXzajsecXF7Ne61soB3U
 Jq45eBt+rlRfq71JQTBcIwKPOblt4/iy+ASFPRXlEsVKqzyh2bFUEnqOGfJ3pmnD3zCV
 J5MOeiqJ3dR5Zsum1jqMaLgu9oRts79pfJv5svR17OmoP17Z4stEaLJQ9sBLKEsSemtt
 YSB85rpEUa12R6fRKFFw4px0dQOztf5m+c0c3t+3Nsc4vXLeqx65bY7U8sP8o7vwhUyX
 EbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696100986; x=1696705786;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aiG+rR+R6t56lqWfRqLp7eEyf7rlNWDwPW+R1Jte8F8=;
 b=Cb/1M7Y4lmyA3dqvxmymIykY/GN+F5884W9YSkHV7mjRcuypcFsH6bDnKGFc30lqRE
 Hx6gUq8tSO4v9P8zNuGZKxAAL0QpUxhF+xwC3SNbcGICgBzmmTmGy+omVq/E1V1dw3Ms
 Gjg1td629DwdfqogVKPjWQUGK4/3MJwlgRMKHKXeAKJh+Zqg7JslrBBJi/cXOLY0c0tA
 jJ27kDoUS1Wg8JzmOI0MCi1av+5Dttfvn1k5Y8zCD9+R0ryfVEtxtYdmKsljADmbtGFo
 Vt/ss7PK4tBVf7Qztj+a/poApl6lp69U1cNtRQggJd6quvpLUiOVo5D30IuQnmDE6IQz
 +F4w==
X-Gm-Message-State: AOJu0Yy/MqWMj6Ht4yyTcqOenx9i/E26DDY9wvaXYbBX5x9GvfK5t5xQ
 6HsKt7gbT4xKFnB7Ho4buwewKnUr50iAZWYgoDsnySqC/1EBHg==
X-Google-Smtp-Source: AGHT+IEFYIqlsSIH2oBNp7sWYVqDynNsTzYA6egfNUX/XSMGQAzbus7SnohCR4bopck2tE4Af+SqZs1rqkX5RE5QuJ4=
X-Received: by 2002:aa7:d5cc:0:b0:530:9fbc:8df6 with SMTP id
 d12-20020aa7d5cc000000b005309fbc8df6mr6458145eds.2.1696100985787; Sat, 30 Sep
 2023 12:09:45 -0700 (PDT)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Sat, 30 Sep 2023 20:09:06 +0100
Message-ID: <CABBZOskMb-6Lc9rAyuqQvYbs3HX-yGXoQHJHcrZzJrbRfsq1wg@mail.gmail.com>
Subject: =?UTF-8?Q?Wireguard=2Dapple_1=2E0=2E16=2D27_can=E2=80=99t_be_added_via_SPM?=
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hello Jason, Andrej

Please try to add the latest Wireguard-Apple 1.0.16-27 via Swift
Package Manager and you will see that fails. The issue could be
related to swift-tools-version.

Please advise what to do?
Thank you.
Houman
