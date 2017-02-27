Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df05a5bf
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 22:08:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 013b8623
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 22:08:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e79fadc3
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 22:08:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 872a9fc2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 22:08:44 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id 62so46025721oih.2
 for <wireguard@lists.zx2c4.com>; Mon, 27 Feb 2017 14:10:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170227203727.GA9565@wolff.to>
References: <20170227180434.GA5702@wolff.to>
 <CAHmME9o+dDEtxdgByOZzpWAsE2_t2QF+qDoFYt+NdqXJRXSz=w@mail.gmail.com>
 <20170227202205.GA9124@wolff.to> <20170227203727.GA9565@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Feb 2017 14:10:18 -0800
Message-ID: <CAHmME9ryT7LWjs+-D4VJpd3DBSQeBa0hUtDUcJ3gBt46xUobiA@mail.gmail.com>
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

Thanks! I wasn't compiling with the options to hit this, so I didn't
see it before. Should be fixed now.

Jason
