Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E94FC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 19:43:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58CE221919
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 19:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58CE221919
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=solidadmin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0809ca7;
	Mon, 4 Jan 2021 19:31:48 +0000 (UTC)
Received: from srv.inf7.email (srv.inf7.email [64.225.52.57])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 83c728fe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L27SG1DoUZ8iD0dfQLVRHENHqYO16r+bdfKzo/Z/VfA=; b=ZLW3NtK0Ju7BoHaW7EmhjpSnuR
 BUt4IS8vHjeL39v8ven/eUe/tVge/S4TEUYgplEpPx5ufErQag9Rl4SqXVaKucWf2qZDSbQ0g0Oci
 vo+kNckT6Y5XZR63bQRt75U+nodqSU1Zvzr4ohFNtAIxJO3bojU1ZN8h6tB9afParJ+6ubFjO1wVA
 6svyibnQ6xwsUNZc3S+5Dkh1Y3UgralL3FOjROLGr231574alhkMceAs+6lvSWICx/GFDY75Fsapu
 WYWu68cdKdJhhvdUyXrss5GxmjYr07gGABnUelHcq5j5QhO1on+vK4LxvPJ2AagXEgUQ7qc9StHFf
 9kazDpEg==;
Received: from c-73-45-55-209.hsd1.il.comcast.net ([73.45.55.209]:41492
 helo=[192.168.1.100])
 by srv.inf7.email with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.93) (envelope-from <joe@solidadmin.com>)
 id 1kwVkV-0013w3-JA; Mon, 04 Jan 2021 19:42:39 +0000
Subject: Re: Wireguard not available for CentOS Stream
To: Jack Craig <jack.craig.aptos@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Silvan Nagl <mail@53c70r.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Neal Gompa <ngompa13@gmail.com>
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
 <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
 <CAL0FmdWzknetT9raQcr_BhJwSWSBKPxXZocHSr2TT6bz2QihSA@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Organization: SolidAdmin
Message-ID: <f1b8bbdc-d669-7236-6632-2c8c48f78b3b@solidadmin.com>
Date: Mon, 4 Jan 2021 13:42:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAL0FmdWzknetT9raQcr_BhJwSWSBKPxXZocHSr2TT6bz2QihSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 1/4/21 1:20 PM, Jack Craig wrote:
> how is fedora looking? is it stable enough for a small home network?

It's in the Fedora kernel and I use it daily. It works great and it is
very stable.

Joe



-- 
Joe Doss
joe@solidadmin.com
