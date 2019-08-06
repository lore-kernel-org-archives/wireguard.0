Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D224C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E36206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="Cy2Iy+op"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3E36206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a6ba964;
	Sun, 25 Aug 2019 15:31:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63b9d236
 for <wireguard@lists.zx2c4.com>; Tue, 6 Aug 2019 13:18:34 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06cb5c66
 for <wireguard@lists.zx2c4.com>; Tue, 6 Aug 2019 13:18:34 +0000 (UTC)
Received: from Alex (unknown [192.168.177.5])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: news@lindenberg.one)
 by mailarchive.lindenberg.one (Postfix) with ESMTPSA id CB812280080;
 Tue,  6 Aug 2019 15:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1565097511;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=R1FfmNGUtkxWkB3HUa8SMzb9GSnAzI3gOFLLDbU35js=;
 b=Cy2Iy+opfP4ee05dUSyHsyWRQhCwkVENqVXhdydAscBfxPQ+jra4sh+sEolEezQ5/JCJsB
 03uQ/Vu9g9k4LXuRrB0izAROMR27CuzcoXY55B3nM6iTJeTjhKaT/EQuPb/ScYeVSmGFHJ
 lq/HtuFtwKSzP/F+XdjFu0FdplsC2B2+iW0lvCLFt1eYwtcSeNbUVeZ+c+Rl3rM3Cw3Plk
 +F/0GnJOBqrkMEBCikJ9+oD8Ct8SKHhYQubneM1pO519Sc4afYOjf2OPT4myjfpdUfHVE7
 GY0bC2a3EEgKU1DW8VdJjQAdbwUOkm45xjGtFyg9pAhWSMBOMjAYUXGoLl4s3A==
From: "Joachim Lindenberg" <wireguard@lindenberg.one>
To: "'David Kerr'" <david@kerr.net>,
	<boerner@t-online.de>
References: <5549622.se0SCevcK7@majestix.boerner.local>
 <CAJJxGdF0y798ra2HwNZdJ_OpRnUG3H7Wb2bo7sWhLz0iK6fOKg@mail.gmail.com>
 <2995139.DOlZOuy8Ws@majestix.boerner.local>
 <CAJJxGdG501kTbza+nNhfPhEOJPb9E97LEaZf-E7TeeAF6cH8Dg@mail.gmail.com>
In-Reply-To: <CAJJxGdG501kTbza+nNhfPhEOJPb9E97LEaZf-E7TeeAF6cH8Dg@mail.gmail.com>
Subject: RE: Wireguard command line tools for Android
Date: Tue, 6 Aug 2019 15:18:31 +0200
Message-ID: <003301d54c59$7190e820$54b2b860$@lindenberg.one>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQL39P+BrZ8dwDopoz7+IVTRmoXD1QDaN8h9AfdccsEBazGEUwIZzwIO
Content-Language: en-de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one; 
 s=dkim180429; t=1565097511;
 h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:resent-to:resent-cc:resent-from:resent-sender:resent-message-id:in-reply-to:references:list-id:list-owner:list-unsubscribe:list-subscribe:list-post;
 bh=R1FfmNGUtkxWkB3HUa8SMzb9GSnAzI3gOFLLDbU35js=;
 b=0BoLyIe9/ey73/Gv7Kb/wUqnUPRKXANkqIYEVRBNR8rNEm7zKKjjKMjoG6tY2EysBFVC5n
 L36Ios2QldyMg4zHnGZypNIfCMIU5PvHgMsFiD53lezB8ei23ntjij3Sa+ImGDMdcVM0qb
 u8mBSR+0Ugcm6F6zoE9+pPgvRd4oTtFNnoPo3nbrjRb9yWukRhc2wq5KX0SXtOz2b/nhMt
 xX94j3qGPm8QU4sG+8mXGfK0MSG8+/RM4p3m+FXX2a/4Gafu8jXvP6YiDVSTtYq3KGb+Wl
 4FzJ/DGsqwq9D/6yACkri4lPJ8vPDQt8PJ5zf1dw9MppRYqwoYCbSIzglT6dnQ==
