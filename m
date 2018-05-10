Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06ee27aa
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 21:45:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f0e6045
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 21:45:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26d83f0e
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 21:47:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bbf757fd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 21:47:06 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id g7-v6so4006323otj.11
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 14:47:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFuSFDHaFoF1SkbbdqDA87SKzOuwfV1GWWnZapDkOWTa7yYObA@mail.gmail.com>
References: <CAFuSFDHSJ8zezCqKuA+JM5asoWH-B2AYLAN2fbcWCwNE=r33hQ@mail.gmail.com>
 <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
 <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
 <CAFuSFDEf9gUMW5nOcStnFM22dvAa_mAtMAVnk92m-dRY2xFa5w@mail.gmail.com>
 <CAFuSFDFziCyiL=J_aom9YTWCM6gpGmY1cC56TroxJJvFcC3GKQ@mail.gmail.com>
 <CAHmME9pRTWCEzhuFAbDBtWPAxk0hB7AobZWa8bDHC3EuPbN95A@mail.gmail.com>
 <CAFuSFDEREZibd5Vb-J1GreLK9ZV+y2wGOc5MuaHvHx4XdbwDkw@mail.gmail.com>
 <CAHmME9pJJi3ReS_am0xopy1E=hpnaUZ1k1WnVNZLGdi_jA4eeA@mail.gmail.com>
 <CAHmME9qYv_5+TM-MaYowi5mf8g1=mgTC6_JasipYt29oJ4xFHQ@mail.gmail.com>
 <CAHmME9qhmPiDEE81h6rmA+iWdV4KpbqV7vCcw-6Nr+PZcQfnYw@mail.gmail.com>
 <CAFuSFDHaFoF1SkbbdqDA87SKzOuwfV1GWWnZapDkOWTa7yYObA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 May 2018 23:47:57 +0200
Message-ID: <CAHmME9r2xhe0NNt=y8aBdAzxHZUD76SAPBjPOrmT8dZ3Kqr8CQ@mail.gmail.com>
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

Hmm. Is the traffic on the box locally generated, or is it mostly
forwarding traffic? What ethernet driver are you using? Could you send
me the complete build directory of the WireGuard module -- with all
the .o files and the resultant .ko file?
