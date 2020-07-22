Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D36C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:56:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A558C206D8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A558C206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=boardsec.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fed29ed6;
	Fri, 24 Jul 2020 08:33:39 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4473fbd3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jul 2020 18:18:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1595443262; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jlhSamt9b4NFt0JG2OJ4jXCyUe3vuev/yRuMMXnbFyRlzwIe2NZNLboV707OSkLdkwa9NdptpwaeD5UQzBhXrhKggfg7EWirdfIIs/wR3nntsNmEXoaVIfsqiLgjsXrtXg2FnVNgbY++8TBKeo64kOZQxupn4pLPCRgFFuyvtAc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1595443262;
 h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=BYAWrvmRbZr5Qh1qQkv9TgUQpxI2X+T6CoQqfvTw/TE=; 
 b=XrWg9JWBtbKvhb7sh6+wcqbVImhuQbKViAiibkPB/xh9tkQnm3vFgcg0WgXMmsK4O6Uv1LRP0z8iaHvZ3evTDzV7t1OyUxh+Y8kaDQsSLN/Vi4s5Q73NKfSidnIgoHZ3oVq4M/5ljuQNezN3T/XZEhakGeUhVdjZfjbhNr0ewn4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=paul@boardsec.com;
 dmarc=pass header.from=<paul@boardsec.com> header.from=<paul@boardsec.com>
Received: from [192.168.1.7] (c-73-40-48-116.hsd1.va.comcast.net
 [73.40.48.116]) by mx.zohomail.com
 with SMTPS id 1595443256991578.4986923706823;
 Wed, 22 Jul 2020 11:40:56 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Paul D. Robertson" <paul@boardsec.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 22 Jul 2020 14:40:55 -0400
Subject: Protocol Q
Message-Id: <637FDD00-48A2-4B1B-AD11-FAC3C3F5EA09@boardsec.com>
To: wireguard@lists.zx2c4.com
X-Mailer: iPhone Mail (17G68)
X-ZohoMailClient: External
X-Mailman-Approved-At: Fri, 24 Jul 2020 10:33:38 +0200
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

Why is it that when a PSK exists, it=E2=80=99s not used to transform or encr=
ypt the initial packet=E2=80=99s payload?
It seems that would add to the overall security.  What am I missing?

Paul
--
paul@boardsc.com
@compuwar=