ARC-Seal: i=1; s=dkim180429; d=lindenberg.one; t=1565097511; a=rsa-sha256;
 cv=none;
 b=FPk5xYrPfCaODl89TOfu4GkFP+BCoSagydQQPD0GBfFxIiOhJI1XG3GgcnYBzFN5Hpw3lAVZCzcl6Ia4+veGf02i1fpUQJfT/PfVVsn5dlMmpzDaHhF3z7KK5rDy92D/JnUCFACgF/ebG66EKnfyOy7XYL+cy5bZkaTDYs/fnkXT+6PDYQYvjtFRGIwdky8X7hrb5KjKc7txnZojLZUCLFU/EtmL4QynSHkli5N8DXx19Dt7/WKpkZ8PWXYX2x8mDyweKZ+1jcu16+hDVf5Orkqd/xIRNgP62WxKKsbVBd9izhwu445U05xujxhsq9rP4U654vVOrOLd9V8iUdNA9A==
ARC-Authentication-Results: i=1; auth=pass smtp.auth=news@lindenberg.one
 smtp.mailfrom=news@lindenberg.one
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:31:49 +0200
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
Content-Type: multipart/mixed; boundary="===============4174938241148102383=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multipart message in MIME format.

--===============4174938241148102383==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0034_01D54C6A.351B3EC0"
Content-Language: en-de

This is a multipart message in MIME format.

------=_NextPart_000_0034_01D54C6A.351B3EC0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Unfortunately changing IP-Addresses on subscriber lines is very common =
in Germany, unless you pay extra money for a =E2=80=9Cstatic=E2=80=9D =
IP. I definitely support Thomas=C2=B4 request to renew the binding via =
DNS when the tunnel is broken.

Thanks, Joachim

=20

From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of David =
Kerr
Sent: Dienstag, 6. August 2019 14:34
To: boerner@t-online.de
Cc: wireguard@lists.zx2c4.com
Subject: Re: Wireguard command line tools for Android

=20

Hi Tom,

  Yes I have a stable IP external address.  Under normal circumstances =
it only changes if I change device (the MAC address) that requests the =
dhcp lease.  Thus I only have to deal with roaming (changing IPs) on my =
client device(s) not the server.  I have never heard of a ISP that =
changes an assigned IP address every 24 hours, its pretty unfriendly =
practice.  Normally client devices request renewal of the specific IP =
address it was previously assigned, so your ISP is explicitly refusing =
to renew that and causing the client to request a new IP.  I would be =
seeking a new ISP in your situation.

=20

David

=20

On Tue, Aug 6, 2019 at 3:17 AM <boerner@t-online.de =
<mailto:boerner@t-online.de> > wrote:

Hi David,

Thanks for your elaborate answer!

=20

Yes, your assumption is right - my clients connect to a URL that =
resolves to an internal address when inside my local LAN. The idea was =
to keep traffic internal whenever possible.=20

I have now followed your suggestion and have my VPN URL always resolved =
to the external IP address so the address won't change when =
leaving/entering the local network.

For me, this solves a part of my issue but not all of it.=20

My router is assigned a new external address (both IPv4 and IPv6) every =
24 h, and obviously this invalidates the public IP adresses known by the =
server and the client simultaneously, as they are identical for the =
clients connected to the local network. That makes the handshake fail, =
and "wg" on the server shows that it is still looking for its endpoints =
at the old address. The same is true for the clients.

Disconnecting/reconnecting the clients fixes the tunnel until the next =
address change, because then Wireguard looks for the DNS record instead =
of using its stored address information. I think it would be a good =
feature if Wireguard could refresh its endpoint addresses automatically =
when an endpoint is not reachable anymore.

=20

How does it work on your side? Have you a constant external IP address?

=20

Thomas

=20

=20

Am Montag, 5. August 2019, 23:28:41 CEST schrieb David Kerr:

