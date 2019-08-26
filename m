Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828EEC3A59F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 18:06:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E5221872
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 18:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E5221872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68e16a64;
	Mon, 26 Aug 2019 18:06:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bab0ae65
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 18:06:24 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 359d74a3
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 18:06:24 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1i2JKG-0001eI-EV; Mon, 26 Aug 2019 18:02:44 +0000
Date: Mon, 26 Aug 2019 18:02:44 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Hendrik Friedel <hendrik@friedels.name>
Subject: Re: Keep-alive does not keep the connection alive
Message-ID: <20190826180244.GB5022@matrix-dream.net>
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I notice you are using dynamic ips for server.
On the client, is the server peer ip correct?

Regards,
Ivan

On Sun, Aug 25, 2019 at 06:44:53PM +0000, Hendrik Friedel wrote:
> Hello,
> 
> thanks for your reply.
> It is linux (Kernel 5.x) in both cases.
> 
> Regards,
> Hendrik
> 
> ------ Originalnachricht ------
> Von: "Vasili Pupkin" <diggest@gmail.com>
> An: "Hendrik Friedel" <hendrik@friedels.name>
> Cc: wireguard@lists.zx2c4.com
> Gesendet: 25.08.2019 17:59:59
> Betreff: Re: Keep-alive does not keep the connection alive
> 
> >What OS is running on client side? I have this issue on Win7 client,
> >can explain it further, it has nothing to do with keepalives though,
> >it is a bug in tun adapter implementation
> >
> >On Sun, Aug 25, 2019 at 6:38 PM Hendrik Friedel <hendrik@friedels.name> wrote:
> >>  I have a setup in which the Server IP is known, whereas the Client IP is changing. Thus, I rely on the Client to connect to the Server. I want the Client to keep the connection alive all the time though, so that the Server can also initiate a connection to the Server when needed. Both, client and server are behind a NAT/Router.
> >>  I would think, that the "PersistentKeepalive = 25" on the Client would ckeep the connection open. The connection works fine while used. But after a while, I cannot connect from the Server to the client anymore.
> >>  I would assume that a ping from the Client to the IP of the endpoint would help to re-alive the connection - but it does not.
> >>
> >>  Only after a wg-quick down and up all is fine again.
> >>
> >>  Below some more information.
> >>
> >>  Can you help me to find, what I am doing wrong?
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
