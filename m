Return-Path: damian.kaczkowski@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e583705b
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 09:48:04 +0000 (UTC)
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
 [209.85.220.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6df67289
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 09:48:04 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id u68so27830046qkd.0
 for <wireguard@lists.zx2c4.com>; Tue, 02 May 2017 02:57:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pNgSjXeKnzM23Bb3Q=zZJKMDtq-3xevMzdtP7XdoMjkQ@mail.gmail.com>
References: <CAGzienFDihyN8fDbKj4KQ-1cwz53_u7Vz3G37P08+wS=hbF0LA@mail.gmail.com>
 <CAHmME9pNgSjXeKnzM23Bb3Q=zZJKMDtq-3xevMzdtP7XdoMjkQ@mail.gmail.com>
From: Damian Kaczkowski <damian.kaczkowski@gmail.com>
Date: Tue, 2 May 2017 11:56:54 +0200
Message-ID: <CAGzienHd=L8tYn41WdjGSk4hvCWiUW8LUi4C8jf8piBhLA=dng@mail.gmail.com>
Subject: Re: Ability to use one udp port for multiple wg interfaces
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=94eb2c057516aaa5ee054e87915e
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c057516aaa5ee054e87915e
Content-Type: text/plain; charset=UTF-8

Hello Janson.

On 2 May 2017 at 10:55, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> 3. You may have multiple peers on a single wireguard interface. This
> is the configuration that you probably should be using. "It is not
> very friendly to open additional udp ports in multiple peer scenario
> where firewall ACLs are desirable" This is 100% incorrect. With
> multiple peers on an interface and a sufficiently clamped allowed-ips
> entry for each, you'll have perfect firewall ACLs.
>

3. Well if one uses firewall to control flows between zones in environment
with mix protocols (eg. gre, ipsec, openvpn and so on) then using second
tool just to control only wireguard ACLs is not very convenient way from
administrative point of view. Also in case where peer is roaming and
changing its source IP (eg. road warrior) then maintaining wireguard ACLs
will be a huge PITA, if not impossible at large scale.


4. Does wireguard have some means so that iptables can easily
differentiate tunnels (peers) and put them in appropriate 'zone'? like eg.
iptables -m policy --help
iptables -m ah --help
iptables -m esp --help

Or something similar?

Regards.

--94eb2c057516aaa5ee054e87915e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Hell=
o Janson.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">On 2 May 2017 at 10:55, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">3. You may h=
ave multiple peers on a single wireguard interface. This<br>
is the configuration that you probably should be using. &quot;It is not<br>
<span class=3D"m_-3176269631431994378gmail-">very friendly to open addition=
al udp ports in multiple peer scenario<br>
</span>where firewall ACLs are desirable&quot; This is 100% incorrect. With=
<br>
multiple peers on an interface and a sufficiently clamped allowed-ips<br>
entry for each, you&#39;ll have perfect firewall ACLs.<br></blockquote><div=
><br></div><div>3. Well if one uses firewall to control flows between zones=
 in environment with mix protocols (eg. gre, ipsec, openvpn and so on) then=
 using second tool just to control only wireguard ACLs is not very convenie=
nt way from administrative point of view. Also in case where peer is roamin=
g and changing its source IP (eg. road warrior) then maintaining wireguard =
ACLs will be a huge PITA, if not impossible at large scale.</div><div><br><=
/div><div><br></div><div>4. Does wireguard have some means so that iptables=
 can easily differentiate=C2=A0tunnels (peers) and put them in appropriate=
=C2=A0&#39;zone&#39;? like eg.</div><div><div>iptables -m policy --help<br>=
</div><div>iptables -m ah --help</div><div>iptables -m esp --help</div></di=
v><div><br></div><div>Or something similar?</div><div><br></div><div>Regard=
s.</div><div><br></div></div></div></div>

--94eb2c057516aaa5ee054e87915e--