I assume you have set the client configs to connect to something like " =
<http://vpn.example.com> vpn.example.com:<port>" . How does DNS resolve =
this when inside your local LAN?  Does it resolve to the same public IP =
address that your DSL router is connected to, or does it resolve to an =
internal address like 192.168.1.1?

=20

The way I have this working is to ensure that my VPN URL always resolves =
to the external IP address, even when I am inside my home network.  To =
do that I had to update my DNS server configuration to make sure that my =
VPN URL is always resolved by an external DNS provider... I have my own =
custom network gateway/router and set dnsmasq.static to include the =
line...

=20

server=3D/ <http://vpn.example.com/8.8.8.8> vpn.example.com/8.8.8.8

=20

Now this works for me because my wireguard server is running on my =
custom gateway/router... no NAT forwarding to an internal host running =
wireguard.  If you are running wireguard on an internal server then you =
also need to make sure that your firewall rules don't block connections =
to your external interface from your local LAN and do the right NATing =
-- which is probably not permitted by default.  I forget how to do this, =
but I'm sure google will find some instructions.

=20

David

=20

=20

=20

=20

On Mon, Aug 5, 2019 at 2:57 PM < <mailto:boerner@t-online.de> =
boerner@t-online.de> wrote:

Hey all,

I've recently set up my private VPN with Wireguard. I am running my =
local server behind a DSL router with a variable public IP address, =
accessible via dyndns and NAT, and several mobile clients (Android, =
Notebooks).=20
Everything is working fine so far, except of one issue that I would like =
discuss here:=20
Roaming doesn't work reliably when a device leaves or re-enters the home =
LAN, nor when the public IP address is changed by my ISP. The reason =
seems clear to me: In these cases both peers change their IP address =
simultaneously whereas the Wireguard protocol relies on only one address =
changing at a time.

My approach would be to shut down Wireguard on the clients as long as =
they are connected to their home network locally and to bring up the =
tunnel only when they leave the home network. Besides the roaming issue =
it  would be desirable to use the local connection when it is available =
rather than to take the detour over the internet. And it  should be done =
automatically so users need not remember to switch on/off VPN all the =
time.
My idea was to use Tasker to perform something like wg-quick up|down =
tun1 accordingly, but the Wireguard command line tools wg and wg-quick =
don't seem to be available (anymore). In older forum posts I've seen =
that you can install them from the app settings, but in my version =
(v0.0.20190708) this option is not available.

Does anybody know about another solution? Or, as a question to the =
developers, would it be a big deal to bring back the command line =
feature?

Thanks, Tom




_______________________________________________
WireGuard mailing list
 <mailto:WireGuard@lists.zx2c4.com> WireGuard@lists.zx2c4.com
 <https://lists.zx2c4.com/mailman/listinfo/wireguard> =
https://lists.zx2c4.com/mailman/listinfo/wireguard

=20


