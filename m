Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3798cdc
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 22:54:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cac2d1b2
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 22:54:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40e728fc
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 22:45:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0ba19a27
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 22:45:48 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id z8-v6so11452714oix.2
 for <wireguard@lists.zx2c4.com>; Sat, 14 Apr 2018 16:09:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180414202029.5f247fba@natsu>
References: <20180316142547.2ecb70de@natsu>
 <CAHmME9rVba9Zzv65guftwxZcRGWBY0uaP=_GhHVnBz=8+L6Y3A@mail.gmail.com>
 <20180414024017.GA14470@zx2c4.com>
 <CAHmME9ru0iQeYMv_Y5dBZ1GoJvT_=UK8V74wWYNz2jtZWRFhfw@mail.gmail.com>
 <20180414184018.0166bc48@natsu>
 <CAHmME9rHTu1dQi+xyyRnkKxVkC9bx91V06-qF513SsVt8e7FKg@mail.gmail.com>
 <20180414193815.0d0cd039@natsu>
 <CAHmME9ra=DZiaUS7pP3xAxC_7H-yqfiTefU3Q8gufpP7e6H2zw@mail.gmail.com>
 <20180414202029.5f247fba@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Apr 2018 01:08:58 +0200
Message-ID: <CAHmME9oY1iaDh7F6mQFJcOrvVq7GQyCONhNit8N7R1eiZOGSCg@mail.gmail.com>
Subject: Re: Mixed MTU hosts on a network
To: Roman Mamedov <rm@romanrm.net>
Content-Type: text/plain; charset="UTF-8"
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Roman Mamedov <rm.wg@romanrm.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Roman,

I've just tried a few ways of replicating your setup, and I can't seem
to reproduce the bug, either with the new code or old. The results you
mention are surprising too, since WireGuard or not, TCP is supposed to
negotiate the lowest common MSS. I wonder if some strange iptables
rules are getting in the way and confusing things?

Jason
