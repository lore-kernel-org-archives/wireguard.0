Return-Path: <SRS0=YA29=WC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCD2C433FF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Aug 2019 12:34:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8E692070D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Aug 2019 12:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8E692070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kerr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1384b5f;
	Tue, 6 Aug 2019 12:34:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cb5e6b0
 for <wireguard@lists.zx2c4.com>; Tue, 6 Aug 2019 12:33:56 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40faeb54
 for <wireguard@lists.zx2c4.com>; Tue, 6 Aug 2019 12:33:56 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id c15so10893633oic.3
 for <wireguard@lists.zx2c4.com>; Tue, 06 Aug 2019 05:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uo8Y1Dynz5JroxDawPsee2kzzVmUjg7nJXJKWHGcd7U=;
 b=bfTPvuFm5cjPGdF2wIJ7zxgqTeyIVOGfR0HqcGu7JUc2Jx0/uTalptAFqQVEhv+dFz
 cgji4tlvpW4jhOQTkNP2Y+2aD0Xpu11bjMRZpy+/JGMA+gfnYLXCWTCquV1zE3M9zNyf
 lOQ+rWHPwH1JGDSc2mBqtUn06ThKscE2fd0TLNaXklWw5BB715fdhMNduqoIYFyw+yZM
 2U8d63VXjODRDQDAmxlZpIWVrNm73OkkBtGzOOS4O4A/Aa/cDzw2YEVXTAfP+jfu0YZ4
 e0tJ4DlwhuHP7FO5A8ezpizLAtzeuEcA9LBClfQlbVy3CmMLEe5CPmUCmnplE6zq48FC
 +TeA==
X-Gm-Message-State: APjAAAXCtwhnhlhBf+cUE7TtfK4nt1sFvwu8ZWUpgtcU0CWnzrnxz4kf
 ZrDI1FzxvCyOJBdDQwnb88VVzZ+pzryi++7dxrwLuQ==
X-Google-Smtp-Source: APXvYqzzV6TG4MRS5+bWe78g42cgS+syldK/e2NKvgDq5AtauobRggK4uzGzRsSynnFsyTY1sh8hugyCVVzoCNsTUQY=
X-Received: by 2002:aca:55d7:: with SMTP id j206mr2482446oib.71.1565094834971; 
 Tue, 06 Aug 2019 05:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <5549622.se0SCevcK7@majestix.boerner.local>
 <CAJJxGdF0y798ra2HwNZdJ_OpRnUG3H7Wb2bo7sWhLz0iK6fOKg@mail.gmail.com>
 <2995139.DOlZOuy8Ws@majestix.boerner.local>
In-Reply-To: <2995139.DOlZOuy8Ws@majestix.boerner.local>
From: David Kerr <david@kerr.net>
Date: Tue, 6 Aug 2019 08:33:44 -0400
Message-ID: <CAJJxGdG501kTbza+nNhfPhEOJPb9E97LEaZf-E7TeeAF6cH8Dg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2767371583713518991=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2767371583713518991==
Content-Type: multipart/alternative; boundary="000000000000adc360058f7209c1"

--000000000000adc360058f7209c1
Content-Type: text/plain; charset="UTF-8"

Hi Tom,
  Yes I have a stable IP external address.  Under normal circumstances it
only changes if I change device (the MAC address) that requests the dhcp
lease.  Thus I only have to deal with roaming (changing IPs) on my client
device(s) not the server.  I have never heard of a ISP that changes an
assigned IP address every 24 hours, its pretty unfriendly practice.
Normally client devices request renewal of the specific IP address it was
previously assigned, so your ISP is explicitly refusing to renew that and
causing the client to request a new IP.  I would be seeking a new ISP in
your situation.

David

On Tue, Aug 6, 2019 at 3:17 AM <boerner@t-online.de> wrote:

