Return-Path: <SRS0=rqdY=NZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8DDC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Sep 2021 04:12:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 211ED60F4B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Sep 2021 04:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 211ED60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e5a4924;
	Fri, 3 Sep 2021 04:09:37 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d68d2574
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Sep 2021 04:09:34 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id y6so7565938lje.2
 for <wireguard@lists.zx2c4.com>; Thu, 02 Sep 2021 21:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ItYfyyPLbWsB8NERCa8vKz6U9IWOEhilLKJDQaQY32w=;
 b=pfV6MAptuU83Q31zXgi34Xhnm5Z1QHKGBErj4j2tilvtpE6yJ6R8cZPxN1dciKwXl6
 xwLH+Dww1iKjLFLCrntmLTKdDDy1LWW7EFb05Df+77ph8KYUxD/juL/EwLg+rAMxiKRQ
 F0u0myKdudYCeRf9EyJgGYyu+sIPYvEu3CKuDsZ/O2dyL+LKC+EX024gzXJNBLYuI/6g
 aVykFz9wUhshmNIG8cGQKjYrhsgi6IYGbC9sR6EqUdo3CrtsB9HtRLg8NMcLTbQCaVZW
 2p9pjIYGi9l1T15eT/M8r8NnUQyFjMKfAoNN5wJpeRZWFLqTBj5L4rkAcHBZLAtLDHwc
 aHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ItYfyyPLbWsB8NERCa8vKz6U9IWOEhilLKJDQaQY32w=;
 b=ce2ndXvBVghKtA/pJLFaNZY7bZy3gfgVbApniTsDR2tcsrrYRSYpY/iY3hGx96qVCW
 ibCmP0Oq7RpIwTeVjhIHyH1KppN7tNcTqR7ekUu6GFvj+K55WUnw0HcSE8B87ZAtf1o5
 fYJUKm1mWyu/ba4CE6s5fqJ2SBHlhkNQzvQlKLmOWPP8BOzT/ZvOMKdmw56VFN0Au27n
 KAF6IJwHleph7dw/LOjdrX1Vv9sx0nk05C0/aqapUMkph5hy5rPLGmYfAwMUwmKJiIqp
 ZpDUpucWNbB4eiIWsXLNJYn4zGx/AxDdGuRIr1HEJwzDWTRfqC6GXVN/xgQewCjSam1G
 TfwQ==
X-Gm-Message-State: AOAM531keWLLJwMQTLFx9X9PuIZRklOU2ICHbmmupPfxzAXkm1WU5vAC
 cT6kner2RWmWktMOQO8pPdV6iE4I/ao3EPan3qwxByXbvHPyszQo
X-Google-Smtp-Source: ABdhPJwL0lQizI6S2W0eDK8qJ0k1+WfJMYZWRiG/sYRAGS7A+DRDdYF4bdRwPjo2sVzPlpjB/Dk2g1gSbSKvqFnKa7Y=
X-Received: by 2002:a05:651c:2125:: with SMTP id
 a37mr1244472ljq.317.1630642173269; 
 Thu, 02 Sep 2021 21:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAECraRrhiAZQfZjSc0Auhby0Z+G0jSfNeapgDnfQ6=NT8p7q5Q@mail.gmail.com>
 <CAECraRro-ZQrZbxBkQg=o1bnWmf1V4C65D0jkdkt2rMCCe+6bg@mail.gmail.com>
 <CADGd2Dp0S5_=bPQDnRsamvraJZ5BeVV1eWh98js3wATXodfQcQ@mail.gmail.com>
 <CAECraRpLYEkAm+g1dg6X9RJLEDx=nOs=gPQvT_CjxwjXSbhDOw@mail.gmail.com>
In-Reply-To: <CAECraRpLYEkAm+g1dg6X9RJLEDx=nOs=gPQvT_CjxwjXSbhDOw@mail.gmail.com>
From: =?UTF-8?B?2K3Yp9mF2K8g2LXYp9io2LE=?= <hsaber@gmail.com>
Date: Fri, 3 Sep 2021 08:39:16 +0430
Message-ID: <CAECraRra33vTSb3KW_siHrQx3tLSb-boJUQ1=hVDt5Lo6xXcUw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Unexpected_experience_of_site=2Dto=2Dsite_wireguard_?=
 =?UTF-8?Q?tunneling=E2=80=8F=E2=80=8F?=
