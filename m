Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41498C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 04:20:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A3E360F90
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 04:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A3E360F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 944021a3;
	Thu, 2 Sep 2021 04:17:48 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 96dda884
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Sep 2021 04:17:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m28so1276568lfj.6
 for <wireguard@lists.zx2c4.com>; Wed, 01 Sep 2021 21:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SX01AhUwL9Z26eKY48O+qc83+FCB7j4wz60CSmR5dC4=;
 b=f8mq0Qbdq7OV9apCJwumpBfJnp1CKxXB9w0hf6mHNkhbnCVDXR1/ZFvbqigf7+KNEH
 SX9APF2VYOnMGIK5r+nHRz7Ii3G1ciMz1Ru+6WnSgEGye2W1zSxPQhQQ0S+X5k09SD3S
 ZkmDggtTLR1OX8nEDSV013+2pYqSnmjXYheRfgVpfUxZEfLJ4qm8L4qvPOx25oEXVYFJ
 V4SLjsw24HX50bip3PrcWBPQnZFkDWDc8P33F+byouILiW2xvih91pdrQvtsGqOHeZ5E
 1KtzcPG+yWd/sK4gunHu2xhZJhe2vLhsMOKXQDfP8P+E0apRNkQZJ9Ov6uOoagODdOh9
 7TyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SX01AhUwL9Z26eKY48O+qc83+FCB7j4wz60CSmR5dC4=;
 b=kcqCNBULQcpdQmqZyqXJHQwVN1HS/Bb1nfVHS42UdwEptUqCdL5IKHf0tJIwhXapbe
 0v+FBU3ctIXpupKfGN1/+YoBmPf7fhOdx0FSJF1oE6D0idSJC1VOfQKIOMqqfhwXVZaI
 A58onr6caUtyFi4Ib6BMBNEXqMyZ83orEYudeRgzXbiDHfpXkdEA9cSz0CVD42vk+vZx
 PMaDxgNaqQi+oMwbkf0ezb+CHjAO0iU2boWxvqjKUkd5Q9re6DDcIo2on8lSkDbvf5/w
 JLoJbWfAGgfQNRwhFcHjwc9M765uRIHm6Y68dO0GhOPNM61jNihNLHiV2fsRUyDi9mg1
 z/eg==
X-Gm-Message-State: AOAM533eN+CWvt2tmwbWsyGd+b2dtUnOQFR/TVGv34dQKoDYC1kOmfrE
 huRx1zFS9MxJfxqe8TAfsUohj1GsUtosLAuo/nQ=
X-Google-Smtp-Source: ABdhPJwZIEdT8fPdTKn9FPyGMF3h3utcZSY9lY7bHtsEkXI10Zt/zAGCuyvztWRUUghOap19CHr/DM8e3T6BVoUqr3Y=
X-Received: by 2002:a19:e306:: with SMTP id a6mr997530lfh.319.1630556265098;
 Wed, 01 Sep 2021 21:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAECraRrhiAZQfZjSc0Auhby0Z+G0jSfNeapgDnfQ6=NT8p7q5Q@mail.gmail.com>
 <CAECraRro-ZQrZbxBkQg=o1bnWmf1V4C65D0jkdkt2rMCCe+6bg@mail.gmail.com>
 <CADGd2Dp0S5_=bPQDnRsamvraJZ5BeVV1eWh98js3wATXodfQcQ@mail.gmail.com>
In-Reply-To: <CADGd2Dp0S5_=bPQDnRsamvraJZ5BeVV1eWh98js3wATXodfQcQ@mail.gmail.com>
From: =?UTF-8?B?2K3Yp9mF2K8g2LXYp9io2LE=?= <hsaber@gmail.com>
Date: Thu, 2 Sep 2021 08:47:25 +0430
Message-ID: <CAECraRpLYEkAm+g1dg6X9RJLEDx=nOs=gPQvT_CjxwjXSbhDOw@mail.gmail.com>
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

-Thanks for reply.
For test reasons, I turned the firewall off on my middle-node server.
But I can't understand how this issue may be related to firewall,
because most of the time it works (and to me it means firewall is Ok),
but sometime for some unknown reason it stops working, which when I
restart the wg1 interface with this command everything comes back to
life:
wg-quick down wg1 && wg-quick up wg1

BTW here it is the firewall status of middle-node:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=E2=97=8F firewalld.service - firewalld - dynamic firewall daemon
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service;
disabled; vendor preset: enabled)
   Active: inactive (dead)
     Docs: man:firewalld(1)
-----------------------------------
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
-----------------------------------

