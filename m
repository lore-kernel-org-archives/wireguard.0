Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 406f9757
 for <wireguard@lists.zx2c4.com>;
 Thu, 31 May 2018 01:12:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8d5a353
 for <wireguard@lists.zx2c4.com>;
 Thu, 31 May 2018 01:12:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 700b3a6f
 for <wireguard@lists.zx2c4.com>;
 Thu, 31 May 2018 01:11:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 93a48a84
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 31 May 2018 01:11:33 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id t1-v6so23401688ott.13
 for <wireguard@lists.zx2c4.com>; Wed, 30 May 2018 18:14:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN-r--mgDxq7wo9Uc-4DKcK97v_vbbmyQqhcA1Lxg8rWhUzG+Q@mail.gmail.com>
References: <CAN-r--kLC4bAG0oAGp0gDO7Q2Ro0X9J5L-HY3sXaRz-zeZDR6Q@mail.gmail.com>
 <CAHmME9ogDQv-TxNz+2jwbw=d4s2Vq1LdZgin4_=dL5D_SRy2_Q@mail.gmail.com>
 <CAN-r--=Of+ca1+otqwZM-q4RrGGfNyqZAEazVsoXDzjvDd5sQQ@mail.gmail.com>
 <CAHmME9o3M+06Q1NDuhAD-oNwfwxuDU3G8eCwgsn4Gu0jjzZpMg@mail.gmail.com>
 <CAHmME9oyNvnU4-2tZ9u7zp21_HigWH5_MFbu=Gb=jPe48kxpLA@mail.gmail.com>
 <CAN-r--mgDxq7wo9Uc-4DKcK97v_vbbmyQqhcA1Lxg8rWhUzG+Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 31 May 2018 03:14:56 +0200
Message-ID: <CAHmME9pg3v7VQYCbfFJ+SGOspuopfe3GTrOMXO7qdo_DrkUOkw@mail.gmail.com>
Subject: Re: Wireguard & hw flow offload incompatibility
To: Jaap Buurman <jaapbuurman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Felix Fietkau <nbd@nbd.name>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jaap,

This should now be taken care of by
http://lists.infradead.org/pipermail/openwrt-devel/2018-May/012675.html
. Thanks for the useful bug report.

Jason
