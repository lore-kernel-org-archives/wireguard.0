Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845F3C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jun 2022 21:40:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 449ba806;
	Mon, 27 Jun 2022 21:40:49 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2136e5bc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jun 2022 21:40:47 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 n16-20020a17090ade9000b001ed15b37424so10666609pjv.3
 for <wireguard@lists.zx2c4.com>; Mon, 27 Jun 2022 14:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=meshify-app.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cR92zYFtlaaJQI2/pXAAXOJfUK1y6sQTSnyVoUQf7Gk=;
 b=jeHCXmXjCtGpBoRjFtTQlL6e5cAvp5BmOMVc/vaj6sm9E7AiDCd5muxMP2vvdW64vT
 6+zL48CWdJAPFD4M8mgukRaAn86n47DMjJMDPR0RQSie5f27HCJZoL6KMFdeQz3OQr44
 s+G/CLexngVEaSdmITFYy82SiubBpO8fPmBoyrv4Mgjk+8AyQEICqUINgM1pT7CBdEcQ
 GEG6mOHDQ2iFqG3XJQNL/ndAQMNzdqe1UbvC0K7Tgz8aXzJMZymAoVzq4FlgXaBHqXKq
 7JmEvxpb+/96xbzWw9lw/I3aeVjP/2H3oj2mogBsli4wwlctmm5zDCMJRjkRfbgpr4B0
 9ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cR92zYFtlaaJQI2/pXAAXOJfUK1y6sQTSnyVoUQf7Gk=;
 b=2qS0QGEvozpdaTAYOjUSbq8M44tkAW/DZAkAd9cB2hvbLy2Ip3Tv1pSfpzuZJIPB/V
 WXJgleL/dTuhF/9/4uABQDOrWI5QOWJHG4KJkWX69CLMHRpTNCnk9Q4ytME2KCZ2auBL
 vzqbxCnSiksRvRbm/cdDKj2AeSR/kMBSEF4SAM0p/jxJXxfe6fkxplXoCVbojDNg6pKQ
 +J3nLmtd9MpbMzlD3kvNBoNEBlx413dTI2fzPPPMfLAp8voOh8uVpMhfxYURP0hSH3Cz
 Dulgak6o5dXlV+cnwaMlbm/dx3CVpkezkVUBsLBoUfYQd8VSROJRyHvQeKmprisclBd1
 0u+Q==
X-Gm-Message-State: AJIora+7W1u/7HfvFyNsgzAHRkQ7ZcU741wx3BmKos2y6SHeXPnd5m+N
 aUy2D4LHTHG6mWe02u/b/OBJSrESDMYiqM0ZTW/k9w==
X-Google-Smtp-Source: AGRyM1u2C47+VetZ1Ub3Vu66GAsz6/u1kCiasFWxgTt9dX2gyxSR0yJy2DFroaRqYy9sjd4fS/eFqZed9AhD4AbxJGo=
X-Received: by 2002:a17:902:d504:b0:16a:4846:3f46 with SMTP id
 b4-20020a170902d50400b0016a48463f46mr190145plg.159.1656366045775; Mon, 27 Jun
 2022 14:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADuzeTx8_ODe2gF_hN6nhVFh5j+pEYXZB6fpVcC23pD2LLwCsw@mail.gmail.com>
In-Reply-To: <CADuzeTx8_ODe2gF_hN6nhVFh5j+pEYXZB6fpVcC23pD2LLwCsw@mail.gmail.com>
From: Alan Graham <alan@meshify.app>
Date: Mon, 27 Jun 2022 14:40:36 -0700
Message-ID: <CAMeHLtxurTwgOOuHQg-xALwahH7yGcTrtCmEk6TU6krpN-fSTw@mail.gmail.com>
Subject: Re: Wireguard is loosing connection for no reason
To: Pavel Yegorov <yegorov.p@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Pavel,

I also have a VM in OCI, albeit with Oracle Linux and not Ubuntu.
It's working without issues.  Your PresharedKeys could be at fault
based on how you obfuscated them.  However, I would look at all the
other iptables rules that Oracle made in the VM.  They are long and
complicated and I believe at some point I just nuked them all.

You might also want to install Wireshark on the client and make a
capture when you're having the problem.  You can also remove the
fd42:42:42:2/128 references and see if that solves the problem.  I can
imagine switching from ipv4 to ipv6 could cause such a hiccup and I
don't actually have ipv6 setup in my config.  I'd also ensure you're
not using Oracle's NAT feature for your VM as theirs is not a NAT you
can run Wireguard behind.  Hopefully one of these suggestions will
help!

Best regards,
Alan



