Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4cadd307
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:37:13 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b61e6bb
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:37:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b5c3072
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:13:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ef7a1310
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:13:32 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id c15-v6so9041906oic.2
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 12:37:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f541248bfc8b47975b34acbc1c7bfa9b@rcrdbrt.com>
References: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
 <CAHmME9rFZMXcjZgFQBrZHDCbqmYT+MdBEJmS6f6=5=F-7nrJBA@mail.gmail.com>
 <33d0fd1f4c60919b98b50e2b9d04fe78@rcrdbrt.com>
 <2c17e7ba2590353afa04fc1619d726c2@rcrdbrt.com>
 <CAHmME9oFYswr1KjBGiP+2iMHDGYmZhpv_SovCMT3xxMMErK19A@mail.gmail.com>
 <9896807f0c6cbee1c7c99647a3c289cc@rcrdbrt.com>
 <f541248bfc8b47975b34acbc1c7bfa9b@rcrdbrt.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Apr 2018 21:37:26 +0200
Message-ID: <CAHmME9rtK1JvGs3JNYo4Jd9RPuTX9hx0cJy+a=7vEAJkVVa_ng@mail.gmail.com>
Subject: Re: Troubleshooting WireGuard connections
To: Riccardo Berto <riccardo@rcrdbrt.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Riccardo,

Hmm, I'm really not quite sure from looking at that tcpdump. Are you
able to do one in parallel from the raspi? (Make sure both clocks are
correct with ntpd, so we can synchronize the timestamps.)

Alternatively, maybe just log onto IRC next week and we can debug this
in real time?

Jason
