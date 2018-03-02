Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45903ec7
 for <wireguard@lists.zx2c4.com>; Fri, 2 Mar 2018 15:26:19 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25154619
 for <wireguard@lists.zx2c4.com>; Fri, 2 Mar 2018 15:26:19 +0000 (UTC)
Received: from ipbcc3ebc2.dynamic.kabel-deutschland.de ([188.195.235.194]
 helo=[10.107.0.5]) by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1ermhr-0002hM-KY
 for wireguard@lists.zx2c4.com; Fri, 02 Mar 2018 16:34:47 +0100
Subject: Re: Assigning addresses with avahi-autoipd
To: wireguard@lists.zx2c4.com
References: <CAHLp1YmDybu01qzrH4-=8U0Cm7__3myF4p75iejBB5Zd+AKs8g@mail.gmail.com>
 <CAHLp1YkeCV5KxT2npcSOVb_vyB5oWFY2vq4bA12QLFFeJytzvA@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <89fbd3d2-4e66-3a0f-f0b4-e17b6a42e98c@urlichs.de>
Date: Fri, 2 Mar 2018 16:34:46 +0100
MIME-Version: 1.0
In-Reply-To: <CAHLp1YkeCV5KxT2npcSOVb_vyB5oWFY2vq4bA12QLFFeJytzvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 02.03.2018 15:41, Christophe-Marie Duquesne wrote:
> So the first question would be: any chance wireguard can broadcast ARP request?

Umm … no.

Wireguard doesn't do ARP because it already knows where to send packets.

It also doesn't dynamic assign IP addresses because you already need a
way to exchange information before setting up the WG link (i.e. the
public keys). It's trivial to also exchange IP addresses when you do that.

I'll leave the question of whether/how to route multicast packets to
somebody more knowledgeable.

-- 
-- Matthias Urlichs
