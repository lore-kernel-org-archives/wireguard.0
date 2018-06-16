Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87205a27
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 12:56:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c8d9791
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 12:56:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9326d306
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 12:55:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c8373027
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 12:55:28 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id c6-v6so11164954oiy.0
 for <wireguard@lists.zx2c4.com>; Sat, 16 Jun 2018 06:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <CACsX8BiJJyTc8kS-_u4eMrDLgyOoNxKvhFL8YF1M2mnkKBOxTg@mail.gmail.com>
In-Reply-To: <CACsX8BiJJyTc8kS-_u4eMrDLgyOoNxKvhFL8YF1M2mnkKBOxTg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 16 Jun 2018 15:00:45 +0200
Message-ID: <CAHmME9ricuvsu=vpg4MQO0wBAXgoCdTSVMwP=BCd0Jt9Y3ZH+Q@mail.gmail.com>
Subject: Re: OpenWRT dynamic IP watchdog
To: aleksandr.v.piskunov@gmail.com
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

Hi Aleksandr,

Nice script. One question:

>   [ ${idle_seconds} -lt 150 ] && return 0;

Is there a reason why you went with 150? My original reresolve-dns.sh
went with 135 (REKEY_AFTER_TIME + KEEPALIVE_TIMEOUT + REKEY_TIMEOUT).
Did you find 150 matched network conditions better?

Regards,
Jason
