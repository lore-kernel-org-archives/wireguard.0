Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0F0C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:45:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90887218AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90887218AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrowclift.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 443cc1df;
	Wed, 20 Mar 2019 22:45:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1aeeadab
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Mar 2019 13:34:05 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0007.hostedemail.com
 [216.40.44.7])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3609da5
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Mar 2019 13:34:05 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 79603815ED08
 for <wireguard@lists.zx2c4.com>; Mon, 18 Mar 2019 13:34:07 +0000 (UTC)
X-Session-Marker: 6D61726340626172726F77636C6966742E6D65
X-HE-Tag: tin01_6b9955d36a5a
X-Filterd-Recvd-Size: 6586
Received: from mail.hover.com (imap-ext [216.40.42.5])
 (Authenticated sender: webmail@marc@barrowclift.me)
 by omf10.hostedemail.com (Postfix) with ESMTPA
 for <wireguard@lists.zx2c4.com>; Mon, 18 Mar 2019 13:34:06 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 18 Mar 2019 06:34:05 -0700
From: marc@barrowclift.me
To: wireguard@lists.zx2c4.com
Subject: Traffic routing with pf
Message-ID: <66225ec4096954d5aca77df9a14af635@barrowclift.me>
X-Sender: marc@barrowclift.me
User-Agent: Roundcube Webmail/1.2.7
X-Originating-IP: [198.178.12.46]
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:45:13 +0100
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
Content-Type: multipart/mixed; boundary="===============2468428698845664418=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2468428698845664418==
Content-Type: multipart/alternative;
 boundary="=_626933245a6fc8071adf9b6fe71b8178"

--=_626933245a6fc8071adf9b6fe71b8178
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

Hi everyone,

I've set up a Wireguard server on a Mac Mini and can remotely connect
with no problems. However, all attempts to access anything else on my
server's LAN while connected have been unsuccessful. 

Most guides and documentation I've found to get this routing working are
written with the assumption Linux's `iptables` are available [1], but on
macOS the only available option appears to be `pf`. My attempts thus far
to get those `iptables` rules ported correctly to `pf` have failed. 

Have any of you gotten LAN access working correctly on macOS with `pf`?
If so, I'd greatly appreciate your guidance! 

----- 

My server config 

``` 

[Interface] 
Address = 10.0.0.3 
PrivateKey = ${SERVER_PRIVATE_KEY} 
ListenPort = 51820 

[Peer] 
PublicKey = ${CLIENT_PUBLIC_KEY} 
AllowedIPs = 10.0.0.200/32 
``` 

----- 

My peer config 

``` 
[Interface] 

Address = 10.0.0.200 
PrivateKey = ${CLIENT_PRIVATE_KEY} 
ListenPort = 51820 

[Peer] 
PublicKey = ${SERVER_PUBLIC_KEY} 
Endpoint = ${SERVER_PUBLIC_IP}:51820 
AllowedIPs = 0.0.0.0/0, ::/0 
PersistentKeepalive = 25 
``` 

----- 

The script to load my `pf` rules (run before starting Wireguard on the
server), using this article as a guide:
https://blog.netnerds.net/2016/11/share-vpn-with-os-x-sierra-internet-sharing/


``` 
sysctl -w net.inet.ip.forwarding=1

# Disable pfctl
pfctl -d
sleep 1

# Flushe all pfctl rules
pfctl -F all
sleep 1

# Starts pfctl and loads the rules from the nat-rules file
pfctl -f /private/etc/nat-rules -e 
``` 

----- 

The rules themselves, saved at `/private/etc/nat-rules`. 
I've confirmed that `en0` is my server's ethernet interface, and `utun1`
is the interface WireGuard uses (printed on WireGuard startup) 

``` 
nat on en0 from 10.0.0.0/24 to any -> (en0)
nat on utun1 from 10.0.0.0/24 to any -> (utun1) 
```  

Cheers, 

--Marc 

(Apologies for the duplicate message, I didn't receive any reject/accept
response, and the confirmation string for canceling the message expired.
Giving this another try...) 
  

