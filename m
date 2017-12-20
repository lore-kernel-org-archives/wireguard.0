Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa316ccf
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Dec 2017 14:25:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a4d3a48
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Dec 2017 14:25:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c428dd1
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Dec 2017 14:25:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1aca366
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Dec 2017 14:25:55 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id v21so19764893oth.6
 for <wireguard@lists.zx2c4.com>; Wed, 20 Dec 2017 06:34:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CADZktKY-X6ZwwfWx7qqY608RgrSjihQt04DY5DNpu33AZGFrYw@mail.gmail.com>
References: <CADZktKY-X6ZwwfWx7qqY608RgrSjihQt04DY5DNpu33AZGFrYw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Dec 2017 15:34:34 +0100
Message-ID: <CAHmME9qH6-UiRkiBrOwV4vN-aMKiAZTgB=ywkeqdMg=Frb=hnQ@mail.gmail.com>
Subject: Re: Dual bearer operation.
To: Chris Dew <cmsdew@gmail.com>
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

Hi Chris,

Not directly, but you can probably do this via other means, such as
netfilter's TEE target or bonding interfaces.

Jason
