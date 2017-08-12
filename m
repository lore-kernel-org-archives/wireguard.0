Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94386584
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Aug 2017 01:33:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78b46745
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Aug 2017 01:33:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 108320f8
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Aug 2017 01:52:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f04a65cd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Aug 2017 01:52:10 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id f16so4172055itb.0
 for <wireguard@lists.zx2c4.com>; Fri, 11 Aug 2017 18:55:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9o7Z4L+UrzeLgnetdJ_LWO-XbJE-kcM8W_r76QB7JT_aA@mail.gmail.com>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
 <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
 <CAHmME9pujFf3pUAr9NZK81DZMQHYsH1gvgh3uH6RAQwNEZ8JDA@mail.gmail.com>
 <CAF75rJD7ZcSKp6WiEHg+VUa7=07-+9P3r6TxU6s9ieW+LdkNhQ@mail.gmail.com>
 <CAF75rJD3LH-CcPt2Da2qfxtv7C+W4Ed=ORkUg0L2vW1QiUfBcg@mail.gmail.com>
 <CAHmME9rJ7BiinhPRhOqzAjZJEdc=wKzdk80Dvi=xQnP2fu_eqw@mail.gmail.com>
 <CAF75rJDj79FU7GMa1DKxPNZ9V2dSW0+rFUDQjmEJ_z3ZDeuuGA@mail.gmail.com>
 <CAHmME9q5T-KpTatXxLZ_H_j_Ly=ZTX63wKTeYD=jqKQeupFFpQ@mail.gmail.com>
 <20170810221606.GC30478@lud>
 <CAHmME9o7Z4L+UrzeLgnetdJ_LWO-XbJE-kcM8W_r76QB7JT_aA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 12 Aug 2017 01:55:23 +0000
Message-ID: <CAHmME9qR3jeh-TmG+yeE8qwEypeoy1GV_FDMUb+ZK0bDF+fawQ@mail.gmail.com>
Subject: Re: Multihomed server issue
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jan De Landtsheer <jan@delandtsheer.eu>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Work in progress of last email from airplane:
https://git.zx2c4.com/WireGuard/commit/?id=afca9ef9ce88e8ef026e9c9deca98600c19c502e
If you'd like to test or play with the code.

(Will refine further when I'm home.)
