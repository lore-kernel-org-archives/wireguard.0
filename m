Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD58C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 01:24:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E480D2080D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 01:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E480D2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solidadmin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b7113bf;
	Mon, 4 Jan 2021 01:13:35 +0000 (UTC)
Received: from srv.inf7.email (srv.inf7.email [64.225.52.57])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0bd29169
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 01:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Date:To:From:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DhTCS/NUMY6SV2T027285somOcJY/LRYHTLm3tC1aoE=; b=qEfM5F11N3CninRG6ixjZnj/jV
 3v+5gLVqI3dLLWEoNS8KugmVjdHKw77rJjGjDjuYzu1kNPuvjRgFTF/g7wiNAXBYnkp9DrV2+tp4S
 zouA/7cbu3NPXpGWqUNb2GtWDtoqaidz8BYop6ul/CwREKfuP9ayMCpQ/UWsb4fJ/3UtdnPuDmRIM
 +sKfUcLnGypyLRK/M5llcfxyQXAv3AjLStyh/w7uI5EgY0guBMaQSmWUkOqXHd+m7SLiRoaCEPiDr
 Mp6U3V6EPPHC50SO5SJ0Kg2DKPze4tNkpvbIULAoHkCLnoVWAgeT2Pd4upt3a90z9Xnl7putTXCep
 G5T3ZB7w==;
Received: from [209.107.181.147] (port=49976 helo=[100.69.78.178])
 by srv.inf7.email with esmtpsa (TLS1.2) tls
 TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <joe@solidadmin.com>)
 id 1kwEbb-000v4F-Ji; Mon, 04 Jan 2021 01:24:19 +0000
From: Joe Doss <joe@solidadmin.com>
To: Silvan Nagl <mail@53c70r.de>, <wireguard@lists.zx2c4.com>
Date: Sun, 03 Jan 2021 19:24:17 -0600
Message-ID: <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
In-Reply-To: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
User-Agent: AquaMail/1.27.2-1730 (build: 102700009)
Subject: Re: Wireguard not available for CentOS Stream
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - srv.inf7.email
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - solidadmin.com
X-Get-Message-Sender-Via: srv.inf7.email: authenticated_id:
 jdoss@solidadmin.com
X-Authenticated-Sender: srv.inf7.email: jdoss@solidadmin.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/

The official DKMS install method for CentOS has a Stream repo enabled. It 
should work fine. Let us know if you have any issues.

Joe

On January 3, 2021 2:19:30 PM Silvan Nagl <mail@53c70r.de> wrote:

> Hi,
>
> i noticed that no Wireguard installation source currently supports
> CentOS Stream and its newer Kernels.
> Will there be support for it?
>
> Greetings,
>
> Silvan



