Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB39C001DE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 Jul 2023 21:42:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2909c83f;
	Mon, 31 Jul 2023 21:39:40 +0000 (UTC)
Received: from tootai.net (mail1.tootai.net [2a01:4f8:a0:821b::58:14])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a52755d2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2023 21:39:37 +0000 (UTC)
Received: from tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id 671E86081887
 for <wireguard@lists.zx2c4.com>; Mon, 31 Jul 2023 23:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1690839576; bh=D+6bO2RXoGZWCCl/4hEkdRGsSYqKupAxl4D3p+GwRXY=;
 h=Date:To:From:Subject:From;
 b=ty7WfFNDbhZlHfpFMZ3of1u+XmzRHGHrcuftgNK+C4SmU9cbmNwZk/aheyEQ+HQJm
 lG6x1PQRive0UIt1zWsTOU1l2ai+R7n3/8a8fgv/SkfR1vMKnmGthvnML+onlBiHxH
 gy/eIhHSmW4J6+NJr7kbDk/wdx7nKLug7ajdJxrI=
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown
 [IPv6:fd99:1234:beef:cafe::24])
 by mail1.tootai.net (Postfix) with ESMTPA id 243E36081883
 for <wireguard@lists.zx2c4.com>; Mon, 31 Jul 2023 23:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1690839576; bh=D+6bO2RXoGZWCCl/4hEkdRGsSYqKupAxl4D3p+GwRXY=;
 h=Date:To:From:Subject:From;
 b=ty7WfFNDbhZlHfpFMZ3of1u+XmzRHGHrcuftgNK+C4SmU9cbmNwZk/aheyEQ+HQJm
 lG6x1PQRive0UIt1zWsTOU1l2ai+R7n3/8a8fgv/SkfR1vMKnmGthvnML+onlBiHxH
 gy/eIhHSmW4J6+NJr7kbDk/wdx7nKLug7ajdJxrI=
Message-ID: <e9ddd93a-4517-7411-a5d3-360fa8e1bde6@tootai.net>
Date: Mon, 31 Jul 2023 23:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: fr-FR
To: wireguard <wireguard@lists.zx2c4.com>
From: Daniel <tech@tootai.net>
Subject: Endpoint failover ip
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello,

I create a hostname with few IPs v4 & v6 for my wireguard server. I 
faced today a problem that after a failure with the ip a customer wg was 
registered, it continue to try to register with this ip insteed to 
fallback to another one.

Is there a way to avoid this problem and to get failover working 
properly with wireguard ?

Thanks for any hint
-- 
Daniel