And the firewall status of exit-node:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Unit firewalld.service could not be found.
---------------------------
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0            udp dpt:50842
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0            udp dpt:53

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
---------------------
Regards

=E2=80=AB=E2=80=AAJohn Lauro=E2=80=AC=E2=80=8F <=E2=80=AAjohnalauro@gmail.c=
om=E2=80=AC=E2=80=8F> =D8=AF=D8=B1 =D8=AA=D8=A7=D8=B1=DB=8C=D8=AE =DA=86=D9=
=87=D8=A7=D8=B1=D8=B4=D9=86=D8=A8=D9=87 =DB=B1 =D8=B3=D9=BE=D8=AA=D8=A7=D9=
=85=D8=A8=D8=B1
=DB=B2=DB=B0=DB=B2=DB=B1 =D8=B3=D8=A7=D8=B9=D8=AA =DB=B2=DB=B1:=DB=B5=DB=B1=
 =D9=86=D9=88=D8=B4=D8=AA:=E2=80=AC
>
> Just a guess, but I would be suspicious about connection tracking causing=
 the issue.  What are your firewall rules?
>
> =E2=80=AAOn Wed, Sep 1, 2021 at 9:51 AM =E2=80=AB=D8=AD=D8=A7=D9=85=D8=AF=
 =D8=B5=D8=A7=D8=A8=D8=B1=E2=80=AC=E2=80=8E <hsaber@gmail.com> wrote:=E2=80=
=AC
>>
>> Dear friends,
>> I have configured 3 wireguard interfaces on 2 servers to act as a
>> chained VPN for me (to bypass the internet censorship in my country),
>> with this schema:
>>
>> client -- wg0 on middle-node -- wg1 on middle node -- wg2 on exit node
>> (to free internet)
>>
>> Everything works fine, but after a while, the connection between wg1
>> and wg2 drops and I can't find the reason. The connection comes back
>> to action by simply switching the wg1 down and up again using
>> wg-quick. And the amazing behaviour is that sometimes the connection
>> comes back to work automatically  after some random time passes,
>> without any actions from my side (sometimes after a few tens of
>> minutes, sometimes after a few hours).
>> When the wg1-wg2 connection is not working, anything else between 2
>> servers (middle-node and exit-node) works fine. I mean I can ping the
>> public IP of each server from another part, but the local wireguard ip
>> of none of them are accessible.
>>
>> I tried to monitor the situation and read the logs but couldn't find
>> what is happening here, so please help!
>>
>> The configuration:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> client (my mobile phone):
>> -------------------------------------------
>> [Interface]
>> Address =3D 10.10.20.2/32
>> PrivateKey =3D  <private key of client>
>> DNS =3D 10.10.10.1
>>
>> ### Middle Node
>> [Peer]
>> PublicKey =3D  <public key of wg0>
>> PresharedKey =3D  <preshared key>
>> AllowedIPs =3D 0.0.0.0/0
>> Endpoint =3D middle-node:50842
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> wg0 (in middle-node server):
>> -------------------------------------------
>> [Interface]
>> Address =3D 10.10.20.1/24
>> ListenPort =3D 50842
>> PrivateKey =3D  <private key of wg0>
>>
>> ### Client
>> [Peer]
>> PublicKey =3D  <public key of client>
>> PresharedKey =3D  <preshared key>
>> AllowedIPs =3D 10.10.20.2/32
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> wg1 (again in middle-node server):
>> -------------------------------------------
>> [Interface]
>> Address =3D 10.10.10.2/32
>> PrivateKey =3D  <private key of wg1>
>>
>> PostUp =3D ip route add default dev wg1 table middle
>> PostUp =3D ip rule add iif wg0 lookup middle
>> PostUp =3D wg set wg1 peer <publickey of wg2 (in exit-node)> allowed-ips=
 0.0.0.0/0
