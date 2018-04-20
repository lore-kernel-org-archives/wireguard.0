Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d32e2b4
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:51:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 628f8136
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:51:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71c47782
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:28:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 69983548
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 19:28:03 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id e80-v6so1613824oig.11
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 12:51:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rDJT5bOJdUn_b9nrUgBbfUWYu2cpQXRhWuAHOGcVczsw@mail.gmail.com>
References: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
 <CAHmME9rFZMXcjZgFQBrZHDCbqmYT+MdBEJmS6f6=5=F-7nrJBA@mail.gmail.com>
 <33d0fd1f4c60919b98b50e2b9d04fe78@rcrdbrt.com>
 <2c17e7ba2590353afa04fc1619d726c2@rcrdbrt.com>
 <CAHmME9oFYswr1KjBGiP+2iMHDGYmZhpv_SovCMT3xxMMErK19A@mail.gmail.com>
 <9896807f0c6cbee1c7c99647a3c289cc@rcrdbrt.com>
 <f541248bfc8b47975b34acbc1c7bfa9b@rcrdbrt.com>
 <CAHmME9rtK1JvGs3JNYo4Jd9RPuTX9hx0cJy+a=7vEAJkVVa_ng@mail.gmail.com>
 <CAHmME9rDJT5bOJdUn_b9nrUgBbfUWYu2cpQXRhWuAHOGcVczsw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Apr 2018 21:51:57 +0200
Message-ID: <CAHmME9okxTTCUtnJxCL9ERF1mFQN7_CzN4dM-sOL3KC4J6uBvA@mail.gmail.com>
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

Could you let me know which kernel the non-working rapsis are running?
Also, have you tried this over different internet connections and
experienced the same thing?
