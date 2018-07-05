Return-Path: denis@dkisselev.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49836625
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 19:01:01 +0000 (UTC)
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-oln040092006101.outbound.protection.outlook.com [40.92.6.101])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce949e51
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 19:01:01 +0000 (UTC)
From: Denis Kisselev <denis@dkisselev.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Eric Kuck <eric@bluelinelabs.com>
Subject: Re: "Exclude Private IPs" in Android App
Date: Thu, 5 Jul 2018 19:07:43 +0000
Message-ID: <CY4PR14MB11417B558CCB088D0D2BD605A2400@CY4PR14MB1141.namprd14.prod.outlook.com>
References: <CAHmME9pZZeQautpRT99R-gC9sxjsodgJK_1SLHd0mwU3hCsf_A@mail.gmail.com>
In-Reply-To: <CAHmME9pZZeQautpRT99R-gC9sxjsodgJK_1SLHd0mwU3hCsf_A@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="_000_CY4PR14MB11417B558CCB088D0D2BD605A2400CY4PR14MB1141namp_"
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--_000_CY4PR14MB11417B558CCB088D0D2BD605A2400CY4PR14MB1141namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Jason, that sounds like an amazing feature, but would it be possible with t=
he current Go/Android VPN implementation?

In my (limited) experience, entering 2 or more comma-separated IP ranges do=
es not work.
I get "Error bringing up tunnel: Bad Address" if I try to set Allowed IP's =
to "10.5.0.1/24,192.168.1.0/13" but it works with "0.0.0.0/0".

The Android VPN subsystem only seems to allow a single subnet in that param=
eter.

I'm running Wireguard for Android v0.0.20180625.
________________________________
From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of Jason A. D=
onenfeld <Jason@zx2c4.com>
Sent: Thursday, July 5, 2018 10:46 AM
To: Eric Kuck
Cc: WireGuard mailing list
Subject: "Exclude Private IPs" in Android App

Hey Eric,

While you're iterating on the "Excluded Applications" feature, what
would you think of also taking a stab at the "Exclude Private IPs"
feature? It's kind of in the same ballpark and works over the same
code you're currently playing with.

First some background: Some people don't want packets intended for
their local network to go through a tunnel. On desktop linux's
wg-quick(8), this is the default with some very clever use of
ip-rule(8)'s suppress_prefixlength parameter. It works perfectly 100%
of the time, without any need for heuristics. I've written to the
folks I know working on Android's networking stack to allow for the
same kind of clever thing, but if that happens, it'd of course be
quite a ways off. So in the meantime, rather than introducing a switch
called "exclude local networks", which would have all sorts of races
with detecting local networks and making decisions about network types
and such, plus the need to toggle VpnService in a racy way, etc, I
have a much cleaner idea: "Exclude Private IPs".

"Exclude Private IPs" works in the most dumb and straightforward way
possible, that is guaranteed to not fail. We add a checkbox underneath
"AllowedIPs". The checkbox is visible if "0.0.0.0/0" or ${MAGICRANGE}
is included in the AllowedIPs; otherwise it is hidden. When the
checkbox is checked, it replaces 0.0.0.0/0 with ${MAGICRANGE}. When
the checkbox is unchecked, it replaces (after sorting) ${MAGICRANGE}
with "0.0.0.0/0". ${MAGICRANGE} is defined to be  0.0.0.0/0 modulo
RFC1918:
"0.0.0.0/5,8.0.0.0/7,11.0.0.0/8,12.0.0.0/6,16.0.0.0/4,32.0.0.0/3,64.0.0.0/2=
,128.0.0.0/3,160.0.0.0/5,168.0.0.0/6,172.0.0.0/12,172.32.0.0/11,172.64.0.0/=
10,172.128.0.0/9,173.0.0.0/8,174.0.0.0/7,176.0.0.0/4,192.0.0.0/9,192.128.0.=
0/11,192.160.0.0/13,192.169.0.0/16,192.170.0.0/15,192.172.0.0/14,192.176.0.=
0/12,192.192.0.0/10,193.0.0.0/8,194.0.0.0/7,196.0.0.0/6,200.0.0.0/5,208.0.0=
.0/4"

I think this approach will be simple and consistent, and implementing
this as a static modification of AllowedIPs rather than runtime set
subtraction makes it more obvious what's going on.

What do you think of that idea?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.z=
x2c4.com%2Fmailman%2Flistinfo%2Fwireguard&data=3D02%7C01%7C%7Cf70032b86fee4=
6134b9c08d5e29f5941%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C6366640963=
73456109&sdata=3DOuSYdUZQEB1%2BZ4Wf9%2FEv%2BeHLgTFWIjwMCk1xXJOzOWg%3D&reser=
ved=3D0

