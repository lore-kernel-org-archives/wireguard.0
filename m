Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 293d14dd
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 19:17:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4d1f2c0
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 19:17:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b8c01da
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 19:16:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id efe3a9ef
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 19:16:36 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id b15-v6so18985623oib.10
 for <wireguard@lists.zx2c4.com>; Thu, 05 Jul 2018 12:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9pZZeQautpRT99R-gC9sxjsodgJK_1SLHd0mwU3hCsf_A@mail.gmail.com>
 <CY4PR14MB11417B558CCB088D0D2BD605A2400@CY4PR14MB1141.namprd14.prod.outlook.com>
In-Reply-To: <CY4PR14MB11417B558CCB088D0D2BD605A2400@CY4PR14MB1141.namprd14.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Jul 2018 21:24:23 +0200
Message-ID: <CAHmME9o1d5+=DnVOwGcTuZcRHYF-b27e4oUbnOThSuZ7WqzL5g@mail.gmail.com>
Subject: Re: "Exclude Private IPs" in Android App
To: denis@dkisselev.net
Content-Type: text/plain; charset="UTF-8"
Cc: Eric Kuck <eric@bluelinelabs.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Denis,

> I get "Error bringing up tunnel: Bad Address" if I try to set Allowed IP's to "10.5.0.1/24,192.168.1.0/13" but it works with "0.0.0.0/0".

User error. This fails because:

192.168.1.0 & (1 << (32 - 13)) != 192.168.1.0
and
10.5.0.1 & (1 << (32 - 24) != 10.5.0.1

Try instead using 192.168.0.0/13 and 10.5.0.0/24.

Jason
