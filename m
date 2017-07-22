Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca6a3bce
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 23:44:07 +0000 (UTC)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ad2fbd3
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 23:44:07 +0000 (UTC)
Message-Id: <1500681823.1017135.1048796128.794D7A24@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: Sahil Gupta <sg5414@rit.edu>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_----------=_150068182310171350"
Date: Sat, 22 Jul 2017 12:03:43 +1200
In-Reply-To: <CAA8CD9uBLq_2NsVVDYw8MkJa19a86YabtWrvmx1qsNxzhx+scw@mail.gmail.com>
Subject: Re: Not able to ping the host as per demo of wireguard.
References: <CAA8CD9vTW5XJVDjhE=5t6e8midm6LivLYqLHBrT98riTYnP3kQ@mail.gmail.com>
 <CAA8CD9s67yT1esUYwyo5rmsZAKahoXn86AAX8faccgvTcA8_xw@mail.gmail.com>
 <CAHmME9pQR3hmHJjV-wUah2wqYGKqSw+HipuQH6F92hVgD4FBrg@mail.gmail.com>
 <1500680038.1009000.1048775720.4A6974DA@webmail.messagingengine.com>
 <CAA8CD9uBLq_2NsVVDYw8MkJa19a86YabtWrvmx1qsNxzhx+scw@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_150068182310171350
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

Yep you can make them permanent.  Create your config in /etc/wireguard/wg0.conf.  Then run 'systemctl enable wg-quick@wg0'  (assuming you're running systemd).
wg-quick takes care of interface creation, interface and endpoint IP addressing, routing, and peer keys; so you just create that file and then use 'wg-quick up wg0'.  :)
I wrote a few blog posts on setting up wg to act as a bridge into a remote network; you can probably use a lot of the info from there to get you started:   https://www.ericlight.com/wireguard-part-one-installation
E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es



On Sat, 22 Jul 2017, at 11:54, Sahil Gupta wrote:
> Sorry, my bad.
> I copy paste configuration of Peer A in both Peer A and B in this email.> I will follow the advise of Jason.
> 
> I switched off both Laptops and now wg interface are gone.
> I need to create them again.
> Can we make these interfaces permanent so they will not go upon switching off the laptop?> 
> I will mail again if problem still persists.
> Thanks
> Sahil Gupta


--_----------=_150068182310171350
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body><div>Yep you can make them permanent. &nbsp;Create your config in /etc/wireguard/wg0.conf. &nbsp;Then run 'systemctl enable wg-quick@wg0' &nbsp;(assuming you're running systemd).<br></div>
<div><br></div>
<div>wg-quick takes care of interface creation, interface and endpoint IP addressing, routing, and peer keys; so you just create that file and then use 'wg-quick up wg0'. &nbsp;:)</div>
<div><br></div>
<div>I wrote a few blog posts on setting up wg to act as a bridge into a remote network; you can probably use a lot of the info from there to get you started: &nbsp;&nbsp;<a href="https://www.ericlight.com/wireguard-part-one-installation">https://www.ericlight.com/wireguard-part-one-installation</a><br></div>
<div><br></div>
<div>E</div>
<div><br></div>
<div id="sig66226376"><div class="signature">--------------------------------------------<br></div>
<div class="signature">Q: Why is this email five sentences or less?<br></div>
<div class="signature">A: http://five.sentenc.es<br></div>
<div class="signature"><br></div>
</div>
<div><br></div>
<div><br></div>
<div>On Sat, 22 Jul 2017, at 11:54, Sahil Gupta wrote:<br></div>
<blockquote type="cite"><div dir="ltr"><div>Sorry, my bad.<br></div>
<div>I copy&nbsp;paste configuration of Peer A in both Peer A and B in this email.<br></div>
<div>I will follow the advise of Jason.<br></div>
<div><br></div>
<div><div>I switched off both Laptops and now wg interface are gone.<br></div>
<div>I need to create them again.<br></div>
<div>Can we make these interfaces permanent so they will not go upon switching off the laptop?<br></div>
</div>
<div><br></div>
<div><div>I will mail again if problem still persists.<br></div>
</div>
<div><div>Thanks<br></div>
<div>Sahil Gupta<br></div>
</div>
</div>
</blockquote><div><br></div>
</body>
</html>

--_----------=_150068182310171350--