> Hi David,
>
> Thanks for your elaborate answer!
>
>
>
> Yes, your assumption is right - my clients connect to a URL that resolves
> to an internal address when inside my local LAN. The idea was to keep
> traffic internal whenever possible.
>
> I have now followed your suggestion and have my VPN URL always resolved to
> the external IP address so the address won't change when leaving/entering
> the local network.
>
> For me, this solves a part of my issue but not all of it.
>
> My router is assigned a new external address (both IPv4 and IPv6) every 24
> h, and obviously this invalidates the public IP adresses known by the
> server and the client simultaneously, as they are identical for the clients
> connected to the local network. That makes the handshake fail, and "wg" on
> the server shows that it is still looking for its endpoints at the old
> address. The same is true for the clients.
>
> Disconnecting/reconnecting the clients fixes the tunnel until the next
> address change, because then Wireguard looks for the DNS record instead of
> using its stored address information. I think it would be a good feature if
> Wireguard could refresh its endpoint addresses automatically when an
> endpoint is not reachable anymore.
>
>
>
> How does it work on your side? Have you a constant external IP address?
>
>
>
> Thomas
>
>
>
>
>
> Am Montag, 5. August 2019, 23:28:41 CEST schrieb David Kerr:
>
> I assume you have set the client configs to connect to something like "
> vpn.example.com:<port>" . How does DNS resolve this when inside your
> local LAN?  Does it resolve to the same public IP address that your DSL
> router is connected to, or does it resolve to an internal address like
> 192.168.1.1?
>
>
> The way I have this working is to ensure that my VPN URL always resolves
> to the external IP address, even when I am inside my home network.  To do
> that I had to update my DNS server configuration to make sure that my VPN
> URL is always resolved by an external DNS provider... I have my own custom
> network gateway/router and set dnsmasq.static to include the line...
>
>
> server=/vpn.example.com/8.8.8.8
>
>
> Now this works for me because my wireguard server is running on my custom
> gateway/router... no NAT forwarding to an internal host running wireguard.
> If you are running wireguard on an internal server then you also need to
> make sure that your firewall rules don't block connections to your external
> interface from your local LAN and do the right NATing -- which is probably
> not permitted by default.  I forget how to do this, but I'm sure google
> will find some instructions.
>
>
> David
>
>
>
>
>
>
> On Mon, Aug 5, 2019 at 2:57 PM <boerner@t-online.de> wrote:
>
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
>
>
>

--000000000000adc360058f7209c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">Hi Tom,</div><div class=3D"gmail_default" style=3D"font-family:=
verdana,sans-serif">=C2=A0 Yes I have a stable IP external address.=C2=A0 U=
nder normal circumstances it only changes if I change device (the MAC addre=
ss) that requests the dhcp lease.=C2=A0 Thus I only have to deal with roami=
ng (changing IPs) on my client device(s) not the server.=C2=A0 I have never=
 heard of a ISP that changes an assigned IP address every 24 hours, its pre=
tty unfriendly practice.=C2=A0 Normally client devices request renewal of t=
he specific IP address it was previously assigned, so your ISP is explicitl=
y refusing to renew that and causing the client to request a new IP.=C2=A0 =
I would be seeking a new ISP in your situation.</div><div class=3D"gmail_de=
fault" style=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gma=
il_default" style=3D"font-family:verdana,sans-serif">David</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug=
 6, 2019 at 3:17 AM &lt;<a href=3D"mailto:boerner@t-online.de">boerner@t-on=
line.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><u></u>
<div style=3D"font-family:&quot;Noto Sans&quot;;font-size:10pt;font-weight:=
400;font-style:normal">
<p style=3D"margin:0px;text-indent:0px">Hi David,</p>
<p style=3D"margin:0px;text-indent:0px">Thanks for your elaborate answer!</=
p>
<p style=3D"margin:0px;text-indent:0px">=C2=A0</p>
<p style=3D"margin:0px;text-indent:0px">Yes, your assumption is right - my =
clients connect to a URL that resolves to an internal address when inside m=
y local LAN. The idea was to keep traffic internal whenever possible. </p>
<p style=3D"margin:0px;text-indent:0px">I have now followed your suggestion=
 and have my VPN URL always resolved to the external IP address so the addr=
ess won&#39;t change when leaving/entering  the local network.</p>
<p style=3D"margin:0px;text-indent:0px">For me, this solves a part of my is=
sue but not all of it. </p>
<p style=3D"margin:0px;text-indent:0px">My router is assigned a new externa=
l address (both IPv4 and IPv6) every 24 h, and obviously this invalidates t=
he public IP adresses known by the server and the client simultaneously, as=
 they are identical for the clients connected to the local network. That ma=
kes the handshake fail, and &quot;wg&quot; on the server shows that it is s=
till looking for its endpoints at the old address. The same is true for the=
 clients.</p>
<p style=3D"margin:0px;text-indent:0px">Disconnecting/reconnecting the clie=
nts fixes the tunnel until the next address change, because then Wireguard =
looks for the DNS record instead of using its stored address information. I=
 think it would be a good feature if Wireguard could refresh its endpoint a=
ddresses automatically when an endpoint is not reachable anymore.</p>
<p style=3D"margin:0px;text-indent:0px">=C2=A0</p>
<p style=3D"margin:0px;text-indent:0px">How does it work on your side? Have=
 you a constant external IP address?</p>
<p style=3D"margin:0px;text-indent:0px">=C2=A0</p>
<p style=3D"margin:0px;text-indent:0px">Thomas</p>
<p style=3D"margin:0px;text-indent:0px">=C2=A0</p>
<p style=3D"margin:0px;text-indent:0px">=C2=A0</p>
<p style=3D"margin:0px;text-indent:0px">Am Montag, 5. August 2019, 23:28:41=
 CEST schrieb David Kerr:<br></p>
