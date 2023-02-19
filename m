Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AE5C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 18:39:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a7e15f1;
	Sun, 19 Feb 2023 18:38:07 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6668cc51
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 18:38:04 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id c2so1290475lfp.6
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2023 10:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LB93YBVA5j2JQzH9KFzG2WCvP+JNgfjvNSZqsxBVcFY=;
 b=PWYp4hGq0vlWPVfI/XcKqAMZWTzDOvn4jvbGXX9dP5ss4EX9ZAUvG0N9T9QZCZhuiu
 KsXSaYvvpx/7xHibOjssXgOdKHEDpShtwSj7cWUrVNz3++8Vb9Lx7sevJ/VxTzUZWuLo
 OVf9N2k4WsOS2bOiQ+g/mlrn/xfn+6u07m0iHJyhAQf70eUmTSH4tvC3X7q3F24E+C+r
 vHCTRr+sTSZz1t3aQNp9iSshuYQwMJJ1HXeUSrr6wNfVUXlKIML22g35mwQXfCXNsoPC
 0EQNgKjUSQTnWLMmOPgJsNsNQA0uIgEugYk94e0gDpanLs1egn6UhNYohXIsp3q11K0o
 fI8Q==
X-Gm-Message-State: AO0yUKVluf8t7mSpbu/6qwoSgp0Oykq81f6BdjcvrIzbiCN5s7Rz+46J
 Ha2b2oxkHTLHiAP5XgMkCaSg3SkeNJ1N1/9JB7qj0bD/006ip2YiRwA=
X-Google-Smtp-Source: AK7set/yr76Z9tDOSRpeoSikZuLd1WISiVQ1UFAgFKcAMKIiGu5dyhHPYcP1Eb/mu/9Yd5HwD/Ye8u+mXnQTIEFt9JI=
X-Received: by 2002:ac2:43d5:0:b0:4d5:ca32:697f with SMTP id
 u21-20020ac243d5000000b004d5ca32697fmr642391lfl.9.1676831883447; Sun, 19 Feb
 2023 10:38:03 -0800 (PST)
MIME-Version: 1.0
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
In-Reply-To: <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
From: David Kerr <david@kerr.net>
Date: Sun, 19 Feb 2023 13:37:52 -0500
Message-ID: <CAJJxGdGjQ_m4LYWgvX4TEB=KsRWSM3oSM8dqVjL8wMkBvonqOQ@mail.gmail.com>
Subject: Re: Source IP incorrect on multi homed systems
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

My proposed workaround specifically stated to match on both the
interface and destination address, and to set a route with both
interface and [source] address.  This allows for multiple IP addresses
on the same interface -- which you can do with both IPv4 and IPv6.

But yes, it is a nasty hack.  You really need to understand what is
going on between the firewall and routing tables/rules and it is easy
to get confused.


On Sun, Feb 19, 2023 at 12:10 PM tlhackque <tlhackque@yahoo.com> wrote:
>
> FWIW, while clever, I don't think that iptables mark solves all cases.
> E.g., consider an interface with multiple addresses, where a packet
> comes in on a secondary address.  The proposed rule would send it out
> the right interface, but still with the wrong (primary) address picked
> from the interface...
>
> With IPv6 it's common to assign an address to a service rather than a
> host so services can move easily.  So multiple addresses per interface
> are the rule, not the exception.
>
> I do the same with IPv4 inside addresses, though these days public IPv4
> addresses are scarce enough that it's not common for public IPs.  It
> amounts to the same issue - the NAT tracking is stateful.
>
> Trying to work around this with routing seems like a maze of twisty
> passages - so I agree that the right solution is for WG to respond from
> the address that receives a packet.
>
> On 19-Feb-23 11:32, David Kerr wrote:
> > Without getting into the debate of whether wireguard is acting
> > correctly or not, I think there is a possible workaround.
> >
> > 1. In the iptables mangle table PREROUTING, match the incoming
> > interface and destination address and --set-xmark a firewall MARK
> > unique to this interface/destination
> > 2. Create a new ip route table that sets the default route to go out
> > on the interface with the source address you want (same as destination
> > address in iptables)
> > 3. Create a new ip rule that sends all packets with firewall mark set
> > in iptables to the routing table you just created
> >
> > Repeat above for each interface/address you need to mangle, with a
> > unique firewall mark and routing table for each.
> >
> > It may be necessary to use CONNMARK in PREROUTING and OUTPUT to
> > --restore_mark.  I can't remember if this is needed or not, its been a
> > while since I configured iptables with this.
> >
> > This should ensure that any packet that comes into an
> > interface/address is replied to from the same interface/address.
> >
> > David
> >
> >
> > On Sun, Feb 19, 2023 at 9:44 AM Christoph Loesch<wireguard-mail@chil.at>  wrote:
> >> Hi,
> >>
> >> I don't think no one wants to fix it, there are several users having this issue. I rather guess no one could find a suitable solution to fix it.
> >>
> >> @Nico: did you try to delete the affected route and add it again with the correct source IP ?
> >>
> >> as I mentioned it inhttps://lists.zx2c4.com/pipermail/wireguard/2021-November/007324.html
> >>
> >> ip route del <NET>
> >> ip route add <NET> dev <ALIAS_DEV> src <SRC_IP>
> >>
> >> This way I was able to (at least temporary) fix this issue on multi homed systems.
> >>
> >> Kind regards,
> >> Christoph
> >>
> >> Am 19.02.2023 um 13:13 schrieb Nico Schottelius:
> >>> Hey Sebastian,
> >>>
> >>> Sebastian Hyrwall<sh@keff.org>  writes:
> >>>
> >>>> It is kinda. It's been mentioned multiple times over the years but no one seems to want to fix it. Atleast you should be able to specify bind/src ip in the
> >>>> config. I gave up WG because of it. Wasn't accepted by my projects security policy since src ip could not be configured.
> >>>>
> >>>> There is an unofficial patch however,
> >>>>
> >>>> https://github.com/torvalds/linux/commit/5fa98082093344c86345f9f63305cae9d5f9f281
> >>> the binding is somewhat related to this issue and I was looking for that
> >>> feature some time ago, too. While it is correlated and I would really
> >>> appreciate binding support, I am not sure whether the linked patch does
> >>> actually fix the problem I am seeing in multi homed devices.
> >>>
> >>> As long as wireguard does not reply with the same IP address it was
> >>> contacted with, packets will get dropped on stateful firewalls, because
> >>> the returning packet does not match the state session database.
> >>>
> >>> Best regards,
> >>>
> >>> Nico
> >>>
> >>> --
> >>> Sustainable and modern Infrastructures by ungleich.ch
>
