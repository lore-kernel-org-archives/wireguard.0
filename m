Return-Path: <SRS0=2kf9=IL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0EAC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Mar 2021 13:21:04 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75A0464EE7
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Mar 2021 13:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75A0464EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lotz.li
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5470fd65;
	Sat, 13 Mar 2021 13:18:35 +0000 (UTC)
Received: from mail.dr-lotz.de (mail.dr-lotz.de [5.9.59.78])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cf2efe4f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Mar 2021 13:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.dr-lotz.de (Postfix) with ESMTP id 787315C86E;
 Sat, 13 Mar 2021 14:18:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dr-lotz.de
Received: from mail.dr-lotz.de ([127.0.0.1])
 by localhost (mail.dr-lotz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nteY4s-GT1AN; Sat, 13 Mar 2021 14:14:36 +0100 (CET)
Received: from [192.168.42.35] (ipb21b6623.dynamic.kabel-deutschland.de
 [178.27.102.35])
 by mail.dr-lotz.de (Postfix) with ESMTPSA id 2E0325C86D;
 Sat, 13 Mar 2021 14:14:36 +0100 (CET)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20210109210056.160597-1-linus@lotz.li>
 <CAHmME9osYO9O6dikmwR+i44hB_4YqKyc2P3Sre_g9ReHkMJDpQ@mail.gmail.com>
From: Linus Lotz <linus@lotz.li>
Subject: Re: [PATCH] wireguard: netlink: add multicast notification for peer
 changes
Message-ID: <c97061f5-2d28-0323-c16a-aacacbdc734f@lotz.li>
Date: Sat, 13 Mar 2021 14:14:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9osYO9O6dikmwR+i44hB_4YqKyc2P3Sre_g9ReHkMJDpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi Jason,> Thanks for the patch and sorry for the delay in reviewing it.
Seeing
> the basic scaffolding for getting netlink notifiers working with
> WireGuard is enlightening; it looks surprisingly straightforward.
Glad to hear that this is a welcome feature.
> 
> There are three classes of things that are interesting to receive
> notifications for:
> 
> 1) Things that the admin changes locally. This is akin to the `ip
> monitor`, in which you can see various things that other programs (or
> the kernel) modify. This seems straightforward and uncontroversial.
The current patch will also trigger for admin changes of the endpoint.
This could obviously be extended to other events as well.
> 
> 2) Authenticated events from peers. This basically amounts to new
> sessions being created following a successful handshake. This seems
> mostly okay because authenticated actions already have various DoS
> protections in place.
> 
> 3) Unauthenticated events. This would be things like (a) your patch --
> a peer's endpoint changes -- or, more interestingly, (b) public keys
> of unknown peers trying to handshake.
I was under the impression that this is an authenticated event. The
function 'wg_socket_set_peer_endpoint' where I hook in the notification
is called from:
- set_peer (changes from netlink, authenticated)
- wg_packet_consume_data_done (which should be authenticated?)
- wg_socket_set_peer_endpoint_from_skb
And wg_socket_set_peer_endpoint_from_skb is in turn called from
wg_receive_handshake_packet where it is called after validating a
handshake initiation and after validating a handshake response. So it
should be authenticated, right?

If the endpoint could be updated without authentication I would be
concerned that an attacker could change the stored endpoint and thus do
a DOS on a tunnel, as he could change the endpoints for both peers by
sending them messages from an invalid endpoint.

> 
> (b) is interesting because it allows doing database lookups in
> userspace, adding the looked up entry, adding it to the interface, and
> initiating a handshake in the reverse direction using the endpoint
> information. It's partially DoS-protected due to the on-demand cookie
> mac2 field.
This is indeed an interesting feature. In this case we might want to
keep the handshake information so that we can complete it if the lookup
is successful. Since this would keep some state for unauthenticated
peers it should probably only be used when explicitly enabled. This
could probably also be used to debug tunnel settings.
> 
> (a) is also interesting for the use cases you outlined, but much more
> perilous, as these are highspeed packets where the outer IP header is
> totally unauthenticated. What prevents a man in the middle from doing
> something nasty there, causing userspace to be inundated with
> expensive calls and filling up netlink socket buffers and so forth?
I was assuming it was authenticated, if not, there should definitely be
some counter measures and it should only be enabled manually.

> 
> I wonder if this would be something better belonging to (2) -- getting
> an event on an authenticated peer handshake -- and combining that with
> the ability to disable roaming (something discussed a few times on
> wgml). Alternatively, maybe you have a different idea in mind about
> this?
If wg_socket_set_peer_endpoint is the only place where the endpoint is
modified it would be relatively simple to implement a flag that disables
roaming. In theory it could also be possible to send a notification, but
 not change the endpoint and only let userspace update it. So an
userspace application could decide if the roaming is allowed or not.
> 
> I also don't (yet) know much about the efficiency of multicast netlink
> events and what the overhead is if nobody is listening, and questions
> like that. So I'd be curious to hear your thoughts on the matter.
I do not know how big the overhead is. I was assuming that a change of
the endpoint address is relatively rare so that the impact should be
negligible (since I assumed that changing the endpoint is authenticated.)

Regards,
Linus
