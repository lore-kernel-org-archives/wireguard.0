Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d65bd242
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 20:22:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9aeed12
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 20:22:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf0cd924
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 20:24:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d0a24937
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 20:24:18 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id y10-v6so3767252otg.10
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 13:25:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qYv_5+TM-MaYowi5mf8g1=mgTC6_JasipYt29oJ4xFHQ@mail.gmail.com>
References: <CAFuSFDHSJ8zezCqKuA+JM5asoWH-B2AYLAN2fbcWCwNE=r33hQ@mail.gmail.com>
 <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
 <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
 <CAFuSFDEf9gUMW5nOcStnFM22dvAa_mAtMAVnk92m-dRY2xFa5w@mail.gmail.com>
 <CAFuSFDFziCyiL=J_aom9YTWCM6gpGmY1cC56TroxJJvFcC3GKQ@mail.gmail.com>
 <CAHmME9pRTWCEzhuFAbDBtWPAxk0hB7AobZWa8bDHC3EuPbN95A@mail.gmail.com>
 <CAFuSFDEREZibd5Vb-J1GreLK9ZV+y2wGOc5MuaHvHx4XdbwDkw@mail.gmail.com>
 <CAHmME9pJJi3ReS_am0xopy1E=hpnaUZ1k1WnVNZLGdi_jA4eeA@mail.gmail.com>
 <CAHmME9qYv_5+TM-MaYowi5mf8g1=mgTC6_JasipYt29oJ4xFHQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 May 2018 22:25:08 +0200
Message-ID: <CAHmME9qhmPiDEE81h6rmA+iWdV4KpbqV7vCcw-6Nr+PZcQfnYw@mail.gmail.com>
Subject: Re: wireguard-dkms and CentOS 7.5
To: Henry Snow <henry.snow@nielsen.com>
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

Hi Henry,

Here's a transcript of things working fine with the latest master
branch: https://=D7=90.cc/GEDdGn4N

I'm still playing to see if I can reproduce your crash.

Jason
