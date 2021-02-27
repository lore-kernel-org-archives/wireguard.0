Return-Path: <SRS0=Udva=H5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C360EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Feb 2021 17:53:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6751664E4B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Feb 2021 17:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6751664E4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dc55486;
	Sat, 27 Feb 2021 17:53:18 +0000 (UTC)
Received: from mail1.matrix-dream.net (<unknown> [2a0a:51c0::71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4a460fae
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Feb 2021 17:53:16 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.92.2)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1lG3WO-00076T-L5; Sat, 27 Feb 2021 17:36:52 +0000
Date: Sat, 27 Feb 2021 17:36:52 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: nicolas prochazka <prochazka.nicolas@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: ipv6 multicast peer ?
Message-ID: <20210227173652.GA27005@matrix-dream.net>
References: <CADdae-jn684uFbFPgkWY47TsmOAnTfzLq7dVGrBxv8Vv8Gcg-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADdae-jn684uFbFPgkWY47TsmOAnTfzLq7dVGrBxv8Vv8Gcg-Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

you can't, as wireguard does not currently implement multicast nor broadcast.

You can add unicast IPs and duplicate packets if you feel like it,
or add another layer or two, which is what most people posting here do.

Regards,
Ivan

On Fri, Feb 19, 2021 at 08:58:53AM +0100, nicolas prochazka wrote:
> Hello,
> On a "server side" I've for example these peers, and i want to send a
> ipv6 multicast group
> ff02::1
> How can I do that with peer / allowed-ips routing ?
> 
> Regards
> Nicolas
> 
> interface: wg0
>   public key: **************
>   private key: (hidden)
>   listening port: 6081
> 
> peer: ************
>   preshared key: (hidden)
>   endpoint: x.x.130.134:6081
>   allowed ips: fd00:0:222d:0:f64d:30ff:fe6e:222d/128
>   latest handshake: 52 seconds ago
>   transfer: 56.96 MiB received, 1.96 GiB sent
> 
> peer: **********
>   preshared key: (hidden)
>   endpoint: x.x.x.x:6081
>   allowed ips: fd00::8e2:97ff:fe2e:3/128,
> fd00:0:2836:0:1e69:7aff:fe01:2836/128,
> fd00:0:3340:0:a00:27ff:fe5a:3340/128
>   latest handshake: 1 minute, 54 seconds ago
>   transfer: 513.17 MiB received, 6.27 GiB sent
>   persistent keepalive: every 25 seconds
> 
> peer: *****
>   preshared key: (hidden)
>   endpoint: x.x.x.x:6081
>   allowed ips: fd00::/32, fd00::8e2:97ff:fe2e:0/112,
> fd00::8e2:97ff:fe2e:eeee/128
>   latest handshake: 1 minute, 59 seconds ago
>   transfer: 2.70 MiB received, 6.69 MiB sent
>   persistent keepalive: every 25 seconds
> 
> peer: **************
>   preshared key: (hidden)
>   endpoint: x.x.100.142:6081
>   allowed ips: fd00:0:ec58:0:b26e:bfff:fe1e:2d5a/128
>   latest handshake: 2 minutes, 5 seconds ago
>   transfer: 195.00 MiB received, 2.19 GiB sent
