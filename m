Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40d8572c
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Dec 2017 14:36:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c223928
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Dec 2017 14:36:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27418e66
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Dec 2017 14:27:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8e6729dd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Dec 2017 14:27:11 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id t81so19027908oih.13
 for <wireguard@lists.zx2c4.com>; Fri, 22 Dec 2017 06:36:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKYr3zyw829Ed3Dxi1eACQJvQrgPe+H6FTOdNNBNAJVxDeKnxw@mail.gmail.com>
References: <CAKYr3zyw829Ed3Dxi1eACQJvQrgPe+H6FTOdNNBNAJVxDeKnxw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Dec 2017 15:36:05 +0100
Message-ID: <CAHmME9rGVeTbqh1fN9Oo8Zxnb3NHyjAO=fqBPUPUF7K_C6aycQ@mail.gmail.com>
Subject: Re: wireguard on embedded / no bash
To: Outback Dingo <outbackdingo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

wg(8) doesn't require bash. wg-quick(8), which does use bash, probably
shouldn't be necessary in embedded environments, where you likely
should be writing simpler scripts around wg(8) and ip(8) instead.
