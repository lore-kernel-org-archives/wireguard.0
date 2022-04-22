Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360CBC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 07:13:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6fe73c9c;
	Fri, 22 Apr 2022 07:13:52 +0000 (UTC)
Received: from mail1.tootai.net (<unknown> [2a01:4f8:a0:821b::58:14])
 by lists.zx2c4.com (OpenSMTPD) with ESMTP id 021e6c0d
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 07:13:47 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id C2D8F6081407
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 09:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1650611626; bh=O5msl90oVbN+1QJlYPzAv89OnOXBROxpGp4Qo9HKp2U=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=BjLFyjtVlMnDrJjFZJe78H3cRlmMnWFJW11a30zLw3OcGZjmgkrA5ujiuqOqFGlab
 sxwpVw5aVN5qtrCaSdufltz85Px66yV3oCPbB1i5Hj6yKeNN70VXF01REQ1AmXsDz6
 pGL2AOhC/xTfAZ44GzRTCYT5kqlz38FMtRoTx5LQ=
Received: from [IPV6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id A7E236081718
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 09:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1650611626; bh=O5msl90oVbN+1QJlYPzAv89OnOXBROxpGp4Qo9HKp2U=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=BjLFyjtVlMnDrJjFZJe78H3cRlmMnWFJW11a30zLw3OcGZjmgkrA5ujiuqOqFGlab
 sxwpVw5aVN5qtrCaSdufltz85Px66yV3oCPbB1i5Hj6yKeNN70VXF01REQ1AmXsDz6
 pGL2AOhC/xTfAZ44GzRTCYT5kqlz38FMtRoTx5LQ=
Message-ID: <c202757f-99eb-215f-9e22-4b473a2b9f98@tootai.net>
Date: Fri, 22 Apr 2022 09:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Choosing local IP address
Content-Language: fr-FR
To: wireguard@lists.zx2c4.com
References: <91765b65-5daa-c699-4a72-b59b0f6f9ebb@rail.eu.org>
From: Daniel <tech@tootai.net>
In-Reply-To: <91765b65-5daa-c699-4a72-b59b0f6f9ebb@rail.eu.org>
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

Hi

Le 26/03/2022 à 21:27, Erwan David a écrit :
> Hello
>
> I have a wireguard setup between my home router (and the home network 
> behind) and a distant FreeBSD servers with several jails.
>
> I use IPv6 fir transport, but I have a routing problem because whan at 
> home I need to ssh to the server, and if I use for endpoint address 
> (on the home router) the main IPv6 address it ends up with a traffic 
> half out of the tunnel (from home to server), and half in the tunnel 
> (from server to home).
>
>
> So I chose to add an IPv6 address to the server, route it outside the 
> tunnel and use it only for the tunnel. But I cannot specify to 
> wireguard on the server to use this address, thus I get packets from 
> the main address, my router changes the endpoint address and tunnel 
> does not work.
>
> How can I say to wireguard which IP address to use when sending ths 
> encrypted packets to the endpoint ?

Not sure I understand your problem but you can't use the ip address used 
to mount the tunnel to access the other end. You have to give an ipv6 
ULA address to each endpoint. In your case, this should be GUA Home <> 
GUA FreeBSD to mount the tunnel. To access the other end in ipv6, give 
an ULA address to each wg and you're done.

Also be sure that you put the right address in your config file

-- 
Daniel
