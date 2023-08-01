Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E801EB64DD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  1 Aug 2023 08:33:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac863df9;
	Tue, 1 Aug 2023 08:33:07 +0000 (UTC)
Received: from tootai.net (mail1.tootai.net [213.239.227.108])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 92b905a6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2023 08:33:05 +0000 (UTC)
Received: from tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id B00A56081887
 for <wireguard@lists.zx2c4.com>; Tue,  1 Aug 2023 10:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1690878784; bh=leyqnxOnG0iqd8h+cZCia9gOvRqzsqKugPrl8C3pUbM=;
 h=Date:From:Subject:To:References:In-Reply-To:From;
 b=axWSbW+hnM6AbrT1nUenpzJ1rYbEDzDaV2cjTBPBuI/RW2m9NCOo6nOSZ9XquMjzi
 P54N5Xou1HmTso7NJQVUpc3ZOGlLpuOWT+N3TDjslXSTG8Xc3NXhMSUmpo4obKEyr0
 m13eDpOO0EeNx7Mk1oMjPdTmAEHn2k/dPZkLrZ8U=
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown
 [IPv6:fd99:1234:beef:cafe::24])
 by mail1.tootai.net (Postfix) with ESMTPA id 65C856081883
 for <wireguard@lists.zx2c4.com>; Tue,  1 Aug 2023 10:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1690878784; bh=leyqnxOnG0iqd8h+cZCia9gOvRqzsqKugPrl8C3pUbM=;
 h=Date:From:Subject:To:References:In-Reply-To:From;
 b=axWSbW+hnM6AbrT1nUenpzJ1rYbEDzDaV2cjTBPBuI/RW2m9NCOo6nOSZ9XquMjzi
 P54N5Xou1HmTso7NJQVUpc3ZOGlLpuOWT+N3TDjslXSTG8Xc3NXhMSUmpo4obKEyr0
 m13eDpOO0EeNx7Mk1oMjPdTmAEHn2k/dPZkLrZ8U=
Message-ID: <b112c414-36c6-d87f-3568-f3a740c52877@tootai.net>
Date: Tue, 1 Aug 2023 10:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
From: Daniel <tech@tootai.net>
Subject: Re: Endpoint failover ip
To: wireguard <wireguard@lists.zx2c4.com>
References: <e9ddd93a-4517-7411-a5d3-360fa8e1bde6@tootai.net>
 <20230731222744.5wej7mv5sef57w46@House.clients.dxld.at>
Content-Language: fr-FR
In-Reply-To: <20230731222744.5wej7mv5sef57w46@House.clients.dxld.at>
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

Hi Daniel

Le 01/08/2023 à 00:27, Daniel Gröber a écrit :
> Hi Daniel,
>
> On Mon, Jul 31, 2023 at 11:39:35PM +0200, Daniel wrote:
>> I create a hostname with few IPs v4 & v6 for my wireguard server. I faced
>> today a problem that after a failure with the ip a customer wg was
>> registered, it continue to try to register with this ip insteed to fallback
>> to another one.
> [...]
> [1]: Supporting multiple active endpoints is where we have to head to fix
> this properly IMO, see my recent proposal
> https://lists.zx2c4.com/pipermail/wireguard/2023-July/008111.html

Yes, that's exactly the problem. Will see with babeld but hope that 
something native can be done in wireguard.

Thanks for your feedback

-- 
Daniel
