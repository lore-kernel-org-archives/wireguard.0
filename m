Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5b0bd39
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 17:23:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6e12c8c
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 17:23:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6e0ee5d
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 17:25:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 460569a5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 17:25:11 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id t1-v6so3163328ott.13
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 10:26:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFuSFDFziCyiL=J_aom9YTWCM6gpGmY1cC56TroxJJvFcC3GKQ@mail.gmail.com>
References: <CAFuSFDHSJ8zezCqKuA+JM5asoWH-B2AYLAN2fbcWCwNE=r33hQ@mail.gmail.com>
 <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
 <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
 <CAFuSFDEf9gUMW5nOcStnFM22dvAa_mAtMAVnk92m-dRY2xFa5w@mail.gmail.com>
 <CAFuSFDFziCyiL=J_aom9YTWCM6gpGmY1cC56TroxJJvFcC3GKQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 May 2018 19:25:59 +0200
Message-ID: <CAHmME9pRTWCEzhuFAbDBtWPAxk0hB7AobZWa8bDHC3EuPbN95A@mail.gmail.com>
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

Yikes. I guess I need to examine my compat backport closely. Do you
have any more logging than that? Usually there's a backtrace.