To: John Lauro <johnalauro@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi again,
Something new happened which makes me more confused.
I wrote a small shell-script to check the connection between wg1 and
wg2, so whenever it drops, the script restarts the wg1 and everything
comes back.
Yes yes I don't like this way of addressing issues, but what could I
do if no meaningful debug information exists, and I predict that it
might be a bug of Wireguard itself?
BTW this system worked fine and the anti-censorship VPN chain was up
and running till this morning.
The connection went down at 7:49 and didn't come back with
auto-restart. The process of restarting continued for about 6 minutes,
and at last at 7:55 it came back.
During the outage I checked both sides and everything seemed fine.
Sides could ping the public ip of each other, their wg udp ports were
accessible to each other, and even handshake seemed to be finished
correctly (using wg-show command) but peers couldn't ping each other.
And the most confusing part is everything came back to life without
any action from my side. Just after 6 minutes of continuously
restarting the wg1 interface!
Isn't there a bug? Somebody please help me to debug this problem and
find the cause.

Here I bring you my shell-script code, and then its related log:

-------------------------
#!/bin/bash

exec >>/var/log/wg-ping 2>&1
while true
do
        connection=3D$(ping -c 1 10.10.10.1)
        time=3D$(date +%H:%M)
        seconds=3D$(date +%S)
        seconds=3D${seconds#0}
        if [[ "$connection" !=3D *"icmp"* ]]; then
          echo " "
          date
          wg-quick down wg1
          echo " "
          wg-quick up wg1
          connection=3D$(ping -c 1 10.10.10.1)
          time=3D$(date +%T)
          if [[ "$connection" !=3D *"icmp"* ]]; then
            echo "$time ERROR"
          else
            echo "$time OK"
            echo " "
          fi
        elif [[ $seconds -lt 5  ]]; then
          echo "$time OK"
        fi
        sleep 5
done
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Sample log of simply restarting the wg1 which makes everything fine
(and happens every few hours):
-----------------------
01:17 OK
01:18 OK
01:19 OK
01:20 OK
01:21 OK
01:22 OK
01:23 OK
01:24 OK
01:25 OK
01:26 OK

Fri Sep  3 01:26:41 +0430 2021
[#] ip route del default dev wg1 table middle
[#] ip rule del iif wg0 lookup middle
[#] ip link delete dev wg1

[#] ip link add wg1 type wireguard
[#] wg setconf wg1 /dev/fd/63
[#] ip -4 address add 10.10.10.2/32 dev wg1
[#] ip link set mtu 1420 up dev wg1
[#] ip -4 route add 10.10.10.1/32 dev wg1
[#] ip route add default dev wg1 table middle
[#] ip rule add iif wg0 lookup middle
[#] wg set wg1 peer <public key> allowed-ips 0.0.0.0/0
01:26:42 OK

01:27 OK
01:28 OK
01:30 OK
01:31 OK
01:32 OK
01:33 OK
01:34 OK
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
And the log for the confusing situation I explained:
-----------------------
07:45 OK
07:46 OK
07:47 OK
07:48 OK
07:49 OK

Fri Sep  3 07:49:42 +0430 2021
[#] ip route del default dev wg1 table middle
[#] ip rule del iif wg0 lookup middle
[#] ip link delete dev wg1

[#] ip link add wg1 type wireguard
[#] wg setconf wg1 /dev/fd/63
[#] ip -4 address add 10.10.10.2/32 dev wg1
[#] ip link set mtu 1420 up dev wg1
[#] ip -4 route add 10.10.10.1/32 dev wg1
[#] ip route add default dev wg1 table middle
[#] ip rule add iif wg0 lookup middle
[#] wg set wg1 peer <public key> allowed-ips 0.0.0.0/0
07:49:53 ERROR

Fri Sep  3 07:50:08 +0430 2021
[#] ip route del default dev wg1 table middle
[#] ip rule del iif wg0 lookup middle
[#] ip link delete dev wg1

[#] ip link add wg1 type wireguard
[#] wg setconf wg1 /dev/fd/63
[#] ip -4 address add 10.10.10.2/32 dev wg1
[#] ip link set mtu 1420 up dev wg1
[#] ip -4 route add 10.10.10.1/32 dev wg1
[#] ip route add default dev wg1 table middle
[#] ip rule add iif wg0 lookup middle
[#] wg set wg1 peer <public key> allowed-ips 0.0.0.0/0
07:50:18 ERROR

=3D=3D=3D=3D=3D=3D
LOTS OF RETRY LOGS CROPPED
=3D=3D=3D=3D=3D=3D

Fri Sep  3 07:55:13 +0430 2021
[#] ip route del default dev wg1 table middle
[#] ip rule del iif wg0 lookup middle
[#] ip link delete dev wg1

[#] ip link add wg1 type wireguard
[#] wg setconf wg1 /dev/fd/63
[#] ip -4 address add 10.10.10.2/32 dev wg1
[#] ip link set mtu 1420 up dev wg1
[#] ip -4 route add 10.10.10.1/32 dev wg1
[#] ip route add default dev wg1 table middle
[#] ip rule add iif wg0 lookup middle
[#] wg set wg1 peer <public key> allowed-ips 0.0.0.0/0
07:55:23 ERROR

Fri Sep  3 07:55:38 +0430 2021
[#] ip route del default dev wg1 table middle
[#] ip rule del iif wg0 lookup middle
[#] ip link delete dev wg1

[#] ip link add wg1 type wireguard
[#] wg setconf wg1 /dev/fd/63
[#] ip -4 address add 10.10.10.2/32 dev wg1
[#] ip link set mtu 1420 up dev wg1
[#] ip -4 route add 10.10.10.1/32 dev wg1
[#] ip route add default dev wg1 table middle
[#] ip rule add iif wg0 lookup middle
[#] wg set wg1 peer <public key> allowed-ips 0.0.0.0/0
07:55:39 OK

07:56 OK
07:57 OK
07:58 OK
07:59 OK
08:00 OK
---------------------------------------



=E2=80=AB=D8=AD=D8=A7=D9=85=D8=AF =D8=B5=D8=A7=D8=A8=D8=B1 <=E2=80=AAhsaber=
@gmail.com=E2=80=AC=E2=80=8F> =D8=AF=D8=B1 =D8=AA=D8=A7=D8=B1=DB=8C=D8=AE =
=D9=BE=D9=86=D8=AC=D8=B4=D9=86=D8=A8=D9=87 =DB=B2 =D8=B3=D9=BE=D8=AA=D8=A7=
=D9=85=D8=A8=D8=B1 =DB=B2=DB=B0=DB=B2=DB=B1 =D8=B3=D8=A7=D8=B9=D8=AA
=DB=B8:=DB=B4=DB=B7 =D9=86=D9=88=D8=B4=D8=AA:=E2=80=AC
>
> -Thanks for reply.
> For test reasons, I turned the firewall off on my middle-node server.
> But I can't understand how this issue may be related to firewall,
> because most of the time it works (and to me it means firewall is Ok),
> but sometime for some unknown reason it stops working, which when I
> restart the wg1 interface with this command everything comes back to
> life:
> wg-quick down wg1 && wg-quick up wg1
>
> BTW here it is the firewall status of middle-node:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =E2=97=8F firewalld.service - firewalld - dynamic firewall daemon
>    Loaded: loaded (/usr/lib/systemd/system/firewalld.service;
> disabled; vendor preset: enabled)
>    Active: inactive (dead)
>      Docs: man:firewalld(1)
> -----------------------------------
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> -----------------------------------
>
> And the firewall status of exit-node:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Unit firewalld.service could not be found.
> ---------------------------
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0            udp dpt:508=
42
> ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0            udp dpt:53
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> ---------------------
> Regards
>
> =E2=80=AB=E2=80=AAJohn Lauro=E2=80=AC=E2=80=8F <=E2=80=AAjohnalauro@gmail=
.com=E2=80=AC=E2=80=8F> =D8=AF=D8=B1 =D8=AA=D8=A7=D8=B1=DB=8C=D8=AE =DA=86=
=D9=87=D8=A7=D8=B1=D8=B4=D9=86=D8=A8=D9=87 =DB=B1 =D8=B3=D9=BE=D8=AA=D8=A7=
=D9=85=D8=A8=D8=B1
> =DB=B2=DB=B0=DB=B2=DB=B1 =D8=B3=D8=A7=D8=B9=D8=AA =DB=B2=DB=B1:=DB=B5=DB=
=B1 =D9=86=D9=88=D8=B4=D8=AA:=E2=80=AC
> >
> > Just a guess, but I would be suspicious about connection tracking causi=
ng the issue.  What are your firewall rules?
> >
> > =E2=80=AAOn Wed, Sep 1, 2021 at 9:51 AM =E2=80=AB=D8=AD=D8=A7=D9=85=D8=
=AF =D8=B5=D8=A7=D8=A8=D8=B1=E2=80=AC=E2=80=8E <hsaber@gmail.com> wrote:=E2=
=80=AC
> >>
> >> Dear friends,
> >> I have configured 3 wireguard interfaces on 2 servers to act as a
> >> chained VPN for me (to bypass the internet censorship in my country),
> >> with this schema:
> >>
> >> client -- wg0 on middle-node -- wg1 on middle node -- wg2 on exit node
> >> (to free internet)
> >>
> >> Everything works fine, but after a while, the connection between wg1
> >> and wg2 drops and I can't find the reason. The connection comes back
> >> to action by simply switching the wg1 down and up again using
> >> wg-quick. And the amazing behaviour is that sometimes the connection
> >> comes back to work automatically  after some random time passes,
> >> without any actions from my side (sometimes after a few tens of
> >> minutes, sometimes after a few hours).
> >> When the wg1-wg2 connection is not working, anything else between 2
> >> servers (middle-node and exit-node) works fine. I mean I can ping the
> >> public IP of each server from another part, but the local wireguard ip
> >> of none of them are accessible.
> >>
> >> I tried to monitor the situation and read the logs but couldn't find
> >> what is happening here, so please help!
> >>
> >> The configuration:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> client (my mobile phone):
> >> -------------------------------------------
> >> [Interface]
> >> Address =3D 10.10.20.2/32
> >> PrivateKey =3D  <private key of client>
> >> DNS =3D 10.10.10.1
> >>
> >> ### Middle Node
> >> [Peer]
> >> PublicKey =3D  <public key of wg0>
> >> PresharedKey =3D  <preshared key>
> >> AllowedIPs =3D 0.0.0.0/0
> >> Endpoint =3D middle-node:50842
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> wg0 (in middle-node server):
> >> -------------------------------------------
> >> [Interface]
> >> Address =3D 10.10.20.1/24
> >> ListenPort =3D 50842
> >> PrivateKey =3D  <private key of wg0>
> >>
> >> ### Client
> >> [Peer]
> >> PublicKey =3D  <public key of client>
> >> PresharedKey =3D  <preshared key>
> >> AllowedIPs =3D 10.10.20.2/32
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> wg1 (again in middle-node server):
> >> -------------------------------------------
> >> [Interface]
> >> Address =3D 10.10.10.2/32
> >> PrivateKey =3D  <private key of wg1>
> >>
> >> PostUp =3D ip route add default dev wg1 table middle
> >> PostUp =3D ip rule add iif wg0 lookup middle
> >> PostUp =3D wg set wg1 peer <publickey of wg2 (in exit-node)> allowed-i=
ps 0.0.0.0/0
> >>
> >> PreDown =3D ip route del default dev wg1 table middle
> >> PreDown =3D ip rule del iif wg0 lookup middle
> >>
> >> ### Exit Node
> >> [Peer]
> >> PublicKey =3D  <publickey of wg2 (in exit-node)>
> >> PresharedKey =3D  <preshared key>
> >> AllowedIPs =3D 10.10.10.1/32
> >> Endpoint =3D exit-node:50842
> >> PersistentKeepalive =3D 25
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> wg2 (in exit-node server):
> >> -------------------------------------------
> >> [Interface]
> >> Address =3D 10.10.10.1/24
> >> ListenPort =3D 50842
> >> PrivateKey =3D  <private key of wg2>
> >>
> >> PostUp   =3D iptables -A FORWARD -i eth0 -o wg2 -j ACCEPT
> >> PostUp   =3D iptables -A FORWARD -i wg2 -j ACCEPT
> >> PostUp   =3D iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> >>
> >> PostDown =3D iptables -D FORWARD -i eth0 -o wg2 -j ACCEPT
> >> PostDown =3D iptables -D FORWARD -i wg2 -j ACCEPT
> >> PostDown =3D iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
> >>
> >> ### Middle Node
> >> [Peer]
> >> PublicKey =3D  <publickey of wg1 (in middle-node)>
> >> PresharedKey =3D  <preshared key>
> >> AllowedIPs =3D 10.0.0.0/8
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> Sample log of dmesg when the wg1-wg2 connection is not working:
> >> -------------------------------------------
> >> [Wed Sep  1 11:19:32 2021] wireguard: wg1: Sending keepalive packet to
> >> peer 12 (~exit-node-ip~:50842)
> >> [Wed Sep  1 11:19:44 2021] wireguard: wg0: Sending keepalive packet to
> >> peer 8 (~client-ip~:65323)
> >> [Wed Sep  1 11:19:44 2021] wireguard: wg1: Receiving keepalive packet
> >> from peer 12 (~exit-node-ip~:50842)
> >> [Wed Sep  1 11:20:09 2021] wireguard: wg0: Receiving handshake
> >> initiation from peer 8 (~client-ip~:65323)
> >> [Wed Sep  1 11:20:09 2021] wireguard: wg0: Sending handshake response
> >> to peer 8 (~client-ip~:65323)
> >> [Wed Sep  1 11:20:09 2021] wireguard: wg0: Keypair 2867 destroyed for =
peer 8
> >> [Wed Sep  1 11:20:09 2021] wireguard: wg0: Keypair 2871 created for pe=
er 8
> >> [Wed Sep  1 11:20:09 2021] wireguard: wg0: Receiving keepalive packet
> >> from peer 8 (~client-ip~:65323)
> >> [Wed Sep  1 11:21:19 2021] wireguard: wg0: Sending keepalive packet to
> >> peer 8 (~client-ip~:65323)
> >> [Wed Sep  1 11:21:24 2021] wireguard: wg1: Retrying handshake with
> >> peer 12 (~exit-node-ip~:50842) because we stopped hearing back after
> >> 15 seconds
> >> [Wed Sep  1 11:21:24 2021] wireguard: wg1: Sending handshake
> >> initiation to peer 12 (~exit-node-ip~:50842)
> >> [Wed Sep  1 11:21:30 2021] wireguard: wg1: Handshake for peer 12
> >> (~exit-node-ip~:50842) did not complete after 5 seconds, retrying (try
> >> 2)
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> Sample log of dmesg when the wg1-wg2 connection is coming back using
> >> manual restart:
> >> -------------------------------------------
> >> [Wed Sep  1 11:45:52 2021] wireguard: wg1: Sending handshake
> >> initiation to peer 12 (~exit-node-ip~:50842)
> >> [Wed Sep  1 11:45:52 2021] wireguard: wg0: Sending keepalive packet to
> >> peer 8 (~client-ip~:2335)
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Handshake for peer 12
> >> (~exit-node-ip~:50842) did not complete after 5 seconds, retrying (try
> >> 3)
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Sending handshake
> >> initiation to peer 12 (~exit-node-ip~:50842)
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Keypair 2878 destroyed for =
peer 12
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Peer 12
> >> (~exit-node-ip~:50842) destroyed
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Interface destroyed
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Interface created
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Peer 13 created
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Sending keepalive packet to
> >> peer 13 (~exit-node-ip~:50842)
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Sending handshake
> >> initiation to peer 13 (~exit-node-ip~:50842)
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Receiving handshake
> >> response from peer 13 (~exit-node-ip~:50842)
> >> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Keypair 2881 created for pe=
er 13
> >> [Wed Sep  1 11:46:12 2021] wireguard: wg0: Receiving keepalive packet
> >> from peer 8 (~client-ip~:2335)
> >> [Wed Sep  1 11:46:14 2021] wireguard: wg1: Receiving keepalive packet
> >> from peer 13 (~exit-node-ip~:50842)
> >> [Wed Sep  1 11:46:27 2021] wireguard: wg0: Sending keepalive packet to
> >> peer 8 (~client-ip~:2335)
> >> [Wed Sep  1 11:46:28 2021] wireguard: wg1: Receiving keepalive packet
> >> from peer 13 (~exit-node-ip~:50842)
> >> [Wed Sep  1 11:46:52 2021] wireguard: wg1: Receiving keepalive packet
> >> from peer 13 (~exit-node-ip~:50842)
> >>
> >>
> >> Thanks in advance for your kind help