--_000_CY4PR14MB11417B558CCB088D0D2BD605A2400CY4PR14MB1141namp_
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
<div style=3D"color: rgb(0, 0, 0); font-family: Calibri,Helvetica,sans-seri=
f; font-size: 12pt;">
Jason, that sounds like an amazing feature, but would it be possible with t=
he current Go/Android VPN implementation?</div>
<div style=3D"color: rgb(0, 0, 0); font-family: Calibri,Helvetica,sans-seri=
f; font-size: 12pt;">
<br>
</div>
<div style=3D"color: rgb(0, 0, 0); font-family: Calibri,Helvetica,sans-seri=
f; font-size: 12pt;">
In my (limited) experience, entering 2 or more comma-separated IP ranges do=
es not work.</div>
<div style=3D"color: rgb(0, 0, 0); font-family: Calibri,Helvetica,sans-seri=
f; font-size: 12pt;">
I get &quot;Error bringing up tunnel: Bad Address&quot; if I try to set All=
owed IP's to &quot;10.5.0.1/24,192.168.1.0/13&quot; but it works with &quot=
;0.0.0.0/0&quot;.</div>
<div style=3D"color: rgb(0, 0, 0); font-family: Calibri,Helvetica,sans-seri=
f; font-size: 12pt;">
<br>
</div>
<div style=3D"color: rgb(0, 0, 0); font-family: Calibri,Helvetica,sans-seri=
f; font-size: 12pt;">
The Android VPN subsystem only seems to allow a single subnet in that param=
eter.</div>
<div style=3D"color: rgb(0, 0, 0); font-family: Calibri,Helvetica,sans-seri=
f; font-size: 12pt;">
<br>
</div>
<div style=3D"color: rgb(0, 0, 0); font-family: Calibri,Helvetica,sans-seri=
f; font-size: 12pt;">
I'm running Wireguard for Android v0.0.20180625.</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> WireGuard &lt;wiregua=
rd-bounces@lists.zx2c4.com&gt; on behalf of Jason A. Donenfeld &lt;Jason@zx=
2c4.com&gt;<br>
<b>Sent:</b> Thursday, July 5, 2018 10:46 AM<br>
<b>To:</b> Eric Kuck<br>
<b>Cc:</b> WireGuard mailing list<br>
<b>Subject:</b> &quot;Exclude Private IPs&quot; in Android App</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hey Eric,<br>
<br>
While you're iterating on the &quot;Excluded Applications&quot; feature, wh=
at<br>
would you think of also taking a stab at the &quot;Exclude Private IPs&quot=
;<br>
feature? It's kind of in the same ballpark and works over the same<br>
code you're currently playing with.<br>
<br>
First some background: Some people don't want packets intended for<br>
their local network to go through a tunnel. On desktop linux's<br>
wg-quick(8), this is the default with some very clever use of<br>
ip-rule(8)'s suppress_prefixlength parameter. It works perfectly 100%<br>
of the time, without any need for heuristics. I've written to the<br>
folks I know working on Android's networking stack to allow for the<br>
same kind of clever thing, but if that happens, it'd of course be<br>
quite a ways off. So in the meantime, rather than introducing a switch<br>
called &quot;exclude local networks&quot;, which would have all sorts of ra=
ces<br>
with detecting local networks and making decisions about network types<br>
and such, plus the need to toggle VpnService in a racy way, etc, I<br>
have a much cleaner idea: &quot;Exclude Private IPs&quot;.<br>
<br>
&quot;Exclude Private IPs&quot; works in the most dumb and straightforward =
way<br>
possible, that is guaranteed to not fail. We add a checkbox underneath<br>
&quot;AllowedIPs&quot;. The checkbox is visible if &quot;0.0.0.0/0&quot; or=
 ${MAGICRANGE}<br>
is included in the AllowedIPs; otherwise it is hidden. When the<br>
checkbox is checked, it replaces 0.0.0.0/0 with ${MAGICRANGE}. When<br>
the checkbox is unchecked, it replaces (after sorting) ${MAGICRANGE}<br>
with &quot;0.0.0.0/0&quot;. ${MAGICRANGE} is defined to be&nbsp; 0.0.0.0/0 =
modulo<br>
RFC1918:<br>
&quot;0.0.0.0/5,8.0.0.0/7,11.0.0.0/8,12.0.0.0/6,16.0.0.0/4,32.0.0.0/3,64.0.=
0.0/2,128.0.0.0/3,160.0.0.0/5,168.0.0.0/6,172.0.0.0/12,172.32.0.0/11,172.64=
.0.0/10,172.128.0.0/9,173.0.0.0/8,174.0.0.0/7,176.0.0.0/4,192.0.0.0/9,192.1=
28.0.0/11,192.160.0.0/13,192.169.0.0/16,192.170.0.0/15,192.172.0.0/14,192.1=
76.0.0/12,192.192.0.0/10,193.0.0.0/8,194.0.0.0/7,196.0.0.0/6,200.0.0.0/5,20=
8.0.0.0/4&quot;<br>
<br>
I think this approach will be simple and consistent, and implementing<br>
this as a static modification of AllowedIPs rather than runtime set<br>
subtraction makes it more obvious what's going on.<br>
<br>
What do you think of that idea?<br>
<br>
Jason<br>
_______________________________________________<br>
WireGuard mailing list<br>
WireGuard@lists.zx2c4.com<br>
<a href=3D"https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.zx2c4.com%2Fmailman%2Flistinfo%2Fwireguard&amp;data=3D02%7C01%7C%=
7Cf70032b86fee46134b9c08d5e29f5941%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7=
C0%7C636664096373456109&amp;sdata=3DOuSYdUZQEB1%2BZ4Wf9%2FEv%2BeHLgTFWIjwMC=
k1xXJOzOWg%3D&amp;reserved=3D0">https://nam04.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Flists.zx2c4.com%2Fmailman%2Flistinfo%2Fwireguard&a=
mp;data=3D02%7C01%7C%7Cf70032b86fee46134b9c08d5e29f5941%7C84df9e7fe9f640afb=
435aaaaaaaaaaaa%7C1%7C0%7C636664096373456109&amp;sdata=3DOuSYdUZQEB1%2BZ4Wf=
9%2FEv%2BeHLgTFWIjwMCk1xXJOzOWg%3D&amp;reserved=3D0</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_CY4PR14MB11417B558CCB088D0D2BD605A2400CY4PR14MB1141namp_--
