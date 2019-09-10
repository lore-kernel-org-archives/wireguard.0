Return-Path: <SRS0=xahJ=XF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59533C3A5A2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Sep 2019 09:24:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C9D2084D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Sep 2019 09:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0C9D2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd335238;
	Tue, 10 Sep 2019 09:24:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f2ec811
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 09:24:20 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e9dcf7c
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 09:24:19 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1i7cJ0-0001eW-S6; Tue, 10 Sep 2019 09:19:22 +0000
Date: Tue, 10 Sep 2019 09:19:22 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Hendrik Friedel <hendrik@friedels.name>
Subject: Re: Keep-alive does not keep the connection alive
Message-ID: <20190910091922.GA5679@matrix-dream.net>
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
 <20190826180244.GB5022@matrix-dream.net>
 <CANcuY=oE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=CxkMQ@mail.gmail.com>
 <em05f3a9de-8e41-4353-affa-3fb52e65cda8@ryzen>
 <20190828065411.GA6914@matrix-dream.net>
 <emc2cb759b-1a2b-4bd0-a4f8-77ed32053cff@ryzen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <emc2cb759b-1a2b-4bd0-a4f8-77ed32053cff@ryzen>
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

On Sat, Sep 07, 2019 at 10:04:44AM +0000, Hendrik Friedel wrote:
> Hello,
> 
> >>  that seems not to be the intended behaviour:
> >>  If I understand correctly, the current behaviour is:
> >>
> >>  At tunnel start the IP is resolved
> >>  This IP is used for ever, namingly for re-connects.
> >This is only partly correct. The remote endpoint can unconditionally
> >roam and is updated by any valid packet from a given IP (if I remember
> >correctly).
> What does that mean?
> Does that mean, that traffic will update the IP so that the problem will 
> not appear?

If you have peers A and B with publicly rechable IP+port A1 and B1.
When A's ip+port changes from A1 to A2, then (assuming I remember correctly)
any properly authenticated traffic from A (now A2) to B (B1) will update
B's record of A's remote endpoint to A2. Any subsequent traffic from B will be
sent to A2.

Note, the roaming side (one with changed ip/port) must send the first
packet, so it should be the one sending keepalive messages and it is
the side where you should set the keepalive interval (for sending
packets).

> 
> >
> >>  The probably intended behaviour would be:
> >>  At tunnel start and at any re-connect the IP is resolved.
> >>
> >>  Do you agree that this behaviour should be changed?
> >>  Apart from that: Can you suggest an automatable workaround?
> >
> >In some circumstances a similar behavior would be a desired.
> 
> That's ambigous.
> In what circumstances, what behaviour would be desired?

For example, I don't want my server of my client continuously re-resolving DNS,
for privacy reasons among others. Also I prefer kernel not mucking with
DNS for security reasons.

> >Wireguard design and implementation is layered (which seems good).
> >The secure* tunnel, including the kernel module and wg tool seem
> >to be in a reasonable state, but automation, DNS, key exchange are
> >out of scope for them. It is meant to be provided by tooling, which is
> >currently very raw.
> 
> I don't understand...
> When I am on my way in a roadwarrier scenario with my mobile, with a 
> changing IP and a changing connection that works very well.
> If the IP of my Server is changing, it's not working well at all. I 
> don't think that this should be declared as 'works as intended'.

I am not saying wireguard solution is working as intended. I am saying
the DNS resolution is meant to be implemented in out-of-kernel tooling,
which is currently minimal and such features are not (yet) implemented.
Either way, the kernel should not handle DNS, the tooling where DNS
handling belongs has no concept of reconnections, so the request is
very far from a simple change and probably should not and even could
not be done in the way you have described.

Even in the kernel itself there is not a well defined concept connection,
more like a peer state or session (ip, keys etc.) that is possibly valid
or definitely invalid.

> >As a workaround you could
> >   - unconditionally periodically update the endpoint
> This would break existing transfers without reason.

As I said, you could try periodically updating the endpoint, and only
endpoint, not restarting or changing anything except peer ip+port.
If updating endpoint information (to the same or valid ip+port) does break
connections, then I believe it is a bug that should be reported.

> >   - monitor last handshake time, when large update endpoint or restart
> >     tunnel
> That could be an option.
> >   - add keepalive to server - it might reduce your downtime
> How would that help?

Keepalive is one-sided. As your client doesn't know where to send
the keepalive request, it doesn't help. Keepalive on the server can.
If the server changes IPs and the client remains reachable on previous ip+port,
keepalive on server should keep your tunnel alive.


Roaming will work if the side that changes ips:
  a) has keepalive enabled, so it will send a packet periodically
  b) sends an unsolicited packet (e.g. requests something from the
     other side as clients usually do but server less so)
  c) ip is changed after a request is received and before a reply is
     sent (could happen but unreliable)

Regards,
Ivan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
