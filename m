Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83f7525e
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jan 2018 23:36:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30dc6f00
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jan 2018 23:36:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b84af98
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jan 2018 23:27:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0b03d6ad
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jan 2018 23:27:08 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id q39so2665101otb.8
 for <wireguard@lists.zx2c4.com>; Thu, 04 Jan 2018 15:37:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAL-k0sSF7y63y8wYc0dn2_8j2Sa8_t-U5-5ZZHcRVxh9pRK47w@mail.gmail.com>
References: <CAL-k0sRpa8Z2sW=z3bCW5pqPyJMCc5i3BMcXHRmZxNoRijTOXQ@mail.gmail.com>
 <CAL-k0sRFgPetkH3n_p4H5cTSA-58bHGJ=mV+rs7tC4kWeqgmiA@mail.gmail.com>
 <CAL-k0sQk=kbFep0xZ-9_xzUqvgGGqa3Y6=nEe=1kWq98Ek9f6w@mail.gmail.com>
 <CAL-k0sST3nZnOPAFYtthv4CFJjpoFDvzpxYDwvP1vt_t4bO+kQ@mail.gmail.com>
 <CAL-k0sTi-g0w4cHw+9K5hqYooupPJVf_bb_tQ3jR-hW=tqmfKA@mail.gmail.com>
 <CAL-k0sShn5t8K4TCgnWgKp74Lf6ASgrA_SDdAEjdL9Vc-J3e4Q@mail.gmail.com>
 <CAL-k0sTux_e2CrQG0Pm2cdk4VxdxW9m+BALQ=Ccw34KH-6D25g@mail.gmail.com>
 <CAL-k0sRUR1DKJK4df1YHvs+3LSJ+qQVUrBgC5-tg2eSjN_wrtw@mail.gmail.com>
 <CAL-k0sTtBWdgV1LfiAF9jjU6T47sT=pYyJgJQej4UmFrA0_27Q@mail.gmail.com>
 <CAL-k0sSF7y63y8wYc0dn2_8j2Sa8_t-U5-5ZZHcRVxh9pRK47w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 5 Jan 2018 00:37:44 +0100
Message-ID: <CAHmME9qe6=Gf_TzJdVXVULFwxTF9Xh_oVn43GoKDsmNE2vzt0A@mail.gmail.com>
Subject: Re: Question about Wireguard server
To: Stoyan Mihov <t0ny0@atlantabg.com>
Content-Type: multipart/alternative; boundary="94eb2c045e269b19800561fbd12e"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c045e269b19800561fbd12e
Content-Type: text/plain; charset="UTF-8"

Hi Stoyan,

Ensure that the time is set correctly on your lede box after reboots. If
the time rolls backwards, handshakes will be rejected rightfully by the
server.

Jason

--
Sent from my telephone.

On Jan 4, 2018 22:51, "Stoyan Mihov" <t0ny0@atlantabg.com> wrote:

> Greetings dear wireguards!
>
> First of all - happy 2018!
>
> I have a quick question:
>
> I am running wireguard on ubuntu 16.04 server and LEDE on router. When I
> have everything set up on the router - I decided to upgrade to a newer
> version of LEDE. So I did, and then my router would not connect to the
> server anymore (although settings have been saved) until I issue a command
> on the server:
> wg-quick down wg0 && wg-quick up wg0
>
> Then the router automatically connects without an issue. Before that - the
> server would not accept a connection from the router, there are no dmesg
> errors, no errors whatsoever on both sides. It simply doesn't show a
> handshake on the server, and the router sends packets, but receives 0
> packets.
>
> Is there an easier way to fix that issue, so a restart on the server would
> not be necessary every time an upgrade on the router is made? Or am I
> missing something obvious (quite possible lol) that resolves that issue?
>
> Thank you so much!
> Tony.
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>

--94eb2c045e269b19800561fbd12e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Stoyan,<div dir=3D"auto"><br></div><div dir=3D"auto">E=
nsure that the time is set correctly on your lede box after reboots. If the=
 time rolls backwards, handshakes will be rejected rightfully by the server=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Jason<br><br><div data=
-smartmail=3D"gmail_signature" dir=3D"auto">--<br>Sent from my telephone.<b=
r></div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Jan 4, 2018 22:51, &quot;Stoyan Mihov&quot; &lt;<a href=3D"mailto:t0n=
y0@atlantabg.com">t0ny0@atlantabg.com</a>&gt; wrote:<br type=3D"attribution=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Greetings dear wireguard=
s!<div dir=3D"auto"><br></div><div dir=3D"auto">First of all - happy 2018!<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">I have a quick question:=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I am running wireguard =
on ubuntu 16.04 server and LEDE on router. When I have everything set up on=
 the router - I decided to upgrade to a newer version of LEDE. So I did, an=
d then my router would not connect to the server anymore (although settings=
 have been saved) until I issue a command on the server:</div><div dir=3D"a=
uto">wg-quick down wg0 &amp;&amp; wg-quick up wg0</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Then the router automatically connects without an=
 issue. Before that - the server would not accept a connection from the rou=
ter, there are no dmesg errors, no errors whatsoever on both sides. It simp=
ly doesn&#39;t show a handshake on the server, and the router sends packets=
, but receives 0 packets.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Is there an easier way to fix that issue, so a restart on the server woul=
d not be necessary every time an upgrade on the router is made? Or am I mis=
sing something obvious (quite possible lol) that resolves that issue?</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Thank you so much!</div><div =
dir=3D"auto">Tony.</div></div>
<br>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
<br></blockquote></div></div>

--94eb2c045e269b19800561fbd12e--
