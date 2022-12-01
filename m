Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D30C43217
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Dec 2022 13:06:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b1e1bac;
	Thu, 1 Dec 2022 13:06:56 +0000 (UTC)
Received: from tootai.net (mail1.tootai.net [213.239.227.108])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8703e6d7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Dec 2022 13:06:55 +0000 (UTC)
Received: from tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id 4A108608251A
 for <wireguard@lists.zx2c4.com>; Thu,  1 Dec 2022 14:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1669900014; bh=O2RbL6/+sFx/R6gGNQ9JeFmURNmakYEQNSML+WCYRPE=;
 h=Date:Subject:From:To:References:In-Reply-To:From;
 b=k7i9c7lIwXwuE8LVGifezu6z0ChEuHLRmFIeOJVXLMTKZMTWaYs00gertwhubs31d
 wn2Qxn8WCjt3vcImWAH9NcBgIe3wlLaZzRiMIMlVWekwJ3Mc8NX4GFLLjI9apuGQbo
 QzaLlgN+zGNk3zWi8ShQvWGCavI7+LYhETQKdlTk=
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown
 [IPv6:fd99:1234:beef:cafe::24])
 by mail1.tootai.net (Postfix) with ESMTPA id F27676000086
 for <wireguard@lists.zx2c4.com>; Thu,  1 Dec 2022 14:06:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1669900014; bh=O2RbL6/+sFx/R6gGNQ9JeFmURNmakYEQNSML+WCYRPE=;
 h=Date:Subject:From:To:References:In-Reply-To:From;
 b=k7i9c7lIwXwuE8LVGifezu6z0ChEuHLRmFIeOJVXLMTKZMTWaYs00gertwhubs31d
 wn2Qxn8WCjt3vcImWAH9NcBgIe3wlLaZzRiMIMlVWekwJ3Mc8NX4GFLLjI9apuGQbo
 QzaLlgN+zGNk3zWi8ShQvWGCavI7+LYhETQKdlTk=
Message-ID: <8941df6b-2935-ef5c-a4b3-15a715258ef2@tootai.net>
Date: Thu, 1 Dec 2022 14:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Wireguard on Asahi Debian
Content-Language: fr-FR
From: Daniel <tech@tootai.net>
To: wireguard <wireguard@lists.zx2c4.com>
References: <0ac435a3-95f4-c005-9834-ffb44360536c@tootai.net>
In-Reply-To: <0ac435a3-95f4-c005-9834-ffb44360536c@tootai.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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

OK, wg is in the kernel, sorry to have bother you.

Le 01/12/2022 à 13:24, Daniel a écrit :
> Hi All,
> 
> I installed Asahi/Debian Bookworm from
> 
> https://git.zerfleddert.de/cgi-bin/gitweb.cgi/m1-debian/
> 
> and face a problem: installing wireguard shipped the Debian arm kernel 
> and I can't get wg to work.
> 
> Is there a solution for this ?

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
+41.445532125@swiss-itech.ch		    tootaiNET
