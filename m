Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2DBC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:19:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1AC12089F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:19:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eb/z9vNe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1AC12089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a4ac19a;
	Tue, 8 Jan 2019 02:16:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d303c852
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 19:33:23 +0000 (UTC)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 282ca6f9
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 19:33:23 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id n32so21157125qte.11
 for <wireguard@lists.zx2c4.com>; Thu, 27 Dec 2018 11:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=ASrW1gPp+XsaqJn1ZFiGGCn3nzROocy4rgi5z8vJLC4=;
 b=Eb/z9vNeflQAsKSwsfR3oL9BGc3+d0DTQ/UBSVv+TuenhHxMUv868FFIHC2zUBk1NS
 riwe4G1cQkRs7/e/rZ+Gi+ILWJC7DT7AgLv/I5xYE0muaILcwNcf+mg+6EE4+83YGhAj
 D7D/7M3qd7ID4QzDflSM6Y95MbbkZAW+M6vWx/5XWeMlEapRZgzhgZ1S5pUVM7AK1Z6s
 KHWldYkftZrKRhsRLf5jLhk3jZeEkDvQBw1OCY4XTYR081lPRHNcOd3nPdnSWKgC3T9Y
 MbQLMtgv9oPBztBD6Z0m1RFn2IjhVDNrjZ3KXqaf2eOwlS5oHq/o9WLs99PcRoIhrDqS
 h4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=ASrW1gPp+XsaqJn1ZFiGGCn3nzROocy4rgi5z8vJLC4=;
 b=FdKtA+3MJSUpSR9ipF9F7apyJJ8IEWrbwxAqMjSXdwoxyQ4SW/5yxvK17xyFG7kTDH
 W3pIYi2bq5B1vOfEYLJod+ROlb8rwkV23hNUVY+aXSXn4NKTSxFZFPCj6uSJ6nG/16SS
 W+u/OTo42+eBTZrJC9Xv6HNvZVO0S5oEKI66wUmH2lROl8eqfJds7UO74f0mS16/qgn7
 /mAhc/zWmMjmiWbhTi+8ppgrG/pYMuG48shLzhKPmjjA5qJDIymVaHipg7oPI20n2U7I
 HjpSlzcAUBISQRGPYtdOOypZqnQRTtgfINlJo89W6n1FeenH/Pw5NKIrsjTQLEnp54fR
 I8aA==
X-Gm-Message-State: AJcUukcgdsU6oBVt6YTBfFaOr9AJ/R8E1mgAQFhd/C0ZWAgXCBR6hilF
 60wUrBRRZdPD16T79H45RdHcRJBcw8A=
X-Google-Smtp-Source: AFSGD/VqTEkiV829xu6sXPJwHa1rttvZafssc0zEdmt/TpA29x33IoZRizuv88agqyh50peK3B9U0A==
X-Received: by 2002:aed:3bd7:: with SMTP id s23mr23161937qte.207.1545939301038; 
 Thu, 27 Dec 2018 11:35:01 -0800 (PST)
Received: from [10.57.8.4] (23-128-129-35.ylinx.net. [23.128.129.35])
 by smtp.gmail.com with ESMTPSA id d193sm18386171qka.91.2018.12.27.11.34.59
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Dec 2018 11:35:00 -0800 (PST)
From: Muhammad Naseer Bhatti <nbhatti@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Connections dropped after long in-activity
Message-Id: <8320FB7C-4C2A-4644-A25C-A8380914966C@gmail.com>
Date: Fri, 28 Dec 2018 00:34:56 +0500
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.102.3)
X-Mailman-Approved-At: Tue, 08 Jan 2019 03:16:00 +0100
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

Hi,
Facing a strange issue with single and sometimes with double NAT with client running Wireguard with the server on Public IP address. If client remains idle for long time (more than 15 minutes) NAT table in the route is dropped for that port combination (at the ISP side) since there is no activity, and Wireguard does not re-establishes the connection or tries to refresh. I am not sure why Keep alives set to 30 seconds not working either since if Keep Alives are set this should not happen.

Is this the desired behavior or am I missing something here?

Thanks.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
