Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B09C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 21:13:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0140D2070B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 21:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0140D2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=osk.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8945a0fd;
	Tue, 5 Jan 2021 21:13:04 +0000 (UTC)
Received: from mail.osk.ch (dynamic.wline.6rd.res.cust.swisscom.ch
 [2a02:1205:5052:8220:20f:feff:fe92:5373])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 03c6f233
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 21:13:02 +0000 (UTC)
Received: from server.osk.ch (localhost [127.0.0.1])
 by mail.osk.ch (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id 105LD1EI031467;
 Tue, 5 Jan 2021 22:13:01 +0100
Received: (from osk@localhost)
 by server.osk.ch (8.14.4/8.14.4/Submit) id 105LD1cM031466;
 Tue, 5 Jan 2021 22:13:01 +0100
X-Authentication-Warning: server.osk.ch: osk set sender to wg@osk.ch using -f
Date: Tue, 5 Jan 2021 22:13:01 +0100
From: Chris Osicki <wg@osk.ch>
To: Roman Mamedov <rm@romanrm.net>
Cc: Gijs Conijn <egc112@outlook.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: WG default routing
Message-ID: <20210105211301.GC31054@server>
References: <20210103215441.GA24251@server>
 <AM7P191MB088330591C4788BAEA9591888FD20@AM7P191MB0883.EURP191.PROD.OUTLOOK.COM>
 <20210105201212.GA31054@server> <20210106012530.2754726a@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106012530.2754726a@natsu>
X-message-flag: Using Microsoft software might be a security risk
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Greylist: inspected by milter-greylist-4.5.11 (mail.osk.ch [127.0.0.1]);
 Tue, 05 Jan 2021 22:13:01 +0100 (CET) for IP:'127.0.0.1'
 DOMAIN:'localhost' HELO:'server.osk.ch' FROM:'wg@osk.ch' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.11
 (mail.osk.ch [127.0.0.1]); Tue, 05 Jan 2021 22:13:01 +0100 (CET)
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

On Wed, Jan 06, 2021 at 01:25:30AM +0500, Roman Mamedov wrote:
> On Tue, 5 Jan 2021 21:12:12 +0100
> Chris Osicki <wg@osk.ch> wrote:
> 
> > As far as I can see after few tests, AllowedIPs config file option has nothing to do with routing and I hope 
> > it will stay like this.
> 
> wg-quick uses AllowedIPs to also set up matching entries in the system routing
> table. This can be disabled in its config.
> 
> > It is just a filter
> 
> It is not only a filter on incoming packets, but also WG's internal routing
> table for knowing which packets should be sent to which peer.

I'm sorry to contradict you but after some more readig I have to :-)
WG has no "internal routing table", wg-quick (which, BTW, is not the subject of my query) uses it to modify 
kernel routing tables, from the wg-quick man page:

       It infers all routes from the list of peers' allowed IPs, and automatically adds them to  the  system  routing
       table.  If  one  of  those  routes is the default route (0.0.0.0/0 or ::/0), then it uses ip-rule(8) to handle
       overriding of the default gateway.

So, in my test config I have a server, 10.10.10.1 and two clients, 10.10.10.2/3
If on the server I remove the AllowedIPs option, no one can connect.
Giving AllowedIPs = 10.10.10.0/24 both clients can connect and routing in them stays as it was.
The same for the clients, without AllowedIPs = 10.10.10.0/24 cannot connect.

Thus, my question still remains: why this filtering function?

> 
> -- 
> With respect,
> Roman

Regards,
Chris
