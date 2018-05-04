Return-Path: adorman@ironicdesign.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7974a24
 for <wireguard@lists.zx2c4.com>; Fri, 4 May 2018 02:51:52 +0000 (UTC)
Received: from nerissa.ironicdesign.com (nerissa.ironicdesign.com
 [206.166.194.226])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ede0f3a2
 for <wireguard@lists.zx2c4.com>; Fri, 4 May 2018 02:51:52 +0000 (UTC)
Subject: Re: wg0 packets not being routed? FIXED!
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <8599540b-b761-57a1-a585-b4395f9bed96@ironicdesign.com>
 <CAHmME9o+yduX0kbM0BV1qqGBbyf83XHi6bmcTSFXqzmVHw=FfQ@mail.gmail.com>
From: Andy Dorman <adorman@ironicdesign.com>
Message-ID: <2f57d1a5-1814-3f04-211d-94971b1a6f03@ironicdesign.com>
Date: Thu, 3 May 2018 21:53:46 -0500
MIME-Version: 1.0
In-Reply-To: <CAHmME9o+yduX0kbM0BV1qqGBbyf83XHi6bmcTSFXqzmVHw=FfQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Ironic Design Development <devel@lists.ironicdesign.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 5/3/18 7:15 PM, Jason A. Donenfeld wrote:
> ip route add 192.168.100.0/24 dev wg0

Thank you everyone, that was it. Once I added an explicit route for the 
remote IP block on each server it ALL worked (and latency is pretty 
good, under 30ms over about a 10-hop route).

Somehow I had gotten the idea that the setup was more complicated if I 
used the same IP block on both ends of the VPN. I am pretty sure I did 
NOT get that from the wireguard.com web site. When I find the doc that 
mislead me I will work with the author to make it clearer for a nube 
like me.

Thank you again.

-- 
Andy
