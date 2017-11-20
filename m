Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edf8dd67
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 16:03:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9184032
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 16:03:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 059551cb
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 16:03:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e6f961b5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 16:03:45 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id j29so8034393oth.13
 for <wireguard@lists.zx2c4.com>; Mon, 20 Nov 2017 08:08:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171120160704.Horde.BsfBQSW63FEc1BxXECCXXS4@www.vdorst.com>
References: <20171120160704.Horde.BsfBQSW63FEc1BxXECCXXS4@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Nov 2017 17:08:37 +0100
Message-ID: <CAHmME9oxWCdnmBgHHWAEKSz2DHwT7fFPsZmpESABPqCXJY=e6Q@mail.gmail.com>
Subject: Re: general protection fault: 0000 [#1] SMP with latest commit
 a073ccac17a85f0c453698d0213cc8b86ecc3dfe
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Thanks for the report! You'll notice I CCd you in the last email,
hoping you'd find just this. :)

Investigating.
