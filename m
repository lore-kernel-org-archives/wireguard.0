Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42a9642e
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 May 2018 16:04:32 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c063f32
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 May 2018 16:04:32 +0000 (UTC)
Subject: Re: wireguard-dkms and CentOS 7.5
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Henry Snow <henry.snow@nielsen.com>
References: <CAFuSFDHSJ8zezCqKuA+JM5asoWH-B2AYLAN2fbcWCwNE=r33hQ@mail.gmail.com>
 <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
 <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <962dc8ba-30ed-fbd0-9e41-a65b7aab9522@solidadmin.com>
Date: Fri, 11 May 2018 11:07:16 -0500
MIME-Version: 1.0
In-Reply-To: <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 05/10/2018 11:14 AM, Jason A. Donenfeld wrote:
> Hi again,
> 
> I've fixed that here:
> https://git.zx2c4.com/WireGuard/patch/?id=94f25e47b23ddeba26120de4ee3c098438fc2251
> 
> This will be part of the next snapshot. In the meantime, you can apply
> that manually to the src directory, and perhaps Joe (CCd) can add it
> to the rpm.

It sounds like the patch maybe causing some problems still based on this 
thread. Regardless, patch or snapshot, I will have some time this 
weekend build the RPM with the fix.

Joe




-- 
Joe Doss
joe@solidadmin.com