------=_NextPart_000_0034_01D54C6A.351B3EC0
Content-Type: text/html;
	boundary="----=_NextPart_000_B4B4_01D54C69.DAC99A20";
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Noto Sans";}
@font-face
	{font-family:"verdana\,sans-serif";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.E-MailFormatvorlage18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3Den-DE link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'mso-fareast-language:EN-US'>Unfortunately changing =
IP-Addresses on subscriber lines is very common in Germany, unless you =
pay extra money for a =E2=80=9Cstatic=E2=80=9D IP. I definitely support =
Thomas=C2=B4 request to renew the binding via DNS when the tunnel is =
broken.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'mso-fareast-language:EN-US'>Thanks, =
Joachim<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b><span lang=3DEN-US>From:</span></b><span =
lang=3DEN-US> WireGuard &lt;wireguard-bounces@lists.zx2c4.com&gt; <b>On =
Behalf Of </b>David Kerr<br><b>Sent:</b> Dienstag, 6. August 2019 =
14:34<br><b>To:</b> boerner@t-online.de<br><b>Cc:</b> =
wireguard@lists.zx2c4.com<br><b>Subject:</b> Re: Wireguard command line =
tools for Android<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DDE><o:p>&nbsp;</o:p></span></p><div><div><p =
class=3DMsoNormal><span lang=3DDE =
style=3D'font-family:"Verdana",sans-serif'>Hi =
Tom,<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DDE style=3D'font-family:"Verdana",sans-serif'>&nbsp; Yes I have a =
stable IP external address.&nbsp; Under normal circumstances it only =
changes if I change device (the MAC address) that requests the dhcp =
lease.&nbsp; Thus I only have to deal with roaming (changing IPs) on my =
client device(s) not the server.&nbsp; I have never heard of a ISP that =
changes an assigned IP address every 24 hours, its pretty unfriendly =
practice.&nbsp; Normally client devices request renewal of the specific =
IP address it was previously assigned, so your ISP is explicitly =
refusing to renew that and causing the client to request a new IP.&nbsp; =
I would be seeking a new ISP in your =
situation.<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DDE =
style=3D'font-family:"Verdana",sans-serif'><o:p>&nbsp;</o:p></span></p></=
div><div><p class=3DMsoNormal><span lang=3DDE =
style=3D'font-family:"Verdana",sans-serif'>David<o:p></o:p></span></p></d=
iv></div><p class=3DMsoNormal><span =
lang=3DDE><o:p>&nbsp;</o:p></span></p><div><div><p =
class=3DMsoNormal><span lang=3DDE>On Tue, Aug 6, 2019 at 3:17 AM &lt;<a =
href=3D"mailto:boerner@t-online.de">boerner@t-online.de</a>&gt; =
wrote:<o:p></o:p></span></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-bottom:5=
.0pt'><div><p style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto Sans"'>Hi =
David,<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto Sans"'>Thanks for your =
elaborate answer!<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'>&nbsp;<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto Sans"'>Yes, your assumption =
is right - my clients connect to a URL that resolves to an internal =
address when inside my local LAN. The idea was to keep traffic internal =
whenever possible. <o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto Sans"'>I have now followed =
your suggestion and have my VPN URL always resolved to the external IP =
address so the address won't change when leaving/entering the local =
network.<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto Sans"'>For me, this solves a =
part of my issue but not all of it. <o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto Sans"'>My router is assigned =
a new external address (both IPv4 and IPv6) every 24 h, and obviously =
this invalidates the public IP adresses known by the server and the =
client simultaneously, as they are identical for the clients connected =
to the local network. That makes the handshake fail, and &quot;wg&quot; =
on the server shows that it is still looking for its endpoints at the =
old address. The same is true for the clients.<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'>Disconnecting/reconnecting the clients fixes the tunnel until the =
next address change, because then Wireguard looks for the DNS record =
instead of using its stored address information. I think it would be a =
good feature if Wireguard could refresh its endpoint addresses =
automatically when an endpoint is not reachable =
anymore.<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'>&nbsp;<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto Sans"'>How does it work on =
your side? Have you a constant external IP =
address?<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'>&nbsp;<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'>Thomas<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'>&nbsp;<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'>&nbsp;<o:p></o:p></span></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto Sans"'>Am Montag, 5. August =
2019, 23:28:41 CEST schrieb David Kerr:<o:p></o:p></span></p><p =
style=3D'mso-margin-top-alt:9.0pt;margin-right:30.0pt;margin-bottom:0cm;m=
argin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"verdana\,sans-serif"'>I assume =
you have set the client configs to connect to something like =
&quot;</span><span lang=3DDE style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><a href=3D"http://vpn.example.com" target=3D"_blank"><span =
style=3D'font-family:"verdana\,sans-serif";color:#2980B9'>vpn.example.com=
</span></a></span><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"verdana\,sans-serif"'>:&lt;port&gt=
;&quot; . How does DNS resolve this when inside your local LAN?&nbsp; =
Does it resolve to the same public IP address that your DSL router is =
connected to, or does it resolve to an internal address like =
192.168.1.1?</span><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p></o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p>&nbsp;</o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"verdana\,sans-serif"'>The way I =
have this working is to ensure that my VPN URL always resolves to the =
external IP address, even when I am inside my home network.&nbsp; To do =
that I had to update my DNS server configuration to make sure that my =
VPN URL is always resolved by an external DNS&nbsp;provider... I have my =
own custom network gateway/router and set dnsmasq.static to include the =
line...</span><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p></o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p>&nbsp;</o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"verdana\,sans-serif"'>server=3D/</=
span><span lang=3DDE style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><a href=3D"http://vpn.example.com/8.8.8.8" =
target=3D"_blank"><span =
style=3D'font-family:"verdana\,sans-serif";color:#2980B9'>vpn.example.com=
/8.8.8.8</span></a><o:p></o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p>&nbsp;</o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"verdana\,sans-serif"'>Now this =
works for me because my wireguard server is running on my custom =
gateway/router... no NAT forwarding to an internal host running =
wireguard.&nbsp; If you are running wireguard on an internal server then =
you also need to make sure that your firewall rules don't block =
connections to your external interface from your local LAN and do the =
right NATing -- which is probably not permitted by default.&nbsp; I =
forget how to do this, but I'm sure google will find some =
instructions.</span><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p></o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p>&nbsp;</o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"verdana\,sans-serif"'>David</span>=
<span lang=3DDE style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p></o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p>&nbsp;</o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p>&nbsp;</o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p>&nbsp;</o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:12.0pt;=
margin-left:30.0pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p>&nbsp;</o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:30.0pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto Sans"'>On Mon, Aug 5, 2019 =
at 2:57 PM &lt;<a href=3D"mailto:boerner@t-online.de" =
target=3D"_blank"><span =
style=3D'color:#2980B9'>boerner@t-online.de</span></a>&gt; =
wrote:<o:p></o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:30.0pt;margin-bottom:0cm;mar=
gin-left:33.75pt;margin-bottom:.0001pt'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto Sans"'>Hey all,<br><br>I've =
recently set up my private VPN with Wireguard. I am running my local =
server behind a DSL router with a variable public IP address, accessible =
via dyndns and NAT, and several mobile clients (Android, Notebooks). =
<br>Everything is working fine so far, except of one issue that I would =
like discuss here: <br>Roaming doesn't work reliably when a device =
leaves or re-enters the home LAN, nor when the public IP address is =
changed by my ISP. The reason seems clear to me: In these cases both =
peers change their IP address simultaneously whereas the Wireguard =
protocol relies on only one address changing at a time.<br><br>My =
approach would be to shut down Wireguard on the clients as long as they =
are connected to their home network locally and to bring up the tunnel =
only when they leave the home network. Besides the roaming issue =
it&nbsp; would be desirable to use the local connection when it is =
available rather than to take the detour over the internet. And it&nbsp; =
should be done automatically so users need not remember to switch on/off =
VPN all the time.<br>My idea was to use Tasker to perform something like =
wg-quick up|down tun1 accordingly, but the Wireguard command line tools =
wg and wg-quick don't seem to be available (anymore). In older forum =
posts I've seen that you can install them from the app settings, but in =
my version (v0.0.20190708) this option is not available.<br><br>Does =
anybody know about another solution? Or, as a question to the =
developers, would it be a big deal to bring back the command line =
feature?<br><br>Thanks, =
Tom<br><br><br><br><br>_______________________________________________<br=
>WireGuard mailing list<br><a href=3D"mailto:WireGuard@lists.zx2c4.com" =
target=3D"_blank"><span =
style=3D'color:#2980B9'>WireGuard@lists.zx2c4.com</span></a><br><a =
href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" =
target=3D"_blank"><span =
style=3D'color:#2980B9'>https://lists.zx2c4.com/mailman/listinfo/wireguar=
d</span></a><o:p></o:p></span></p><p =
style=3D'mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:12.0pt;mar=
gin-left:0cm'><span lang=3DDE =
style=3D'font-size:10.0pt;font-family:"Noto =
Sans"'><o:p>&nbsp;</o:p></span></p></div></blockquote></div></div></body>=
</html>
------=_NextPart_000_0034_01D54C6A.351B3EC0--


--===============4174938241148102383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4174938241148102383==--

