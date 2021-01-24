Return-Path: <SRS0=FNV9=G3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C3EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 17:40:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A730022581
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 17:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A730022581
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=oern.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6da7dc16;
	Sun, 24 Jan 2021 17:37:21 +0000 (UTC)
Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.215])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6ebb238
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Jan 2021 17:37:19 +0000 (UTC)
Received: from smtp.soverin.net (unknown [10.10.3.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by outbound.soverin.net (Postfix) with ESMTPS id B2FB26008F;
 Sun, 24 Jan 2021 17:37:19 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.142]) by
 soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=oern.de; s=soverin;
 t=1611509839; bh=GCsdUGfVVA0ZfkmLFq45w3LYGRILZONPR1vRW+6zRHY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B5pXpO/eopGzcOdjclGqt4eOMFvMdV6z2PQWU6hjeUlu0mRztFRKcOS41GVtag95b
 ELR68N9hFoKdvwnltdfEC9CBLnsNsMQlehbMpG6kbS9idkgx2jtrCHejAiYyYEGrps
 NNNeUlOOLuAWZ2vrhFPI0mQBBIoFMugWU0mWLAr3G2KXOJLzk5MnH13CEr0DkvObPp
 wRqttakXxofMbbu6UeZQl7xDa2ojhLU7tvJANI+wdrCQ2SIzvj5BFKHUVPtoQlPJH+
 8lFwvMxX2yODQm6WPqhyVcX7vM3cb1TgGgmQ8EAJ5+nONdtdpHMUmPxAT0YZpve8Tr
 66l3cOiMZ0SCA==
MIME-Version: 1.0
Date: Sun, 24 Jan 2021 18:37:17 +0100
From: ml-wireguard@oern.de
To: Ken D'Ambrosio <ken@jots.org>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Access subnet behind server.
In-Reply-To: <4464b11ea233ea1e57f49d4a5d1a84d5@jots.org>
References: <4464b11ea233ea1e57f49d4a5d1a84d5@jots.org>
Message-ID: <a44319fdb964cea522862ec51a9cf745@oern.de>
X-Sender: ml-wireguard@oern.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

Am 2021-01-23 17:52, schrieb Ken D'Ambrosio:
> The client connects just fine, and it can talk to the server's VPN IP 
> (192.168.50.1) as well as its internal interface (192.168.10.1).  
> Likewise, the server can talk to 192.168.50.11.  But nothing gets 
> inside to other 192.168.10.x hosts.  I do have forwarding set up for 
> "all":

Are the clients in the 192.168.10.0/24 net configured to send the anwser 
packets for 192.168.50.0/24 to the raspberry (eg is the raspberry the 
default gateway for 192.168.50.0/24)?

