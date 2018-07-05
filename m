Return-Path: denis@dkisselev.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ef23bef
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 19:31:10 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092005084.outbound.protection.outlook.com [40.92.5.84])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7adabe5
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 19:31:10 +0000 (UTC)
From: Denis Kisselev <denis@dkisselev.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: "Exclude Private IPs" in Android App
Date: Thu, 5 Jul 2018 19:37:53 +0000
Message-ID: <CY4PR14MB11411822072C6493B6532569A2400@CY4PR14MB1141.namprd14.prod.outlook.com>
References: <CAHmME9pZZeQautpRT99R-gC9sxjsodgJK_1SLHd0mwU3hCsf_A@mail.gmail.com>
 <CY4PR14MB11417B558CCB088D0D2BD605A2400@CY4PR14MB1141.namprd14.prod.outlook.com>,
 <CAHmME9o1d5+=DnVOwGcTuZcRHYF-b27e4oUbnOThSuZ7WqzL5g@mail.gmail.com>
In-Reply-To: <CAHmME9o1d5+=DnVOwGcTuZcRHYF-b27e4oUbnOThSuZ7WqzL5g@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="_000_CY4PR14MB11411822072C6493B6532569A2400CY4PR14MB1141namp_"
MIME-Version: 1.0
Cc: Eric Kuck <eric@bluelinelabs.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--_000_CY4PR14MB11411822072C6493B6532569A2400CY4PR14MB1141namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That does work, thanks! Apologies for the derail.
________________________________
From: Jason A. Donenfeld <Jason@zx2c4.com>
Sent: Thursday, July 5, 2018 12:24 PM
To: denis@dkisselev.net
Cc: Eric Kuck; WireGuard mailing list
Subject: Re: "Exclude Private IPs" in Android App

Hi Denis,

> I get "Error bringing up tunnel: Bad Address" if I try to set Allowed IP'=
s to "10.5.0.1/24,192.168.1.0/13" but it works with "0.0.0.0/0".

User error. This fails because:

192.168.1.0 & (1 << (32 - 13)) !=3D 192.168.1.0
and
10.5.0.1 & (1 << (32 - 24) !=3D 10.5.0.1

Try instead using 192.168.0.0/13 and 10.5.0.0/24.

Jason

--_000_CY4PR14MB11411822072C6493B6532569A2400CY4PR14MB1141namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
That does work, thanks! Apologies for the derail.</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jason A. Donenfeld &l=
t;Jason@zx2c4.com&gt;<br>
<b>Sent:</b> Thursday, July 5, 2018 12:24 PM<br>
<b>To:</b> denis@dkisselev.net<br>
<b>Cc:</b> Eric Kuck; WireGuard mailing list<br>
<b>Subject:</b> Re: &quot;Exclude Private IPs&quot; in Android App</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Denis,<br>
<br>
&gt; I get &quot;Error bringing up tunnel: Bad Address&quot; if I try to se=
t Allowed IP's to &quot;10.5.0.1/24,192.168.1.0/13&quot; but it works with =
&quot;0.0.0.0/0&quot;.<br>
<br>
User error. This fails because:<br>
<br>
192.168.1.0 &amp; (1 &lt;&lt; (32 - 13)) !=3D 192.168.1.0<br>
and<br>
10.5.0.1 &amp; (1 &lt;&lt; (32 - 24) !=3D 10.5.0.1<br>
<br>
Try instead using 192.168.0.0/13 and 10.5.0.0/24.<br>
<br>
Jason<br>
</div>
</span></font></div>
</body>
</html>

--_000_CY4PR14MB11411822072C6493B6532569A2400CY4PR14MB1141namp_--
