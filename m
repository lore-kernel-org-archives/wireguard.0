Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 750e9c66
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 00:49:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6ac765c
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 00:49:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b70a63a
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 01:08:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ae511523
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 01:08:35 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id v9so487306oif.13
 for <wireguard@lists.zx2c4.com>; Tue, 10 Oct 2017 18:19:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171010185133.Horde.g9yJlkVpxW5Gk-qJumftGF_@www.vdorst.com>
References: <20171010185133.Horde.g9yJlkVpxW5Gk-qJumftGF_@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 11 Oct 2017 03:19:20 +0200
Message-ID: <CAHmME9rtGod=Jw-vGKnUfPwDh+16zP1MjNr57+8k5PUVMhxtYA@mail.gmail.com>
Subject: Re: possible irq lock inversion dependency detected
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
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

Hi Ren=C3=A9,

Are you able to reliably reproduce this? If so, could you let me know
if this patch fixes it?

https://git.zx2c4.com/WireGuard/patch/?id=3D940317ee52d020fc3e19e3a9f615acb=
c715985d5

Jason
