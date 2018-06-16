Return-Path: aleksandr.v.piskunov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02df9710
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 14:46:26 +0000 (UTC)
Received: from mail-lf0-x231.google.com (mail-lf0-x231.google.com
 [IPv6:2a00:1450:4010:c07::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2c98645
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 14:46:26 +0000 (UTC)
Received: by mail-lf0-x231.google.com with SMTP id y20-v6so18670231lfy.0
 for <wireguard@lists.zx2c4.com>; Sat, 16 Jun 2018 07:50:42 -0700 (PDT)
Return-Path: <aleksandr.v.piskunov@gmail.com>
Received: from d1781 ([212.3.194.24])
 by smtp.gmail.com with ESMTPSA id q73-v6sm1907472lje.53.2018.06.16.07.50.39
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jun 2018 07:50:40 -0700 (PDT)
Date: Sat, 16 Jun 2018 17:50:38 +0300
From: "Aleksandr V. Piskunov" <aleksandr.v.piskunov@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: OpenWRT dynamic IP watchdog
Message-ID: <20180616144440.GA6799@d1781>
References: <CACsX8BiJJyTc8kS-_u4eMrDLgyOoNxKvhFL8YF1M2mnkKBOxTg@mail.gmail.com>
 <CAHmME9ricuvsu=vpg4MQO0wBAXgoCdTSVMwP=BCd0Jt9Y3ZH+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9ricuvsu=vpg4MQO0wBAXgoCdTSVMwP=BCd0Jt9Y3ZH+Q@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Yes, I've tried 135 first, but during the real usage there were quite
a few false alarm situations with watchdog reconnecting at
136..~140 seconds. So.. changed it to 150 secs, which seems to work OK
for my conditions.

I can try to send a git patch to contrib/examples/reresolve-dns,
if rest is OK.

Regards,
Aleksandr

On Sat, Jun 16, 2018 at 03:00:45PM +0200, Jason A. Donenfeld wrote:
> Hi Aleksandr,
> 
> Nice script. One question:
> 
> >   [ ${idle_seconds} -lt 150 ] && return 0;
> 
> Is there a reason why you went with 150? My original reresolve-dns.sh
> went with 135 (REKEY_AFTER_TIME + KEEPALIVE_TIMEOUT + REKEY_TIMEOUT).
> Did you find 150 matched network conditions better?
> 
> Regards,
> Jason
