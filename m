Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34FFC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Mar 2022 17:16:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 50288dad;
	Mon, 14 Mar 2022 17:11:41 +0000 (UTC)
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1844b269
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Feb 2022 21:18:28 +0000 (UTC)
Date: Mon, 21 Feb 2022 21:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1645478307;
 bh=kKh0afVIa/gD2iIdXR1C4/IG9j/AWpLNe8wJU6SivnI=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID;
 b=eE4j5lAwFNLGx24JI9IM03rp+MbzlBG7Xb8IwURkI4O4UvxB0WPcEmG/mGqNgejF+
 UVZxdA3AtMYABuxksq5Ui6L245QX7AhXdkdTPzjUJ9XQfTiffO1fgvKBg7PBeVckLK
 T+AwcoyMSirNdDA/iSnCCFzK9f3ABqSmS0Zd5Kt9t+wQfmA/qPrzVkSNKxZMUkU8kE
 jjTwB/vldom39jwnFrmFKZRi2NGXGNFejO6PltvW8pzkVuqqImzAFrrz7sh49pGLuQ
 ZMWbV/vsZkYeml5KoeO6L9gHDAvslMyT19U4mpUAP8sYWFg04pMrYLwag/czpncBX/
 LIbD2uvCmwMdA==
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Rujbin <rujbin@protonmail.com>
Subject: MTU Size should be 1280 with details now.
Message-ID: <ST1eC_dUqVErxkXZD7AL_jDRz6dMT8m1HHXo606F1bIANkd7Ud2okAtzk_wCOPRgFoDb5_IeHNSzpWw4HXnUah2ps7l1HzyWyXlLQo3Fp-M=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 14 Mar 2022 17:11:40 +0000
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
Reply-To: Rujbin <rujbin@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey, i dont know how mail lists work, as i dont get mails from the whole di=
scussion. I make new Thread with all Details included.
I am running Windows 10 Enterprise, Windows 10 Home. My Router is Vodafone =
Station (Default Router). They might have remote access to fix problems, li=
ke all isps do.

When i do 1280 MTU, its fine. But its 100mbps maixmum with huge latency dro=
ps when i open some websites.

My Configurations:

[Interface]
PrivateKey =3D HIDDEN
Address =3D 10.0.0.2/32, 2a01::2/128
DNS =3D 20.199.177.73
MTU =3D 1280

[Peer]
PublicKey =3D oyq9egDqiRTgxKbvWonrkFavvp9JcIw40EJoWmjRD3Y=3D
AllowedIPs =3D 0.0.0.0/0, ::/0
Endpoint =3D 104.248.247.50:51820
PersistentKeepalive =3D 21

I did not change anything on Interface.
Ubuntu Server:
ip -a

2: eth0: mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether fa:04:72:19:7f:4b brd ff:ff:ff:ff:ff:ff
    inet 104.248.247.50/20 brd 104.248.255.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet 10.19.0.6/16 brd 10.19.255.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 2a03:b0c0:3:d0::16bc:a001/64 scope global
       valid_lft forever preferred_lft forever
    inet6 fe80::f804:72ff:fe19:7f4b/64 scope link
       valid_lft forever preferred_lft forever


63: wg0: mtu 1420 qdisc noqueue state UNKNOWN group default qlen 1000
    link/none
    inet 10.0.0.0/24 scope global wg0
       valid_lft forever preferred_lft forever
    inet6 2a01::/64 scope global
       valid_lft forever preferred_lft forever

Address =3D 10.0.0.0/24, 2a01:affe:affe:affe:affe:affe:affe:affe/64
Privatekey =3D HIDDEN
Listenport =3D 51820

PostUp =3D iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostUp =3D ip6tables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown =3D iptables -t nat -D POSTROUTING -o etho -j MASQUERADE
PostDown =3D ip6tables -t nat -D POSTROUTING -o etho -j MASQUERADE

[Peer]
Publickey =3D P7TiJbnXVvLrVCSosZL3ZK1CZHx5OEJf57Q3oejc8RI=3D
AllowedIPs =3D 10.0.0.3/32, 2a01::3/128
[Peer]
PublicKey =3D tb9edxZH0vdJYYqC8AyF83mkDjra/CoWIoTB584qWF0=3D
AllowedIPs =3D 10.0.0.2/32, 2a01::2/128

Tracepath:
root@ubuntu-s-1vcpu-1gb-intel-fra1-01:~# tracepath 1.1.1.1
 1?: [LOCALHOST]                      pmtu 1500
 1:  no reply
 2:  10.68.132.5                                           1.609ms asymm  1
 3:  138.197.249.62                                        6.634ms asymm  2
 4:  138.197.250.141                                       0.811ms asymm  3
 5:  no reply
 6:  no reply
 7:  no reply
 8:  no reply
 9:  no reply
10:  no reply
11:  no reply
12:  no reply
13:  no reply
14:  no reply
15:  no reply
16:  no reply
17:  no reply
18:  no reply
19:  no reply
20:  no reply
21:  no reply
22:  no reply
23:  no reply
24:  no reply
25:  no reply
26:  no reply
27:  no reply
28:  no reply
29:  no reply
30:  no reply
     Too many hops: pmtu 1500
     Resume: pmtu 1500


Endpoint is always ipv4. What is the problem here?  Now, im in Hotel Wifi a=
nd 1420 MTU works. But i didnt make something on Network, i dont understand=
 what is wrong... My Server is Ubuntu Server 20.04 LTS with kernel module.
