Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B26C05027
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 11:37:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14e837fa;
	Mon, 20 Feb 2023 11:37:49 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c786f2e6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 18:32:06 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id s24so4010581edw.2
 for <wireguard@lists.zx2c4.com>; Sun, 19 Feb 2023 10:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ifjveaRNm6Yo9cXrk/fmqQMST4Zhci6bpoq7yM7ab28=;
 b=qOUK6tYZYIvKSCCO+MQSXN9/k7Ykmh+aIOws798mKLCD4x091wv57Ij5UlD5MmJfxZ
 UhqOliXo8u+xynLcyoI+nidGDlcLBpPPe6QnXdok2HP8xL8u0hBnv3LtiNfRmC4Ndiyp
 SCC3gsBjs+6mEDg5665/5o96rwJvQaoB/aiBf8rm47U5Tb0phzAF2dpy1EIzGc3qfjfP
 Med9zbrKdJkLsf28BuC/Pi9BGuCKd9azlG8uacxdlcIxCAnUK1m1EkhozB2CoyHfsX4l
 2tVQ0on9TZJoqoBH1qS/UntWIIoQJ1UZvzgTDiTy8AKRxplbMIAsN+OHbdiOMb3jSsdz
 SnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ifjveaRNm6Yo9cXrk/fmqQMST4Zhci6bpoq7yM7ab28=;
 b=OAG8ikKSSPL+ezAOSSqViTW7OR99xyUmQyv5qhN4XhjbFKw5SdS0W8vO1OgFiRq0ta
 +AiJ0yE3nwEejS3UC02RVyksNYg9h+dx5d3zVGxysZuXy4lunm06L96kf9k0asj2mzq1
 P+b/z3u/5OTTfkJkUYnAhNys3WdX63RJzzoojhy7X1i/WCk3ubraPNm4sc8S26ORRmZE
 znqqHnC+g9P/1vifFNmQe71CyuyIemrSHSSgswAf3xqdbWgOudIM3aL/VvZ9gU4Ezq3T
 3rSCQMQWFLPhRlrwOKgiFqF4+6rvL01FmWiH39eZDOW/iaxnKugOX9TrlLAwebzCV+eU
 5b/g==
X-Gm-Message-State: AO0yUKWfLZ3BaTOzOO4xUbkA7NEeipFxDNAmM3ZiAR/IDtTpt8s7e8tz
 s9jbnp23ZBWE0VBKvyayWedh4tpzChm/kDMo8j6i4Rhf
X-Google-Smtp-Source: AK7set/ucc1Oh65Vana3uMyDAsQ3RZOxgZz0M0FDEVDCunn6TlvUofgxTpYi+u63qbID2GmhMWR/qMeDwaDVzFHWXdE=
X-Received: by 2002:a17:906:aac6:b0:8b2:fa6d:45e3 with SMTP id
 kt6-20020a170906aac600b008b2fa6d45e3mr3431128ejb.1.1676831526134; Sun, 19 Feb
 2023 10:32:06 -0800 (PST)
MIME-Version: 1.0
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <CADGd2DoE6TCtCxxWL7JWyNW5+yy_Pe+9MNzHznbudMWLTXQreA@mail.gmail.com>
In-Reply-To: <CADGd2DoE6TCtCxxWL7JWyNW5+yy_Pe+9MNzHznbudMWLTXQreA@mail.gmail.com>
From: John Lauro <johnalauro@gmail.com>
Date: Sun, 19 Feb 2023 13:30:42 -0500
Message-ID: <CADGd2DoGhYw1YHLu6e=-weWQhWMccbKS=UKbS7Z_LnvNZm+65g@mail.gmail.com>
Subject: Fwd: Source IP incorrect on multi homed systems
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 20 Feb 2023 11:37:48 +0000
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

I think the ip route with src would work, but only as a short lived
work around.  The problem with it is if dealing with dynamic routes is
it could go a way when a link is down and then come back and the src
setting would be lost.  You would need the bgp software to add the
src.

UDP is connectionless.  Sending back out the same as it's coming in
isn't strictly the same.  The streams are not attached the same as
they would be with TCP on nginx or a reply with icmp. You should be
able to whitelist the udp port on the NAT devices, as it shouldn't use
state info.

I am not sure if you are attempting to do site to site or client to
server/site and which end has the NAT (or both).  What I do for site
to site is use a different port for each connection and have a
separate BGP connection for each possible connection (ie: different
one for different network providers).  Have a full mesh with 8 sites
and upto 3 providers per site.

That said, you probably have floating IPs on the client side, and
don't want to lock in a single IP on the multi-homed server side?  You
could nat the incoming IPs on the border from an internal IP and then
then lock to a single private IP on the wireguard server for in/out
and that border nat would force the reply back to the same gateway it
came in from.

I know, you don't want work arounds, just want to mention it's not the
same as comparing a single stream to something that handles routing
though it.  As you are doing bgp and redundant routes I assume you
also reset rp_filter on all nat/wireguard/routers so the routers will
allow packets to come from different sources.

On Sun, Feb 19, 2023 at 12:07 PM tlhackque <tlhackque@yahoo.com> wrote:
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