Links:
------
[1] https://www.stavros.io/posts/how-to-configure-wireguard/
--=_626933245a6fc8071adf9b6fe71b8178
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p><span>Hi everyone,</span></p>
<div>&nbsp;</div>
<div>I've set up a Wireguard server on a Mac Mini and can remotely connect =
with no problems. However, all attempts to access anything else on my serve=
r's LAN while connected have been unsuccessful.</div>
<div>&nbsp;</div>
<div>Most guides and documentation I've found to get this routing working a=
re&nbsp;<a href=3D"https://www.stavros.io/posts/how-to-configure-wireguard/=
" target=3D"_blank" rel=3D"noreferrer">written with the assumption Linux's =
`iptables` are available</a>,&nbsp;but on macOS the only available option a=
ppears to be `pf`. My attempts thus far to get those `iptables` rules porte=
d correctly to `pf` have failed.</div>
<div>&nbsp;</div>
<div>Have any of you gotten LAN access working correctly on macOS with `pf`=
? If so, I'd greatly appreciate your guidance!</div>
<div>&nbsp;</div>
<div>-----</div>
<div>&nbsp;</div>
<div>My server config</div>
<div>&nbsp;</div>
<div>```</div>
<div>
<div>[Interface]</div>
<div>Address =3D 10.0.0.3</div>
<div>PrivateKey =3D ${SERVER_PRIVATE_KEY}</div>
<div>ListenPort =3D 51820</div>
<div>&nbsp;</div>
<div>[Peer]</div>
<div>PublicKey =3D ${CLIENT_PUBLIC_KEY}</div>
<div>AllowedIPs =3D 10.0.0.200/32</div>
</div>
<div>```</div>
<div>&nbsp;</div>
<div>-----</div>
<div>&nbsp;</div>
<div>My peer config</div>
<div>&nbsp;</div>
<div>```</div>
<div>[Interface]</div>
<div>
<div>Address =3D 10.0.0.200</div>
<div>PrivateKey =3D ${CLIENT_PRIVATE_KEY}</div>
<div>ListenPort =3D 51820</div>
<div>&nbsp;</div>
<div>[Peer]</div>
<div>PublicKey =3D ${SERVER_PUBLIC_KEY}</div>
<div>Endpoint =3D ${SERVER_PUBLIC_IP}:51820</div>
<div>AllowedIPs =3D 0.0.0.0/0, ::/0</div>
<div>PersistentKeepalive =3D 25</div>
</div>
<div>```</div>
<div>&nbsp;</div>
<div>-----</div>
<div>&nbsp;</div>
<div>The script to load my `pf` rules (run before starting Wireguard on the=
 server), using this article as a guide: <a href=3D"https://blog.netnerds=
=2Enet/2016/11/share-vpn-with-os-x-sierra-internet-sharing/" target=3D"_bla=
nk" rel=3D"noreferrer">https://blog.netnerds.net/2016/11/share-vpn-with-os-=
x-sierra-internet-sharing/</a></div>
<div>&nbsp;</div>
<div>```</div>
<div>sysctl -w net.inet.ip.forwarding=3D1<br /><br /># Disable pfctl<br />p=
fctl -d<br />sleep 1<br /><br /># Flushe all pfctl rules<br />pfctl -F all<=
br />sleep 1<br /><br /># Starts pfctl and loads the rules from the nat-rul=
es file<br />pfctl -f /private/etc/nat-rules -e</div>
<div>```</div>
<div>&nbsp;</div>
<div>-----</div>
<div>&nbsp;</div>
<div>The rules themselves, saved at `/private/etc/nat-rules`.</div>
<div>I've confirmed that `en0` is my server's ethernet interface, and `utun=
1` is the interface WireGuard uses (printed on WireGuard startup)</div>
<div>&nbsp;</div>
<div>```</div>
<div>nat on en0 from 10.0.0.0/24 to any -&gt; (en0)<br />nat on utun1 from =
10.0.0.0/24 to any -&gt; (utun1)</div>
<div>```&nbsp;</div>
<div>&nbsp;</div>
<div>Cheers,</div>
<div>&nbsp;</div>
<div>&mdash;Marc</div>
<div>&nbsp;</div>
<div>(Apologies for the duplicate message, I didn't receive any reject/acce=
pt response, and the confirmation string for canceling the message expired=
=2E Giving this another try...)</div>
<div>&nbsp;</div>
</body></html>

--=_626933245a6fc8071adf9b6fe71b8178--

--===============2468428698845664418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2468428698845664418==--
