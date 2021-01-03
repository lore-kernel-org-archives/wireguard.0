Return-Path: <SRS0=V5dh=GG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED70BC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 20:17:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B3020754
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 20:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B3020754
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76a8b811;
	Sun, 3 Jan 2021 20:06:51 +0000 (UTC)
Received: from 53c70r.de (53c70r.de [2a03:4000:4a:b7f::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 29b44a2b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 20:06:48 +0000 (UTC)
To: wireguard@lists.zx2c4.com
DKIM-Filter: OpenDKIM Filter v2.11.0 53c70r.de 7E77B407D94C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=53c70r.de;
 s=default; t=1609705052;
 bh=FJomzvK8p9u0t6u86hJc7oF4tyudq1PT0C0yW55K0qI=;
 h=To:From:Subject:Date:From;
 b=Q/wDCLhARbsoAsitss3Uniu19DR/XzRun5hVJ6UrnX3keZfO7Dvauzo2+XuJmpjhc
 1SH0kx2phY0VBIqqCAzsMnOh0c1/QPwM+GVlIPJiMFGDuhsvzGGm85PaL/cMcRRmdj
 1NYmPTSPEs7cMMt9K+fHWf38ArOBhWZdseQ5I7pA=
From: Silvan Nagl <mail@53c70r.de>
Subject: Wireguard not available for CentOS Stream
Message-ID: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
Date: Sun, 3 Jan 2021 21:17:32 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

i noticed that no Wireguard installation source currently supports
CentOS Stream and its newer Kernels.
Will there be support for it?

Greetings,

Silvan

