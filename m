Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0243de8
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 22:31:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65cf1a6f
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 22:31:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b28f784
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 22:30:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3d14a03d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 22:30:04 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id y207-v6so15963021oie.13
 for <wireguard@lists.zx2c4.com>; Sat, 04 Aug 2018 15:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <55706f46-74db-9dfb-6cc7-93ce40f0d5c5@mib-infotech.co.nz>
 <CAHmME9p-GMKAt-c=w4HdRMEDE0RbY6ok84uSCdQ6pqmD6_DyCA@mail.gmail.com>
 <1a96593c-5954-ee6a-7f74-3ed34302735b@mib-infotech.co.nz>
In-Reply-To: <1a96593c-5954-ee6a-7f74-3ed34302735b@mib-infotech.co.nz>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 5 Aug 2018 00:41:45 +0200
Message-ID: <CAHmME9rcUMnhhC+gLox4XOXccRhoaCEwi2B5i5GCZkR=-U1f=A@mail.gmail.com>
Subject: Re: package seems to have lost netifrc script
To: John Huttley <john@mib-infotech.co.nz>
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

On Sun, Aug 5, 2018 at 12:16 AM John Huttley <john@mib-infotech.co.nz> wrote:
>
> I'm running default  stable netifrc-0.5.1. I guess this is in the 0.6.X
> series.. (~amd64)
>
> I'll keep running stable thanks and copy the script as required.

WireGuard is also in ~, by the way. But sure copying works. Also, I
just opened https://bugs.gentoo.org/662808 for you.
