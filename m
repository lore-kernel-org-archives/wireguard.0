Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb8fd843
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:12:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 243d9670
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:12:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34c41240
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:03:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 28c27dcd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:03:14 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id a14-v6so11830491otf.6
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 18:26:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2c17e7ba2590353afa04fc1619d726c2@rcrdbrt.com>
References: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
 <CAHmME9rFZMXcjZgFQBrZHDCbqmYT+MdBEJmS6f6=5=F-7nrJBA@mail.gmail.com>
 <33d0fd1f4c60919b98b50e2b9d04fe78@rcrdbrt.com>
 <2c17e7ba2590353afa04fc1619d726c2@rcrdbrt.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 03:26:18 +0200
Message-ID: <CAHmME9oFYswr1KjBGiP+2iMHDGYmZhpv_SovCMT3xxMMErK19A@mail.gmail.com>
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

Based on those tcpdump timestamps, it looks like the handshake
response happens nearly immediately after the handshake initiation.
Yet from your description, it appears only after many moments. In my
experience, tcpdump blocks like this when it has to do too many DNS
resolutions and the resolver is slow. You might get a more accurate
picture of what is going on if you additionally pass `-n` to tcpdump,
which should make the packets appear more instantaneously.

Jason
