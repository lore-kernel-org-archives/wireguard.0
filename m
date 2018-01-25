Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b8ce039
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jan 2018 19:41:06 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a80d58c
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jan 2018 19:41:06 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1eenS0-000Hu0-6S
 for wireguard@lists.zx2c4.com; Thu, 25 Jan 2018 20:44:44 +0100
Subject: Re: Bridging wg and normal interfaces?
To: wireguard@lists.zx2c4.com
References: <CAMEMCsKxKHtn2ARFchYVTrj2r_ArHQ4DeqaaSYUh96ZKrVk3GA@mail.gmail.com>
 <CAHmME9oZ=4fEB+CTPPXLz=b=HZCOkVy02dVfVh4=Ri=bH80UjQ@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <a8a25aac-48bf-9491-6734-3fed0978d99d@urlichs.de>
Date: Thu, 25 Jan 2018 20:44:43 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9oZ=4fEB+CTPPXLz=b=HZCOkVy02dVfVh4=Ri=bH80UjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 25.01.2018 12:08, Jason A. Donenfeld wrote:
> WireGuard is layer 3, not layer 2, so bridging is not what you want.

Though if you *do* want (or need) bridging, l2tp is your friend.

See for example https://remote-lab.net/linux-l2tp-ethernet-pseudowires

How to change this example to go through wireguard is left as an
exercise for the esteemed reader. ;-)

-- 
-- Matthias Urlichs
