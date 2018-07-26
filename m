Return-Path: jacob.schooley@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3df06d9
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 16:03:09 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccb92f68
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 16:03:09 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id h4-v6so1849268edi.6
 for <wireguard@lists.zx2c4.com>; Thu, 26 Jul 2018 09:12:36 -0700 (PDT)
MIME-Version: 1.0
From: Jacob Schooley <jacob.schooley+wgvpn@gmail.com>
Date: Thu, 26 Jul 2018 12:12:22 -0400
Message-ID: <CAHjFYUJp3A3Q_Jdqcn8XOnnYfsnMsF6x2FUM=AiAV=j0g8BY9w@mail.gmail.com>
Subject: Cross compiling wireguard-go for ARM with utiliities
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="00000000000049a6a50571e943ec"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000049a6a50571e943ec
Content-Type: text/plain; charset="UTF-8"

I'm trying to run wireguard on an old embedded device. I have a tun module
for it, but the kernel is too old for the wireguard module, so I compiled
wireguard-go and it runs and creates the interface. However, it looks like
I need the the wg utility to configure the interface with the keys, and
wg-quick to use a config file, but I can't seem to find a way to easily
compile those without also compiling the module. Is there a way to do that?
Or will I have to pull out my old raspberry pi and update it just to get
those utilities?

--00000000000049a6a50571e943ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m trying to run wireguard on an old embedded device.=
 I have a tun module for it, but the kernel is too old for the wireguard mo=
dule, so I compiled wireguard-go and it runs and creates the interface. How=
ever, it looks like I need the the wg utility to configure the interface wi=
th the keys, and wg-quick to use a config file, but I can&#39;t seem to fin=
d a way to easily compile those without also compiling the module. Is there=
 a way to do that? Or will I have to pull out my old raspberry pi and updat=
e it just to get those utilities?</div>

--00000000000049a6a50571e943ec--
