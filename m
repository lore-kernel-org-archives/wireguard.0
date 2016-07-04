Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 722b97c2
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 23:42:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87f9471b
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 23:42:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ad0ec4bc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 23:42:50 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id l188so124607079lfe.2
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jul 2016 16:46:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKAE9iTcZepnpH1FnGg2CM-HGerJENw+OC=yk44ZFkBepAtnHw@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9oMaHXVZMqjjFbuy9tprCyfWh03dsg1XnEtudD-RuknLA@mail.gmail.com>
 <CAKAE9iTcZepnpH1FnGg2CM-HGerJENw+OC=yk44ZFkBepAtnHw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 Jul 2016 01:46:09 +0200
Message-ID: <CAHmME9q83PQc637=xA2mxECGTfOWkh0TzsYkfy5macyF6AkSDA@mail.gmail.com>
To: Phillip Smith <fukawi2@gmail.com>
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

On Tue, Jul 5, 2016 at 12:57 AM, Phillip Smith <fukawi2@gmail.com> wrote:
> yaourt is not a standard part of Arch, and it's often frowned upon to use
> it.
> That section should read something like:
>
>> Use the AUR to install the `wireguard-dkms` and `wireguard-tools`
>> packages.

Have you got a better suggestion for a "command"? What do you prefer
to yaourt for installing AUR packages?