>>
>> PreDown =3D ip route del default dev wg1 table middle
>> PreDown =3D ip rule del iif wg0 lookup middle
>>
>> ### Exit Node
>> [Peer]
>> PublicKey =3D  <publickey of wg2 (in exit-node)>
>> PresharedKey =3D  <preshared key>
>> AllowedIPs =3D 10.10.10.1/32
>> Endpoint =3D exit-node:50842
>> PersistentKeepalive =3D 25
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> wg2 (in exit-node server):
>> -------------------------------------------
>> [Interface]
>> Address =3D 10.10.10.1/24
>> ListenPort =3D 50842
>> PrivateKey =3D  <private key of wg2>
>>
>> PostUp   =3D iptables -A FORWARD -i eth0 -o wg2 -j ACCEPT
>> PostUp   =3D iptables -A FORWARD -i wg2 -j ACCEPT
>> PostUp   =3D iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>
>> PostDown =3D iptables -D FORWARD -i eth0 -o wg2 -j ACCEPT
>> PostDown =3D iptables -D FORWARD -i wg2 -j ACCEPT
>> PostDown =3D iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
>>
>> ### Middle Node
>> [Peer]
>> PublicKey =3D  <publickey of wg1 (in middle-node)>
>> PresharedKey =3D  <preshared key>
>> AllowedIPs =3D 10.0.0.0/8
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Sample log of dmesg when the wg1-wg2 connection is not working:
>> -------------------------------------------
>> [Wed Sep  1 11:19:32 2021] wireguard: wg1: Sending keepalive packet to
>> peer 12 (~exit-node-ip~:50842)
>> [Wed Sep  1 11:19:44 2021] wireguard: wg0: Sending keepalive packet to
>> peer 8 (~client-ip~:65323)
>> [Wed Sep  1 11:19:44 2021] wireguard: wg1: Receiving keepalive packet
>> from peer 12 (~exit-node-ip~:50842)
>> [Wed Sep  1 11:20:09 2021] wireguard: wg0: Receiving handshake
>> initiation from peer 8 (~client-ip~:65323)
>> [Wed Sep  1 11:20:09 2021] wireguard: wg0: Sending handshake response
>> to peer 8 (~client-ip~:65323)
>> [Wed Sep  1 11:20:09 2021] wireguard: wg0: Keypair 2867 destroyed for pe=
er 8
>> [Wed Sep  1 11:20:09 2021] wireguard: wg0: Keypair 2871 created for peer=
 8
>> [Wed Sep  1 11:20:09 2021] wireguard: wg0: Receiving keepalive packet
>> from peer 8 (~client-ip~:65323)
>> [Wed Sep  1 11:21:19 2021] wireguard: wg0: Sending keepalive packet to
>> peer 8 (~client-ip~:65323)
>> [Wed Sep  1 11:21:24 2021] wireguard: wg1: Retrying handshake with
>> peer 12 (~exit-node-ip~:50842) because we stopped hearing back after
>> 15 seconds
>> [Wed Sep  1 11:21:24 2021] wireguard: wg1: Sending handshake
>> initiation to peer 12 (~exit-node-ip~:50842)
>> [Wed Sep  1 11:21:30 2021] wireguard: wg1: Handshake for peer 12
>> (~exit-node-ip~:50842) did not complete after 5 seconds, retrying (try
>> 2)
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Sample log of dmesg when the wg1-wg2 connection is coming back using
>> manual restart:
>> -------------------------------------------
>> [Wed Sep  1 11:45:52 2021] wireguard: wg1: Sending handshake
>> initiation to peer 12 (~exit-node-ip~:50842)
>> [Wed Sep  1 11:45:52 2021] wireguard: wg0: Sending keepalive packet to
>> peer 8 (~client-ip~:2335)
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Handshake for peer 12
>> (~exit-node-ip~:50842) did not complete after 5 seconds, retrying (try
>> 3)
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Sending handshake
>> initiation to peer 12 (~exit-node-ip~:50842)
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Keypair 2878 destroyed for pe=
er 12
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Peer 12
>> (~exit-node-ip~:50842) destroyed
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Interface destroyed
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Interface created
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Peer 13 created
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Sending keepalive packet to
>> peer 13 (~exit-node-ip~:50842)
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Sending handshake
>> initiation to peer 13 (~exit-node-ip~:50842)
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Receiving handshake
>> response from peer 13 (~exit-node-ip~:50842)
>> [Wed Sep  1 11:45:58 2021] wireguard: wg1: Keypair 2881 created for peer=
 13
>> [Wed Sep  1 11:46:12 2021] wireguard: wg0: Receiving keepalive packet
>> from peer 8 (~client-ip~:2335)
>> [Wed Sep  1 11:46:14 2021] wireguard: wg1: Receiving keepalive packet
>> from peer 13 (~exit-node-ip~:50842)
>> [Wed Sep  1 11:46:27 2021] wireguard: wg0: Sending keepalive packet to
>> peer 8 (~client-ip~:2335)
>> [Wed Sep  1 11:46:28 2021] wireguard: wg1: Receiving keepalive packet
>> from peer 13 (~exit-node-ip~:50842)
>> [Wed Sep  1 11:46:52 2021] wireguard: wg1: Receiving keepalive packet
>> from peer 13 (~exit-node-ip~:50842)
>>
>>
>> Thanks in advance for your kind help