<p style=3D"margin:12px 40px 0px;text-indent:0px"><span style=3D"font-famil=
y:&quot;verdana,sans-serif&quot;">I assume you have set the client configs =
to connect to something like &quot;</span><a href=3D"http://vpn.example.com=
" target=3D"_blank"><span style=3D"font-family:&quot;verdana,sans-serif&quo=
t;;text-decoration:underline;color:rgb(41,128,185)">vpn.example.com</span><=
/a><span style=3D"font-family:&quot;verdana,sans-serif&quot;">:&lt;port&gt;=
&quot; . How does DNS resolve this when inside your local LAN?=C2=A0 Does i=
t resolve to the same public IP address that your DSL router is connected t=
o, or does it resolve to an internal address like 192.168.1.1?</span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;"><br></span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;">The way I have this working is to ensure that =
my VPN URL always resolves to the external IP address, even when I am insid=
e my home network.=C2=A0 To do that I had to update my DNS server configura=
tion to make sure that my VPN URL is always resolved by an external DNS=C2=
=A0provider... I have my own custom network gateway/router and set dnsmasq.=
static to include the line...</span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;"><br></span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;">server=3D/</span><a href=3D"http://vpn.example=
.com/8.8.8.8" target=3D"_blank"><span style=3D"font-family:&quot;verdana,sa=
ns-serif&quot;;text-decoration:underline;color:rgb(41,128,185)">vpn.example=
.com/8.8.8.8</span></a><span style=3D"font-family:&quot;verdana,sans-serif&=
quot;"><br></span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;"><br></span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;">Now this works for me because my wireguard ser=
ver is running on my custom gateway/router... no NAT forwarding to an inter=
nal host running wireguard.=C2=A0 If you are running wireguard on an intern=
al server then you also need to make sure that your firewall rules don&#39;=
t block connections to your external interface from your local LAN and do t=
he right NATing -- which is probably not permitted by default.=C2=A0 I forg=
et how to do this, but I&#39;m sure google will find some instructions.</sp=
an></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;"><br></span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;">David</span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;"><br></span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;"><br></span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;"><br></span></p>
<p style=3D"margin:0px 40px;text-indent:0px"><span style=3D"font-family:&qu=
ot;verdana,sans-serif&quot;"><br></span><br></p>
<p style=3D"margin:0px 40px;text-indent:0px">On Mon, Aug 5, 2019 at 2:57 PM=
 &lt;<a href=3D"mailto:boerner@t-online.de" target=3D"_blank"><span style=
=3D"text-decoration:underline;color:rgb(41,128,185)">boerner@t-online.de</s=
pan></a>&gt; wrote:<br></p>
<p style=3D"margin:0px 40px 0px 45px;text-indent:0px">Hey all,<br><br>I&#39=
;ve recently set up my private VPN with Wireguard. I am running my local se=
rver behind a DSL router with a variable public IP address, accessible via =
dyndns and NAT, and several mobile clients (Android, Notebooks). <br>Everyt=
hing is working fine so far, except of one issue that I would like discuss =
here: <br>Roaming doesn&#39;t work reliably when a device leaves or re-ente=
rs the home LAN, nor when the public IP address is changed by my ISP. The r=
eason seems clear to me: In these cases both peers change their IP address =
simultaneously whereas the Wireguard protocol relies on only one address ch=
anging at a time.<br><br>My approach would be to shut down Wireguard on the=
 clients as long as they are connected to their home network locally and to=
 bring up the tunnel only when they leave the home network. Besides the roa=
ming issue it=C2=A0 would be desirable to use the local connection when it =
is available rather than to take the detour over the internet. And it=C2=A0=
 should be done automatically so users need not remember to switch on/off V=
PN all the time.<br>My idea was to use Tasker to perform something like wg-=
quick up|down tun1 accordingly, but the Wireguard command line tools wg and=
 wg-quick don&#39;t seem to be available (anymore). In older forum posts I&=
#39;ve seen that you can install them from the app settings, but in my vers=
ion (v0.0.20190708) this option is not available.<br><br>Does anybody know =
about another solution? Or, as a question to the developers, would it be a =
big deal to bring back the command line feature?<br><br>Thanks, Tom<br><br>=
<br><br><br>_______________________________________________<br>WireGuard ma=
iling list<br><a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank=
"><span style=3D"text-decoration:underline;color:rgb(41,128,185)">WireGuard=
@lists.zx2c4.com</span></a><br><a href=3D"https://lists.zx2c4.com/mailman/l=
istinfo/wireguard" target=3D"_blank"><span style=3D"text-decoration:underli=
ne;color:rgb(41,128,185)">https://lists.zx2c4.com/mailman/listinfo/wireguar=
d</span></a><br></p>
<p style=3D"margin:0px;text-indent:0px"><br><br></p></div></blockquote></di=
v>

--000000000000adc360058f7209c1--

--===============2767371583713518991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2767371583713518991==--
