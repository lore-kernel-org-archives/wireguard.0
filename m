Return-Path: <SRS0=0td0=MH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC94C43382
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 21:17:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F3320877
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Sep 2018 21:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F3320877
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9381dab9;
	Tue, 25 Sep 2018 21:14:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 883731bd
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Sep 2018 21:14:29 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3bbf5e2
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Sep 2018 21:14:28 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1g4uhA-0006BK-Bd; Tue, 25 Sep 2018 21:16:36 +0000
Date: Tue, 25 Sep 2018 21:16:36 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Raffaele Spazzoli <rspazzol@redhat.com>
Subject: Re: what to do when the peers use different IPs to transmit and
 receive
Message-ID: <20180925211636.GB23521@matrix-dream.net>
References: <CACOeLq+PG-SFUhSZUejCVWc+uMnBq1ATRwUFFLQZBTCU6JMSew@mail.gmail.com>
 <20180916165458.GA31165@matrix-dream.net>
 <CACOeLqLN5vc7O9_VwGhipycVE5Yi+phDKKwf2U4VPzZM00KeMw@mail.gmail.com>
 <CACOeLq+GseaDTZaOKD3qA_pPoT0_xRFAgqip2+KEkxTeG1Mw=Q@mail.gmail.com>
 <20180917091635.GB5016@matrix-dream.net>
 <CACOeLqLB8zbarowwTZFrxTkHyAk=B_cT_OruWDwAi6FvHjGi-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOeLqLB8zbarowwTZFrxTkHyAk=B_cT_OruWDwAi6FvHjGi-Q@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

I guess SNAT-ing on the destination node should work.

Still, without a compelling use case, it seems
like a broken network to me. You will have packets
in transit with an unroutable/incorrect source address,
among other possible issues. ICMP signalling won't work.
I think TCP wouldn't work with such a setup, or even
most udp protocols.

Do you use other services over this type of network?

Also, please note that iptables rules can affect network performance,
especially if there are many of them and haphazardly placed.
For debugging iptables rules I would suggest adding -v, so you can see
the number of matched packets (caveats apply in NAT).

Regards,
Ivan Lab=E1th


On Mon, Sep 17, 2018 at 07:10:05AM -0400, Raffaele Spazzoli wrote:
> Ivan,
> =

> sorry for the formatting, it seemed right on my email editor (gmail).
> I cannot do SNAT at the source because the packet would be dropped if it
> didn't come from the actual IP of the VM.
> So I am doing SNAT at the destination. why do you say I am doing it wrong?
> I know it would be ideal to do it at the source, but should it work when
> done at the destination?
> =

> Thanks,
> Raffaele
> =

> Raffaele Spazzoli
> Senior Architect - OpenShift <https://www.openshift.com>, Containers
> and PaaS Practice <https://www.redhat.com/en/services/consulting/paas>
> Tel: +1 216-258-7717
> =

> =

> =

> On Mon, Sep 17, 2018 at 5:16 AM, Ivan Lab=E1th <labawi-wg@matrix-dream.ne=
t>
> wrote:
> =

> > On Sun, Sep 16, 2018 at 07:08:58PM -0400, Raffaele Spazzoli wrote:
> > > sh-4.2# iptables -t nat -n -L Chain PREROUTING (policy ACCEPT) target
> > prot
> > > opt source destination Chain INPUT (policy ACCEPT) target prot opt so=
urce
> > > destination SNAT udp -- 10.128.2.10 0.0.0.0/0 udp dpt:5555 to:
> > > 192.168.99.12:5555 SNAT udp -- 10.128.1.94 0.0.0.0/0 udp dpt:5555 to:
> > > 192.168.99.14:5555 SNAT udp -- 10.130.0.136 0.0.0.0/0 udp dpt:5555 to:
> > > 192.168.99.13:5555 SNAT udp -- 10.129.1.158 0.0.0.0/0 udp dpt:5555 to:
> > > 192.168.99.15:5555 SNAT udp -- 10.131.0.199 0.0.0.0/0 udp dpt:5555 to:
> > > 192.168.99.7:5555 SNAT udp -- 10.129.2.217 0.0.0.0/0 udp dpt:5555 to:
> > > 192.168.99.6:5555 Chain OUTPUT (policy ACCEPT) target prot opt source
> > > destination Chain POSTROUTING (policy ACCEPT) target prot opt source
> > > destination
> >
> > Please try to have no or reasonable line wrapping.
> >
> > If you are applying SNAT on your source node, you are setting
> > the source address, which should be set to the reachable address
> > for the replies to come to. In your case VIP.
> > If you are setting it on the destination, you are IMO doing it wrong.
> >
> > Same thing applies to TCP and most typical protocol, nothing special
> > about wireguard here.
> >
> > If you have a middlebox doing DNAT, it would normaly be expected
> > for it or something else to do SNAT in the reverse direction.
> > Or, if your node has both adresses assigned, then it might be
> > a case of improperly set source address on outgoing packets
> > (e.g. your routing might need tuning).
> >
> > Regards,
> > Ivan
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
> >
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
