Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD22CA5FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 12:51:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5180ed80;
	Mon, 5 Oct 2026 07:00:45 +0000 (UTC)
Received: from srv.irni.nl (irni.nl [2a10:3781:286::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6500a756
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Sep 2026 20:19:58 +0000 (UTC)
Received: from mailfilter.noci.lan (localhost [127.0.0.1])
 by srv.irni.nl (Proxmox) with ESMTP id 3A6608E0
 for <wireguard@lists.zx2c4.com>; Thu, 03 Sep 2026 22:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noci-ict.nl; h=
 cc:content-transfer-encoding:content-type:content-type:date:from
 :from:in-reply-to:message-id:mime-version:references:reply-to
 :subject:subject:to:to; s=pmgselect; bh=tbXh8ZrZYB0Vm3B2hjARvXbi
 AvqEw5rmtBSUFODd++0=; b=nzj972QMqOSCFmD6bYsSTk7u7FaMsWzcJRgDTEMi
 ulZAXkBr1TxYoXjnWWewrvhY+NdiFBRu47PvfxK8aR6I4L3GcPxMwbfnXDLMEUdv
 OuY0zLsa1+kxzkfery/G8dnh+gM8bXFllmaK0WWDqJfatd/sp/8hBqh6obYvZZrD
 FFhoJ6f2vAfSN/1ASSi89Hqo04RcvCdziS9GdFxAOiETWe9zpSSo1H6LCciKzveo
 U6l7E7cDTN9+cWgyFQENwvv/wdasQyJwGEHhGTfZL0uOe/5U8982Ae3h6CrG+oi1
 25DRJsIZdO0J/yBd1y5hcHWQfKtzt6p1Oo6f3zUbY5+Q4yWxY+xs4axBacDnopJK
 dbILGSM/hC5f1LtMRfb0UgLHTblEYZHiZHyDNzMdoiQEGEw2Zje2yT3grKNSUMWX
 39YPTCiPjzHoRjQS2QUaNR5zXOkGYnCnDSqb9sxx+Bq1vtdbplgXqY4pXLW5QwLf
 VghHaGNAxeU9yg2c0eXDLPYBK6ph+irGtG0nITf6hvUK63qxAHXkWMkepzflMjSp
 qg0DMW5W8IJRmxBu5kJWSNhG7FW3LcfRVGXe89M5zZo1MvGTtr4WnhUzcdOoE4JJ
 sUdvkhshoV9hWS1KMAM+L01o4YK6knxx7g5j97JcxQxZgpmybAOnu+7fXqHINANV
 Okw=
From: wireguard@noci-ict.nl
To: wireguard@lists.zx2c4.com
Subject: Re: Remove endpoint
Date: Thu, 03 Sep 2026 22:19:54 +0200
Message-ID: <sRq6ygV7STOqiux06SNsXw@noci-ict.nl>
In-Reply-To: <20260903202133.2383ecd75a9b94dec9dc3974@gmx.com>
References: <20260903202133.2383ecd75a9b94dec9dc3974@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

Why would you want that.....

If the endpoint (your mobile) stops transmitting then after the timeout time 
there will be no more packets....  from anywhere.
Mostly the clients will be on the mobile,
so after stopping sessions packets should stop.
And the system will ONLY respond to valid packets, port scanning will be hard 
to do. No response until a valid packet arrives to setup a connection.

So if you setup timeout to be a low value (10-20 seconds or so, assuming your 
regular roundtrip time would be <5 seconds)  there at most 10 seconds of traffic 
left.

Kind regards.

On Thursday, 3 September 2026 20:21:33 CEST Kent Friis wrote:
> I can specify a peer with no endpoint in wg0.conf. It will then simply
> not have an endpoint until it either receives a packet from the peer,
> or one is specified with wg set ... endpoint ip:port.
> 
> Now, I'm on a mobile connection, so when I log off, I want to remove
> the endpoint ip again so the "server" doesn't transmit stray packets
> to a mobile ip address.
> 
> I tried
> 
> wg set wg0 peer XXX endpoint 0:0
> wg set wg0 peer XXX endpoint off
> wg set wg0 peer XXX endpoint none
> wg set wg0 peer XXX endpoint ""
> 
> The first one sets the endpoint to 0.0.0.0 port 0, which is first of
> all, usually treated as a broadcast address, and second, AFAIK there is
> no port zero.
> 
> The other three give errors.
> 
> How to remove the endpoint while keeping the rest of the configuration?
> 
> /Kent





