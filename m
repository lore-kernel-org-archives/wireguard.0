Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4126b5d
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 12:18:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0061d499
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 12:18:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fa6a0c8
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 12:37:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 774942a9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Sep 2017 12:37:36 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id l74so29993223oih.1
 for <wireguard@lists.zx2c4.com>; Sun, 10 Sep 2017 05:44:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
References: <1e1740c3-f8cf-2ee2-d842-749b687cb737@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 10 Sep 2017 14:44:30 +0200
Message-ID: <CAHmME9ptrCHRbAXpztbveMrHZ-nSOwadgX0vfnmDgKrGE_ge7g@mail.gmail.com>
Subject: Re: Timing issue (?) with wg-quick up on Raspberry Pi B+
To: Jim Darby <uberscubajim@gmail.com>
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

Hey Jim,

That's very odd indeed. Do you have any other network management
daemons running on there that could be interfering?

Also: what snapshot version, kernel version, distribution, etc are you
using? Anything odd in dmesg after running wg-quick?

Regards,
Jason
