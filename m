Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8B6C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 23:51:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C10229C5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 23:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C10229C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cc8303b;
	Tue, 5 Jan 2021 23:51:33 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fc1b1ae1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 23:51:31 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id h205so2598860lfd.5
 for <wireguard@lists.zx2c4.com>; Tue, 05 Jan 2021 15:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6/Bh1+aQt1QZJwPIcHaNEF3PdgJHksbYjplkJgpmoL8=;
 b=Bd2n9qJf4eZw1qmvOWzPRIACiBzUVTyzIfUHKS4Zs8qCFXUEN+nTLnIcbJbv4rS0Cg
 p1MLK7ddU5CQY0D86kGN1Wf7F6dd9V3jgg7JG72o0xdaHpVDkt52HSo3XrkaMtYPBkCL
 d9Jo15rUZ283TnPriWKZbl+LC7HY6h4v1f9cUmXNxSnwBluG9LnjFWhgWtiOmrJOjSp6
 8LCqrQpVSFtaiuORjXkpBU9v1eI6iEU5I9EB2w3UFp9EcDfNN3gVl9c5e40Xv32na/95
 Q8CW828ZX13S/2lPfDLCncVaAerzh7WfxTaFdtr6iEobwIIBX7wlHgz+IV7F0sKytnub
 PERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6/Bh1+aQt1QZJwPIcHaNEF3PdgJHksbYjplkJgpmoL8=;
 b=EHQD4KhqR+44EIBR51OEZJRIpY+qsHwkAA8ansplkGplndJN/JR9kvw0r2PTSNFpnB
 OaKjoDNMnW0EC5yI+1QomHw2Lt6olK4p6BqkZJph5Wd2Wf2+6lwZnk9AIlNg1wrLNu7L
 dfUkUGsPlGBsOXoinh9eeHzXQh9nAQ+5LRXF3oVGmGuURqr+MD69YUWRO3QkCOKxfTkY
 Fkv7kfQiEAg0Wun8Y8gdWMZQsQafYgcrtdT2burnoXPCIBCVuiijiLSLu6t178tLhKOg
 QIyb51GfC1wbaGKjmBc2A4XaZDhxFsfpjyQTvtWCw59NZlisFXyw7t4zvya0VU9vFmvx
 zgzA==
X-Gm-Message-State: AOAM531wXyFHG9W1neX2xH/Srot5BxcPxVaqFw7GLPl0diQPQHpxm0Zb
 PF60UMOUs4GQnJ5S7GS9TMwYQCVQP7dFC7dYSfM=
X-Google-Smtp-Source: ABdhPJzcNB5+xECQZejHOlxgGXVkiVflM55gtCoQ/m88D2elw9lndYpMmhET4Qo3zfjYwlt6rvMCII1ax0kQj1cxYsU=
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr915280ljj.318.1609890690930; 
 Tue, 05 Jan 2021 15:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20210103215441.GA24251@server>
 <AM7P191MB088330591C4788BAEA9591888FD20@AM7P191MB0883.EURP191.PROD.OUTLOOK.COM>
 <20210105201212.GA31054@server> <20210106012530.2754726a@natsu>
 <20210105211301.GC31054@server>
In-Reply-To: <20210105211301.GC31054@server>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Wed, 6 Jan 2021 00:50:58 +0100
Message-ID: <CABtXGiB0bOWtmOSbJCnGFRM9d-7W0+L4QUz=ZvmX35b8hyzG_A@mail.gmail.com>
Subject: Re: WG default routing
To: Chris Osicki <wg@osk.ch>
Cc: Roman Mamedov <rm@romanrm.net>, Gijs Conijn <egc112@outlook.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Chris, you first post made it sound very much like a query on
wg-quick, it's mentioned in a way that implies you're using it.

"...My first try was with wg-quick, and noticed all my traffic went
through the WG-VPN connection.
It escapes me why. What is the idea behind this policy?

On my Linux boxes it's not a problem, I don't have to use wg-quick and
with few lines of bash in a script I have what I need. I have
root...."

On the working config I have, multiple clients, multiple wg tunnels
and policy-based routing, AllowedIPs does set up entries in my routing
table. Not setting another in AllowedIPs results in what you are
seeing, no traffic flow as their are no routes established. wg uses
your standard OS functionality for routing, try adding those routes
manually and no in the wg config and you should see quickly traffic
start to flow.

AllowedIPs function in the config is to easily encapsulate simple
routing requirements for tunnels that probably satisfies the needs of
most simple users. Stick in 0.0.0.0/0 and everything goes down the
pipe, or add specific ranges you want to go down the pipe and nothing
else.

Or you can go your own route (no pun intended) and make full use of
your OS routing and IP capability to get as complex as you need.

wg doesn't have a policy to take over your routing, but if you use
wg-quick as mentioned in your first post it's taking care of lots of
things for ease of use and based on the content of your config might
take over all routing.

Post your config and what you actually want to achieve and I am sure
this mailing list will have you up and running in no time.

On Tue, 5 Jan 2021 at 22:16, Chris Osicki <wg@osk.ch> wrote:
>
> On Wed, Jan 06, 2021 at 01:25:30AM +0500, Roman Mamedov wrote:
> > On Tue, 5 Jan 2021 21:12:12 +0100
> > Chris Osicki <wg@osk.ch> wrote:
> >
> > > As far as I can see after few tests, AllowedIPs config file option has nothing to do with routing and I hope
> > > it will stay like this.
> >
> > wg-quick uses AllowedIPs to also set up matching entries in the system routing
> > table. This can be disabled in its config.
> >
> > > It is just a filter
> >
> > It is not only a filter on incoming packets, but also WG's internal routing
> > table for knowing which packets should be sent to which peer.
>
> I'm sorry to contradict you but after some more readig I have to :-)
> WG has no "internal routing table", wg-quick (which, BTW, is not the subject of my query) uses it to modify
> kernel routing tables, from the wg-quick man page:
>
>        It infers all routes from the list of peers' allowed IPs, and automatically adds them to  the  system  routing
>        table.  If  one  of  those  routes is the default route (0.0.0.0/0 or ::/0), then it uses ip-rule(8) to handle
>        overriding of the default gateway.
>
> So, in my test config I have a server, 10.10.10.1 and two clients, 10.10.10.2/3
> If on the server I remove the AllowedIPs option, no one can connect.
> Giving AllowedIPs = 10.10.10.0/24 both clients can connect and routing in them stays as it was.
> The same for the clients, without AllowedIPs = 10.10.10.0/24 cannot connect.
>
> Thus, my question still remains: why this filtering function?
>
> >
> > --
> > With respect,
> > Roman
>
> Regards,
> Chris



-- 
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
