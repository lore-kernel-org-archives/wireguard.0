Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e323849
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Sep 2017 16:51:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f37b6ff9
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Sep 2017 16:51:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4789699
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Sep 2017 17:10:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e303713b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Sep 2017 17:10:39 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id z187so687599ioz.12
 for <wireguard@lists.zx2c4.com>; Tue, 19 Sep 2017 10:18:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170919151533.Horde.MQvI7jMPhVKrVNqOVodg-dg@www.vdorst.com>
References: <20170919151533.Horde.MQvI7jMPhVKrVNqOVodg-dg@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 19 Sep 2017 19:18:43 +0200
Message-ID: <CAHmME9p17p2Hq6c1rw4QB=PztStywoR-r1r-L6bGiNZ2WU=62g@mail.gmail.com>
Subject: Re: Last pingtest always fails with netns.sh script on ARM device
 with F25.
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

Hi Rene,

Thanks for your detailed report. Could you let me know if this problem
exists with 0.0.20170918? Or only with 0.0.20170918-7-g7758071?

Thanks,
Jason
