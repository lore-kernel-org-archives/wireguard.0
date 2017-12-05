Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bdb2760
 for <wireguard@lists.zx2c4.com>; Tue, 5 Dec 2017 14:44:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3024645
 for <wireguard@lists.zx2c4.com>; Tue, 5 Dec 2017 14:44:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdd052e1
 for <wireguard@lists.zx2c4.com>; Tue, 5 Dec 2017 14:44:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 43b7dc10
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Dec 2017 14:44:24 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id i1so422405oth.9
 for <wireguard@lists.zx2c4.com>; Tue, 05 Dec 2017 06:51:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <C8A2DFA8-4E80-4720-9E8C-88E018D0D8C0@ferrisellis.com>
References: <881c121c-5a53-b937-0a3a-f7a7a75400dc@posteo.de>
 <C8A2DFA8-4E80-4720-9E8C-88E018D0D8C0@ferrisellis.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 Dec 2017 15:51:08 +0100
Message-ID: <CAHmME9osHuX0M8rG=zD6SADUSU2bjURNkjjBfVrFL5XQ56+1zg@mail.gmail.com>
Subject: Re: File Encryption with WireGuard
To: Ferris Ellis <ferris@ferrisellis.com>
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

On Tue, Dec 5, 2017 at 3:48 PM, Ferris Ellis <ferris@ferrisellis.com> wrote=
:
> 2. If you had another program which used Curve25519 keys it could
> theoretically use the keys from two WireGuard clients, but that=E2=80=99s=
 outside
> the scope of WireGuard and also likely not a very secure practice.

Nobody should be reusing WireGuard's pubkeys for other purposes,
unless they can prove (with our open source Tamarin model [1],
perhaps) that it won't weaken WireGuard's security properties.

Usually key reuse by the untrained hand results in disasters.

[1] https://git.zx2c4.com/wireguard-tamarin/