On Mon, Jun 27, 2022 at 4:07 AM Pavel Yegorov <yegorov.p@gmail.com> wrote:
>
> Hey folks!
>
> I really need some advice, cause I just don't know how to deal with my problem.
>
> So, I have a WG "server" on ubuntu 18.04.6 LTS, hosted in the oracle
> free tier. I've installed wireguard using well-known
> https://github.com/angristan/wireguard-install script. Then I've
> generated several configs for my desktops, phones, etc. It connects
> and runs perfectly, but sometimes it just freezes for no reason.
> There's no connectivity issues or something like that. Logs on client
> side says something like that:
>
> 2022-06-21 03:01:01.845: [TUN] [win] Keypair 17 created for peer 1
> 2022-06-21 03:01:01.846: [TUN] [win] Sending keepalive packet to peer
> 1 (SERVER_IP:SERVER_PORT)
> 2022-06-21 03:03:01.822: [TUN] [win] Sending handshake initiation to
> peer 1 (SERVER_IP:SERVER_PORT)
> 2022-06-21 03:03:01.884: [TUN] [win] Receiving handshake response from
> peer 1 (SERVER_IP:SERVER_PORT)
> 2022-06-21 03:03:01.884: [TUN] [win] Keypair 16 destroyed for peer 1
> 2022-06-21 03:03:01.884: [TUN] [win] Keypair 18 created for peer 1
> 2022-06-21 03:03:01.884: [TUN] [win] Sending keepalive packet to peer
> 1 (SERVER_IP:SERVER_PORT)
> 2022-06-21 03:05:02.058: [TUN] [win] Sending handshake initiation to
> peer 1 (SERVER_IP:SERVER_PORT)
> 2022-06-21 03:05:02.106: [TUN] [win] Receiving handshake response from
> peer 1 (SERVER_IP:SERVER_PORT)
> 2022-06-21 03:05:02.106: [TUN] [win] Keypair 17 destroyed for peer 1
> 2022-06-21 03:05:02.106: [TUN] [win] Keypair 19 created for peer 1
> 2022-06-21 03:05:02.106: [TUN] [win] Sending keepalive packet to peer
> 1 (SERVER_IP:SERVER_PORT)
> 2022-06-21 03:06:21.302: [TUN] [win] Retrying handshake with peer 1
> (SERVER_IP:SERVER_PORT) because we stopped hearing back after 15
> seconds
> 2022-06-21 03:06:21.302: [TUN] [win] Sending handshake initiation to
> peer 1 (SERVER_IP:SERVER_PORT)
> 2022-06-21 03:06:26.423: [TUN] [win] Handshake for peer 1
> (SERVER_IP:SERVER_PORT) did not complete after 5 seconds, retrying
> (try 2)
> 2022-06-21 03:06:26.423: [TUN] [win] Sending handshake initiation to
> peer 1 (SERVER_IP:SERVER_PORT)
> 2022-06-21 03:06:31.471: [TUN] [win] Handshake for peer 1
> (SERVER_IP:SERVER_PORT) did not complete after 5 seconds, retrying
> (try 3)
> 2022-06-21 03:06:31.473: [TUN] [win] Sending handshake initiation to
> peer 1 (SERVER_IP:SERVER_PORT)
> 2022-06-21 03:06:36.517: [TUN] [win] Handshake for peer 1
> (SERVER_IP:SERVER_PORT) did not complete after 5 seconds, retrying
> (try 4)
>
> If I reconnect WG client, it immediately connects and everything is ok.
>
> Any advices? I tried to experiment with PersistentKeepAlive param (on
> both sides!) that doesn't change anything.
>
> My server cfg:
>
> [Interface]
> Address = 10.66.66.1/24,fd42:42:42::1/64
> ListenPort = SERVER_PORT
> PrivateKey = M?????Uyg4r3mo=
>
> PostUp = iptables -I FORWARD -i ens3 -o wg0 -j ACCEPT; iptables -I
> FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o ens3 -j
> MASQUERADE; ip6tables -A FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -A
> POSTROUTING -o ens3 -j MASQUERADE; sudo iptables -I INPUT -i ens3 -p
> udp --dport SERVER_PORT -m state --state NEW,ESTABLISHED -j ACCEPT
> PostDown = iptables -D FORWARD -i ens3 -o wg0 -j ACCEPT; iptables -D
> FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o ens3 -j
> MASQUERADE; ip6tables -D FORWARD -i wg0 -j ACCEPT; ip6tables -t nat -D
> POSTROUTING -o ens3 -j MASQUERADE; sudo iptables -D INPUT -i ens3 -p
> udp --dport SERVER_PORT -m state --state NEW,ESTABLISHED -j ACCEPT
>
> ### Client iphone
> [Peer]
> PublicKey = 0+V???????4HnM=
> PresharedKey = s???????amJCxJyqcE=
> AllowedIPs = 10.66.66.2/32,fd42:42:42::2/128
>
> ### Client mac
> [Peer]
> PublicKey = Tet4??????mI=
> PresharedKey = Ld???r8=
> AllowedIPs = 10.66.66.3/32,fd42:42:42::3/128
>
> My client cfg
>
> [Interface]
> PrivateKey = 4Bp????=
> Address = 10.66.66.2/32,fd42:42:42::2/128
> DNS = 8.8.8.8,1.1.1.1
>
> [Peer]
> PublicKey = 5R?????c=
> PresharedKey = sY????E=
> Endpoint = SERVER_IP:SERVER_PORT
> AllowedIPs = 0.0.0.0/0,::/0
>
> some stats
>
> root@oraclevpn:~# wg show all
> interface: wg0
>   public key: 5R?????c=
>   private key: (hidden)
>   listening port: SERVER_PORT
>
> peer: 0+?????nM=
>   preshared key: (hidden)
>   endpoint: 666.666.666.666:11111
>   allowed ips: 10.66.66.2/32, fd42:42:42::2/128
>   latest handshake: 2 minutes, 2 seconds ago
>   transfer: 533.52 MiB received, 5.18 GiB sent
>
>
> --
> Pavel Yegorov
