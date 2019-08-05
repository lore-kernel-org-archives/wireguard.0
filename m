Return-Path: <SRS0=ZLx+=WB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88CFC0650F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 21:29:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177462173B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 21:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 177462173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kerr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6234cbf7;
	Mon, 5 Aug 2019 21:28:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53160fb0
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 21:28:53 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 776e7b09
 for <wireguard@lists.zx2c4.com>; Mon, 5 Aug 2019 21:28:53 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id j19so10725279otq.2
 for <wireguard@lists.zx2c4.com>; Mon, 05 Aug 2019 14:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YwmlviujykLaGxbNBnFo9vhCUNcdxxK3vKgsqkwepUs=;
 b=q11Q5enh9eN//G4kfB5cY3tLRSlZCaiWTajmse1f3qITENY0FIB5A9927w9G8fVF8g
 F+wL6N5A468VIhpyyHuVmeHYWgs5m/lll6cGHpX8uPMstVAY9dG3g+leniZdoGszcMhx
 lSM1X2gUPR1GlONTdby5CuBJNQEQZFE0tVdIYJ0m6F9NN9MDiJX2czWLskWqEU4DtfQE
 a+L1BPkDVn02XTuhquiGKGn4wj2uY7DVezBfqdv1p284ZhWxTafgF/SWDMuXerB+SSUd
 1WyfcdHo+2slavtx5aFhnap8192164pi1VXxyOT11RZyYaQqu+xEkSvsRXYDKXrrlL+3
 Cb8w==
X-Gm-Message-State: APjAAAWJP4QSZxXDAo0znsRVQBIsz30qQ1ldv/BeLIvvv0x5/+blb5//
 hT5hax6NViQd1E4WgMGkdiT1fMyZdRA0hkkcoug=
X-Google-Smtp-Source: APXvYqxy3KT5lC1Mc03k+6WZPtb8ElWKa1DU5BOwWBmyW8MJSvhkbYVKdD4sllbgaHeMeaVJY4CZiEs/I3SIO85KgiY=
X-Received: by 2002:a05:6830:12d5:: with SMTP id
 a21mr48422158otq.29.1565040532183; 
 Mon, 05 Aug 2019 14:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <5549622.se0SCevcK7@majestix.boerner.local>
In-Reply-To: <5549622.se0SCevcK7@majestix.boerner.local>
From: David Kerr <david@kerr.net>
Date: Mon, 5 Aug 2019 17:28:41 -0400
Message-ID: <CAJJxGdF0y798ra2HwNZdJ_OpRnUG3H7Wb2bo7sWhLz0iK6fOKg@mail.gmail.com>
Subject: Re: Wireguard command line tools for Android
To: boerner@t-online.de
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
Content-Type: multipart/mixed; boundary="===============3707179757604445043=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3707179757604445043==
Content-Type: multipart/alternative; boundary="000000000000faf261058f656453"

--000000000000faf261058f656453
Content-Type: text/plain; charset="UTF-8"

I assume you have set the client configs to connect to something like "
vpn.example.com:<port>" . How does DNS resolve this when inside your local
LAN?  Does it resolve to the same public IP address that your DSL router is
connected to, or does it resolve to an internal address like 192.168.1.1?

The way I have this working is to ensure that my VPN URL always resolves to
the external IP address, even when I am inside my home network.  To do that
I had to update my DNS server configuration to make sure that my VPN URL is
always resolved by an external DNS provider... I have my own custom network
gateway/router and set dnsmasq.static to include the line...

server=/vpn.example.com/8.8.8.8

Now this works for me because my wireguard server is running on my custom
gateway/router... no NAT forwarding to an internal host running wireguard.
If you are running wireguard on an internal server then you also need to
make sure that your firewall rules don't block connections to your external
interface from your local LAN and do the right NATing -- which is probably
not permitted by default.  I forget how to do this, but I'm sure google
will find some instructions.

David





On Mon, Aug 5, 2019 at 2:57 PM <boerner@t-online.de> wrote:

