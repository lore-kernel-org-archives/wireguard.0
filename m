Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aafc2662
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:19:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74e9dc8a
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:19:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e8c4511
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:19:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1d7e73f6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:19:40 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id g139so2121931oic.5
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 15:24:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171122232302.GA19498@WOPR.localdomain>
References: <20171122232302.GA19498@WOPR.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Nov 2017 00:24:50 +0100
Message-ID: <CAHmME9pbEUzHKS7P-gh2S8GXVV=Fz302wt5uARbpr9_rh11TLQ@mail.gmail.com>
Subject: Re: 0.0.20171122 build error on weird chromebook kernel
To: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
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

Hi Jaron,

Sorry about that. I fixed this bug about two hours after releasing
0.0.20171122. The fix will be part of the next snapshot. For now, you
can cherry pick this commit:

https://git.zx2c4.com/WireGuard/patch/?id=bca546c22a083b50aa24bfa3a78ac17e88d9292a

Jason
