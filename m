Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290F1C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Apr 2022 22:56:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bac2933f;
	Mon, 4 Apr 2022 22:56:28 +0000 (UTC)
Received: from srv.inf7.email (srv.inf7.email [64.225.52.57])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b2e00e95
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Apr 2022 22:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=solidadmin.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3omJn8Xcr6dK+XQq5veh4XLsuXrbqTTHJKTqqLuC3w=; b=AwjbUscxqPE9k9bsANMRlzKfs8
 bIjT5B+WS+wWgESi2paFG8auKYFW/Xz9qFUut/Do6sfaPeyP6lugfOuSm+xk8H0XeLWT5zWu0VlH0
 x2T4UHYQJKOcV7Y9HhVl3sRbDE+jDxkJ/LMugqijUQpGnLglceVqt5es8+bmVWzEzT2rPDIYh1Q4X
 2v8wDGXMqSjG4TqST5B/b0UvhF9QcPWDmXfl6ADLpzivDxzsnVWN1/oXbAxV/fsRivVNdlAD4zuiI
 qDP7GspB87Qv4X7VkDoZ6fIAJS4CxGgRpfAvjoyP2NtNof7W/od/9rIKkYSv9S/vwHyyN2X5mF3zp
 rz8CJWnQ==;
Received: from c-71-201-101-213.hsd1.il.comcast.net ([71.201.101.213]:47162
 helo=[192.168.1.242])
 by srv.inf7.email with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.94.2) (envelope-from <joe@solidadmin.com>)
 id 1nbVcX-004eXK-SO
 for wireguard@lists.zx2c4.com; Mon, 04 Apr 2022 22:56:25 +0000
Message-ID: <22f7069e-fac3-09e8-5f2e-2d3c93506352@solidadmin.com>
Date: Mon, 4 Apr 2022 17:56:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: wireguard performance
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <CADjMg7VSw58f+2Pj9_aJOupVPcAneVA9DDbmVLGEVpZW_XY2nw@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Organization: SolidAdmin
In-Reply-To: <CADjMg7VSw58f+2Pj9_aJOupVPcAneVA9DDbmVLGEVpZW_XY2nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 4/4/22 4:34 PM, Devanath S wrote:
> We were trying to test the performance of wireguard on GCP and found
> it around 1G for TCP and around 500-800 for UDP.
> 
> Plz do let us know if there are any ways to UP this performance.  Any
> suggestion is appreciated.

GCP network defaults to a lower MTU (1460). You might want to adjust 
your WireGuard tunnel's MTUs and the default GCP VPC MTU. See:

https://cloud.google.com/network-connectivity/docs/vpn/concepts/mtu-considerations

Joe



-- 
Joe Doss
joe@solidadmin.com
