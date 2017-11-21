Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b86208c
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:18:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5189d308
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:18:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fca2e3ad
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:18:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bfc8d828
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:18:26 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id o23so9157757otd.1
 for <wireguard@lists.zx2c4.com>; Mon, 20 Nov 2017 16:23:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171120231416.Horde.CgDTFw41-BBj-IomMwxyq3_@www.vdorst.com>
References: <20171120231416.Horde.CgDTFw41-BBj-IomMwxyq3_@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Nov 2017 01:23:21 +0100
Message-ID: <CAHmME9pFmoZYR2Teh2t+6hjp9HNZcE8o_jvZ17Xvzqmf7bpd6A@mail.gmail.com>
Subject: Re: netns.sh stuck at ncat.
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

Hey Rene,

Thanks for the report. I'm looking into it. Can you confirm that you
cannot reproduce this on 20171111?

Jason
