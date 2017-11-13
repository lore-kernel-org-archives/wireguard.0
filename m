Return-Path: geokozey@mailfence.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1043f6f4
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 12:13:55 +0000 (UTC)
Received: from wilbur.contactoffice.com (cinderella.contactoffice.com
 [212.3.242.69])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff9b7e95
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Nov 2017 12:13:54 +0000 (UTC)
Date: Mon, 13 Nov 2017 13:17:50 +0100 (CET)
From: Geo Kozey <geokozey@mailfence.com>
To: Stephen Major <smajor@gmail.com>, wireguard@lists.zx2c4.com
Message-ID: <332327830.119976.1510575470630@ichabod.co-bxl>
In-Reply-To: <CALzTOmLS-RYnns4xPpDSA6zaDBFhXqgL02n7PjzZjZMM4y0pPg@mail.gmail.com>
References: <CALzTOmLS-RYnns4xPpDSA6zaDBFhXqgL02n7PjzZjZMM4y0pPg@mail.gmail.com>
Subject: Re: Hardware based two factor authentication
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Reply-To: Geo Kozey <geokozey@mailfence.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

November 13, 2017 12:18:28 AM CET Stephen Major <smajor@gmail.com> wrote:
>This is a two-fold=C2=A0question:
>
>1) Can Wireguard=C2=A0be used directly with=C2=A0Yubikeys:=C2=A0https://ww=
w.yubico.com
>
>2) Can Wireguard=C2=A0be used with a radius server like GreenRADIUS:http:/=
/www.greenrocketsecurity.com/greenradius/
=C2=A0
In case of [1] you can store wireguard keys in pass (https://www.passwordst=
ore.org) database which is encrypted using yubikey smartcard  mode. See exa=
mple setup https://www.palkeo.com/sys/perfect-password-manager.html

Then you can add below command to your wg config, see https://git.zx2c4.com=
/WireGuard/about/src/tools/wg-quick.8:

PostUp =3D wg set %i private-key <(pass WireGuard/private-keys/%i)


Yours sincerely

G. K.
