Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59f7530c
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Feb 2017 00:50:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8acd58e0
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Feb 2017 00:50:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 887a5822
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Feb 2017 00:50:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f4e63beb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Feb 2017 00:50:21 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id k4so63481688otc.0
 for <wireguard@lists.zx2c4.com>; Mon, 27 Feb 2017 16:51:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170228002424.GA18437@wolff.to>
References: <20170227180434.GA5702@wolff.to>
 <CAHmME9o+dDEtxdgByOZzpWAsE2_t2QF+qDoFYt+NdqXJRXSz=w@mail.gmail.com>
 <20170227202205.GA9124@wolff.to> <20170227203727.GA9565@wolff.to>
 <CAHmME9ryT7LWjs+-D4VJpd3DBSQeBa0hUtDUcJ3gBt46xUobiA@mail.gmail.com>
 <20170227221444.GA11938@wolff.to> <20170227223751.GA13376@wolff.to>
 <CAHmME9oWA82Gre1ZDRQCYbOakWsEG-+YCA4jykBybp0tKunrww@mail.gmail.com>
 <20170228002424.GA18437@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Feb 2017 16:51:58 -0800
Message-ID: <CAHmME9reptbL33VU4eapc7Q7jrhU2J+eA2T71kdw7y1apWFSQQ@mail.gmail.com>
Subject: Re: Kernel commit d35a00b8e33dab7385f724e713ae71c8be0a49f4 breaks
 wireguard
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Bruno,

Excellent, thanks for checking.

By the way, after rc1 is released, wireguard.io/build-status/ will
automatically start compiling every version on it, so we'll get good
code coverage that way. You're just a bit ahead of the curve :).

Jason
