Return-Path: carroarmato0@inuits.eu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bda3951
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 09:37:13 +0000 (UTC)
Received: from zimbra.inuits.be (mail.inuits.eu [88.151.241.2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5abefba
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 May 2017 09:37:13 +0000 (UTC)
Subject: Re: Wireguard on Centos 7
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <8a2eb5ef-f154-ecff-e080-57b9a63d1bce@inuits.eu>
 <CAHmME9pJf1RP_0C1VrqHzEnqaNrAx4XH8snYaAH_h2xJdO3tGw@mail.gmail.com>
From: Christophe Vanlancker <carroarmato0@inuits.eu>
Message-ID: <156af131-eeda-9f34-90e0-ebc70a994e95@inuits.eu>
Date: Fri, 12 May 2017 11:47:57 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9pJf1RP_0C1VrqHzEnqaNrAx4XH8snYaAH_h2xJdO3tGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I haven't done this kind of work but I'll try giving it a shot. :)


Christophe


On 12-05-17 11:38, Jason A. Donenfeld wrote:
> Centos's 3.10 is not kernel.org's 3.10. They patch it heavily. If
> you'd like to adjust compat.h to support centos's patched-up kernel,
> without breaking support for other kernels, feel free to submit a
> patch.
>
> Jason

-- 
-- 
Christophe Vanlancker <christophe.vanlancker@inuits.eu>
+32 (494) 232277 | Linux & Open-Source consultant - Inuits.eu
