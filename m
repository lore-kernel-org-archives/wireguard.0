Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be8e847c
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 23:11:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 304405f6
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 23:11:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id abd54bf4
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 23:10:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 99ebf2fc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jul 2018 23:10:37 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id q11-v6so5970901oic.12
 for <wireguard@lists.zx2c4.com>; Thu, 26 Jul 2018 16:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAHjFYUJp3A3Q_Jdqcn8XOnnYfsnMsF6x2FUM=AiAV=j0g8BY9w@mail.gmail.com>
 <CAHmME9r8zh_X5JDSHy+wkAyeX3Kt-FuWzpcxFSgkBdo8o13Rnw@mail.gmail.com>
 <e4f3f09a-1281-7f79-9d80-a878f0dd8cbe@mib-infotech.co.nz>
 <CY4PR14MB1141B39996AC40980AB9CC01A22B0@CY4PR14MB1141.namprd14.prod.outlook.com>
In-Reply-To: <CY4PR14MB1141B39996AC40980AB9CC01A22B0@CY4PR14MB1141.namprd14.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Jul 2018 01:21:08 +0200
Message-ID: <CAHmME9p4Qd+TYYzpDxoUs2tpj9beLbFAQWiX-P98jZ5x0hpisg@mail.gmail.com>
Subject: Re: Android Update wants Camera Permissions
To: Denis Kisselev <denis@dkisselev.net>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eric Kuck <eric@bluelinelabs.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

[adding Eric and Harsh to the CC]

On Fri, Jul 27, 2018 at 1:15 AM Denis Kisselev <denis@dkisselev.net> wrote:
> That permission should probably only be requested as-needed but I suspect that wg is targeting an older Android API that doesn't expose that capability.

It was my understanding that only Android 4 would prompt at install
time and Android 5+ would only prompt when actually used. Perhaps I'm
mistaken?
