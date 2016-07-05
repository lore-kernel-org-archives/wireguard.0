Return-Path: fukawi2@gmail.com
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
 [209.85.220.196])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0d7500d
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 01:12:31 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n132so34851196qka.0
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jul 2016 18:15:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9q83PQc637=xA2mxECGTfOWkh0TzsYkfy5macyF6AkSDA@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9oMaHXVZMqjjFbuy9tprCyfWh03dsg1XnEtudD-RuknLA@mail.gmail.com>
 <CAKAE9iTcZepnpH1FnGg2CM-HGerJENw+OC=yk44ZFkBepAtnHw@mail.gmail.com>
 <CAHmME9q83PQc637=xA2mxECGTfOWkh0TzsYkfy5macyF6AkSDA@mail.gmail.com>
From: Phillip Smith <fukawi2@gmail.com>
Date: Tue, 5 Jul 2016 11:15:33 +1000
Message-ID: <CAKAE9iRNJEMO9S3_hNNK5tWYASxKMQA4-0FTJRAFjq6PJ8jKTw@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> Have you got a better suggestion for a "command"? What do you prefer
> to yaourt for installing AUR packages?

There isn't really a single official command for installing from the
AUR. It is assumed the user has an understanding of the AUR process,
and tools like yaourt are unofficial third-party utilities.
A bare minimum of commands to do it manually would be something like:
    git clone https://aur.archlinux.org/wireguard-dkms.git && cd wireguard-dkms
    makepkg -is
    cd ..
    git clone https://aur.archlinux.org/wireguard-tools.git && cd wireguard-dkms
    makepkg -is
