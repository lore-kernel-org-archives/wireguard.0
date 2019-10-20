Return-Path: <SRS0=YiN/=YN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B287CA9EAD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Oct 2019 20:34:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED1321928
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Oct 2019 20:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CED1321928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad3ebe08;
	Sun, 20 Oct 2019 20:34:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31acb1c8
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Oct 2019 20:34:18 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 903bcec7
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Oct 2019 20:34:18 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.92.2)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1iMHly-0000WQ-Rz; Sun, 20 Oct 2019 20:25:54 +0000
Date: Sun, 20 Oct 2019 20:25:54 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Hendrik Friedel <hendrik@friedels.name>
Subject: Re: Keep-alive does not keep the connection alive
Message-ID: <20191020202554.GA1752@matrix-dream.net>
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
 <20190826180244.GB5022@matrix-dream.net>
 <CANcuY=oE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=CxkMQ@mail.gmail.com>
 <em05f3a9de-8e41-4353-affa-3fb52e65cda8@ryzen>
 <20190828065411.GA6914@matrix-dream.net>
 <emc2cb759b-1a2b-4bd0-a4f8-77ed32053cff@ryzen>
 <20190910091922.GA5679@matrix-dream.net>
 <emb3ce60aa-e0fe-4ef1-9955-18b08ac83546@ryzen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <emb3ce60aa-e0fe-4ef1-9955-18b08ac83546@ryzen>
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

On Thu, Oct 17, 2019 at 07:03:40PM +0000, Hendrik Friedel wrote:
> >>
> >>  >As a workaround you could
> >>  >   - unconditionally periodically update the endpoint
> >>  This would break existing transfers without reason.
> >
> >As I said, you could try periodically updating the endpoint, and only
> >endpoint, not restarting or changing anything except peer ip+port.
> >If updating endpoint information (to the same or valid ip+port) does break
> >connections, then I believe it is a bug that should be reported.
> 
> I was not able to find commands for updating the endpoint without 
> restarting the tunnel.
> Can you give me a hint?

wg set <interface> [listen-port <port>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ]...

so something like:
wg set <wgiface> peer <peerpubkey> endpoint <ip>:<port>

> >If the server changes IPs and the client remains reachable on previous ip+port,
> >keepalive on server should keep your tunnel alive.
> >
> >
> >Roaming will work if the side that changes ips:
> >   a) has keepalive enabled, so it will send a packet periodically
> >   b) sends an unsolicited packet (e.g. requests something from the
> >      other side as clients usually do but server less so)
> >   c) ip is changed after a request is received and before a reply is
> >      sent (could happen but unreliable)
> >
> 
> I think, there is an 'or' between a, b and c?

Yes, either of those.

--
Ivan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
