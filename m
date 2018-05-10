Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 997ba160
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 16:11:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68375a27
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 16:11:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed78b629
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 16:13:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ca5aa48b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 16:13:44 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id e80-v6so2227554oig.11
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 09:14:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
References: <CAFuSFDHSJ8zezCqKuA+JM5asoWH-B2AYLAN2fbcWCwNE=r33hQ@mail.gmail.com>
 <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 May 2018 18:14:33 +0200
Message-ID: <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
Subject: Re: wireguard-dkms and CentOS 7.5
To: Henry Snow <henry.snow@nielsen.com>, Joe Doss <joe@solidadmin.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi again,

I've fixed that here:
https://git.zx2c4.com/WireGuard/patch/?id=94f25e47b23ddeba26120de4ee3c098438fc2251

This will be part of the next snapshot. In the meantime, you can apply
that manually to the src directory, and perhaps Joe (CCd) can add it
to the rpm.

Jason
