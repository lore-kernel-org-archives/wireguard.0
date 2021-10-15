Return-Path: <SRS0=FZ0+=PD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4F7C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 08:55:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3BB061073
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 08:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3BB061073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kracon.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09a18728;
	Fri, 15 Oct 2021 08:55:02 +0000 (UTC)
Received: from mailgw1.kracon.dk (mailgw1.kracon.dk [185.38.24.9])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 39019cfd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Oct 2021 08:55:00 +0000 (UTC)
Received: from mail.kracon.dk (mail.kracon.dk [185.38.24.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailgw1.kracon.dk (Postfix) with ESMTPS id 2B14524129
 for <wireguard@lists.zx2c4.com>; Fri, 15 Oct 2021 10:55:00 +0200 (CEST)
Received: (qmail 6212 invoked from network); 15 Oct 2021 08:54:17 -0000
Received: from unknown (HELO ?192.168.179.133?) (sk@217.116.222.18)
 by 192.168.3.2 with ESMTPA; 15 Oct 2021 08:54:17 -0000
Message-ID: <5ec4906f-db2b-363a-db38-ac7179af83b5@kracon.dk>
Date: Fri, 15 Oct 2021 10:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Source IP for multihomed peer
Content-Language: en-GB
To: wireguard@lists.zx2c4.com
References: <d0e1773d-80d5-7676-7943-2eff8d57beaa@kracon.dk>
 <87wnmfj9kq.fsf@proton.d.airelinux.org>
From: Svenne Krap <svenne@kracon.dk>
Organization: Kracon ApS
In-Reply-To: <87wnmfj9kq.fsf@proton.d.airelinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 15.10.2021 04.39, Benda Xu wrote:
> We have met exactly the same problem.

Have you tried SNAT from iptables? Is that a viable work-around?


Svenne

