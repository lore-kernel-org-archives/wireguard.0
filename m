Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AE4C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:21:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 16064383;
	Thu, 21 Apr 2022 23:48:58 +0000 (UTC)
Received: from oxalide-smtp-out.extra.cea.fr (oxalide-smtp-out.extra.cea.fr
 [132.168.224.13])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 70bcc21a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Apr 2022 09:20:54 +0000 (UTC)
Received: from pisaure.intra.cea.fr (pisaure.intra.cea.fr [132.166.88.21])
 by oxalide-sys.extra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0) with ESMTP
 id 23K9Ks9J008768
 for <wireguard@lists.zx2c4.com>; Wed, 20 Apr 2022 11:20:54 +0200
Received: from pisaure.intra.cea.fr (localhost [127.0.0.1])
 by localhost (Postfix) with SMTP id 564B1203376
 for <wireguard@lists.zx2c4.com>; Wed, 20 Apr 2022 11:20:54 +0200 (CEST)
Received: from muguet1-smtp-out.intra.cea.fr (muguet1-smtp-out.intra.cea.fr
 [132.166.192.12])
 by pisaure.intra.cea.fr (Postfix) with ESMTP id 436112036B9
 for <wireguard@lists.zx2c4.com>; Wed, 20 Apr 2022 11:20:54 +0200 (CEST)
Received: from [132.166.141.77] (is223528.intra.cea.fr [132.166.141.77])
 by muguet1-sys.intra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0) with ESMTP
 id 23K9KsxW025842
 for <wireguard@lists.zx2c4.com>; Wed, 20 Apr 2022 11:20:54 +0200
Message-ID: <367df062-5c7c-2916-db4d-afdf6c7d92db@cea.fr>
Date: Wed, 20 Apr 2022 11:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: wireguard@lists.zx2c4.com
Content-Language: en-GB
From: Dimitri Papadopoulos Orfanos <dimitri.papadopoulos@cea.fr>
Subject: Wintun on Windows 11
Organization: CEA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
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

The README states that Wintun "is a layer 3 TUN driver for Windows 7, 8, 
8.1, and 10":
	https://git.zx2c4.com/wintun/tree/README.md#n4

You should add Windows 11 to the list.

Best Regards,
Dimitri