> Hey all,
>
> I've recently set up my private VPN with Wireguard. I am running my local
> server behind a DSL router with a variable public IP address, accessible
> via dyndns and NAT, and several mobile clients (Android, Notebooks).
> Everything is working fine so far, except of one issue that I would like
> discuss here:
> Roaming doesn't work reliably when a device leaves or re-enters the home
> LAN, nor when the public IP address is changed by my ISP. The reason seems
> clear to me: In these cases both peers change their IP address
> simultaneously whereas the Wireguard protocol relies on only one address
> changing at a time.
>
> My approach would be to shut down Wireguard on the clients as long as they
> are connected to their home network locally and to bring up the tunnel only
> when they leave the home network. Besides the roaming issue it  would be
> desirable to use the local connection when it is available rather than to
> take the detour over the internet. And it  should be done automatically so
> users need not remember to switch on/off VPN all the time.
> My idea was to use Tasker to perform something like wg-quick up|down tun1
> accordingly, but the Wireguard command line tools wg and wg-quick don't
> seem to be available (anymore). In older forum posts I've seen that you can
> install them from the app settings, but in my version (v0.0.20190708) this
> option is not available.
>
> Does anybody know about another solution? Or, as a question to the
> developers, would it be a big deal to bring back the command line feature?
>
> Thanks, Tom
>
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000faf261058f656453
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">I assume you have set the client configs to connect to somethin=
g like &quot;<a href=3D"http://vpn.example.com">vpn.example.com</a>:&lt;por=
t&gt;&quot; . How does DNS resolve this when inside your local LAN?=C2=A0 D=
oes it resolve to the same public IP address that your DSL router is connec=
ted to, or does it resolve to an internal address like 192.168.1.1?</div><d=
iv class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">Th=
e way I have this working is to ensure that my VPN URL always resolves to t=
he external IP address, even when I am inside my home network.=C2=A0 To do =
that I had to update my DNS server configuration to make sure that my VPN U=
RL is always resolved by an external DNS=C2=A0provider... I have my own cus=
tom network gateway/router and set dnsmasq.static to include the line...</d=
iv><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><b=
r></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-seri=
f">server=3D/<a href=3D"http://vpn.example.com/8.8.8.8">vpn.example.com/8.8=
.8.8</a><br></div><div class=3D"gmail_default" style=3D"font-family:verdana=
,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:ve=
rdana,sans-serif">Now this works for me because my wireguard server is runn=
ing on my custom gateway/router... no NAT forwarding to an internal host ru=
nning wireguard.=C2=A0 If you are running wireguard on an internal server t=
hen you also need to make sure that your firewall rules don&#39;t block con=
nections to your external interface from your local LAN and do the right NA=
Ting -- which is probably not permitted by default.=C2=A0 I forget how to d=
o this, but I&#39;m sure google will find some instructions.</div><div clas=
s=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><br></div><div=
 class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">David</di=
v><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><br=
></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif=
"><br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-=
serif"><br></div><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Aug 5, 2019 at 2:57 PM &lt;<a href=3D"mailto:=
boerner@t-online.de">boerner@t-online.de</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hey all,<br>
<br>
I&#39;ve recently set up my private VPN with Wireguard. I am running my loc=
al server behind a DSL router with a variable public IP address, accessible=
 via dyndns and NAT, and several mobile clients (Android, Notebooks). <br>
Everything is working fine so far, except of one issue that I would like di=
scuss here: <br>
Roaming doesn&#39;t work reliably when a device leaves or re-enters the hom=
e LAN, nor when the public IP address is changed by my ISP. The reason seem=
s clear to me: In these cases both peers change their IP address simultaneo=
usly whereas the Wireguard protocol relies on only one address changing at =
a time.<br>
<br>
My approach would be to shut down Wireguard on the clients as long as they =
are connected to their home network locally and to bring up the tunnel only=
 when they leave the home network. Besides the roaming issue it=C2=A0 would=
 be desirable to use the local connection when it is available rather than =
to take the detour over the internet. And it=C2=A0 should be done automatic=
ally so users need not remember to switch on/off VPN all the time.<br>
My idea was to use Tasker to perform something like wg-quick up|down tun1 a=
ccordingly, but the Wireguard command line tools wg and wg-quick don&#39;t =
seem to be available (anymore). In older forum posts I&#39;ve seen that you=
 can install them from the app settings, but in my version (v0.0.20190708) =
this option is not available.<br>
<br>
Does anybody know about another solution? Or, as a question to the develope=
rs, would it be a big deal to bring back the command line feature?<br>
<br>
Thanks, Tom<br>
<br>
<br>
<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000faf261058f656453--

--===============3707179757604445043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3707179757604445043==--
