Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbea9be9
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 10:35:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62794f6f
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 10:35:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88e0c5b2
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 10:35:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 62807d19
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 10:35:22 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id s4so946926ote.4
 for <wireguard@lists.zx2c4.com>; Sat, 11 Nov 2017 02:39:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <QiBM8URr-HKCMq4BcIPXG7YFxKwmqj7pJE8-O3T6z8f3q5ZNr2rzpHiKsw42PX8t_i1z5z1HuTKn7PibpxaPk6rccBsi871tkyedEU-Y0Iw=@protonmail.com>
References: <QiBM8URr-HKCMq4BcIPXG7YFxKwmqj7pJE8-O3T6z8f3q5ZNr2rzpHiKsw42PX8t_i1z5z1HuTKn7PibpxaPk6rccBsi871tkyedEU-Y0Iw=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Nov 2017 19:39:03 +0900
Message-ID: <CAHmME9pGL+_OWYNEDnxTCO-1qY-Sa9oQfsj2yt_vXHNOA_uA7w@mail.gmail.com>
Subject: Re: Multilink/handover: proposal
To: Tatsuyuki Ishi <ishitatsuyuki@protonmail.com>
Content-Type: multipart/alternative; boundary="001a113cfc126cf2c6055db2a5cd"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113cfc126cf2c6055db2a5cd
Content-Type: text/plain; charset="UTF-8"

I'm pretty sure WireGuard is the wrong place to import the massive quantity
of research on asynchronous packet scheduling that's gone into creating
MPTCP. Instead, just use MPTCP. It works super well. You can even do it
over several WireGuard interfaces, need be.


On Nov 11, 2017 19:34, "Tatsuyuki Ishi" <ishitatsuyuki@protonmail.com>
wrote:

I have seen a thread regarding multilink this month, and I'm also
interested in it.

I'm not exactly sure if this is a thing to implement in WireGuard layer
(MPTCP mentioned in previous thread is a good competitor), but I have some
ideas for its design.

Extending the "roaming" design, we can choose to not directly switch to the
new peer but allow it to split the traffic. We start round robin, and in
each time frame, we check how many packets have we received from each path,
and adjust the ratio of sending. This way a disconnect should gracefully
propagate.

How does this sound? Comments welcome.

*NOTICE: I have mail delivery disabled. Please use "Reply All" so it's also
directly sent to me.*

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--001a113cfc126cf2c6055db2a5cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature">I&#39;m pret=
ty sure WireGuard is the wrong place to import the massive quantity of rese=
arch on asynchronous packet scheduling that&#39;s gone into creating MPTCP.=
 Instead, just use MPTCP. It works super well. You can even do it over seve=
ral WireGuard interfaces, need be.</div><div data-smartmail=3D"gmail_signat=
ure" dir=3D"auto"><br></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Nov 11, 2017 19:34, &quot;Tatsuyuki Ishi&quot; &lt;<a href=3D=
"mailto:ishitatsuyuki@protonmail.com">ishitatsuyuki@protonmail.com</a>&gt; =
wrote:<br type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I have seen a =
thread regarding multilink this month, and I&#39;m also interested in it.<b=
r></div><div><br></div><div>I&#39;m not exactly sure if this is a thing to =
implement in WireGuard layer (MPTCP mentioned in previous thread is a good =
competitor), but I have some ideas for its design.<br></div><div><br></div>=
<div>Extending the &quot;roaming&quot; design, we can choose to not directl=
y switch to the new peer but allow it to split the traffic. We start round =
robin, and in each time frame, we check how many packets have we received f=
rom each path, and adjust the ratio of sending. This way a disconnect shoul=
d gracefully propagate.<br></div><div><br></div><div>How does this sound? C=
omments welcome.<br></div><div><br></div><div><b>NOTICE: I have mail delive=
ry disabled. Please use &quot;Reply All&quot; so it&#39;s also directly sen=
t to me.</b><br></div><br>______________________________<wbr>______________=
___<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
<br></blockquote></div><br></div></div></div>

--001a113cfc126cf2c6055db2a5cd--
