Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2df0c1db
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 21:57:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c466ab1
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 21:57:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52fcef92
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 21:56:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c3af9c4e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 21:56:45 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id w126-v6so15974728oie.7
 for <wireguard@lists.zx2c4.com>; Sat, 04 Aug 2018 15:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <55706f46-74db-9dfb-6cc7-93ce40f0d5c5@mib-infotech.co.nz>
In-Reply-To: <55706f46-74db-9dfb-6cc7-93ce40f0d5c5@mib-infotech.co.nz>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 5 Aug 2018 00:08:25 +0200
Message-ID: <CAHmME9p-GMKAt-c=w4HdRMEDE0RbY6ok84uSCdQ6pqmD6_DyCA@mail.gmail.com>
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

On Sun, Aug 5, 2018 at 12:07 AM John Huttley <john@mib-infotech.co.nz> wrote:
>
> Gentoo needs a script in /lib/netifrc/net  for network integration with
> openrc.
>
>
> This exists in wireguard-0.0.20180625 not in wireguard-0.0.20180802  or git.
>
> The package is built with "module tools".
>
> What happened?

It's now part of the netifrc scripts that come by default!
