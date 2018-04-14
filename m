Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d19cad0
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 23:05:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14468c2b
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 23:05:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76ff00be
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 22:56:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9078ea8a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 22:56:27 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id i5-v6so4179963oth.1
 for <wireguard@lists.zx2c4.com>; Sat, 14 Apr 2018 16:19:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <9896807f0c6cbee1c7c99647a3c289cc@rcrdbrt.com>
References: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
 <CAHmME9rFZMXcjZgFQBrZHDCbqmYT+MdBEJmS6f6=5=F-7nrJBA@mail.gmail.com>
 <33d0fd1f4c60919b98b50e2b9d04fe78@rcrdbrt.com>
 <2c17e7ba2590353afa04fc1619d726c2@rcrdbrt.com>
 <CAHmME9oFYswr1KjBGiP+2iMHDGYmZhpv_SovCMT3xxMMErK19A@mail.gmail.com>
 <9896807f0c6cbee1c7c99647a3c289cc@rcrdbrt.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Apr 2018 01:19:38 +0200
Message-ID: <CAHmME9rUuheX=nHWfiNHj+gnZ2bJhu9up-TOR6TPKJk2n0fCmw@mail.gmail.com>
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

That's a confusing result. The tcpdump also shows two sequences of
completed handshakes happening, about 7 seconds apart. It might be
best in the end to hop onto IRC next week, and we can debug this in
real time. But based on the erratic behavior, my only guess remaining
is that you've mixed up the public and private keys -- perhaps sharing
a private key amongst hosts -- and so one session is interrupting the
handshake of another? Hmm...

Jason
